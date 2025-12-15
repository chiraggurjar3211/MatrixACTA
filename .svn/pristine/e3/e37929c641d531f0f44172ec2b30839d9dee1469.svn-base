@tag
Feature: Title of your feature
  I want to use this template for my feature file

  #Pre-Conditions
  ## Biometric device should be connected with Device config > Alert Message flag Enable
  ## Identification Service should be running in tray app
  #************************************************************************************************
  #************************************************************************************************
  # USER MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-2
  Scenario Outline: Alert Custom - User - User Events - Event Selection = All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_1  |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_1 | COS_1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Assign users to device from API
      | Userid |
      | COS_1  |
    And Set Alert Configuration "User Events"
    And Update Alert Configuration "User Events"
      | EventSelection |
      | All            |
    And Assign User in Alert "User Events"
      | UserID |
      | COS_1  |
    And Set Alert Message Preview in Alert "User Events"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Generate User Event "1" times for User via API
      | UserID |
      | COS_1  |
    And "User Events" alert normal custom field value set
      | UserName | UserID | EntryExit | Mail                       |
      | COS_1    | COS_1  | Entry     | matrixautomationreceiver@gmail.com |
    Then Validate Alert Containt
      | AlertType   | AlertEvent  | MailRecieveTo |
      | <alertType> | User Events | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                | smsContent                                                                                                                                                                 | whatsappContent                                                                                                                                                                |
      | Custom    | ESS      | [User Name] (ID [UserID]) [Entry/Exit] has been Allowed at [DoorName] on [DateTime]<br>[User Name] (ID [UserID]) [Entry/Exit] has been Allowed at [DoorName] on [DateTime] | [User Name] (ID [UserID]) [Entry/Exit] has been Allowed at [DoorName] on [DateTime]<br>[User Name] (ID [UserID]) [Entry/Exit] has been Allowed at [DoorName] on [DateTime] | For User [User Name-UserID] [Entry/Exit] has been Allowed at [DoorName] on [DateTime]<br>For User [User Name-UserID] [Entry/Exit] has been Allowed at [DoorName] on [DateTime] |
      | Default   | ESS      | Default                                                                                                                                                                    | Default                                                                                                                                                                    | Default                                                                                                                                                                        |

  @CA-16
  Scenario Outline: Alert Custom - User - Missing In Punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | INUSER  |
      | OUTUSER |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   9898981232 | OUTUSER@gmail.com          |
      |   9898981233 | InOutRIC@gmail.com         |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | INUSER   | INUSER   |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | OUTUSER  | OUTUSER  |               1 |         1 |               1 |                  1 |    9898981232 | OUTUSER@gmail.com          |
      | InOutRIC | InOutRIC |               1 |         1 |               1 |                  1 |    9898981233 | InOutRIC@gmail.com         |
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
      |            486 |
    And Set Alert Message Preview in Alert "Missing In Punch - Users"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Missing In Punch - Users"
      | UserID |
      | INUSER |
    #And Start Stop Service from Command Propmt
      #| Service      | Status |
      #| AlertService | stop   |
      #| AlertService | start  |
    When Wait for "5" min
    And "Missing In Punch - Users" alert normal custom field value set
      | userid | Date | time | ShiftID |
      | INUSER |    0 |  486 | IO      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent               | MailRecieveTo |
      | <alertType> | Missing In Punch - Users | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                            | smsContent                                                                                                                             | whatsappContent                                                                                                                        |
      | Custom    | ESS      | In Punch not found for ([UserID-UserName]) on [Date] till [time].<br>In Punch not found for ([UserID-UserName]) on [Date] till [time]. | In Punch not found for ([UserID-UserName]) on [Date] till [time].<br>In Punch not found for ([UserID-UserName]) on [Date] till [time]. | In Punch not found for ([UserID-UserName]) on [Date] till [time].<br>In Punch not found for ([UserID-UserName]) on [Date] till [time]. |
      | Default   | ESS      | Default                                                                                                                                | Default                                                                                                                                | Default                                                                                                                                |

  @CA-16_1
  Scenario Outline: Alert Custom - User - Missing Out Punch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | INUSER  |
      | OUTUSER |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9898981231 | INUSER@gmail.com           |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   9898981233 | InOutRIC@gmail.com         |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | INUSER   | INUSER   |               1 |         1 |               1 |                  1 |    9898981231 | INUSER@gmail.com           |
      | OUTUSER  | OUTUSER  |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | InOutRIC | InOutRIC |               1 |         1 |               1 |                  1 |    9898981233 | InOutRIC@gmail.com         |
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
    And Set Alert Configuration "Missing Out Punch - Users"
    And Update Alert Configuration "Missing Out Punch - Users"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            5 |
    And Assign User in Alert "Missing Out Punch - Users"
      | UserID  |
      | OUTUSER |
    And Set Alert Message Preview in Alert "Missing Out Punch - Users"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    #And Start Stop Service from Command Propmt
      #| Service      | Status |
      #| AlertService | stop   |
      #| AlertService | start  |
    When Wait for "5" min
    And "Missing Out Punch - Users" alert normal custom field value set
      | userid  | Date | starttime | endtime | ShiftID |
      | OUTUSER |    0 |        -3 |       5 | IO      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                | MailRecieveTo |
      | <alertType> | Missing Out Punch - Users | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                              | smsContent                                                                                                                                                                               | whatsappContent                                                                                                                                                                          |
      | Custom    | ESS      | Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time].<br>Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time]. | Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time].<br>Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time]. | Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time].<br>Out Punch not found for ([UserID-UserName]) on [Date] between [Start Time] and [End Time]. |
      | Default   | ESS      | Default                                                                                                                                                                                  | Default                                                                                                                                                                                  | Default                                                                                                                                                                                  |

  @CA-16_2
  Scenario Outline: Alert Custom - User - Missing In Punch - Group Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | INUSER  |
      | OUTUSER |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9898981231 | INUSER@gmail.com           |
      |   9898981232 | OUTUSER@gmail.com          |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | INUSER   | INUSER   |               1 |         1 |               1 |                  1 |    9898981231 | INUSER@gmail.com           |
      | OUTUSER  | OUTUSER  |               1 |         1 |               1 |                  1 |    9898981232 | OUTUSER@gmail.com          |
      | InOutRIC | InOutRIC |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
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
    And Set Alert Configuration "Missing In Punch - Group Incharge"
    And Update Alert Configuration "Missing In Punch - Group Incharge"
      | PostShiftStart |
      |            485 |
    And Assign User in Alert "Missing In Punch - Group Incharge"
      | UserID   |
      | InOutRIC |
    And Set Alert Message Preview in Alert "Missing In Punch - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    #And Start Stop Service from Command Propmt
      #| Service      | Status |
      #| AlertService | stop   |
      #| AlertService | start  |
    When Wait for "5" min
    And "Missing In Punch - Group Incharge" alert normal custom field value set
      | userid         | Date | time | ShiftID | UserCount |
      | INUSER,OUTUSER |    0 |  485 | IO      |         2 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                        | MailRecieveTo |
      | <alertType> | Missing In Punch - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                          | smsContent                                                                                                                                                                           | whatsappContent                                                                                                                                                                      |
      | Custom    | RIC      | In Punch not found for below listed User(s) of '[Shift ID]' Shift on [Date] till [time].<br>In Punch not found for below listed User(s) of '[Shift ID]' Shift on [Date] till [time]. | In Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] till [time].<br>In Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] till [time]. | In Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] till [time].<br>In Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] till [time]. |
      | Default   | RIC      | Default                                                                                                                                                                              | Default                                                                                                                                                                              | Default                                                                                                                                                                              |

  @CA-16_3
  Scenario Outline: Alert Custom - User - Missing Out Punch - Group Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | INUSER  |
      | OUTUSER |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9898981231 | INUSER@gmail.com           |
      |   9898981232 | OUTUSER@gmail.com          |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | INUSER   | INUSER   |               1 |         1 |               1 |                  1 |    9898981231 | INUSER@gmail.com           |
      | OUTUSER  | OUTUSER  |               1 |         1 |               1 |                  1 |    9898981232 | OUTUSER@gmail.com          |
      | InOutRIC | InOutRIC |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
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
    And Set Alert Configuration "Missing Out Punch - Group Incharge"
    And Set Alert Message Preview in Alert "Missing Out Punch - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Update Alert Configuration "Missing Out Punch - Group Incharge"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            5 |
    And Assign User in Alert "Missing Out Punch - Group Incharge"
      | UserID   |
      | InOutRIC |
    #And Start Stop Service from Command Propmt
      #| Service      | Status |
      #| AlertService | stop   |
      #| AlertService | start  |
    When Wait for "5" min
    And "Missing Out Punch - Group Incharge" alert normal custom field value set
      | userid         | Date | starttime | endtime | ShiftID | UserCount |
      | INUSER,OUTUSER |    0 |        -3 |       5 | IO      |         2 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                         | MailRecieveTo |
      | <alertType> | Missing Out Punch - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                        |
      | Custom    | RIC      | Out Punch not found for below listed User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time].<br>Out Punch not found for below listed User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time]. | Out Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time].<br>Out Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time]. | Out Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time].<br>Out Punch not found for [User Count] User(s) of '[Shift ID]' Shift on [Date] between [Start Time] and [End Time]. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                |

  @CA-8
  Scenario Outline: Alert Custom - User - 11New Joining - Confirmation
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID        |
      | COS_11        |
      | COS_11_Alert  |
      | COS_11_Custom |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_11        | COS_11        |               1 |         1 |               1 |                  1 |    1100000001 | cos11@gmail.com            |
      | COS_11_Custom | COS_11_Custom |               1 |         1 |               1 |                  1 |    1100011001 | cos11Custom@gmail.com      |
      | COS_11_Alert  | COS_11_Alert  |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id            | name          | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_11        | COS_11        |           -3 |               |         |             |                 |                        |             |                 |
      | COS_11_Custom | COS_11_Custom |           -3 |               |         |             |                 |                        |             |                 |
    And Update Alert Configuration "New Joining - Confirmation"
      | Confirmation | SetReminderDaysbeforeConfirmation | ReminderTime | UserID       |
      |            5 |                                 2 |            4 | COS_11_Alert |
    And Set Alert Configuration "New Joining - Confirmation"
    And Set Alert Message Preview in Alert "New Joining - Confirmation"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "New Joining - Confirmation" alert normal custom field value set
      | Userid               | days |
      | COS_11,COS_11_Custom |    2 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                 | MailRecieveTo |
      | <alertType> | New Joining - Confirmation | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                            | smsContent                                                                                                                           | whatsappContent                                                                                                                      |
      | Custom    | User     | [no. of confirmations] confirmation(s) approaching in [days] days for below listed users.<br>[no. of confirmations] confirmation(s) approaching in [days] days for below listed users. | [no. of confirmation] confirmation/s approaching in [days] days.<br>[no. of confirmation] confirmation/s approaching in [days] days. | [no. of confirmation] confirmation/s approaching in [days] days.<br>[no. of confirmation] confirmation/s approaching in [days] days. |
      | Default   | User     | Default                                                                                                                                                                                | Default                                                                                                                              | Default                                                                                                                              |

  @CA-51
  Scenario Outline: Alert Custom - User - Validity/Expiry Date -Send To ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_12      |
      | COS_12_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   1200000011 | cos12ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_12      | COS_12      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_12_RIC1 | COS_12_RIC1 |               1 |         1 |               1 |                  1 |    1200000011 | cos12ric1@gmail.com        |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS12RICGrp      |        1 | COS_12_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_12 | COS12RICGrp    |                |            |              | Saved Successfully |
    And Create User via api
      | Id     | name   | joining-date | date-of-birth | driving-license | driving-license-expiry |
      | COS_12 | COS_12 |              |               |            1212 |                      2 |
    And Set Alert Configuration "Validity/Expiry Date"
    And Set Send Alert to parameters for "Validity/Expiry Date" Alert
    And Set Alert Message Preview in Alert "Validity/Expiry Date"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Update Alert Configuration "Validity/Expiry Date"
      | SendAlertFor | Document        | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      | True         | Visa            |                2 |            2 | False          |                    1 |
      | True         | Driving License |                2 |            2 | False          |                    1 |
      | True         | Passport        |                2 |            2 | True           |                    1 |
    And Assign User in Alert "Validity/Expiry Date"
      | UserID |
      | COS_12 |
    When Wait for "4" min
    And "Validity/Expiry Date" alert normal custom field value set
      | Userid | days | FieldName       |
      | COS_12 |    2 | Driving License |
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Validity/Expiry Date | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                              | smsContent                                                                                                                                                                               | whatsappContent                                                                                                                                                                  |
      | Custom    | ESS      | [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days<br>[Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days | [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days<br>[Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days | [Visa/Driving License/Passport/(Custom Field Name)] is going to expire in [days] days.<br>[Visa/Driving License/Passport/(Custom Field Name)] is going to expire in [days] days. |
      | Default   | ESS      | Default                                                                                                                                                                                  | Default                                                                                                                                                                                  | Default                                                                                                                                                                          |

  @CA-51_1
  Scenario Outline: Alert Custom - User - Validity/Expiry Date -Send To RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_12      |
      | COS_12_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   1200000001 | cos12@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_12      | COS_12      |               1 |         1 |               1 |                  1 |    1200000001 | cos12@gmail.com            |
      | COS_12_RIC1 | COS_12_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS12RICGrp      |        1 | COS_12_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_12 | COS12RICGrp    |                |            |              | Saved Successfully |
    And Create User via api
      | Id     | name   | joining-date | date-of-birth | driving-license | driving-license-expiry |
      | COS_12 | COS_12 |              |               |            1212 |                      2 |
    And Set Alert Configuration "Validity/Expiry Date"
    And Set Send Alert to parameters for "Validity/Expiry Date" Alert
    And Set Alert Message Preview in Alert "Validity/Expiry Date"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    And Update Alert Configuration "Validity/Expiry Date"
      | SendAlertFor | Document        | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      | True         | Visa            |                2 |            2 | False          |                    1 |
      | True         | Driving License |                2 |            2 | False          |                    1 |
      | True         | Passport        |                2 |            2 | True           |                    1 |
    And Assign User in Alert "Validity/Expiry Date"
      | UserID |
      | COS_12 |
    When Wait for "4" min
    And "Validity/Expiry Date" alert normal custom field value set
      | Userid | days | FieldName       |
      | COS_12 |    2 | Driving License |
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Validity/Expiry Date | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                                                                                                                                                                         | smsContent1                                                                                                                                                                                                                                          | whatsappContent1                                                                                                                                                                                                                           |
      | Custom    | RIC      | [User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days.<br>[User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days. | [User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days.<br>[User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] Expiry Date approaching in [days] days. | [User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] is going to expire in [days] days.<br>[User name]'s (ID: [Userid]) [Visa/Driving License/Passport/(Custom Field Name)] is going to expire in [days] days. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                    |

  @CA-6
  Scenario Outline: Alert Custom - User - Self-Enrollment Notification
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_13 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | pin |
      | COS_13 | COS_13 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com | 133 |
    And Set Alert Configuration "Self-Enrollment Notification"
    And Set Alert Message Preview in Alert "Self-Enrollment Notification"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Create user from user configuration
      | userid | EnableSelfEnrollment | Validation         |
      | COS_13 | True                 | Saved Successfully |
    And "Self-Enrollment Notification" alert normal custom field value set
      | userid |
      | COS_13 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Self-Enrollment Notification | <Reciever>    |
    And Create user from user configuration
      | userid | EnableSelfEnrollment | Validation         |
      | COS_13 | False                | Saved Successfully |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                    |
      | Custom    | ESS      | Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors.<br>Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors. | Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors.<br>Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors. | Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors.<br>Self-Enrollment has been enabled for [UserID] - [User Name]. Use [PIN number] for enrolling biometrics from doors. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                            |

  @ASA-8
  Scenario Outline: Alert - User14 Birthday Greetings
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_14      |
      | COS_14_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                          |
      |   9033207186 | matrixautomationreceiver@gmail.com     |
      |   1400000011 | matrixautomationsender@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email                 |
      | COS_14      | COS_14      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com     |
      | COS_14_RIC1 | COS_14_RIC1 |               1 |         1 |               1 |                  1 |    1400000011 | matrixautomationsender@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS14RICGrp      |        1 | COS_14_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_14 | COS14RICGrp    |                |            |              | Saved Successfully |
    And Create User via api
      | Id     | name   | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_14 | COS_14 |              |             0 |         |             |                 |                        |             |                 |
    And Set Alert Configuration "Birthday Greetings"
    And Set Send Alert to parameters for "Birthday Greetings" Alert
    And Update Alert Configuration "Birthday Greetings"
      | AdditionalRecipients           | ScheduleTime |
      | matrixautomationsender@gmail.com |            3 |
    And Set Alert Message Preview in Alert "Birthday Greetings"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Birthday Greetings"
      | UserID |
      | COS_14 |
    When Wait for "5" min
    And "Happy Birthday COS_14" alert normal custom field value set
      | userid |
      | COS_14 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent            | MailRecieveTo |
      | <alertType> | Happy Birthday COS_14 | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                | smsContent                                                                                                                                                                       | whatsappContent                                                                                                                                                                  |
      | Custom    | ESS      | [OrganizationName] wishes you a very Happy Birthday! <br> <br> May your birthday be the start of a year with full of happiness and brings you much success.<br>[OrganizationName] wishes you a very Happy Birthday! <br> <br> May your birthday be the start of a year with full of happiness and brings you much success. | Greetings, [OrganizationName] wishes you a very happy birthday and a great year ahead[OrganizationName] | Greetings, [OrganizationName] wishes you a very happy birthday and a great year ahead.<br>Greetings, [OrganizationName] wishes you a very happy birthday and a great year ahead. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                          | Default                                                                                                                                                                          |

  @CA-711
  Scenario Outline: Alert Custom - User - Exceeding Health Declaration Parameters - RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_17         |
      | COS_17_RIC1    |
      | COS_17_LinkESS |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   1700000021 | cos17LinkESS@gmail.com     |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_17         | COS_17         |               1 |         1 |               1 |                  1 |    1700000001 | cos17@gmail.com            |
      | COS_17_RIC1    | COS_17_RIC1    |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |    1700000021 | cos17LinkESS@gmail.com     |
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
    And Set Alert Message Preview in Alert "Exceeding Health Declaration Parameters"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_17 |                          1 | admin        |    1 |
    And Declare Temperature and Symptoms for Self Declaration of ESSUser from API
      | UserID | Temperature | Symptoms | declaration-date |
      | COS_17 |        99.0 |        1 |                0 |
    And "Exceeding Health Declaration Parameters" alert normal custom field value set
      | Userid | Username | Temperature | Symptoms |
      | COS_17 | COS_17   | 99.0 &deg;F | Fever    |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Exceeding Health Declaration Parameters | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                | smsContent                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                            |
      | Custom    | RIC      | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                    |

  @CA-712
  Scenario Outline: Alert Custom - User - Exceeding Health Declaration Parameters - SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_17         |
      | COS_17_RIC1    |
      | COS_17_LinkESS |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   1700000011 | cos17ric1@gmail.com        |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_17         | COS_17         |               1 |         1 |               1 |                  1 |    1700000001 | cos17@gmail.com            |
      | COS_17_RIC1    | COS_17_RIC1    |               1 |         1 |               1 |                  1 |    1700000011 | cos17ric1@gmail.com        |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
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
    And Set Alert Message Preview in Alert "Exceeding Health Declaration Parameters"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_17 |                          1 | admin        |    1 |
    And Declare Temperature and Symptoms for Self Declaration of ESSUser from API
      | UserID | Temperature | Symptoms | declaration-date |
      | COS_17 |        99.0 |        1 |                0 |
    And "Exceeding Health Declaration Parameters" alert normal custom field value set
      | Userid | Username | Temperature | Symptoms |
      | COS_17 | COS_17   | 99.0 &deg;F | Fever    |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Exceeding Health Declaration Parameters | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                | smsContent                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                            |
      | Custom    | SA       | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. | [Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit.<br>[Userid]-[Username] has declared [Temperature] Temperature & [Symptoms] Symptoms which exceeds the threshold limit. |
      | Default   | SA       | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                    |

  @CA-18
  Scenario Outline: Alert Custom - User - Invite User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "Invite User"
    And Set Alert Message Preview in Alert "Invite User"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set User Parameters in GP
      | LinkExpiryDays |
      |             30 |
    And Delete Link from Invite User page
      | Name  |
      | cos18 |
    When Send link from Invite user tab
      | Name  | MobileNo   | EmailID                    |
      | cos18 | 9033207186 | matrixautomationreceiver@gmail.com |
    And "Invite User" alert normal custom field value set
      | ExpiryDate | Email                      |
      |         30 | matrixautomationreceiver@gmail.com |
    Then Validate Alert Containt
      | AlertType   | AlertEvent  | MailRecieveTo |
      | <alertType> | Invite User | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | ESS      | You are invited to fill in your details by [Company Name].<br>Link is valid till [Expiry Date].<br><br>Let us assist you in getting started, all you have to do is follow these simple steps:<br>Step 1: Click [Link] to access Onboarding Portal.<br>Step 2: Login using Mobile Number or Email - OTP.<br>Step 3: Fill in the required User details.<br>Step 4: Use Save, if you want to continue filling details later.<br>Step 5: Use Submit, on filling all the details.<br>Your Onboarding Process is completed. Welcome aboard!<br>You are invited to fill in your details by [Company Name].<br>Link is valid till [Expiry Date].<br><br>Let us assist you in getting started, all you have to do is follow these simple steps:<br>Step 1: Click [Link] to access Onboarding Portal.<br>Step 2: Login using Mobile Number or Email - OTP.<br>Step 3: Fill in the required User details.<br>Step 4: Use Save, if you want to continue filling details later.<br>Step 5: Use Submit, on filling all the details.<br>Your Onboarding Process is completed. Welcome aboard! | You are invited to fill in your details by [Company Name].<br>Click on [Link] to get started with Onboarding Portal.<br>Link is valid till [Expiry Date].<br>You are invited to fill in your details by [Company Name].<br>Click on [Link] to get started with Onboarding Portal.<br>Link is valid till [Expiry Date]. | You are invited to fill in your details by [Company Name].<br>Link is valid till [Expiry Date].<br><br>Let us assist you in getting started, all you have to do is follow these simple steps:<br>Step 1: Click [Link] to access Onboarding Portal.<br>Step 2: Login using Mobile Number or Email - OTP.<br>Step 3: Fill in the required User details.<br>Step 4: Use Save, if you want to continue filling details later.<br>Step 5: Use Submit, on filling all the details.<br>Your Onboarding Process is completed. Welcome aboard!<br>[Company Name].<br>[Expiry Date].<br><br>[Link]<br> |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  @CA-19
  Scenario Outline: Alert Custom - User - User Onboarding - On Submit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID       |
      | COS_19       |
      | COS_19_Alert |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_19_Alert | COS_19_Alert |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "User Onboarding - On Submit"
    And Assign User in Alert "User Onboarding - On Submit"
      | UserID       |
      | COS_19_Alert |
    And Set Alert Message Preview in Alert "User Onboarding - On Submit"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Delete Link from Invite User page
      | Name   |
      | COS_19 |
    And Send link from Invite user tab
      | Name   | MobileNo   | EmailID         |
      | COS_19 | 1900000001 | cos19@gmail.com |
    And "Copy link" and open in new browser tab
      | Name   |
      | COS_19 |
    And Go to previous Tab
    And Get OTP from Alert view for "1900000001"
    And Go to next Tab
    And click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    When Enter details in employees onbording portal
      | Name   |
      | COS_19 |
    And Go to previous Tab
    And "User Onboarding - On Submit" alert normal custom field value set
      | UserName |
      | COS_19   |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                  | MailRecieveTo |
      | <alertType> | User Onboarding - On Submit | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                    | smsContent                                                                                     | whatsappContent                                                                                |
      | Custom    | ESS      | [User Name] has submitted Onboarding Details.<br>[User Name] has submitted Onboarding Details. | [User Name] has submitted Onboarding Details.<br>[User Name] has submitted Onboarding Details. | [User Name] has submitted Onboarding Details.<br>[User Name] has submitted Onboarding Details. |
      | Default   | ESS      | Default                                                                                        | Default                                                                                        | Default                                                                                        |

  @CA-20
  Scenario Outline: Alert Custom - User - User Onboarding - Schedule Time #Issue CSR-8571
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID       |
      | COS_201      |
      | COS_202      |
      | COS_20_Alert |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_20_Alert | COS_20_Alert |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Delete All Links from Invite User page
    And Send link from Invite user tab
      | Name    | MobileNo   | EmailID          |
      | COS_201 | 2000000021 | cos201@gmail.com |
      | COS_202 | 2000000031 | cos202@gmail.com |
    And "Copy link" and open in new browser tab
      | Name    |
      | COS_201 |
    And Go to previous Tab
    And Get OTP from Alert view for "2000000021"
    And Go to next Tab
    And click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    When Enter details in employees onbording portal
      | Name    |
      | COS_201 |
    And Go to previous Tab
    And Update Alert Configuration "User Onboarding - Schedule Time"
      | ScheduleTime |
      |            3 |
    And Set Alert Configuration "User Onboarding - Schedule Time"
    And Assign User in Alert "User Onboarding - Schedule Time"
      | UserID       |
      | COS_20_Alert |
    And Set Alert Message Preview in Alert "User Onboarding - Schedule Time"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And "User Onboarding - Schedule Time" alert normal custom field value set
      | SubmitCount | ExpiryCount | SubmittedUserName | SubmitDate | ExpiredUserName | ExpiryDate |
      |           1 |           1 | COS_201           |          -1 | COS_202         |         -2 |
    And Wait for "5" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent                      | MailRecieveTo |
      | <alertType> | User Onboarding - Schedule Time | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                  |
      | Custom    | ESS      | Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s).<br>Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s). | Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s).<br>Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s). | Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s).<br>Onboarding Details Submitted by [Submit Count] User(s).<br>Onboarding Link Expired for [Expiry Count] User(s). |
      | Default   | ESS      | Default                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                          |

  @CA-21
  Scenario Outline: Alert Custom - User - User Access - QR Credential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | COS_211 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id      | name    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_211 | COS_211 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "User Access - QR Credential"
    And Assign User in Alert "User Access - QR Credential"
      | UserID  |
      | COS_211 |
    And Set Alert Message Preview in Alert "User Access - QR Credential"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Generate QR Credential from User Configuration
      | UserId  |
      | COS_211 |
    And "User Access - QR Credential" alert normal custom field value set
      | UserID  | UserName |
      | COS_211 | COS_211  |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                  | MailRecieveTo |
      | <alertType> | User Access - QR Credential | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                              |  |
      | Custom    | ESS      | ([UserID-UserName]), Your QR Code For Access is generated. You can download the QR and use it for your Access.<br>([UserID-UserName]), Your QR Code For Access is generated. You can download the QR and use it for your Access. | ([UserID-UserName]), Your QR Code For Access is generated and sent on your Mail/WhatsApp. You can download the QR and use it for your Access.<br>([UserID-UserName]), Your QR Code For Access is generated and sent on your Mail/WhatsApp. You can download the QR and use it for your Access. | ([UserID-UserName]), Your QR Code is generated. Use this QR for Door Access.<br>([UserID-UserName]), Your QR Code is generated. Use this QR for Door Access. |  |
      | Default   | ESS      | Default                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                      |  |

  #************************************************************************************************
  #************************************************************************************************
  # T&A MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-18
  Scenario Outline: Alert Custom - T&A - Attendance Correction Application #Issue CSR-8511
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_42      |
      | COS_42_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   4200000001 | cos42@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_42      | COS_42      |               1 |         1 |               1 |                  1 |    4200000001 | cos42@gmail.com            |
      | COS_42_RIC1 | COS_42_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_42      |                          1 | admin        |    1 |
      | COS_42_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS42RICGrp      |        1 | COS_42_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_42 | COS42RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID | ApplicationDate |
      | COS_42 |               0 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_42 |
    And Set Alert Configuration "Attendance Correction Application"
    And Update Alert Configuration "Attendance Correction Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Attendance Correction Application"
      | UserID      |
      | COS_42_RIC1 |
    And Set Alert Message Preview in Alert "Attendance Correction Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_42 |            0 |            0900 |            1800 | GS    | COS_42    |
    And "Attendance Correction Application" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_42 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                        | MailRecieveTo |
      | <alertType> | Attendance Correction Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                    |
      | Custom    | RIC      | [User NAME] has applied for Attendance Correction for attendance date [attendance date]<br>Details (Old Value \| New Value) are as follows:<br><br>Applied On:[application date-time]<br>User ID:[UserID]<br>Reason:[Reason]<br>Shift ID:[shift ID\|shift ID]<br>Day:[Day\|Day]<br>[User NAME] has applied for Attendance Correction for attendance date [attendance date]<br>Details (Old Value \| New Value) are as follows:<br><br>Applied On:[application date-time]<br>User ID:[UserID]<br>Reason:[Reason]<br>Shift ID:[shift ID\|shift ID]<br>Day:[Day\|Day] | [Username] - (ID-[Userid]) applied for Attendance Correction for attendance date [attendance date] on [application date-time]<br>[Username] - (ID-[Userid]) applied for Attendance Correction for attendance date [attendance date] on [application date-time] | [Username] - [Userid] applied for Attendance Correction for attendance date [attendance date] on [application date-time] with Reason: [Reason].<br>[Username] - [Userid] applied for Attendance Correction for attendance date [attendance date] on [application date-time] with Reason: [Reason]. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                            |

  @CA-18
  Scenario Outline: Alert Custom - T&A - Attendance Correction Application -Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_42      |
      | COS_42_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4200000011 | cos42ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_42      | COS_42      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_42_RIC1 | COS_42_RIC1 |               1 |         1 |               1 |                  1 |    4200000011 | cos42ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_42      |                          1 | admin        |    1 |
      | COS_42_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS42RICGrp      |        1 | COS_42_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_42 | COS42RICGrp    |                |            |              | Saved Successfully |
    And Set Alert Configuration "Attendance Correction Application"
    And Update Alert Configuration "Attendance Correction Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Attendance Correction Application"
      | UserID      |
      | COS_42_RIC1 |
    And Set Alert Configuration "Attendance Correction Approval/Rejection"
    And Assign User in Alert "Attendance Correction Approval/Rejection"
      | UserID |
      | COS_42 |
    And Set Alert Message Preview in Alert "Attendance Correction Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_42 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_42 |
    When Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_42 |            0 |            0900 |            1800 | GS    | COS_42    |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID       | process-date |
      | COS_42 |       1 | AtdCorApproved | COS_42_RIC1 |            0 |
    And "Attendance Correction Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_42 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                               | MailRecieveTo |
      | <alertType> | Attendance Correction Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                        |
      | Custom    | ESS      | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Remark:[Remark]<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Remark:[Remark] | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time]. | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time]<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                |

  @CA-18_1
  Scenario Outline: Alert Custom - T&A - Attendance Correction Application - Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_42      |
      | COS_42_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4200000011 | cos42ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_42      | COS_42      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_42_RIC1 | COS_42_RIC1 |               1 |         1 |               1 |                  1 |    4200000011 | cos42ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_42      |                          1 | admin        |    1 |
      | COS_42_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS42RICGrp      |        1 | COS_42_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_42 | COS42RICGrp    |                |            |              | Saved Successfully |
    And Set Alert Configuration "Attendance Correction Application"
    And Update Alert Configuration "Attendance Correction Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Attendance Correction Application"
      | UserID      |
      | COS_42_RIC1 |
    And Set Alert Configuration "Attendance Correction Approval/Rejection"
    And Assign User in Alert "Attendance Correction Approval/Rejection"
      | UserID |
      | COS_42 |
    And Set Alert Message Preview in Alert "Attendance Correction Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_42 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_42 |
    When Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_42 |            0 |            0900 |            1800 | GS    | COS_42    |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID       | process-date |
      | COS_42 |       0 | AtdCorApproved | COS_42_RIC1 |            0 |
    And "Attendance Correction Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_42 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                               | MailRecieveTo |
      | <alertType> | Attendance Correction Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                        |
      | Custom    | ESS      | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Remark:[Remark]<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Remark:[Remark] | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time].<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time]. | Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time]<br>Attendance Correction for attendance date [attendance date] is [Approved/Rejected] on [verdict date-time] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                |

  @CA-20
  Scenario Outline: Alert Custom - T&A - Short Leave Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   4400000001 | cos44@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    4400000001 | cos44@gmail.com            |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Hours Application"
    And Update Alert Configuration "Short Leave/Official Hours Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Short Leave/Official Hours Application"
      | UserID      |
      | COS_44_RIC1 |
    And Set Alert Message Preview in Alert "Short Leave/Official Hours Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      2 | p1short  | COS_44    |
    And "Short Leave/Official Hours Application" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                             | MailRecieveTo |
      | <alertType> | Short Leave/Official Hours Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                      |
      | Custom    | RIC      | [User NAME] has applied for [Short Leave/Official Hours] for attendance date [attendance date]<br>Details are as follows:<br><br>Applied On:[application date]<br>User ID:[UserID]<br>Reason:[Reason]<br>[Short Leave/Official Hours]: [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM]<br>[Short Leave/Official Hours] Duration: [Posted Duration]<br>[User NAME] has applied for [Short Leave/Official Hours] for attendance date [attendance date]<br>Details are as follows:<br><br>Applied On:[application date]<br>User ID:[UserID]<br>Reason:[Reason]<br>[Short Leave/Official Hours]: [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM]<br>[Short Leave/Official Hours] Duration: [Posted Duration] | [Username]-(ID-[Userid]) applied [Short Leave/Official Hours] for [attendance date] on [application date]<br>[Username]-(ID-[Userid]) applied [Short Leave/Official Hours] for [attendance date] on [application date] | [Username-Userid] has applied for the [Short Leave/Official Hours] application for [attendance date] on [application date] with Reason: [Reason]<br>[Username-Userid] has applied for the [Short Leave/Official Hours] application for [attendance date] on [application date] with Reason: [Reason] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                              |

  @CA-20_1
  Scenario Outline: Alert Custom - T&A - Official Hours Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   4400000001 | cos44@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    4400000001 | cos44@gmail.com            |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Hours Application"
    And Update Alert Configuration "Short Leave/Official Hours Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Short Leave/Official Hours Application"
      | UserID      |
      | COS_44_RIC1 |
    And Set Alert Message Preview in Alert "Short Leave/Official Hours Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      1 | p1short  | COS_44    |
    And "Short Leave/Official Hours Application" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                             | MailRecieveTo |
      | <alertType> | Short Leave/Official Hours Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                      |
      | Custom    | RIC      | [User NAME] has applied for [Short Leave/Official Hours] for attendance date [attendance date]<br>Details are as follows:<br><br>Applied On:[application date]<br>User ID:[UserID]<br>Reason:[Reason]<br>[Short Leave/Official Hours]: [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM]<br>[Short Leave/Official Hours] Duration: [Posted Duration]<br>[User NAME] has applied for [Short Leave/Official Hours] for attendance date [attendance date]<br>Details are as follows:<br><br>Applied On:[application date]<br>User ID:[UserID]<br>Reason:[Reason]<br>[Short Leave/Official Hours]: [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM]<br>[Short Leave/Official Hours] Duration: [Posted Duration] | [Username]-(ID-[Userid]) applied [Short Leave/Official Hours] for [attendance date] on [application date]<br>[Username]-(ID-[Userid]) applied [Short Leave/Official Hours] for [attendance date] on [application date] | [Username-Userid] has applied for the [Short Leave/Official Hours] application for [attendance date] on [application date] with Reason: [Reason]<br>[Username-Userid] has applied for the [Short Leave/Official Hours] application for [attendance date] on [application date] with Reason: [Reason] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                              |

  @CA-20_3
  Scenario Outline: Alert Custom - T&A - Short Leave Application - Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4400000011 | cos44ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4400000011 | cos44ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | UserID |
      | COS_44 |
    And Set Alert Message Preview in Alert "Short Leave/Official Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      2 | p1short  | COS_44    |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | Authorization-for | Verdict | remark        | ricID       |
      | COS_44 |               0 |                 2 |       1 | ShortApproved | COS_44_RIC1 |
    And "Short Leave/Official Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Short Leave/Official Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                              |
      | Custom    | ESS      | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark] | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected] | Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                      |

  @CA-20_4
  Scenario Outline: Alert Custom - T&A - Short Leave Application - Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4400000011 | cos44ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4400000011 | cos44ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | UserID |
      | COS_44 |
    And Set Alert Message Preview in Alert "Short Leave/Official Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      2 | p1short  | COS_44    |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | Authorization-for | Verdict | remark        | ricID       |
      | COS_44 |               0 |                 2 |       2 | ShortRejected | COS_44_RIC1 |
    And "Short Leave/Official Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Short Leave/Official Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                              |
      | Custom    | ESS      | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark] | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected] | Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                      |

  @CA-20_5
  Scenario Outline: Alert Custom - T&A - Official Hours Application - Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4400000011 | cos44ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4400000011 | cos44ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | UserID |
      | COS_44 |
    And Set Alert Message Preview in Alert "Short Leave/Official Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      1 | p1short  | COS_44    |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | Authorization-for | Verdict | remark           | ricID       |
      | COS_44 |               0 |                 1 |       1 | OfficialApproved | COS_44_RIC1 |
    And "Short Leave/Official Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Short Leave/Official Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                              |
      | Custom    | ESS      | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark] | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected] | Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                      |

  @CA-20_6
  Scenario Outline: Alert Custom - T&A - Official Application - Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44      |
      | COS_44_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   4400000011 | cos44ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_44      | COS_44      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4400000011 | cos44ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44      |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp      |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_44 | COS44RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_44 | ShortApp1     |             |             |           |             |         | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | UserID |
      | COS_44 |
    And Set Alert Message Preview in Alert "Short Leave/Official Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_44 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_44 |          0 |     100000 |
      | COS_44 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44 |               0 |      1 | p1short  | COS_44    |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid | Attendance-date | Authorization-for | Verdict | remark           | ricID       |
      | COS_44 |               0 |                 1 |       2 | OfficialRejected | COS_44_RIC1 |
    And "Short Leave/Official Approval/Rejection" alert normal custom field value set
      | UserID | ApplicationDate |
      | COS_44 |               0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                              | MailRecieveTo |
      | <alertType> | Short Leave/Official Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                              |
      | Custom    | ESS      | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Remark:[Remark] | [Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>[Short Leave/Official Hours] from [from dd/mm/yyyy-HH:MM] to [to dd/mm/yyyy-HH:MM] is [Approved/Rejected] | Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected]<br>Your application for [Short Leave/Official Hours] from [dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM] is [Approved/Rejected] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                      |

  @CA-25_1
  Scenario Outline: Alert Custom - T&A - Shift Change
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_49 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_49 | COS_49 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | S1      |        -4 |       4 | 04:00   | 08:00   | Saved Successfully |
      | S2      |        -2 |       6 | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "ShiftChng" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | S1      |               7 |
      | S2      |               7 |
    And Create user from user configuration
      | userid | ShiftSchedule | Validation         |
      | COS_49 | ShiftChng     | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_49 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_49 |
    And Set Alert Configuration "Shift Change"
    And Update Alert Configuration "Shift Change"
      | AlertForNormalShift | AlertForFBShift | AlertForRDShift |
      | True                | True            | True            |
    And Set Alert Message Preview in Alert "Shift Change"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Shift Change"
      | UserID |
      | COS_49 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_49 |                          1 | admin        |    1 |
    And Get Shift and Change Shift via API for Alert
      | userid | date-range | shift-id1 | shift-id2 | appliedBy |
      | COS_49 |          0 | S1        | S2        | COS_49    |
    And Get Change Shift application data for custom Alert
      | Userid | fromDate |
      | COS_49 |        0 |
    And Shift change approval via API
      | userid | date-range | approved | remark         | ricID |
      | COS_49 |          0 |        1 | approvedBtAuto | SA    |
    And "Shift Change" alert normal custom field value set
      | UserID |
      | COS_49 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent   | MailRecieveTo |
      | <alertType> | Shift Change | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | Shift Updated for [attendance date dd-mm-yy]<br>New Shift: [new shift code] - [new shift start time hh:mm] - [new shift end time hh:mm]<br>Previous Shift: [previous shift code] - [previous shift start time hh:mm] - [previous shift end time hh:mm]<br>Shift Updated for [attendance date dd-mm-yy]<br>New Shift: [new shift code] - [new shift start time hh:mm] - [new shift end time hh:mm]<br>Previous Shift: [previous shift code] - [previous shift start time hh:mm] - [previous shift end time hh:mm] | Shift Updated for [attendance date dd-mm-yy] New Shift: [new shift code] - [new shift start time hh:mm] - [new shift end time hh:mm] Previous Shift: [previous shift code] - [previous shift start time hh:mm] - [previous shift end time hh:mm]<br>Shift Updated for [attendance date dd-mm-yy] New Shift: [new shift code] - [new shift start time hh:mm] - [new shift end time hh:mm] Previous Shift: [previous shift code] - [previous shift start time hh:mm] - [previous shift end time hh:mm] | Shift Updated for attendance date [dd-mm-yy] New Shift: [new shift code] - start time [new shift start time hh:mm]- end time [new shift end time hh:mm] Previous Shift: [previous shift code] - start time [previous shift start time hh:mm]- end time [previous shift end time hh:mm]<br>Shift Updated for attendance date [dd-mm-yy] New Shift: [new shift code] - start time [new shift start time hh:mm]- end time [new shift end time hh:mm] Previous Shift: [previous shift code] - start time [previous shift start time hh:mm]- end time [previous shift end time hh:mm] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

  @CA-24_6
  Scenario Outline: Alert Custom - T&A - Overtime/C-OFF Authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID       |
      | COSC_101     |
      | COSC_102     |
      | COSC_101_RIC |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name          |
      | AlertOTGroupC |
    And Create NetWork Hours Policy "AlertOTGroupC"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName       | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOTGroupC | AlertOTGroupC  | True      | ALL     | Daily 1    | false           | true                  | Generated Overtime |         0300 |         99959 | Monday           |         99959 | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AlertOTGroupC"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid       | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc   | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COSC_101     | True   | True      |                        2 | Both              |               |             | AlertOTGroupC |           |             |         | True      | True      | True      | True               | Saved Successfully |     5111200001 | COSC_101@gmail.com         |
      | COSC_102     | True   | True      |                        2 | Both              |               |             | AlertOTGroupC |           |             |         | True      | True      | True      | True               | Saved Successfully |     5111300001 | COSC_102@gmail.com         |
      | COSC_101_RIC | True   | True      |                        2 | Both              |               |             | AlertOTGroupC |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1         | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS101RICGrpC    |        1 | COSC_101_RIC |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID   | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COSC_101 | COS101RICGrpC  |                |            |              | Saved Successfully |
      | COSC_102 | COS101RICGrpC  |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | COSC_101 |
      | COSC_102 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | COSC_101 |
      | COSC_102 |
    And Set event via Event Set API
      | Userid   | event-date | event-time |
      | COSC_101 |          0 |     070000 |
      | COSC_101 |          0 |     200000 |
      | COSC_102 |          0 |     070000 |
      | COSC_102 |          0 |     200000 |
    And Set Alert Configuration "Overtime/C-OFF Authorization"
    And Update Alert Configuration "Overtime/C-OFF Authorization"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime/C-OFF Authorization"
      | UserID       |
      | COSC_101_RIC |
    And Set Alert Message Preview in Alert "Overtime/C-OFF Authorization"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Overtime/C-OFF Authorization" alert normal custom field value set
      | UserID   | Event-Date |
      | COSC_101 |          0 |
      | COSC_102 |          0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Overtime/C-OFF Authorization | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                      | smsContent                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                  |
      | Custom    | RIC      | [Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date].<br>[Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date]. | [Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date].<br>[Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date]. | [Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date].<br>[Total Of All Users Who Did Overtime] Users did Overtime on attendance date [attendance date]. |
      | Default   | RIC      | Default                                                                                                                                                                                          | Default                                                                                                                                                                                          | Default                                                                                                                                                                                          |

  @CA-26
  Scenario Outline: Alert Custom - T&A - Event Authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_50      |
      | COS_50_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   5000000001 | cos50@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_50      | COS_50      |               1 |         1 |               1 |                  1 |    5000000001 | cos50@gmail.com            |
      | COS_50_RIC1 | COS_50_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS50RICGrp      |        1 | COS_50_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_50 | COS50RICGrp    |                |            |              | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | EventSource | AuthReqforatleastoneEventoftheday | validation         |
      | EventAuth |                2 | false         | True                 | False            | true               | false                 | true         | All         | True                              | Saved Successfully |
    And Assign policy to user
      | UserID | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | Validation         |
      | COS_50 | EventAuth     |             |             |           |             |         | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_50 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_50 |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_50      |                          1 | admin        |    1 |
      | COS_50_RIC1 |                          1 | admin        |    1 |
    And Set Alert Configuration "Event Authorization"
    And Update Alert Configuration "Event Authorization"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Event Authorization"
      | UserID      |
      | COS_50_RIC1 |
    And Set Alert Message Preview in Alert "Event Authorization"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_50 |          0 |     090000 |
    And "Event Authorization" alert normal custom field value set
      | UserID      |
      | COS_50_RIC1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent          | MailRecieveTo |
      | <alertType> | Event Authorization | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                             | whatsappContent                                                                                                                                                                        |
      | Custom    | RIC      | An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization.<br>Details are as follow:<br>I/O Type :[Entry/Exit]<br>[Source/Device/Location] Details : [Source Name/Device Name/Location Code-Location Name]Reason : [Reason]<br>An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization.<br>Details are as follow:<br>I/O Type :[Entry/Exit]<br>[Source/Device/Location] Details : [Source Name/Device Name/Location Code-Location Name]Reason : [Reason] | An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization.<br>An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization. | An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization.<br>An Event of [UserID]-[Username] at [application date-time] has arrived for Authorization. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                | Default                                                                                                                                                                                |

  @CA-24
  Scenario Outline: Alert Custom - T&A - Generated Overtime Daily Limit Exceeded #issue CSR-8500
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_51 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name    |
      | AlertOT |
    And Create NetWork Hours Policy "AlertNW"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOT | AlertNW        | True      | ALL     | Daily 1    | false           | true                  | Generated Overtime |         0300 |         99959 | Monday           |         99959 | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AlertOT"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_51 | True   | True      |                        2 | Both              |               |             | AlertOT     |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_51 |          0 |     070000 |
      | COS_51 |          0 |     200000 |
    And Set Alert Configuration "Overtime Limit Exceeded - User"
    And Update Alert Configuration "Overtime Limit Exceeded - User"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - User"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Overtime Limit Exceeded - User"
      | UserID |
      | COS_51 |
    When Wait for "3" min
    And "Overtime Limit Exceeded - User" alert normal custom field value set
      | UserID | Event-Date |
      | COS_51 |          0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - User | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details.<br>OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

  @CA-24_1
  Scenario Outline: Alert Custom - T&A - Generated Overtime weekly Limit Exceeded #issue CSR-8500
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_51 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name    |
      | AlertOT |
    And Create NetWork Hours Policy "AlertNW"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOT | AlertNW        | True              | True               | True      | All         | true           | Weekly         |            1 | true                | true                 | Generated Overtime |              | 004:00        | Monday           |               | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "AlertOT"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00200 |        09900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_51 | True   | True      |                        2 | Both              |               |             | AlertOT     |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_51 |          0 |     070000 |
      | COS_51 |          0 |     200000 |
    And Set Alert Configuration "Overtime Limit Exceeded - User"
    And Update Alert Configuration "Overtime Limit Exceeded - User"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - User"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Overtime Limit Exceeded - User"
      | UserID |
      | COS_51 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    When Wait for "3" min
    And "Overtime Limit Exceeded - User" alert normal custom field value set
      | UserID | Event-Date |
      | COS_51 |          0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - User | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details.<br>OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

  @CA-24_2
  Scenario Outline: Alert Custom - T&A - Generated Overtime Monthly Limit Exceeded # Issue CSR-8500
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_51 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name    |
      | AlertOT |
    And Create NetWork Hours Policy "AlertNW"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOT | AlertNW        | True              | True               | True      | All         | true           | Monthly        | true                | Generated Overtime |              |               | Monday           | 004:00        | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "AlertOT"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00200 |        09900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_51 | True   | True      |                        2 | Both              |               |             | AlertOT     |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_51 |          0 |     070000 |
      | COS_51 |          0 |     200000 |
    And Set Alert Configuration "Overtime Limit Exceeded - User"
    And Update Alert Configuration "Overtime Limit Exceeded - User"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - User"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Overtime Limit Exceeded - User"
      | UserID |
      | COS_51 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_51 |
    When Wait for "3" min
    And "Overtime Limit Exceeded - User" alert normal custom field value set
      | UserID | Event-Date |
      | COS_51 |          0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - User | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date].<br>Daily Permissible OT:[Daily AllowedOT].<br>Daily Actual OT:[Daily ActualOT].<br><br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate].<br>Weekly Permissible OT:[Weekly AllowedOT].<br>Weekly Actual OT:[Weekly ActualOT].<br><br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate].<br>Monthly Permissible OT:[Monthly AllowedOT].<br>Monthly Actual OT:[Monthly ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized] for [WeekStartDate to WeekEndDate], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized] for [MonthStartDate to MonthEndDate], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>OT limit exceeded:<br>Daily [Generated/Authorized] for [Attendance Date], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT]. | OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details.<br>OT limit exceeded:<br>Daily [Generated/Authorized], Daily Permissible OT:[Daily AllowedOT], Daily Actual OT:[Daily ActualOT].<br>Weekly [Generated/Authorized], Weekly Permissible OT:[Weekly AllowedOT], Weekly Actual OT:[Weekly ActualOT].<br>Monthly [Generated/Authorized], Monthly Permissible OT:[Monthly AllowedOT], Monthly Actual OT:[Monthly ActualOT].<br>Kindly check ESS/Contact Administrator for more details. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |

  @CA-24_3
  Scenario Outline: Alert Custom - T&A - Overtime Limit Exceeded - Group Incharge-  Daily Limit Exceeded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_101     |
      | COS_102     |
      | COS_101_RIC |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name         |
      | AlertOTGroup |
    And Create NetWork Hours Policy "AlertOTGroup"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOTGroup | AlertOTGroup   | True      | ALL     | Daily 1    | false           | true                  | Generated Overtime |         0300 |         99959 | Monday           |         99959 | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AlertOTGroup"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_101     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110200001 | COS_101@gmail.com          |
      | COS_102     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110300001 | COS_102@gmail.com          |
      | COS_101_RIC | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS101RICGrp     |        1 | COS_101_RIC |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID  | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_101 | COS101RICGrp   |                |            |              | Saved Successfully |
      | COS_102 | COS101RICGrp   |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | COS_101 |          0 |     070000 |
      | COS_101 |          0 |     200000 |
      | COS_102 |          0 |     083000 |
      | COS_102 |          0 |     210000 |
    And Set Alert Configuration "Overtime Limit Exceeded - Group Incharge"
    And Update Alert Configuration "Overtime Limit Exceeded - Group Incharge"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime Limit Exceeded - Group Incharge"
      | UserID      |
      | COS_101_RIC |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Overtime Limit Exceeded - Group Incharge" alert normal custom field value set
      | UserID  | Event-Date | Exceedcheck |
      | COS_101 |          0 | Daily       |
      | COS_102 |          0 | Daily       |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                               | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RIC      | Overtime limit exceeded for below listed User(s):<br>Overtime limit exceeded for below listed User(s): | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). |
      | Default   | RIC      | Default                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                  |

  @CA-24_4
  Scenario Outline: Alert Custom - T&A - Overtime Limit Exceeded - Group Incharge-  Weekly Limit Exceeded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_101     |
      | COS_102     |
      | COS_101_RIC |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name         |
      | AlertOTGroup |
    And Create NetWork Hours Policy "AlertOTGroup"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WeekStartDay | WklyMthlyAutoAuthOT | ConsWorkDoneonWOPHPL | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOTGroup | AlertOTGroup   | True              | True               | True      | All         | true           | Weekly         |            1 | true                | true                 | Generated Overtime |              | 004:00        | Monday           |         99959 | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "AlertOTGroup"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00200 |        09900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_101     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110200001 | COS_101@gmail.com          |
      | COS_102     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110300001 | COS_102@gmail.com          |
      | COS_101_RIC | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS101RICGrp     |        1 | COS_101_RIC |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID  | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_101 | COS101RICGrp   |                |            |              | Saved Successfully |
      | COS_102 | COS101RICGrp   |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | COS_101 |          0 |     070000 |
      | COS_101 |          0 |     200000 |
      | COS_102 |          0 |     083000 |
      | COS_102 |          0 |     210000 |
    And Set Alert Configuration "Overtime Limit Exceeded - Group Incharge"
    And Update Alert Configuration "Overtime Limit Exceeded - Group Incharge"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime Limit Exceeded - Group Incharge"
      | UserID      |
      | COS_101_RIC |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    When Wait for "4" min
    And "Overtime Limit Exceeded - Group Incharge" alert normal custom field value set
      | UserID  | Event-Date | Exceedcheck |
      | COS_101 |          0 | Weekly      |
      | COS_102 |          0 | Weekly      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                               | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever  | mailContent                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RICWeekly | Overtime limit exceeded for below listed User(s):<br>Overtime limit exceeded for below listed User(s): | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). |
      | Default   | RICWeekly | Default                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                  |

  @CA-24_5
  Scenario Outline: Alert Custom - T&A - Overtime Limit Exceeded - Group Incharge-  Monthly Limit Exceeded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_101     |
      | COS_102     |
      | COS_101_RIC |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name         |
      | AlertOTGroup |
    And Create NetWork Hours Policy "AlertOTGroup"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName      | NetWorkPlcName | CalOnAsPerWeekDay | CalOnResHolasperPH | EnblOTCal | WklyMthlyOT | OTR4FracEnable | WklyMthlyOTCal | WklyMthlyAutoAuthOT | OTAlertCal         | DailyOTLimit | WeeklyOTLimit | AlrtWeekStartDay | MnthlyOTLimit | validation         |
      | AlertOTGroup | AlertOTGroup   | True              | True               | True      | All         | true           | Monthly        | true                | Generated Overtime |              | 004:00        | Monday           | 004:00        | Saved Successfully |
    And Overtime Calculation Weekly Monthly Work Component Configuration In Overtime Policy "AlertOTGroup"
      | NWHrsRangeFrom | NWHrsRangeTo | MinDurReq | ConsiderAs | Factor |
      |          00200 |        09900 |     00000 | OT1        |   1.00 |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc  | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_101     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110200001 | COS_101@gmail.com          |
      | COS_102     | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     5110300001 | COS_102@gmail.com          |
      | COS_101_RIC | True   | True      |                        2 | Both              |               |             | AlertOTGroup |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS101RICGrp     |        1 | COS_101_RIC |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID  | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_101 | COS101RICGrp   |                |            |              | Saved Successfully |
      | COS_102 | COS101RICGrp   |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    And Set event via Event Set API
      | Userid  | event-date | event-time |
      | COS_101 |          0 |     070000 |
      | COS_101 |          0 |     200000 |
      | COS_102 |          0 |     083000 |
      | COS_102 |          0 |     210000 |
    And Set Alert Configuration "Overtime Limit Exceeded - Group Incharge"
    And Update Alert Configuration "Overtime Limit Exceeded - Group Incharge"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime Limit Exceeded - Group Incharge"
      | UserID      |
      | COS_101_RIC |
    And Set Alert Message Preview in Alert "Overtime Limit Exceeded - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID  |
      | COS_101 |
      | COS_102 |
    When Wait for "4" min
    And "Overtime Limit Exceeded - Group Incharge" alert normal custom field value set
      | UserID  | Event-Date | Exceedcheck |
      | COS_101 |          0 | Monthly     |
      | COS_102 |          0 | Monthly     |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                               | MailRecieveTo |
      | <alertType> | Overtime Limit Exceeded - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RICMonthly | Overtime limit exceeded for below listed User(s):<br>Overtime limit exceeded for below listed User(s): | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). | Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s).<br>Daily OT limit exceeded for [Daily UserCount] User(s). Weekly OT limit exceeded for [Weekly UserCount] User(s). Monthly OT limit exceeded for [Monthly UserCount] User(s). |
      | Default   | RICMonthly | Default                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                  |

  @CA-27
  Scenario Outline: Alert Custom - T&A - Advance Overtime Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_52      |
      | COS_52_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   5200000001 | cos52@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name      |
      | AdvOTApp1 |
    And Create NetWork Hours Policy "AlertNW1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AdvOTApp1 | AlertNW1       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_52      | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     5200000001 | cos52@gmail.com            |
      | COS_52_RIC1 | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_52      |                          1 | admin        |    1 |
      | COS_52_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS52RICGrp      |        1 | COS_52_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_52 | COS52RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Set Alert Configuration "Advance Overtime Application"
    And Update Alert Configuration "Advance Overtime Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Set Alert Message Preview in Alert "Advance Overtime Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Advance Overtime Application"
      | UserID      |
      | COS_52_RIC1 |
    When Generate Advance Overtime Application via API
      | userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | COS_52 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52    |
    And "Advance Overtime Application" alert normal custom field value set
      | UserID |
      | COS_52 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Advance Overtime Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                             | whatsappContent                                                                                                                                                                                  |
      | Custom    | RIC      | [UserName] has applied for advance overtime.<br>Details are as follows:<br><br>Applied On: [Application Date]<br>User ID: [UserID]<br>OT Date: [OT-Date]<br>OT Duration: [OT-Hours]<br>Reason: [Reason]<br>[UserName] has applied for advance overtime.<br>Details are as follows:<br><br>Applied On: [Application Date]<br>User ID: [UserID]<br>OT Date: [OT-Date]<br>OT Duration: [OT-Hours]<br>Reason: [Reason] | [UserID] - [UserName] has applied for advance overtime on [OT-Date] - [OT-Hours].<br>[UserID] - [UserName] has applied for advance overtime on [OT-Date] - [OT-Hours]. | [UserID-UserName] has applied for advance overtime on [OT-Date] - [OT-Hours] Reason: [Reason].<br>[UserID-UserName] has applied for advance overtime on [OT-Date] - [OT-Hours] Reason: [Reason]. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                | Default                                                                                                                                                                                          |

  @CA-27_1
  Scenario Outline: Alert Custom - T&A - Advance Overtime Application-Approved     #Issue CSR-8520
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_52      |
      | COS_52_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   5200000011 | cos52ric1@gmail.com        |
    And Delete Overtime Policy from TnA module
      | Name      |
      | AdvOTApp1 |
    And Create NetWork Hours Policy "AlertNW1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AdvOTApp1 | AlertNW1       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_52      | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
      | COS_52_RIC1 | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     5200000011 | cos52ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_52      |                          1 | admin        |    1 |
      | COS_52_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS52RICGrp      |        1 | COS_52_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_52 | COS52RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Set Alert Configuration "Advance Overtime Approval/Rejection"
    And Assign User in Alert "Advance Overtime Approval/Rejection"
      | UserID |
      | COS_52 |
    And Set Alert Message Preview in Alert "Advance Overtime Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Generate Advance Overtime Application via API
      | userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | COS_52 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52    |
    And Approve Reject Advance Overtime Application via API
      | approved | ot-hours | remark        | ricID       | userid | OT-date |
      |        1 |     0200 | AdvOTApproved | COS_52_RIC1 | COS_52 |       1 |
    And "Advance Overtime Approval/Rejection" alert normal custom field value set
      | UserID |
      | COS_52 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Advance Overtime Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | ([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>Remark: [Remark]<br>([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>Remark: [Remark] | ([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours]. | ([UserID-UserName]), Your advance overtime application for [OT-Date-OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>([UserID-UserName]), Your advance overtime application for [OT-Date-OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours]. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                          |

  @CA-27_2
  Scenario Outline: Alert Custom - T&A - Advance Overtime Application-Rejected   #Issue CSR-8520
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_52      |
      | COS_52_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   5200000011 | cos52ric1@gmail.com        |
    And Delete Overtime Policy from TnA module
      | Name      |
      | AdvOTApp1 |
    And Create NetWork Hours Policy "AlertNW1"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AdvOTApp1 | AlertNW1       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp1"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid      | Active | AtdEnable | MaxPunchesToBeConsidered | OtCoffEligibility | AttendancePlc | AbsenteePlc | OvertimePlc | LateInPlc | EarlyOutPlc | CoffPlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         | PersonalMobile | PersonalEmail              |
      | COS_52      | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     9033207186 | matrixautomationreceiver@gmail.com |
      | COS_52_RIC1 | True   | True      |                        2 | Both              |               |             | AdvOTApp1   |           |             |         | True      | True      | True      | True               | Saved Successfully |     5200000011 | cos52ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_52      |                          1 | admin        |    1 |
      | COS_52_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS52RICGrp      |        1 | COS_52_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_52 | COS52RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_52 |
    And Set Alert Configuration "Advance Overtime Approval/Rejection"
    And Assign User in Alert "Advance Overtime Approval/Rejection"
      | UserID |
      | COS_52 |
    And Set Alert Message Preview in Alert "Advance Overtime Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Generate Advance Overtime Application via API
      | userid | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | COS_52 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52    |
    And Approve Reject Advance Overtime Application via API
      | approved | ot-hours | remark        | ricID       | userid | OT-date |
      |        2 |     0200 | AdvOTRejected | COS_52_RIC1 | COS_52 |       1 |
    And "Advance Overtime Approval/Rejection" alert normal custom field value set
      | UserID |
      | COS_52 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Advance Overtime Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                  |
      | Custom    | ESS      | ([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>Remark: [Remark]<br>([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>Remark: [Remark] | ([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>([UserID]-[UserName]), your advance overtime application for [OT-Date] - [OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours]. | ([UserID-UserName]), Your advance overtime application for [OT-Date-OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours].<br>([UserID-UserName]), Your advance overtime application for [OT-Date-OT-Hours] is [Approved/Rejected] on [Approved/Rejected Date Time]. Approved OT-Hours: [Approved OT-Hours]. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                          |

  @CA_40
  Scenario Outline: Alert Custom - T&A - Attendance Exception-Send to ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_54_u1   |
      | COS_54_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   5410000011 | cos54ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_54_u1   | COS_54_u1   |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_54_RIC1 | COS_54_RIC1 |               1 |         1 |               1 |                  1 |    5410000011 | cos54ric1@gmail.com        |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS54RICGrp1     |        1 | COS_54_RIC1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | Validation         |
      | COS_54_u1 | COS54RICGrp1   | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_54_u1 |          0 |     100000 |
      | COS_54_u1 |          0 |     150000 |
    And Update Alert Configuration "Attendance Exception"
      | SendAlertAsPer      | ScheduleTime |
      | Daily-Schedule Time |            2 |
    And Set Alert Configuration "Attendance Exception"
    And Set Send Alert to parameters for "Attendance Exception" Alert
    And Assign User in Alert "Attendance Exception"
      | UserID    |
      | COS_54_u1 |
    And Set Alert Message Preview in Alert "Attendance Exception"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Attendance Exception" alert normal custom field value set
      | UserID    |
      | COS_54_u1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Attendance Exception | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                     | whatsappContent                                                                |
      | Custom    | ESS      | [Exception] on [Date] <br> Details : <br> Shift: [Shift] <br> In: [1st Punch] <br> Last Punch: [Last Punch] <br> 1st Half: [1st Half] <br> 2nd Half: [2nd Half] <br> Work Hours: [Work Duration]<br>[Exception] on [Date] <br> Details : <br> Shift: [Shift] <br> In: [1st Punch] <br> Last Punch: [Last Punch] <br> 1st Half: [1st Half] <br> 2nd Half: [2nd Half] <br> Work Hours: [Work Duration] | [Exception] on [Date]<br>[Exception] on [Date] | [Exception] on [Date] has been found.<br>[Exception] on [Date] has been found. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                              | Default                                        | Default                                                                        |

  @CA_40_1
  Scenario Outline: Alert Custom - T&A - Attendance Exception-Send to RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_54_u1   |
      | COS_54_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   5410000001 | cos54@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_54_u1   | COS_54_u1   |               1 |         1 |               1 |                  1 |    5410000001 | cos54@gmail.com            |
      | COS_54_RIC1 | COS_54_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS54RICGrp1     |        1 | COS_54_RIC1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | Validation         |
      | COS_54_u1 | COS54RICGrp1   | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_54_u1 |          0 |     100000 |
      | COS_54_u1 |          0 |     150000 |
    And Update Alert Configuration "Attendance Exception"
      | SendAlertAsPer      | ScheduleTime |
      | Daily-Schedule Time |            2 |
    And Set Alert Configuration "Attendance Exception"
    And Set Send Alert to parameters for "Attendance Exception" Alert
    And Assign User in Alert "Attendance Exception"
      | UserID    |
      | COS_54_u1 |
    And Set Alert Message Preview in Alert "Attendance Exception"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    When Wait for "4" min
    And "Attendance Exception" alert normal custom field value set
      | UserID    |
      | COS_54_u1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Attendance Exception | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                               | smsContent1                                                                                    | whatsappContent1                                                                                                             |
      | Custom    | RIC      | [Exception] on [Date] for below [User Count] users.<br>[Exception] on [Date] for below [User Count] users. | [Exception] on [Date] for [User Count] users.<br>[Exception] on [Date] for [User Count] users. | [Exception] on [Date] for [User Count] users has been found.<br>[Exception] on [Date] for [User Count] users has been found. |
      | Default   | RIC      | Default                                                                                                    | Default                                                                                        | Default                                                                                                                      |

  @CA_25
  Scenario Outline: Alert Custom -T&A Shift Change Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_49_u1   |
      | COS_49_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_49_u1   | COS_49_u1   |               1 |         1 |               1 |                  1 |    4910000001 | cos491@gmail.com           |
      | COS_49_RIC1 | COS_49_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_49_u1   |                          1 | admin        |    1 |
      | COS_49_RIC1 |                          1 | admin        |    1 |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | S1      |        -4 |       4 | 04:00   | 08:00   | Saved Successfully |
      | S2      |        -2 |       6 | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "ShiftChng" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | S1      |               7 |
      | S2      |               7 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS49RICGrp1     |        1 | COS_49_RIC1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | ShiftSchedule | ReportingGroup | Validation         |
      | COS_49_u1 | ShiftChng     | COS49RICGrp1   | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_49_u1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_49_u1 |
    And Set Alert Configuration "Shift Change Application"
    And Update Alert Configuration "Shift Change Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Set Alert Message Preview in Alert "Shift Change Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Shift Change Application"
      | UserID      |
      | COS_49_RIC1 |
    And Get Shift and Change Shift via API for Alert
      | userid    | date-range | shift-id1 | shift-id2 | appliedBy |
      | COS_49_u1 |          0 | S1        | S2        | COS_49_u1 |
    And Get Change Shift application data for custom Alert
      | Userid    | fromDate |
      | COS_49_u1 |        0 |
    And "Shift Change Application" alert normal custom field value set
      | UserID    |
      | COS_49_u1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent               | MailRecieveTo |
      | <alertType> | Shift Change Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                | smsContent                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                            |
      | Custom    | RIC      | [UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm].<br>[UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm]. | [UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm].<br>[UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm]. | [UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm].<br>[UserID] - [UserName] requested Shift Change for attendance date [From Date-To Date], New Shift: [shift code] - start time: [start time hh:mm]- end time: [end time hh:mm]. |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                    |

  #************************************************************************************************
  #************************************************************************************************
  # LEAVE MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-30_2
  Scenario Outline: Alert Custom - Leave - Leave Approval - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3200000011 | cos32ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3200000011 | cos32ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_32 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Approval"
    And Assign User in Alert "Leave Approval"
      | UserID |
      | COS_32 |
    And Set Alert Message Preview in Alert "Leave Approval"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | MV         |                     1 | COS_32    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_32_RIC1 | COS_32 |          0 |        0 |
    And "Leave Approval" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType  |
      | COS_32 | Leave         | days      | Paid Leave |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Leave Approval | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

  @CA-30_4
  Scenario Outline: Alert Custom - Leave - Leave Approval - Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3200000011 | cos32ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3200000011 | cos32ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | IG      | HrAlert   | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "CusAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IG      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup       | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | CusAlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_32 |          0 |           0 |                 |                 |      | 140720230200 |              1 | IG         |        |       |      |          | credit | 020:00 |
    And Set Alert Configuration "Leave Approval"
    And Assign User in Alert "Leave Approval"
      | UserID |
      | COS_32 |
    And Set Alert Message Preview in Alert "Leave Approval"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | COS_32 |                  4 |          0 |        0 | IG         |                     1 |               0 | 09:00             | 18:00           | COS_32    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_32_RIC1 | COS_32 |          0 |        0 |
    And "Leave Approval" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType         | HourlyStartTime | HourlyEndTime |
      | COS_32 | Leave         | hours     | Hourly Paid Leave | 09:00:00        | 18:00:00      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Leave Approval | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

  @CA-30_6
  Scenario Outline: Alert Custom - Leave - Leave Approval - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3200000011 | cos32ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3200000011 | cos32ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_32 |
    When Manual Overtime/C-OFF Entry for UserID= "COS_32" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Approval"
    And Assign User in Alert "Leave Approval"
      | UserID |
      | COS_32 |
    And Set Alert Message Preview in Alert "Leave Approval"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | IH         |                     1 | COS_32    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_32_RIC1 | COS_32 |          0 |        0 |
    And "Leave Approval" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType        |
      | COS_32 | C-OFF Leave   | days      | Compensatory Off |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Leave Approval | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

  @CA-30_8
  Scenario Outline: Alert Custom - Leave - Leave Approval - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3200000011 | cos32ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3200000011 | cos32ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Approval"
    And Assign User in Alert "Leave Approval"
      | UserID |
      | COS_32 |
    And Set Alert Message Preview in Alert "Leave Approval"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | II         |                     1 | COS_32    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_32_RIC1 | COS_32 |          0 |        0 |
    And "Tour Approval" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_32 | Tour          | days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent    | MailRecieveTo |
      | <alertType> | Tour Approval | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Approved on [Approved DateTime] for [Approved/Applied] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

  @CA-31_1
  Scenario Outline: Alert Custom - Leave - Leave Rejection - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_33 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_33 | COS_33 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_33 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_33 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_33 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Rejection"
    And Assign User in Alert "Leave Rejection"
      | UserID |
      | COS_33 |
    And Set Alert Message Preview in Alert "Leave Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_33 |                  1 |          0 |        0 | MV         |                     1 | cos_33    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | RejectedRequest | SA    | COS_33 |          0 |        0 |
    And "Leave Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_33 | Leave         | days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent      | MailRecieveTo |
      | <alertType> | Leave Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  @CA-31_2
  Scenario Outline: Alert Custom - Leave - Leave Rejection - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_33 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_33 | COS_33 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_33 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_33 |                |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_33 |
    And Manual Overtime/C-OFF Entry for UserID= "COS_33" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Rejection"
    And Assign User in Alert "Leave Rejection"
      | UserID |
      | COS_33 |
    And Set Alert Message Preview in Alert "Leave Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_33 |                  1 |          0 |        0 | IH         |                     1 | COS_33    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | RejectedRequest | SA    | COS_33 |          0 |        0 |
    And "Leave Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType        |
      | COS_33 | C-OFF Leave   | days      | Compensatory Off |
    Then Validate Alert Containt
      | AlertType   | AlertEvent      | MailRecieveTo |
      | <alertType> | Leave Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  @CA-31_3
  Scenario Outline: Alert Custom - Leave - Leave Rejection - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_33 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_33 | COS_33 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_33 |                          1 | admin        |    1 |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_33 |                |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Rejection"
    And Assign User in Alert "Leave Rejection"
      | UserID |
      | COS_33 |
    And Set Alert Message Preview in Alert "Leave Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_33 |                  1 |          0 |        0 | II         |                     1 | COS_33    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        2 | RejectedRequest | SA    | COS_33 |          0 |        0 |
    And "Tour Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_33 | Tour          | days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Tour Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].<br>Remark:[Remark][UserID][UserName] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Application for [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] | ([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName]<br>([UserID-UserName]), Your [Leave/Tour/C-OFF Leave] application for [Leave Name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] has been Rejected on [Rejected DateTime] for [Applied Days/Hours] [days/hours].[UserID][UserName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  @CA-30_1
  Scenario Outline: Alert Custom - Leave - Leave Application - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3200000001 | cos32@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    3200000001 | cos32@gmail.com            |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_32 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Application"
    And Update Alert Configuration "Leave Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Application"
      | UserID      |
      | COS_32_RIC1 |
    And Set Alert Message Preview in Alert "Leave Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | MV         |                     1 | COS_32    |
    And "Leave Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType  |
      | COS_32 | Leave         | Days      | Paid Leave |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Leave Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RIC      | [User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name]<br>[User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name][UserID-UserName] | [UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name]<br>[UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

  @CA-30_3
  Scenario Outline: Alert Custom - Leave - Leave Application - Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3200000001 | cos32@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    3200000001 | cos32@gmail.com            |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | IG      | HrAlert   | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "CusAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IG      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup       | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | CusAlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_32 |          0 |           0 |                 |                 |      | 140720230200 |              1 | IG         |        |       |      |          | credit | 020:00 |
    And Set Alert Configuration "Leave Application"
    And Update Alert Configuration "Leave Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Application"
      | UserID      |
      | COS_32_RIC1 |
    And Set Alert Message Preview in Alert "Leave Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | COS_32 |                  4 |          0 |        0 | IG         |                     1 |               0 | 09:00             | 18:00           | COS_32    |
    And "Leave Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType         | HourlyStartTime | HourlyEndTime |
      | COS_32 | Leave         | Hours     | Hourly Paid Leave | 09:00:00        | 18:00:00      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Leave Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RIC      | [User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name]<br>[User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name][UserID-UserName] | [UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name]<br>[UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

  #space in db discuss
  @CA-30_5
  Scenario Outline: Alert Custom - Leave - Leave Application - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3200000001 | cos32@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    3200000001 | cos32@gmail.com            |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_32 |
    When Manual Overtime/C-OFF Entry for UserID= "COS_32" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Application"
    And Update Alert Configuration "Leave Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Application"
      | UserID      |
      | COS_32_RIC1 |
    And Set Alert Message Preview in Alert "Leave Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | IH         |                     1 | COS_32    |
    And "Leave Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | LeaveType        |
      | COS_32 | C-OFF Leave   | Days      | Compensatory Off |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Leave Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RIC      | [User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name]<br>[User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name][UserID-UserName] | [UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name]<br>[UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

  @CA-30_7
  Scenario Outline: Alert Custom - Leave - Leave Application - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32      |
      | COS_32_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3200000001 | cos32@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_32      | COS_32      |               1 |         1 |               1 |                  1 |    3200000001 | cos32@gmail.com            |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32      |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp      | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_32 | COS32RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Application"
    And Update Alert Configuration "Leave Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Application"
      | UserID      |
      | COS_32_RIC1 |
    And Set Alert Message Preview in Alert "Leave Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32 |                  1 |          0 |        0 | II         |                     1 | COS_32    |
    And "Tour Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_32 | Tour          | Days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent       | MailRecieveTo |
      | <alertType> | Tour Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | RIC      | [User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name]<br>[User NAME] has applied [Leave/Tour/C-OFF Leave]:[Leave Name]<br>Details are as follows:<br><br>Applied On: [Applied Date]<br>User ID: [UserID]<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name] ([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Due To Punch Received From Site: ID-Name/Location: Code-Name][UserID-UserName] | [UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID] - [User Name] has Applied [Leave/Tour/C-OFF Leave]:[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name]<br>[UserID-User Name] has Applied for [Leave/Tour/C-OFF Leave] application for [Leave Name] from the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] for [Applied Days/Hours] [days/hours] with Posted Duration: [Posted Days/Hours] Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |

  @CA-34_1
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Application - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3600000001 | cos36@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    3600000001 | cos36@gmail.com            |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_36 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Cancellation Application"
    And Update Alert Configuration "Leave Cancellation Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Cancellation Application"
      | UserID      |
      | COS_36_RIC1 |
    And Set Alert Message Preview in Alert "Leave Cancellation Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | MV         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And "Leave Cancellation Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_36 | Leave         | Days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Leave Cancellation Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | RIC      | [Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason][UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Default                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  @CA-34_3
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Application - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3600000001 | cos36@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    3600000001 | cos36@gmail.com            |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_36 |
    And Manual Overtime/C-OFF Entry for UserID= "COS_36" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Application"
    And Update Alert Configuration "Leave Cancellation Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Cancellation Application"
      | UserID      |
      | COS_36_RIC1 |
    And Set Alert Message Preview in Alert "Leave Cancellation Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | IH         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And "Leave Cancellation Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_36 | C-OFF Leave   | Days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Leave Cancellation Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | RIC      | [Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason][UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Default                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  @CA-34_5
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Application - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3600000001 | cos36@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    3600000001 | cos36@gmail.com            |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Application"
    And Update Alert Configuration "Leave Cancellation Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Cancellation Application"
      | UserID      |
      | COS_36_RIC1 |
    And Set Alert Message Preview in Alert "Leave Cancellation Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | II         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And "Tour Cancellation Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours |
      | COS_36 | Tour          | Days      |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                    | MailRecieveTo |
      | <alertType> | Tour Cancellation Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | RIC      | [Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason]<br>[Leave/Tour/C-OFF Leave] Cancellation application:-<br>Applied On: [Applied Date]<br>By: [User Name]([UserID])<br><br>Towards the following [Leave/Tour/C-OFF Leave] Application:<br>[Leave/Tour/C-OFF Leave] Type: [Leave Name]([Leave])<br>[Leave/Tour/C-OFF Leave] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br>Posted Duration: [Posted Days/Hours]<br>Reason:[Reason][UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours].[UserID-UserName] | [UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName]<br>[UserID]-[User Name] has Applied for [Leave/Tour/C-OFF Leave] Cancellation towards [Leave Name] for specified leave period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID-UserName] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Default                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  @CA-34_2
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Approval - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3600000011 | cos36ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    3600000011 | cos36ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_36 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_36 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | MV         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedCancelled | COS_36_RIC1 | COS_36 |          0 |        0 |
    And "Leave Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_36 | Leave         | Approved         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-35_1
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Rejection - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_37 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_37 | COS_37 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_37 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_37 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_37 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_37 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_37 |                  1 |          0 |        0 | MV         |                     1 | COS_37    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_37 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_37 |            2 | cos_37    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID | userid | Start-date | end-date |
      |        2 | RejectedCancelled | SA    | COS_37 |          0 |        0 |
    And "Leave Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_37 | Leave         | Rejected         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-34_4
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Approval - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3600000011 | cos36ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    3600000011 | cos36ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_36 |
    And Manual Overtime/C-OFF Entry for UserID= "COS_36" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_36 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | IH         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedCancelled | COS_36_RIC1 | COS_36 |          0 |        0 |
    And "Leave Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_36 | C-OFF Leave   | Approved         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-35_2
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Rejection - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_37 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_37 | COS_37 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_37 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_37 |                |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_37 |
    And Manual Overtime/C-OFF Entry for UserID= "COS_37" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_37 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_37 |                  1 |          0 |        0 | IH         |                     1 | COS_37    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_37 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_37 |            2 | cos_37    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID | userid | Start-date | end-date |
      |        2 | RejectedCancelled | SA    | COS_37 |          0 |        0 |
    And "Leave Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_37 | C-OFF Leave   | Rejected         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-34_6
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Approval - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36      |
      | COS_36_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3600000011 | cos36ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_36      | COS_36      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    3600000011 | cos36ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36      |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp      | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_36 | COS36RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_36 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36 |                  1 |          0 |        0 | II         |                     1 | COS_36    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36 |            2 | COS_36    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedCancelled | COS_36_RIC1 | COS_36 |          0 |        0 |
    And "Tour Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_36 | Tour          | Approved         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                           | MailRecieveTo |
      | <alertType> | Tour Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-35_3
  Scenario Outline: Alert Custom - Leave - Leave Cancellation Rejection - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_37 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_37 | COS_37 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_37 |                          1 | admin        |    1 |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_37 |                |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | UserID |
      | COS_37 |
    And Set Alert Message Preview in Alert "Leave Cancellation Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_37 |                  1 |          0 |        0 | II         |                     1 | COS_37    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_37 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_37 |            2 | cos_37    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID | userid | Start-date | end-date |
      |        2 | RejectedCancelled | SA    | COS_37 |          0 |        0 |
    And "Tour Cancellation Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected |
      | COS_37 | Tour          | Rejected         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                           | MailRecieveTo |
      | <alertType> | Tour Cancellation Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][User Name] | ([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>([UserID-UserName]),Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code]-[Leave Name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] | [UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name]<br>[UserID-UserName], Your [Leave/Tour/C-OFF Leave] Cancellation application for [Leave code-Leave Name] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][User Name] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |

  @CA-29_1
  Scenario Outline: Alert Custom - Leave - Leave Credit - Paid Leave - User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_31 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_31 | COS_31 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_31 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_31 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Credit/Debit"
    And Update Alert Configuration "Leave Credit/Debit"
      | AlertReportingInCharge |
      | True                   |
    And Assign User in Alert "Leave Credit/Debit"
      | UserID |
      | COS_31 |
    And Set Alert Message Preview in Alert "Leave Credit/Debit"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | COS_31 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit |       |
    And "Leave Credit/Debit" alert normal custom field value set
      | UserID | DaysHours | CreditedDebited | CreditedDebited2 | Month | Year |
      | COS_31 | days      | Credited to     | Credited         |     0 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Leave Credit/Debit | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                          |
      | Custom    | ESS      | [No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name].<br>[No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name]. | [No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name].<br>[No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name]. | Your leave account has been [Credited/Debited] with count of [No. of Days/Hours] [days/hours] of ([leave ID])- [Leave Name] type for [Month-Year].<br>Your leave account has been [Credited/Debited] with count of [No. of Days/Hours] [days/hours] of ([leave ID])- [Leave Name] type for [Month-Year]. |
      | Default   | ESS      | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                  |

  #Issue in WhatsApp Message Content - Extra Word with added
  @CA-29_2
  Scenario Outline: Alert Custom - Leave - Leave Debit - Paid Leave - User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_31 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_31 | COS_31 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_31 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_31 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_31 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Credit/Debit"
    And Update Alert Configuration "Leave Credit/Debit"
      | AlertReportingInCharge |
      | True                   |
    And Assign User in Alert "Leave Credit/Debit"
      | UserID |
      | COS_31 |
    And Set Alert Message Preview in Alert "Leave Credit/Debit"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_31 |          1 |           0 |                 |                 |    5 | 140720230200 |              1 | MV         |        |       |      |          | debit  | 002:00 |
    And "Leave Credit/Debit" alert normal custom field value set
      | UserID | DaysHours | CreditedDebited | CreditedDebited2 | Month | Year |
      | COS_31 | days      | Debited from    | Debited          |     0 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Leave Credit/Debit | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                          |
      | Custom    | ESS      | [No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name].<br>[No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name]. | [No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name].<br>[No. of Days/Hours] [days/hours] have been [Credited to/Debited from] your ([leave ID])-[Leave Name]. | Your leave account has been [Credited/Debited] with count of [No. of Days/Hours] [days/hours] of ([leave ID])- [Leave Name] type for [Month-Year].<br>Your leave account has been [Credited/Debited] with count of [No. of Days/Hours] [days/hours] of ([leave ID])- [Leave Name] type for [Month-Year]. |
      | Default   | ESS      | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                  |

  @CA-29_3
  Scenario Outline: Alert Custom - Leave - Leave Credit - Paid Leave - RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_31      |
      | COS_31_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3100000001 | cos31@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_31      | COS_31      |               1 |         1 |               1 |                  1 |    3100000001 | cos31@gmail.com            |
      | COS_31_RIC1 | COS_31_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_31 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS31RICGrp      | AnyOne     | COS_31_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_31 | COS31RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Credit/Debit"
    And Update Alert Configuration "Leave Credit/Debit"
      | AlertReportingInCharge |
      | True                   |
    And Assign User in Alert "Leave Credit/Debit"
      | UserID      |
      | COS_31_RIC1 |
    And Set Alert Message Preview in Alert "Leave Credit/Debit"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | COS_31 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit |       |
    And "Leave Credit/Debit" alert normal custom field value set
      | UserID | DaysHours | CreditedDebited | CreditedDebited2 | Month | Year |
      | COS_31 | days      | Credited to     | Credited         |     0 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Leave Credit/Debit | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                                                                                                                                                                                                                                                       | smsContent1                                                                                                                                                                                                                                                                                                                          | whatsappContent1                                                                                                                                                                                                                                                                                                                                                               |
      | Custom    | RIC      | [No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id])[UserID-UserName][LeaveID-LeaveName]<br>[No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id])[UserID-UserName][LeaveID-LeaveName] | [No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id]) [UserID-UserName][LeaveID-LeaveName]<br>[No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id]) [UserID-UserName][LeaveID-LeaveName] | Leave with count of [No. of Days/Hours] [days/hours] of [leave ID-Leave Name] type have been [Credited/Debited] for User [Username-User id] [Username][User id][leave ID][Leave Name]<br>Leave with count of [No. of Days/Hours] [days/hours] of [leave ID-Leave Name] type have been [Credited/Debited] for User [Username-User id] [Username][User id][leave ID][Leave Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                        |

  #Issue in WhatsApp - Extra Word from added
  @CA-29_4
  Scenario Outline: Alert Custom - Leave - Leave Debit - Paid Leave - RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_31      |
      | COS_31_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3100000001 | cos31@gmail.com            |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_31      | COS_31      |               1 |         1 |               1 |                  1 |    3100000001 | cos31@gmail.com            |
      | COS_31_RIC1 | COS_31_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_31      |                          1 | admin        |    1 |
      | COS_31_RIC1 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS31RICGrp      | AnyOne     | COS_31_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_31 | COS31RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_31 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Credit/Debit"
    And Update Alert Configuration "Leave Credit/Debit"
      | AlertReportingInCharge |
      | True                   |
    And Assign User in Alert "Leave Credit/Debit"
      | UserID      |
      | COS_31_RIC1 |
    And Set Alert Message Preview in Alert "Leave Credit/Debit"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    When Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_31 |          1 |           0 |                 |                 |    5 | 140720230200 |              1 | MV         |        |       |      |          | debit  | 002:00 |
    And "Leave Credit/Debit" alert normal custom field value set
      | UserID | DaysHours | CreditedDebited | CreditedDebited2 | Month | Year |
      | COS_31 | days      | Debited from    | Debited          |     0 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Leave Credit/Debit | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                                                                                                                                                                                                                                                       | smsContent1                                                                                                                                                                                                                                                                                                                          | whatsappContent1                                                                                                                                                                                                                                                                                                                                                               |
      | Custom    | RIC      | [No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id])[UserID-UserName][LeaveID-LeaveName]<br>[No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id])[UserID-UserName][LeaveID-LeaveName] | [No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id]) [UserID-UserName][LeaveID-LeaveName]<br>[No. of Days/Hours] [days/hours] of ([leave ID])-[Leave Name] have been [Credited to/Debited from] [Username](id:[User id]) [UserID-UserName][LeaveID-LeaveName] | Leave with count of [No. of Days/Hours] [days/hours] of [leave ID-Leave Name] type have been [Credited/Debited] for User [Username-User id] [Username][User id][leave ID][Leave Name]<br>Leave with count of [No. of Days/Hours] [days/hours] of [leave ID-Leave Name] type have been [Credited/Debited] for User [Username-User id] [Username][User id][leave ID][Leave Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                        |

  #Pending - Issue
  @CA-36_1
  Scenario Outline: Alert Custom - Leave - Leave Status Update - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_38 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_38 | COS_38 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_38 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_38 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_38 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Status Update"
    And Assign User in Alert "Leave Status Update"
      | UserID |
      | COS_38 |
    And Set Alert Message Preview in Alert "Leave Status Update"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_38 |                  1 |          0 |        0 | MV         |                     1 | COS_38    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_38 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_38 |          0 |        0 |
    And "Leave Status Update" alert normal custom field value set
      | UserID | LeaveTourCOFF | PreviousApprovedRejected | CurrentApprovedRejected |
      | COS_38 | Leave         | Approved                 | Rejected                |
    Then Validate Alert Containt
      | AlertType   | AlertEvent          | MailRecieveTo |
      | <alertType> | Leave Status Update | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | ESS      | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  #Pending - Issue
  @CA-36_2
  Scenario Outline: Alert Custom - Leave - Leave Status Update - C-OFF
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_38 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_38 | COS_38 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_38 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | IH      | COffAlert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "COffAlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | IH      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_38 |                |                | COffAlertLeaveGrp |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_38 |
    And Manual Overtime/C-OFF Entry for UserID= "COS_38" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Alert Configuration "Leave Status Update"
    And Assign User in Alert "Leave Status Update"
      | UserID |
      | COS_38 |
    And Set Alert Message Preview in Alert "Leave Status Update"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_38 |                  1 |          0 |        0 | IH         |                     1 | COS_38    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_38 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_38 |          0 |        0 |
    And "Leave Status Update" alert normal custom field value set
      | UserID | LeaveTourCOFF | PreviousApprovedRejected | CurrentApprovedRejected |
      | COS_38 | C-OFF Leave   | Approved                 | Rejected                |
    Then Validate Alert Containt
      | AlertType   | AlertEvent          | MailRecieveTo |
      | <alertType> | Leave Status Update | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | ESS      | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  #Pending - Issue
  @CA-36_3
  Scenario Outline: Alert Custom - Leave - Leave Status Update - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_38 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_38 | COS_38 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_38 |                          1 | admin        |    1 |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_38 |                |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Status Update"
    And Assign User in Alert "Leave Status Update"
      | UserID |
      | COS_38 |
    And Set Alert Message Preview in Alert "Leave Status Update"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_38 |                  1 |          0 |        0 | II         |                     1 | COS_38    |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_38 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_38 |          0 |        0 |
    And "Tour Status Update" alert normal custom field value set
      | UserID | LeaveTourCOFF | PreviousApprovedRejected | CurrentApprovedRejected |
      | COS_38 | Tour          | Approved                 | Rejected                |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Tour Status Update | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | ESS      | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Remark:[Remark] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] | Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime]<br>Your Previously [Previous Approved/Rejected] [Leave/Tour/C-OFF Leave] application for [Leave name] for the specified period start from [FromDate/FromDateTime] to [ToDate/ToDateTime] is now [Current Approved/Rejected] on [status DateTime] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  @CA-32_1
  Scenario Outline: Alert Custom - Leave - Leave Modification Application - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_34      |
      | COS_34_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3400000001 | cos34@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_34      | COS_34      |               1 |         1 |               1 |                  1 |    3400000001 | cos34@gmail.com            |
      | COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_34      |                          1 | admin        |    1 |
      | COS_34_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS34RICGrp      | AnyOne     | COS_34_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_34 | COS34RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_34 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Modification Application"
    And Update Alert Configuration "Leave Modification Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Modification Application"
      | UserID      |
      | COS_34_RIC1 |
    And Set Alert Message Preview in Alert "Leave Modification Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_34 |                  1 |          0 |        0 | MV         |                     1 | COS_34    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_34_RIC1 | COS_34 |          0 |        0 |
    When Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_34 |            1 |                  1 |         -1 |       -1 | COS_34    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark           | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedModified | COS_34_RIC1 | COS_34 |          0 |        0 |
    And "Leave Modification Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | StartDate | EndDate |
      | COS_34 | Leave         | Days      |         0 |       0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Leave Modification Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | smsContent                                                                                                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | RIC      | [Leave/Tour] Modification application:-<br>Applied On: [Applied Date]<br>By: [User Name] ([UserID])<br><br>Towards the following [Leave/Tour] Application:<br>[Leave/Tour] Type:[Leave Name] ([Leave])<br>[Leave/Tour] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br><br>Application Modified to:<br>[Leave/Tour] Period:[Modified FromDate/FromDateTime] to [Modified ToDate/ToDateTime]<br>Total [Days/Hours]: [Modified Applied Days/Hours]<br>Posted Duration: [Modified Posted Days/Hours]<br>Reason:[Reason]<br>[Leave/Tour] Modification application:-<br>Applied On: [Applied Date]<br>By: [User Name] ([UserID])<br><br>Towards the following [Leave/Tour] Application:<br>[Leave/Tour] Type:[Leave Name] ([Leave])<br>[Leave/Tour] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br><br>Application Modified to:<br>[Leave/Tour] Period:[Modified FromDate/FromDateTime] to [Modified ToDate/ToDateTime]<br>Total [Days/Hours]: [Modified Applied Days/Hours]<br>Posted Duration: [Modified Posted Days/Hours]<br>Reason:[Reason][UserID-UserName] | [UserID] - [Username] has applied for [Leave/Tour] Modification on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours][UserID-UserName]<br>[UserID] - [Username] has applied for [Leave/Tour] Modification on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours][UserID-UserName] | [UserID-Username] has applied for [Leave/Tour] Modification request on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID][User Name]<br>[UserID-Username] has applied for [Leave/Tour] Modification request on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Default                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  @CA-32_3
  Scenario Outline: Alert Custom - Leave - Leave Modification Application - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_34      |
      | COS_34_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   3400000001 | cos34@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_34      | COS_34      |               1 |         1 |               1 |                  1 |    3400000001 | cos34@gmail.com            |
      | COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_34      |                          1 | admin        |    1 |
      | COS_34_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS34RICGrp      | AnyOne     | COS_34_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_34 | COS34RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Modification Application"
    And Update Alert Configuration "Leave Modification Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Modification Application"
      | UserID      |
      | COS_34_RIC1 |
    And Set Alert Message Preview in Alert "Leave Modification Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_34 |                  1 |          0 |        0 | II         |                     1 | COS_34    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_34_RIC1 | COS_34 |          0 |        0 |
    When Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_34 |            1 |                  1 |         -1 |       -1 | COS_34    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark           | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedModified | COS_34_RIC1 | COS_34 |          0 |        0 |
    And "Tour Modification Application" alert normal custom field value set
      | UserID | LeaveTourCOFF | DaysHours | StartDate | EndDate |
      | COS_34 | Tour          | Days      |         0 |       0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                    | MailRecieveTo |
      | <alertType> | Tour Modification Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | smsContent                                                                                                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | RIC      | [Leave/Tour] Modification application:-<br>Applied On: [Applied Date]<br>By: [User Name] ([UserID])<br><br>Towards the following [Leave/Tour] Application:<br>[Leave/Tour] Type:[Leave Name] ([Leave])<br>[Leave/Tour] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br><br>Application Modified to:<br>[Leave/Tour] Period:[Modified FromDate/FromDateTime] to [Modified ToDate/ToDateTime]<br>Total [Days/Hours]: [Modified Applied Days/Hours]<br>Posted Duration: [Modified Posted Days/Hours]<br>Reason:[Reason]<br>[Leave/Tour] Modification application:-<br>Applied On: [Applied Date]<br>By: [User Name] ([UserID])<br><br>Towards the following [Leave/Tour] Application:<br>[Leave/Tour] Type:[Leave Name] ([Leave])<br>[Leave/Tour] Period: [FromDate/FromDateTime] to [ToDate/ToDateTime]<br>Total [Days/Hours]: [Applied Days/Hours]<br><br>Application Modified to:<br>[Leave/Tour] Period:[Modified FromDate/FromDateTime] to [Modified ToDate/ToDateTime]<br>Total [Days/Hours]: [Modified Applied Days/Hours]<br>Posted Duration: [Modified Posted Days/Hours]<br>Reason:[Reason][UserID-UserName] | [UserID] - [Username] has applied for [Leave/Tour] Modification on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours][UserID-UserName]<br>[UserID] - [Username] has applied for [Leave/Tour] Modification on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours][UserID-UserName] | [UserID-Username] has applied for [Leave/Tour] Modification request on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID][User Name]<br>[UserID-Username] has applied for [Leave/Tour] Modification request on [modification application date] towards [Leave code] - [Leave name] with Posted Duration: [Posted Days/Hours] and Reason: [Reason].[UserID][User Name] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | Default                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                        |

  #Issue in WhatsApp - [UserName] displayed as it is in Alert message content
  @CA-32_2
  Scenario Outline: Alert Custom - Leave - Leave Modification Approval - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_34      |
      | COS_34_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3400000011 | cos34ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_34      | COS_34      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    3400000011 | cos34ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_34      |                          1 | admin        |    1 |
      | COS_34_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS34RICGrp      | AnyOne     | COS_34_RIC1 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_34 | COS34RICGrp    |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_34 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |      1 |       |    0 |          | credit | 002:00 |
      | COS_34 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |      1 |       |   -1 |          | credit | 002:00 |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | UserID |
      | COS_34 |
    And Set Alert Message Preview in Alert "Leave Modification Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_34 |                  1 |          0 |        0 | MV         |                     1 | COS_34    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_34_RIC1 | COS_34 |          0 |        0 |
    When Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_34 |            1 |                  1 |         -1 |       -1 | COS_34    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark           | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedModified | COS_34_RIC1 | COS_34 |          0 |        0 |
    And "Leave Modification Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected | StartDate | EndDate |
      | COS_34 | Leave         | Approved         |        -1 |      -1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Modification Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename]<br>([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

  #Issue in WhatsApp - [UserName] displayed as it is in Alert message content
  @CA-33_1
  Scenario Outline: Alert Custom - Leave - Leave Modification Rejection - Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_35 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_35 | COS_35 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_35 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup    | WeekOffGroup | Validation         |
      | COS_35 |                |                | AlertLeaveGrp |              | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_35 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | UserID |
      | COS_35 |
    And Set Alert Message Preview in Alert "Leave Modification Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_35 |                  1 |          0 |        0 | MV         |                     1 | COS_35    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_35 |          0 |        0 |
    And Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_35 |            1 |                  1 |         -1 |       -1 | COS_35    |            0 |          0 |
    When Approve Reject Leave Application via API
      | approved | remark           | ricID | userid | Start-date | end-date |
      |        2 | RejectedModified | SA    | COS_35 |          0 |        0 |
    And "Leave Modification Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected | StartDate | EndDate |
      | COS_35 | Leave         | Rejected         |        -1 |      -1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Leave Modification Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename]<br>([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

  #Issue in WhatsApp - [UserName] displayed as it is in Alert message content
  @CA-32_4
  Scenario Outline: Alert Custom - Leave - Leave Modification Approval - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_34      |
      | COS_34_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   3400000011 | cos34ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_34      | COS_34      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    3400000011 | cos34ric1@gmail.com        |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_34      |                          1 | admin        |    1 |
      | COS_34_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS34RICGrp      | AnyOne     | COS_34_RIC1 |      |      |      |      | Saved Successfully |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_34 | COS34RICGrp    |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | UserID |
      | COS_34 |
    And Set Alert Message Preview in Alert "Leave Modification Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_34 |                  1 |          0 |        0 | II         |                     1 | COS_34    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedRequest | COS_34_RIC1 | COS_34 |          0 |        0 |
    When Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_34 |            1 |                  1 |         -1 |       -1 | COS_34    |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark           | ricID       | userid | Start-date | end-date |
      |        1 | ApprovedModified | COS_34_RIC1 | COS_34 |          0 |        0 |
    And "Tour Modification Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected | StartDate | EndDate |
      | COS_34 | Tour          | Approved         |        -1 |      -1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                           | MailRecieveTo |
      | <alertType> | Tour Modification Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename]<br>([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

  #Issue in WhatsApp - [UserName] displayed as it is in Alert message content
  @CA-33_2
  Scenario Outline: Alert Custom - Leave - Leave Modification Rejection - Tour
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_35 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_35 | COS_35 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_35 |                          1 | admin        |    1 |
    And Create Tour
      | TourID | TourName  | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | II     | TourAlert |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "TourAlertLeaveGrp" with Pro-rata "False"
      | TourID |
      | II     |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup        | WeekOffGroup | Validation         |
      | COS_35 |                |                | TourAlertLeaveGrp |              | Saved Successfully |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | UserID |
      | COS_35 |
    And Set Alert Message Preview in Alert "Leave Modification Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_35 |                  1 |          0 |        0 | II         |                     1 | COS_35    |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_35 |          0 |        0 |
    And Apply Leave "Modification" Application via API
      | userid | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_35 |            1 |                  1 |         -1 |       -1 | COS_35    |            0 |          0 |
    When Approve Reject Leave Application via API
      | approved | remark           | ricID | userid | Start-date | end-date |
      |        2 | RejectedModified | SA    | COS_35 |          0 |        0 |
    And "Tour Modification Approval/Rejection" alert normal custom field value set
      | UserID | LeaveTourCOFF | ApprovedRejected | StartDate | EndDate |
      | COS_35 | Tour          | Rejected         |        -1 |      -1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                           | MailRecieveTo |
      | <alertType> | Tour Modification Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | ESS      | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime]<br>Remark:[Remark][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename]<br>([UserID-UserName]),Your [Leave/Tour] Modification application for [Leave code]-[Leavename] from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code-Leavename] | ([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename]<br>([UserID-UserName]), Your [Leave/Tour] Modification application request for the [Leave code-Leavename] for the specified period starts from [FromDate/FromDateTime] to [ToDate/ToDateTime] is [Approved/Rejected] on [status DateTime][UserID][UserName][Leave code][Leavename] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

  #************************************************************************************************
  #************************************************************************************************
  # CWM MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-48
  Scenario Outline: Alert Custom - CWM - Worker Assignment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete user via API
      | UserID |
      | COS_64 |
    And Delete Worker from CWM module
      | WorkerName |
      | Worker_64  |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_64 | CON_64       | Worker_64  |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS1           |
    And Delete Contractor via API
      | id     |
      | CON_64 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_64 | COS_64 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_64 | CON_64 |              10 | CON_64         |     6400000011 | con64@gmail.com |      6400 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | AlertInduction | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS1" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction     | COS_64              |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_64 | WO_64 |             0 |          10 | CON_64                   | AlertAS1          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | CON_64 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | CON_64   | admin    | Welcome CON_64 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker_64  |       1 | WO_64       |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Worker Assignment"
    And Update Alert Configuration "Worker Assignment"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Set Alert Message Preview in Alert "Worker Assignment"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Worker Assignment"
      | UserID |
      | COS_64 |
    When Wait for "4" min
    And "Worker Assignment" alert normal custom field value set
      | WorkerAssignmentTotal | Date |
      |                     1 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Worker Assignment | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                        |
      | Custom    | ESS      | [Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date]<br>[Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date] | [Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date]<br>[Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date] | [Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date]<br>[Total applications pending for approval] Worker Assignment/Registration Requests are pending for your approval on [request date] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                |

  @CA-49
  Scenario Outline: Alert Custom - CWM - Worker Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete Worker from CWM module
      | WorkerName |
      | Worker_65  |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_65 | CON_65       | Worker_65  |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS2           |
    And Delete Contractor via API
      | id     |
      | CON_65 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_65 | CON_65 |              10 | CON_65         |     9033207186 | matrixautomationreceiver@gmail.com |      6500 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | AlertInduction | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS2" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction     |                     |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_65 | WO_65 |             0 |          10 | CON_65                   | AlertAS2          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | CON_65 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | CON_65   | admin    | Welcome CON_65 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker_65  |       1 | WO_65       |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Worker Approval"
    And Update Alert Configuration "Worker Approval"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Set Alert Message Preview in Alert "Worker Approval"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Approve Reject Induction Approval from CWM module
      | WorkOrderID | WorkerName | Approval | Validation         |
      | WO_65       | Worker_65  | Approve  | Saved Successfully |
    When Wait for "4" min
    And "Worker Approval" alert normal custom field value set
      | CreateWorkerTotal | Date |
      |                 1 |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent      | MailRecieveTo |
      | <alertType> | Worker Approval | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                                                                                | smsContent                                                                                                                                                 | whatsappContent                                                                                                                                            |
      | Custom    | Contractor | [Total number of approved Workers] Workers were approved on [approval date]<br>[Total number of approved Workers] Workers were approved on [approval date] | [Total number of approved Workers] Workers were approved on [approval date]<br>[Total number of approved Workers] Workers were approved on [approval date] | [Total number of approved Workers] Workers were approved on [approval date]<br>[Total number of approved Workers] Workers were approved on [approval date] |
      | Default   | Contractor | Default                                                                                                                                                    | Default                                                                                                                                                    | Default                                                                                                                                                    |

  @CA-473
  Scenario Outline: Alert Custom - CWM - 63Work Order Expiry
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_63 | CON_63       | Worker_63  |
    And Delete Contractor via API
      | id     |
      | CON_63 |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_63 | CON_63 |              10 | CON_63         |     9033207186 | matrixautomationreceiver@gmail.com |      6300 | Lic2        | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_63 | WO_63 |             0 |           1 | CON_63                   | Approval Stage-1  |              5 | Saved Successfully |
    And Set Alert Configuration "Work Order Expiry"
    And Update Alert Configuration "Work Order Expiry"
      | SendReminder | SetRemDaysBeforeValEnd | ReminderTime |
      | Everyday     |                      1 |            2 |
    And Set Alert Message Preview in Alert "Work Order Expiry"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Work Order Expiry" alert normal custom field value set
      | WorkOrderEndDate | WorkOrderID | WorkOrderName | SetReminder | WorkOrderExpiryCount |
      |                1 | WO_63       | WO_63         |           1 |                    1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Work Order Expiry | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                                                                        | smsContent                                                                                                                                                                             | whatsappContent                                                                                                                                                                        |
      | Custom    | Contractor | Below mentioned Work Order(s) will expire within [Set Reminder] day(s).<br>Below mentioned Work Order(s) will expire within [Set Reminder] day(s). | [Count of expiring Work Order(s)] Work Order(s) will expire within [Set Reminder] day(s).<br>[Count of expiring Work Order(s)] Work Order(s) will expire within [Set Reminder] day(s). | [Count of expiring Work Order(s)] Work Order(s) will expire within [Set Reminder] day(s).<br>[Count of expiring Work Order(s)] Work Order(s) will expire within [Set Reminder] day(s). |
      | Default   | Contractor | Default                                                                                                                                            | Default                                                                                                                                                                                | Default                                                                                                                                                                                |

  @CA-471
  Scenario Outline: Alert Custom - CWM - 62Contractor Validity - User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   6200000011 | con62@gmail.com            |
    And Delete user via API
      | UserID |
      | COS_62 |
    And Delete Contractor via API
      | id     |
      | CON_62 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_62 | COS_62 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1       | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_62 | CON_62 |               1 | CON_62         |     6200000011 | CON_62@matrixrd.org |      6200 | Lic1        | True          | True             | Saved Successfully |
    And Set Alert Configuration "Contractor Validity"
    And Set Send Alert to parameters for "Contractor Validity" Alert
    And Update Alert Configuration "Contractor Validity"
      | DaysBeforeValEndDate | ReminderTime | RepeatReminder | RepeatIntervalDays | UserID | ContractorID |
      |                    1 |            2 | False          |                  1 | COS_62 | CON_62       |
    And Set Alert Message Preview in Alert "Contractor Validity"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Contractor Validity" alert normal custom field value set
      | ContractorTypeID | ContractorID | ValidityEndDate | DaysRemaining | ContractorCount |
      |                1 | CON_62       |               1 |             1 |               1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent          | MailRecieveTo |
      | <alertType> | Contractor Validity | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                    | smsContent                                                                                                                                       | whatsappContent                                                                                                                                  |
      | Custom    | ESS      | Validity End Date is approaching for following Contractor(s):<br>Validity End Date is approaching for following Contractor(s): | Validity End Date is approaching for [Contractor Count] Contractor(s).<br>Validity End Date is approaching for [Contractor Count] Contractor(s). | Validity End Date is approaching for [Contractor Count] Contractor(s).<br>Validity End Date is approaching for [Contractor Count] Contractor(s). |
      | Default   | ESS      | Default                                                                                                                        | Default                                                                                                                                          | Default                                                                                                                                          |

  @CA-48
  Scenario Outline: Alert Custom - CWM - Worker Induction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete user via API
      | UserID |
      | COS_64 |
    And Delete Worker from CWM module
      | WorkerName |
      | Worker_64  |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_64 | CON_64       | Worker_64  |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS1           |
    And Delete Contractor via API
      | id     |
      | CON_64 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_64 | COS_64 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_64 | CON_64 |              10 | CON_64         |     6400000011 | con64@gmail.com |      6400 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | AlertInduction | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS1" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction     | COS_64              |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_64 | WO_64 |             0 |          10 | CON_64                   | AlertAS1          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Set Alert Configuration "Worker Induction"
    And Update Alert Configuration "Worker Induction"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Worker Induction"
      | UserID |
      | COS_64 |
    And Set Alert Message Preview in Alert "Worker Induction"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | CON_64 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | CON_64   | admin    | Welcome CON_64 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker_64  |       1 | WO_64       |             0 |          10 | Saved Successfully |
    When Wait for "4" min
    And "Worker Induction" alert normal custom field value set
      | ContractorID | ContractorName | ApplicationDate | WorkerName | AssignedWorkOrder | InductionLevel |
      | CON_64       | CON_64         |               0 | Worker_64  | WO_64             | AlertInduction |
    Then Validate Alert Containt
      | AlertType   | AlertEvent       | MailRecieveTo |
      | <alertType> | Worker Induction | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | smsContent                                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                |
      | Custom    | ESS      | [Contractor Name] (ID - [Contractor ID]) has requested for Induction Approval.<br>Details are as follows:<br><br>Applied on: [Application Date]<br>Worker: [Worker Name]<br>Work Order: [Assigned Work Order]<br>Induction Level: [Induction Level]<br>[Contractor Name] (ID - [Contractor ID]) has requested for Induction Approval.<br>Details are as follows:<br><br>Applied on: [Application Date]<br>Worker: [Worker Name]<br>Work Order: [Assigned Work Order]<br>Induction Level: [Induction Level] | [Contractor Name] has requested for Induction Approval for [Worker Name].[Contractor ID][ContractorID-ContractorName][Contractor ID][ContractorID-ContractorName]<br>[Contractor Name] has requested for Induction Approval for [Worker Name].[Contractor ID][ContractorID-ContractorName][Contractor ID][ContractorID-ContractorName] | [Contractor Name] has requested for Induction Approval for [Worker Name].[Contractor ID][ContractorID-ContractorName]<br>[Contractor Name] has requested for Induction Approval for [Worker Name].[Contractor ID][ContractorID-ContractorName] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                        |

  @CA-501
  Scenario Outline: Alert Custom - CWM - Worker Induction Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete Worker from CWM module
      | WorkerName |
      | Worker_66  |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_66 | CON_66       | Worker_66  |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS3           |
    And Delete Contractor via API
      | id     |
      | CON_66 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_66 | CON_66 |              10 | CON_66         |     9033207186 | matrixautomationreceiver@gmail.com |      6600 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | AlertInduction | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS3" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction     |                     |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_66 | WO_66 |             0 |          10 | CON_66                   | AlertAS3          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | CON_66 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | CON_66   | admin    | Welcome CON_66 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker_66  |       1 | WO_66       |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Worker Induction Approval/Rejection"
    And Assign User in Alert "Worker Induction Approval/Rejection"
      | UserID |
      | CON_66 |
    And Set Alert Message Preview in Alert "Worker Induction Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Approve Reject Induction Approval from CWM module
      | WorkOrderID | WorkerName | Approval | Validation         |
      | WO_66       | Worker_66  | Approve  | Saved Successfully |
    And "Worker Induction Approval/Rejection" alert normal custom field value set
      | WorkerName | ApplicationDate | AssignedWorkOrder | ApprovedRejected |
      | Worker_66  |               0 | WO_66             | Approved         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Worker Induction Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                              |
      | Custom    | Contractor | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. |
      | Default   | Contractor | Default                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                      |

  @CA-502
  Scenario Outline: Alert Custom - CWM - Worker Induction Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete Worker from CWM module
      | WorkerName |
      | Worker_66  |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_66 | CON_66       | Worker_66  |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS3           |
    And Delete Contractor via API
      | id     |
      | CON_66 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_66 | CON_66 |              10 | CON_66         |     9033207186 | matrixautomationreceiver@gmail.com |      6600 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name           | Description          | Validation         |
      | AlertInduction | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS3" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction     |                     |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_66 | WO_66 |             0 |          10 | CON_66                   | AlertAS3          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Serial         | False                              |
    And Logout from Cosec Web
    And Set User password
      | User   | NewPassword | ConfirmPassword | Validation |
      | CON_66 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation     |
      | CON_66   | admin    | Welcome CON_66 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker_66  |       1 | WO_66       |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Worker Induction Approval/Rejection"
    And Assign User in Alert "Worker Induction Approval/Rejection"
      | UserID |
      | CON_66 |
    And Set Alert Message Preview in Alert "Worker Induction Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Approve Reject Induction Approval from CWM module
      | WorkOrderID | WorkerName | Approval | Validation         |
      | WO_66       | Worker_66  | Reject   | Saved Successfully |
    And "Worker Induction Approval/Rejection" alert normal custom field value set
      | WorkerName | ApplicationDate | AssignedWorkOrder | ApprovedRejected |
      | Worker_66  |               0 | WO_66             | Rejected         |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Worker Induction Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                              |
      | Custom    | Contractor | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. | Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected].<br>Induction Approval Application for [Worker Name] applied on [Application date] for Work Order: [Assigned Work Order] is [Approved/Rejected]. |
      | Default   | Contractor | Default                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                      |

  @CA-46
  Scenario Outline: Alert Custom - CWM - CSS Account Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Contractor via API
      | id     |
      | CON_61 |
    And Set Alert Configuration "CSS Account Enable"
    And Set Alert Message Preview in Alert "CSS Account Enable"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_61 | CON_61 |              10 | CON_61         |     9033207186 | matrixautomationreceiver@gmail.com |      6100 | Lic         | True          | True             | Saved Successfully |
    And "CSS Account Enable" alert normal custom field value set
      | ContractorID |Mail|
      | CON_61       |matrixautomationreceiver@gmail.com|
      
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | CSS Account Enable | <Reciever>    |

    Examples: 
      | alertType | Reciever   | mailContent                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                        |
      | Custom    | Contractor | Your CSS Account has been enabled. Login ID: [ContractorID]. You can login via [Login Page link].<br>Your CSS Account has been enabled. Login ID: [ContractorID]. You can login via [Login Page link]. | Your CSS Account is activated, kindly follow the link sent to your registered Email ID to login to your account.[ContractorID][Login Page link]<br>Your CSS Account is activated, kindly follow the link sent to your registered Email ID to login to your account.[ContractorID][Login Page link] | Your CSS Account has been enabled. Login ID: [ContractorID]. You can login via [Login Page link].<br>Your CSS Account has been enabled. Login ID: [ContractorID]. You can login via [Login Page link]. |
      | Default   | Contractor | Default                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                |

  @CA-671
  Scenario Outline: Alert Custom - CWM - Contractor Details Alert Custom - User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   6700000011 | con67@gmail.com            |
    And Delete Contractor via API
      | id     |
      | CON_67 |
    And Delete user via API
      | UserID |
      | COS_67 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_67 | COS_67 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set custom fields for "Contractors" in GP
      | Active | FieldName | Type | Upload | Mandatory |
      | True   | Adhar     | Date | False  | False     |
    When Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_67 | CON_67 |              10 | CON_67         |     6700000011 | con67@gmail.com |      6700 | Lic         | True          | True             | Saved Successfully |
    And Update Contractor custom fields from Contractor Profile
      | Id     | Adhar | Validation         |
      | CON_67 |     1 | Saved Successfully |
    And Set Alert Configuration "Contractor Details Alert"
    And Set Send Alert to parameters for "Contractor Details Alert" Alert
    And Set Alert Message Preview in Alert "Contractor Details Alert"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Update Alert Configuration "Contractor Details Alert"
      | SendAlertFor | Document | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      | True         | Adhar    |                1 |            2 | False          |                    1 |
    And Assign User in Alert "Contractor Details Alert"
      | UserID | ContractorID | DocumentName |
      | COS_67 | CON_67       | Adhar        |
    When Wait for "4" min
    And "Contractor Details Alert" alert normal custom field value set
      | ContractorID | ContractorName | FieldName | ValidityEndDate | DaysRemaining | UserID | Receiver | ContractorCount |
      | CON_67       | CON_67         | Adhar     |               1 |             1 | COS_67 | ESS      |               1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent               | MailRecieveTo |
      | <alertType> | Contractor Details Alert | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                  | smsContent                                                                                                                                                     | whatsappContent                                                                                                                                                |
      | Custom    | ESS      | Expiry Date is approaching for documents of following Contractor(s):<br>Expiry Date is approaching for documents of following Contractor(s): | Expiry Date is approaching for documents of [Contractor Count] Contractor(s).<br>Expiry Date is approaching for documents of [Contractor Count] Contractor(s). | Expiry Date is approaching for documents of [Contractor Count] Contractor(s).<br>Expiry Date is approaching for documents of [Contractor Count] Contractor(s). |
      | Default   | ESS      | Default                                                                                                                                      | Default                                                                                                                                                        | Default                                                                                                                                                        |

  #@CA-671  (Contractor SMS/Mail/Whats app details not click so some changes )
  #Scenario Outline: Alert Custom - CWM - Contractor Details Alert Custom - Contractor
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    ##And Set SMS Configuration
    ##And Set Email Configuration
    ##And Set Whatsapp Configuration
    #And Delete SMS and Mail log
      #| mobilenumber | Email                      |
      #|   6700000001 | cos67@gmail.com            |
      #|   9033207186 | matrixautomationreceiver@gmail.com |
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
      #| Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1              | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_67 | CON_67 |              10 | CON_67         |     9033207186 | matrixautomationreceiver@gmail.com |      6700 | Lic         | True          | True             | Saved Successfully |
    #And Update Contractor custom fields from Contractor Profile
      #| Id     | Adhar | Validation         |
      #| CON_67 |     1 | Saved Successfully |
    #And Set Alert Configuration "Contractor Details Alert"
    #And Set Send Alert to parameters for "Contractor Details Alert" Alert
    #And Set Alert Message Preview in Alert "Contractor Details Alert"
      #| Mail1          | SMS1          | WhatsApp1          |
      #| <mailContent1> | <smsContent1> | <whatsappContent1> |
    #And Update Alert Configuration "Contractor Details Alert"
      #| SendAlertFor | Document | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      #| True         | Adhar    |                1 |            2 | False          |                    1 |
    #And Assign User in Alert "Contractor Details Alert"
      #| UserID | ContractorID | DocumentName |
      #| COS_67 | CON_67       | Adhar        |
    #When Wait for "4" min
    #And "Contractor Details Alert" alert normal custom field value set
      #| ContractorID | ContractorName | FieldName | ValidityEndDate | DaysRemaining | UserID | Receiver   | ContractorCount |
      #| CON_67       | CON_67         | Adhar     |               1 |             1 | COS_67 | Contractor |               1 |
    #Then Validate Alert Containt
      #| AlertType   | AlertEvent               | MailRecieveTo |
      #| <alertType> | Contractor Details Alert | <Reciever>    |
#
    #Examples: 
      #| alertType | Reciever   | mailContent1                                                                                             | smsContent1                                                                                              | whatsappContent1                                                                                           |
      #| Custom    | Contractor | Validity of your few documents is going to expire.<br>Validity of your few documents is going to expire. | Validity of your few documents is going to expire.<br>Validity of your few documents is going to expire. | Validity of your few documents are going to expire.<br>Validity of your few documents are going to expire. |
      #| Default   | Contractor | Default                                                                                                  | Default                                                                                                  | Default                                                                                                    |

  #************************************************************************************************
  #************************************************************************************************
  # JPC MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-37
  Scenario Outline: Alert Custom - JPC - Award/Penalty Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_56      |
      | COS_56_RIC1 |
      | COS_56_RIC2 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | AlrProject  |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase1    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | J1      |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | job-assignment-type |
      | COS_56      | COS_56      |               1 |         1 |               1 |                  1 |    5600000001 | cos56@gmail.com            |                   1 |
      | COS_56_RIC1 | COS_56_RIC1 |               1 |         1 |               1 |                  1 |    5600000011 | cos56ric1@gmail.com        |                     |
      | COS_56_RIC2 | COS_56_RIC2 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |                     |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_56      |                          1 | admin        |    1 |
      | COS_56_RIC1 |                          1 | admin        |    1 |
      | COS_56_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS56RIC1Grp     |        1 | COS_56_RIC1 |      |      |      |      | Saved Successfully |
      | COS56RIC2Grp     |        1 | COS_56_RIC2 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID      | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_56      | COS56RIC1Grp   |                |            |              | Saved Successfully |
      | COS_56_RIC1 | COS56RIC2Grp   |                |            |              | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code | Name | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | J1   | J1   |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase1 | JPCAutomation | Saved Successfully |
    And Create Project "AlrProject" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | Alert             | Phase1 |         0 |       0 |
    And Set Job Configuration in Phase "Phase1" of Project "AlrProject" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | J1      |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_56 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_56 |
    And Set event via Event Set API
      | Userid | event-date | event-time |
      | COS_56 |          0 |     090000 |
      | COS_56 |          0 |     120000 |
    And Apply Timesheet Correction Application via API
      | userid | attendance-date | correction-type | job-code | job-count | reason           | appliedBy |
      | COS_56 |               0 |               0 | J1       |         1 | TimesheetApplied | SA        |
    And Set Alert Configuration "Award/Penalty Application"
    And Update Alert Configuration "Award/Penalty Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Set Alert Message Preview in Alert "Award/Penalty Application"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Award/Penalty Application"
      | UserID      |
      | COS_56_RIC2 |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | COS_56_RIC1 | admin    | Welcome COS_56_RIC1 |
    When Assign Award Penalty Hours from RIC ESS login
      | Userid | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | COS_56 |    0 | Award          |  0200 | AwardGranted | GreatWork | Saved Successfully |
    And "Award/Penalty Application" alert normal custom field value set
      | RicUserid   |
      | COS_56_RIC1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                | MailRecieveTo |
      | <alertType> | Award/Penalty Application | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | RIC      | [RIC Username] has applied for adjustment for [Username] user for attendance date [attendance date].<br>Details (Old Value \| New Value) are as follows:<br><br>Applied On:[application date]<br>User ID:[Userid]<br>Reason:[Reason]<br>[RIC Username] has applied for adjustment for [Username] user for attendance date [attendance date].<br>Details (Old Value \| New Value) are as follows:<br><br>Applied On:[application date]<br>User ID:[Userid]<br>Reason:[Reason] | [RIC Username] - (ID-[RIC Userid]) applied for adjustment for [Username] - (ID-[Userid]) User for [attendance date] on [application date][RIC UserID-RIC UserName][UserID-UserName]<br>[RIC Username] - (ID-[RIC Userid]) applied for adjustment for [Username] - (ID-[Userid]) User for [attendance date] on [application date][RIC UserID-RIC UserName][UserID-UserName] | [RIC Username- RIC Userid] has applied for adjustment for [Username-Userid] user for [attendance date] on [application date] Reason: [Reason][RIC Username][RIC Userid]<br>[RIC Username- RIC Userid] has applied for adjustment for [Username-Userid] user for [attendance date] on [application date] Reason: [Reason][RIC Username][RIC Userid] |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                            |

  #************************************************************************************************
  #************************************************************************************************
  # FVM MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-38
  Scenario Outline: Alert Custom - FVM - Schedule Unavailable - Users For SetReminder= EveryDay
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_57      |
      | COS_57_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   5700000011 | cos57ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | FVM-enable |
      | COS_57      | COS_57      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |          1 |
      | COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    5700000011 | cos57ric1@gmail.com        |            |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_57      |                          1 | admin        |    1 |
      | COS_57_RIC1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Set Alert Configuration "Schedule Unavailable - Users"
    And Update Alert Configuration "Schedule Unavailable - Users"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Everyday    |            2 |                       1 |
    And Assign User in Alert "Schedule Unavailable - Users"
      | UserID |
      | COS_57 |
    And Set Alert Message Preview in Alert "Schedule Unavailable - Users"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Schedule Unavailable - Users" alert normal custom field value set
      | RemindPeriod | SetReminder |
      |            1 | Everyday    |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Schedule Unavailable - Users | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                         | smsContent                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                          |
      | Custom    | ESSE     | Schedule from [From Date] to [To Date], has not been created for the following day(s) :<br>Schedule from [From Date] to [To Date], has not been created for the following day(s) :[FromDate-ToDate] | Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s) [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s) [FromDate-ToDate] | Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s) [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s) [FromDate-ToDate] |
      | Default   | ESSE     | Default                                                                                                                                                                                             | Default                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                  |

  @CA-38_1
  Scenario Outline: Alert Custom - FVM - Schedule Unavailable - Users For SetReminder= Once
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_57      |
      | COS_57_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   5700000011 | cos57ric1@gmail.com        |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | FVM-enable |
      | COS_57      | COS_57      |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |          1 |
      | COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    5700000011 | cos57ric1@gmail.com        |            |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_57      |                          1 | admin        |    1 |
      | COS_57_RIC1 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Set Alert Configuration "Schedule Unavailable - Users"
    And Update Alert Configuration "Schedule Unavailable - Users"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Once        |            2 |                       1 |
    And Assign User in Alert "Schedule Unavailable - Users"
      | UserID |
      | COS_57 |
    And Set Alert Message Preview in Alert "Schedule Unavailable - Users"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Schedule Unavailable - Users" alert normal custom field value set
      | RemindPeriod | SetReminder |
      |            1 | Once        |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Schedule Unavailable - Users | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                            | smsContent                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                        |
      | Custom    | ESS      | Schedule for [Date] has not been created.<br>Schedule for [Date] has not been created. | Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s)[FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s)[FromDate-ToDate] | Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s)[FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [No. of days having no defined Schedules] day(s)[FromDate-ToDate] |
      | Default   | ESS      | Default                                                                                | Default                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                |

  @CA-38_3
  Scenario Outline: Alert Custom - FVM - Schedule Unavailable - Group Incharge - SetReminder = Everyday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_57      |
      | COS_57_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   5700000001 | cos57@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | FVM-enable |
      | COS_57      | COS_57      |               1 |         1 |               1 |                  1 |    5700000001 | cos57@gmail.com            |          1 |
      | COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |            |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_57      |                          1 | admin        |    1 |
      | COS_57_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS57RICGrp      |        1 | COS_57_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_57 | COS57RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Set Alert Configuration "Schedule Unavailable - Group Incharge"
    And Update Alert Configuration "Schedule Unavailable - Group Incharge"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Everyday    |            2 |                       1 |
    And Assign User in Alert "Schedule Unavailable - Group Incharge"
      | UserID      |
      | COS_57_RIC1 |
    And Set Alert Message Preview in Alert "Schedule Unavailable - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "3" min
    And "Schedule Unavailable - Group Incharge" alert normal custom field value set
      | RemindPeriod | SetReminder | User   | UserCount |
      |            1 | Everyday    | COS_57 |         1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Schedule Unavailable - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                      | smsContent                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                |
      | Custom    | RICE     | Schedule has not been created for the following users.<br>Schedule has not been created for the following users. | Schedule from [From Date] to [To Date] has not been created for [User Count] users. [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [User Count] users. [FromDate-ToDate] | Schedule from [From Date] to [To Date] has not been created for [user Count] users. [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [user Count] users. [FromDate-ToDate] |
      | Default   | RICE     | Default                                                                                                          | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        |

  @CA-38_4
  Scenario Outline: Alert Custom - FVM - Schedule Unavailable - Group Incharge - SetReminder = Once
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_57      |
      | COS_57_RIC1 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   5700000001 | cos57@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | FVM-enable |
      | COS_57      | COS_57      |               1 |         1 |               1 |                  1 |    5700000001 | cos57@gmail.com            |          1 |
      | COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |            |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_57      |                          1 | admin        |    1 |
      | COS_57_RIC1 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS57RICGrp      |        1 | COS_57_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_57 | COS57RICGrp    |                |            |              | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_57 |
    And Set Alert Configuration "Schedule Unavailable - Group Incharge"
    And Update Alert Configuration "Schedule Unavailable - Group Incharge"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Once        |            2 |                       5 |
    And Assign User in Alert "Schedule Unavailable - Group Incharge"
      | UserID      |
      | COS_57_RIC1 |
    And Set Alert Message Preview in Alert "Schedule Unavailable - Group Incharge"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Wait for "4" min
    And "Schedule Unavailable - Group Incharge" alert normal custom field value set
      | RemindPeriod | SetReminder | User   | UserCount |
      |            5 | Once        | COS_57 |         1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                            | MailRecieveTo |
      | <alertType> | Schedule Unavailable - Group Incharge | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                            | smsContent                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                |
      | Custom    | RIC      | Schedule for [Date] has not been created for the following Users:<br>Schedule for [Date] has not been created for the following Users: | Schedule from [From Date] to [To Date] has not been created for [User Count] users. [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [User Count] users. [FromDate-ToDate] | Schedule from [From Date] to [To Date] has not been created for [user Count] users. [FromDate-ToDate]<br>Schedule from [From Date] to [To Date] has not been created for [user Count] users. [FromDate-ToDate] |
      | Default   | RIC      | Default                                                                                                                                | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        |

  @CA-39
  Scenario Outline: Alert Custom - FVM - Schedule Modified
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_58 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | FVM-enable |
      | COS_58 | COS_58 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |          1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | COS_58 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | COS_58 |
    And Create Location from Location master
      | Code  | Name  | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | Alert | Alert | Wi-Fi |         |         |          |           |                      | 00:00:00:02:02:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description              | Validation         |
      | Alert1   | FVM Automation By Mayank | Saved Successfully |
    And Create Field Visit Schedule for User "COS_58" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              0900 |               0 |            1000 | Alert1   | Alert    | Schedule By Mayank |
    And Set Alert Configuration "Schedule Modified"
    And Assign User in Alert "Schedule Modified"
      | UserID |
      | COS_58 |
    And Set Alert Message Preview in Alert "Schedule Modified"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Create Field Visit Schedule for User "COS_58" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              1001 |               0 |            1100 | Alert1   | Alert    | Schedule By Mayank |
    And "Schedule Modified" alert normal custom field value set
      | Date |
      |    0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent        | MailRecieveTo |
      | <alertType> | Schedule Modified | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                              | smsContent                                                                                                                                                               | whatsappContent                                                                                                                                                          |
      | Custom    | ESS      | Schedule for [Schedule Date] has been changed. Please review the updated schedule.<br>Schedule for [Schedule Date] has been changed. Please review the updated schedule. | Schedule for [Schedule Date] has been changed. Please review the updated schedule.<br>Schedule for [Schedule Date] has been changed. Please review the updated schedule. | Schedule for [Schedule Date] has been changed. Please review the updated schedule.<br>Schedule for [Schedule Date] has been changed. Please review the updated schedule. |
      | Default   | ESS      | Default                                                                                                                                                                  | Default                                                                                                                                                                  | Default                                                                                                                                                                  |

  #************************************************************************************************
  #************************************************************************************************
  # SYSTEM MODULE
  #************************************************************************************************
  #************************************************************************************************
  @CA-9
  Scenario Outline: Alert Custom - System - Database Backup- Only CENTRA and OEM
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_21 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Delete Task Scheduler
      | SchedulerName |
      | DBBackup      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_21 | COS_21 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "Database Backup"
    And Assign User in Alert "Database Backup"
      | UserID |
      | COS_21 |
    And Set Alert Message Preview in Alert "Database Backup"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Create Task scheduler "Database Backup"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime |
      | DBBackup      | Monthly     |                  0 |               0 |
    And Wait for "1" min
    And "Database Backup" alert normal custom field value set
      | ProcessDate | Mail                       |
      |           0 | matrixautomationreceiver@gmail.com |
    Then Validate Alert Containt
      | AlertType   | AlertEvent      | MailRecieveTo |
      | <alertType> | Database Backup | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                    |
      | Custom    | ESS      | Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm]<br>Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm] | Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm]<br>Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm] | Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm]<br>Database Backup Process, scheduled to run on [process run date], completed [Successfully/With Error] at [process completion time hh:mm] |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                            |

  @CA-10
  Scenario Outline: Alert Custom - System - Password Generated
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_22 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             | date-of-birth |
      | COS_22 | COS_22 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |             1 |
    And Set Alert Configuration "Password Generated"
    And Set Alert Message Preview in Alert "Password Generated"
      | Mail          | SMS          |
      | <mailContent> | <smsContent> |
    When Generate Password via API
      | UserID | BirthDate |
      | COS_22 |         1 |
    And "Password Generated" alert normal custom field value set
      | Mail                       | Userid |
      | matrixautomationreceiver@gmail.com | COS_22 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Password Generated | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                | smsContent                                                                                                                                                                                                                 | 
      | Custom    | ESS      | [code] is your verification code.ESS password has been generated for [user name](ID-[user id]) on [dd/mm/yyyy].<br>[code] is your verification code.ESS password has been generated for [user name](ID-[user id]) on [dd/mm/yyyy]. | [code] is your verification code.ESS password has been generated for [user name](ID-[user id]) on [dd/mm/yyyy].<br>[code] is your verification code.ESS password has been generated for [user name](ID-[user id]) on [dd/mm/yyyy]. | 
      | Default   | ESS      | Default                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                    |   

  @CA-11
  Scenario Outline: Alert Custom - System - OTP Generated
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_23 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_23 | COS_23 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "OTP Generated"
    And Set Alert Message Preview in Alert "OTP Generated"
      | Mail          | SMS          |
      | <mailContent> | <smsContent> |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Logout from Cosec Web
    When Enter "COS_23" and click on OTP
    And Refresh page
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And "OTP Generated" alert normal custom field value set
      | Mail                       | action                   |
      | matrixautomationreceiver@gmail.com | for Login Authentication |
    Then Validate Alert Containt
      | AlertType   | AlertEvent    | MailRecieveTo |
      | <alertType> | OTP Generated | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                  | smsContent                                                                                                   |
      | Custom    | ESS      | [code] is your OTP [To complete the required action].<br>[code] is your OTP [To complete the required action]. | [code] is your OTP [To complete the required action].<br>[code] is your OTP [To complete the required action]. | 
      | Default   | ESS      | Default                                                                                                      | Default                                                                                                      | 

  @CA-12
  Scenario Outline: Alert Custom - System - Identification Server Inactive
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_24 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_24 | COS_24 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Update Alert Configuration "Identification Server Inactive"
      | StartTime | EndTime | TolerancePeriodMin | UserID |
      | 00:00     | 23:59   |                  0 | COS_24 |
    And Set Alert Configuration "Identification Server Inactive"
    And Set Alert Message Preview in Alert "Identification Server Inactive"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Start Stop Service from Command Propmt
      | Service              | Status |
      | IdentificationServer | stop   |
    And Wait for "1.5" min
    And Start Stop Service from Command Propmt
      | Service              | Status |
      | IdentificationServer | start  |
    And "Identification Server Inactive" alert normal custom field value set
      | Mail                       | Tolerance Period |
      | matrixautomationreceiver@gmail.com |                0 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                     | MailRecieveTo |
      | <alertType> | Identification Server Inactive | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                        |
      | Custom    | System   | [Identification Server ID] - [Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes.<br>[Identification Server ID] - [Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes. | [Identification Server ID] - [Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes.<br>[Identification Server ID] - [Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes. | [Identification Server ID-Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes.<br>[Identification Server ID-Identification Server Name] found Inactive/Disconnected on [DateTime] since [Tolerance Period] minutes. |
      | Default   | System   | Default                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                |

  @CA-14
  Scenario Outline: Alert Custom - System - Login Account Locked -Check For Ess
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_26 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_26 | COS_26 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "Login Account Locked"
    And Set Alert Message Preview in Alert "Login Account Locked"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
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
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Reset "Password Policy" page to default
    And "Login Account Locked" alert normal custom field value set
      | Account |
      | ESS     |
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Login Account Locked | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                 | whatsappContent                                                                                                                                                            |
      | Custom    | ESS      | Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts.<br>To unlock your account, please click the button below.<br><br>[Unlock my Account]<br><br>Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts.<br>To unlock your account, please click the button below.<br><br>[Unlock my Account]<br> | Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts.<br>Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts. | Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts.<br>Your [System/ESS/CSS] Account has been locked due to maximum failed login attempts. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                    | Default                                                                                                                                                                    |

  @CA-15
  Scenario Outline: Alert Custom - System - APTA Auto Sign-In Configuration   # Issue CSR-8507
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID  |
      | COS_27  |
      | COS_271 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email             |
      | COS_27 | COS_27 |               1 |         1 |               1 |                  1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "APTA Auto Sign-In Configuration"
    And Set Alert Message Preview in Alert "APTA Auto Sign-In Configuration"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Send Alert APTA Auto Sign-In Configuration from Alert Configuration
      | UserID |
      | COS_27 |
    And "APTA Auto Sign-In Configuration" alert normal custom field value set
      | android                                                         | ios                                                  |
      | https://play.google.com/store/apps/details?id=com.matrix.essapp | https://apps.apple.com/in/app/cosec-apta/id978241784 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                      | MailRecieveTo |
      | <alertType> | APTA Auto Sign-In Configuration | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
      | Custom    | ESS      | Greetings!<br><br>Let us assist you in setting up the APTA application; all you have to do is follow these few simple steps.<br>STEP 1: Download the application.<br>Andriod App: [Android App Link]<br>iOS App: [iOS App Link]<br>STEP 2: Open the E-mail attachment with application.<br>STEP 3: Set your ESS Account password; ignore this step if already done.<br>STEP 4: Enter your ESS Account password.<br>STEP 5: Tap on Login button.<br>You are now all set up with your personalized APTA application!<br>Greetings!<br><br>Let us assist you in setting up the APTA application; all you have to do is follow these few simple steps.<br>STEP 1: Download the application.<br>Andriod App: [Android App Link]<br>iOS App: [iOS App Link]<br>STEP 2: Open the E-mail attachment with application.<br>STEP 3: Set your ESS Account password; ignore this step if already done.<br>STEP 4: Enter your ESS Account password.<br>STEP 5: Tap on Login button.<br>You are now all set up with your personalized APTA application! | Auto Sign-In Email has been sent to your registered email id to guide you through the process of setting up APTA application.<br>Auto Sign-In Email has been sent to your registered email id to guide you through the process of setting up APTA application. | Greetings!<br>Let us assist you in setting up the APTA application; all you have to do is follow these few simple steps.<br>STEP 1: Download the application from:<br>Andriod App: https://play.google.com/store/apps/details?id=com.matrix.essapp<br>iOS App: https://apps.apple.com/in/app/cosec-apta/id978241784<br>STEP 2: Open the attachment with application.<br>STEP 3: Set your ESS Account password; ignore this step if already done.<br>STEP 4: Enter your ESS Account password.<br>STEP 5: Tap on Login button.<br>You are now all set up with your personalized APTA application!<br>Greetings!<br>Let us assist you in setting up the APTA application; all you have to do is follow these few simple steps. |
      | Default   | ESS      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

  #************************************************************************************************
  #************************************************************************************************
  # VISITOR MODULE
  #************************************************************************************************
  #************************************************************************************************
 @CAVMM-1
  Scenario Outline: Invite Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete invite visitor
      | VName  |
      | VIS_71 |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_71 |
    And Delete visitor via API
      | mobilenumber |
      |   7100000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | COS_71 | COS_71 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Alert Configuration "Invite Visitor"
    And Set Alert Message Preview in Alert "Invite Visitor"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Invite Visitor via API
      | visitor-name | Visitor-email-id           | Visitor-mobile-no | visit-date | visit-until-date | visit-start-time | visit-end-time | additional-visitors | host-id | purpose    | appliedBy |
      | VIS_71       | matrixautomationreceiver@gmail.com |        9033207186 |          1 |                1 |             0900 |           1000 |                   0 | COS_71  | Automation | SA        |
    And "Invite Visitor" alert normal custom field value set
      | Visitor |
      | VIS_71  |
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Invite Visitor | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | Visitor  | Greetings!<br>You have received a visit invite on COSEC VMS from [host-name] - [host-organization-name].<br>Click [here] to access COSEC Visitor Portal. Link is valid till [Expiry Date].<br>Follow mentioned steps to use VMS mobile application.<br>Step 1: Download the application.<br>Andriod App: https://play.google.com/store/apps/details?id=com.matrixcomsec.vms<br>iOS App: https://apps.apple.com/in/app/cosec-vms/id1461763998?is=1<br>Step 2: Open the E-mail attachment with application.<br>Step 3: Create Profile in the application.<br>Step 4: Plan your visit.<br>You are now all set to visit [host-organization-name]!<br>Greetings!<br>You have received a visit invite on COSEC VMS from [host-name] - [host-organization-name].<br>Click [here] to access COSEC Visitor Portal. Link is valid till [Expiry Date].<br>Follow mentioned steps to use VMS mobile application.<br>Step 1: Download the application.<br>Andriod App: https://play.google.com/store/apps/details?id=com.matrixcomsec.vms<br>iOS App: https://apps.apple.com/in/app/cosec-vms/id1461763998?is=1<br>Step 2: Open the E-mail attachment with application.<br>Step 3: Create Profile in the application.<br>Step 4: Plan your visit.<br>You are now all set to visit [host-organization-name]! | You have received a visit invite on COSEC VMS from [host-name] - [host-organization-name].<br>Click on [Link] to access COSEC Visitor Portal. Link is valid till [Expiry Date].<br>You have received a visit invite on COSEC VMS from [host-name] - [host-organization-name].<br>Click on [Link] to access COSEC Visitor Portal. Link is valid till [Expiry Date]. |Greetings!<br>You have received a visit invite on COSEC VMS from [host-name] - [host-organization-name].<br>Click [here] to access COSEC Visitor Portal. Link is valid till [Expiry Date].<br>Follow mentioned steps to use VMS mobile application.<br>Step 1: Download the application.<br>Andriod App: https://play.google.com/store/apps/details?id=com.matrixcomsec.vms<br>iOS App: https://apps.apple.com/in/app/cosec-vms/id1461763998?is=1<br>Step 2: Open the attachment with application.<br>Step 3: Create Profile in the application.<br>Step 4: Plan your visit.<br>You are now all set to visit [host-organization-name]!<br>[host-name][host-organization-name][Expiry Date]|

  @CAVMM-2
  Scenario Outline: Visitor Added - Watchlist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_72 |
    And Delete visitor via API
      | mobilenumber |
      |   7200000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_72 | COS_72 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And create visitor profile via API
      | id  | name | active |
      | v72 | v72  |      1 |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_72       | Matrix            | 7200000011 | visitor72@gmail.com | COS_72  | SA        | Default Location   |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_72 |
      |         0 |            5 | SA        |         0 |       0 | COS_72 |
    And Set Alert Configuration "Visitor Added - Watchlist/Blacklist"
    And Set Alert Message Preview in Alert "Visitor Added - Watchlist/Blacklist"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |      7200000011 | Watchlist | Saved Successfully |
    And "Visitor Added - Watchlist/Blacklist" alert normal custom field value set
      | Visitor | Watchlist/Blacklist | SecurityName |
      | VIS_72  | Watchlist           | System Admin |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Visitor Added - Watchlist/Blacklist | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                          |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                  |
      | Custom    | Host     | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. |

  @CAVMM-3
  Scenario Outline: Visitor Added - Blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_73 |
    And Delete visitor via API
      | mobilenumber |
      |   7300000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7300000011 | visitor73@gmail.com        |
    And Reset "Visitor Management" page to default
    And create visitor profile via API
      | id       | name     | active |
      | COS_73V1 | COS_73V1 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_73 | COS_73 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_73       | Matrix            | 7300000011 | visitor73@gmail.com | COS_73  | SA        | Default Location   |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_73 |
      |         0 |            5 | SA        |         0 |       0 | COS_73 |
    And Set Alert Configuration "Visitor Added - Watchlist/Blacklist"
    And Set Alert Message Preview in Alert "Visitor Added - Watchlist/Blacklist"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |      7300000011 | Blacklist | Saved Successfully |
    And "Visitor Added - Watchlist/Blacklist" alert normal custom field value set
      | Visitor | Watchlist/Blacklist | SecurityName |
      | VIS_73  | Blacklist           | System Admin |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                          | MailRecieveTo |
      | <alertType> | Visitor Added - Watchlist/Blacklist | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                               | whatsappContent                                                                                                                                                                                                                                                          |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                  |
      | Custom    | Host     | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. | Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time].<br>Visitor [Visitor Name] with Appointment No: [Appointment No.] is added to [Watchlist/Blacklist] by [Security Name] at [Date-Time]. |

  @CAVMM-4
  Scenario Outline: Create Visit - Watchlist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_74 |
    And Delete visitor via API
      | mobilenumber |
      |   7400000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7400000011 | visitor74@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete Visitor Pre-Registration from SA
      | visitor |
      | VIS_74  |
    And create visitor profile via API
      | id       | name     | active |
      | COS_74V1 | COS_74V1 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_74 | COS_74 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_74       | Matrix            | 7400000011 | visitor74@gmail.com | COS_74  | SA        | Default Location   |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_74 |
      |         0 |            5 | SA        |         0 |       0 | COS_74 |
    And Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |      7400000011 | Watchlist | Saved Successfully |
    And Set Alert Configuration "Create Visit - Watchlist/Blacklist"
    And Set Send Alert to parameters for "Create Visit - Watchlist/Blacklist" Alert
    And Set Alert Message Preview in Alert "Create Visit - Watchlist/Blacklist"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7400000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7400000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | COS_74 |         1 |         1 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And "Create Visit - Watchlist/Blacklist" alert normal custom field value set
      | Visitor | Watchlist/Blacklist | AllowedDenied |
      | VIS_74  | Watchlisted         | allowed       |
    And Validate Alert Containt
      | AlertType   | AlertEvent                         | MailRecieveTo |
      | <alertType> | Create Visit - Watchlist/Blacklist | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                 | whatsappContent                                                                                                                                                            |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                    | Default                                                                                                                                                                    |
      | Custom    | Visitor  | Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br><br>Host Name: [Host Name]<br>Visit Date: [Visit Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Appointment No: [Appointment No.]<br>Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br><br>Host Name: [Host Name]<br>Visit Date: [Visit Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Appointment No: [Appointment No.] | Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br>Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name]. | For [Watchlisted/Blacklisted] visitor [Visitor Name] the visit is [Allowed/Denied].<br>For [Watchlisted/Blacklisted] visitor [Visitor Name] the visit is [Allowed/Denied]. |

  @CAVMM-5
  Scenario Outline: Create Visit - Blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_75 |
    And Delete visitor via API
      | mobilenumber |
      |   7500000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7500000011 | visitor75@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete Visitor Pre-Registration from SA
      | visitor |
      | VIS_75  |
    And create visitor profile via API
      | id       | name     | active |
      | COS_75V1 | COS_75V1 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_75 | COS_75 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_75       | Matrix            | 7500000011 | visitor75@gmail.com | COS_75  | SA        | Default Location   |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_75 |
      |         0 |            5 | SA        |         0 |       0 | COS_75 |
    And Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |      7500000011 | Blacklist | Saved Successfully |
    And Set Alert Configuration "Create Visit - Watchlist/Blacklist"
    And Set Send Alert to parameters for "Create Visit - Watchlist/Blacklist" Alert
    And Set Alert Message Preview in Alert "Create Visit - Watchlist/Blacklist"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7500000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7500000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation                                       |
      | COS_75 |         1 |         1 |         1 |      30 | automation | Visit not allowed. Please contact administrator. |
    And Go to previous Tab
    And "Create Visit - Watchlist/Blacklist" alert normal custom field value set
      | Visitor | Watchlist/Blacklist | AllowedDenied |
      | VIS_75  | Blacklisted         | denied        |
    And Validate Alert Containt
      | AlertType   | AlertEvent                         | MailRecieveTo |
      | <alertType> | Create Visit - Watchlist/Blacklist | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                        | smsContent                                                                                                                                                 | whatsappContent                                                                                                                                                            |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                    | Default                                                                                                                                                                    |
      | Custom    | Visitor  | Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br><br>Host Name: [Host Name]<br>Visit Date: [Visit Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Appointment No: [Appointment No.]<br>Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br><br>Host Name: [Host Name]<br>Visit Date: [Visit Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Appointment No: [Appointment No.] | Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name].<br>Visit [Allowed/Denied] to [Watchlisted/Blacklisted] visitor [Visitor Name]. | For [Watchlisted/Blacklisted] visitor [Visitor Name] the visit is [Allowed/Denied].<br>For [Watchlisted/Blacklisted] visitor [Visitor Name] the visit is [Allowed/Denied]. |

  @CAVMM-6
  Scenario Outline: Visitor Pre-Registration  - send to Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_76 |
    And Delete visitor via API
      | mobilenumber |
      |   7600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_76 | COS_76 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "Visitor Pre-Registration"
    And Set Send Alert to parameters for "Visitor Pre-Registration" Alert
    And Update Alert Configuration "Visitor Pre-Registration"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visitor Pre-Registration"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |  7600000011 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "7600000011"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                   |
      | VIS_76 | Matrix       | visitor76@gmail.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@gmail.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | COS_76 |         1 |         2 |         1 |      30 | automation | Visit Created |
    And Go to previous Tab
    And "Visitor Pre-Registration" alert normal custom field value set
      | Visitor | MailRecieveTo |
      | VIS_76  | <Reciever>    |
    Then Validate Alert Containt
      | AlertType   | AlertEvent               | MailRecieveTo |
      | <alertType> | Visitor Pre-Registration | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                           | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | Host     | Your appointment with [Host User Name / Visitor Name] is scheduled.<br>Details are as below:<br><br>Appointment No: [Appointment No]<br>Expected arrival: [Visit Date] at [Visit Start Time]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Last Date: [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude]<br>[Note: Visitor is Watchlisted]Your appointment with [Host User Name / Visitor Name] is scheduled.<br>Details are as below:<br><br>Appointment No: [Appointment No]<br>Expected arrival: [Visit Date] at [Visit Start Time]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Last Date: [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude]<br>[Note: Visitor is Watchlisted] | Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No]<br>Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No] | Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No]<br>Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No] |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                              |

  @CAVMM-7
  Scenario Outline: Visitor Pre-Registration  - send to Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_77 |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7700000001 | cos77@gmail.com            |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      | COS_77 | COS_77 |               1 |         1 |               1 |                  1 |                    1 |    7700000001 | cos77@gmail.com |
    And Set Alert Configuration "Visitor Pre-Registration"
    And Set Send Alert to parameters for "Visitor Pre-Registration" Alert
    And Update Alert Configuration "Visitor Pre-Registration"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visitor Pre-Registration"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                1 |                1 |              5 | VIS_77       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_77  | SA        | Default Location   |
    And "Visitor Pre-Registration" alert normal custom field value set
      | Visitor | MailRecieveTo |
      | VIS_77  | <Reciever>    |
    Then Validate Alert Containt
      | AlertType   | AlertEvent               | MailRecieveTo |
      | <alertType> | Visitor Pre-Registration | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | smsContent                                                                                                                                                                                                                                                                                                                                                                                           | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                      |
      | Custom    | Visitor  | Your appointment with [Host User Name / Visitor Name] is scheduled.<br>Details are as below:<br><br>Appointment No: [Appointment No]<br>Expected arrival: [Visit Date] at [Visit Start Time]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Last Date: [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude]<br>[Note: Visitor is Watchlisted]Your appointment with [Host User Name / Visitor Name] is scheduled.<br>Details are as below:<br><br>Appointment No: [Appointment No]<br>Expected arrival: [Visit Date] at [Visit Start Time]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Last Date: [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude]<br>[Note: Visitor is Watchlisted] | Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No]<br>Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No] | Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No]<br>Your appointment with [Host User Name / Watchlisted Visitor Name/Visitor Name] is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date] .<br>Appointment No: [Appointment No] |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          | Default                                                                                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                              |

  @CAVMM-8
  Scenario Outline: Visit Transfer - To Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_78_H1      |
      | COS_78_H2      |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   7800000011 |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7800000011 | visitor78@gmail.com        |
      |   7800000031 | cos17linkess@gmail.com     |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_78_H1      | COS_78_H1      |               1 |         1 |               1 |                  1 |                    1 |    7800000001 | cos78h1@gmail.com          |
      | COS_78_H2      | COS_78_H2      |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    7800000031 | cos17linkess@gmail.com     |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id   | appliedBy | visit-station-name |
      |         0 |          0 |                2 |                1 |              5 | VIS_78       | Matrix            | 7800000011 | visitor78@gmail.com | COS_78_H1 | SA        | Default Location   |
    And Set Alert Configuration "Visit Transfer"
    And Set Send Alert to parameters for "Visit Transfer" Alert
    And Update Alert Configuration "Visit Transfer"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visit Transfer"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Visitor Invites Approval API
      | user-type | verdict | transfer-host-id | StartDate | EndDate | HostID    | approvedBy |
      |         0 |       3 | COS_78_H2        |         0 |       2 | COS_78_H1 | SA         |
    And "Visit Transfer" alert normal custom field value set
      | Visitor | OldHostName | ActorName    |
      | VIS_78  | COS_78_H1   | System Admin |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Visit Transfer | Host          |

    Examples: 
      | alertType | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                                                                            |
      | Default   | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | [Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visitor Mobile No : [Visitor Mobile No.]<br>Visit Date : [Visit Date]<br>Visit Until Date : [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Visit Purpose : [Visit Purpose]<br>Repeat Visit : [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>[Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visitor Mobile No : [Visitor Mobile No.]<br>Visit Date : [Visit Date]<br>Visit Until Date : [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Visit Purpose : [Visit Purpose]<br>Repeat Visit : [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31] | [Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name] from [Visit Start Date] to [Visit Until Date].<br>Appointment No: [Appointment No.][Actor Name][Old Host Name]<br>[Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name] from [Visit Start Date] to [Visit Until Date].<br>Appointment No: [Appointment No.][Actor Name][Old Host Name] | [Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name] from [Visit Start Date] to [Visit Until Date].[Host Name][Appointment No.]<br>[Actor Name] has transferred you visit request of [Visitor Name], scheduled earlier with [Old Host Name] from [Visit Start Date] to [Visit Until Date].[Host Name][Appointment No.] |

  @CAVMM-8_1
  Scenario Outline: Visit Transfer- To Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_78_H1      |
      | COS_78_H2      |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   7800000011 |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   7800000021 | cos78h2@gmail.com          |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7800000031 | cos17linkess@gmail.com     |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email         |
      | COS_78_H1      | COS_78_H1      |               1 |         1 |               1 |                  1 |                    1 |    7800000001 | cos78h1@gmail.com      |
      | COS_78_H2      | COS_78_H2      |               1 |         1 |               1 |                  1 |                    1 |    7800000021 | cos78h2@gmail.com      |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    7800000031 | cos17linkess@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id   | appliedBy | visit-station-name |
      |         0 |          0 |                2 |                1 |              5 | VIS_78       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_78_H1 | SA        | Default Location   |
    And Set Alert Configuration "Visit Transfer"
    And Set Send Alert to parameters for "Visit Transfer" Alert
    And Update Alert Configuration "Visit Transfer"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visit Transfer"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    When Visitor Invites Approval API
      | user-type | verdict | transfer-host-id | StartDate | EndDate | HostID    | approvedBy |
      |         0 |       3 | COS_78_H2        |         0 |       2 | COS_78_H1 | SA         |
    And "Visit Transfer" alert normal custom field value set
      | Visitor | OldHostName | ActorName    |
      | VIS_78  | COS_78_H1   | System Admin |
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Visit Transfer | Visitor       |

    Examples: 
      | alertType | mailContent1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | smsContent1                                                                                                                                                                                                                                                                                                                                                                                                | whatsappContent1                                                                                                                                                                                                                                                                                                                                                                                           |
      | Default   | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | Default                                                                                                                                                                                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                                                                                    |
      | Custom    | Your visit with [Old Host Name] has been transferred to a new host named [Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visit Date : [Visit Date] - [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Your visit with [Old Host Name] has been transferred to a new host named [Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visit Date : [Visit Date] - [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time] | Your visit with [Old Host Name], scheduled from [Visit Date] at [Visit Start Time] until [Visit Until Date] has been transferred to new host named [Host Name].<br>Appointment No: [Appointment No]<br>Your visit with [Old Host Name], scheduled from [Visit Date] at [Visit Start Time] until [Visit Until Date] has been transferred to new host named [Host Name].<br>Appointment No: [Appointment No] | Your visit with [Old Host Name], scheduled from [Visit Date] at [Visit Start Time] until [Visit Until Date] has been transferred to new host named [Host Name].<br>Appointment No: [Appointment No]<br>Your visit with [Old Host Name], scheduled from [Visit Date] at [Visit Start Time] until [Visit Until Date] has been transferred to new host named [Host Name].<br>Appointment No: [Appointment No] |

 
@CAVMM-8_2
  Scenario Outline: Visit Transfer -To Security
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_78_H1      |
      | COS_78_H2      |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   7800000011 |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   7800000021 | cos78h2@gmail.com          |
      |   7800000011 | visitor78@gmail.com        |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_78_H1      | COS_78_H1      |               1 |         1 |               1 |                  1 |                    1 |    7800000001 | cos78h1@gmail.com          |
      | COS_78_H2      | COS_78_H2      |               1 |         1 |               1 |                  1 |                    1 |    7800000021 | cos78h2@gmail.com          |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id   | appliedBy | visit-station-name |
      |         0 |          0 |                2 |                1 |              5 | VIS_78       | Matrix            | 7800000011 | visitor78@gmail.com | COS_78_H1 | SA        | Default Location   |
    And Set Alert Configuration "Visit Transfer"
    And Set Send Alert to parameters for "Visit Transfer" Alert
    And Update Alert Configuration "Visit Transfer"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visit Transfer"
      | Mail2          | SMS2          | WhatsApp2          |
      | <mailContent2> | <smsContent2> | <whatsappContent2> |
    When Visitor Invites Approval API
      | user-type | verdict | transfer-host-id | StartDate | EndDate | HostID    | approvedBy |
      |         0 |       3 | COS_78_H2        |         0 |       2 | COS_78_H1 | SA         |
    And "Visit Transfer" alert normal custom field value set
      | Visitor | OldHostName | ActorName    |
      | VIS_78  | COS_78_H1   | System Admin |
    And Wait for "5" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Visit Transfer | Security      |

    Examples: 
      | alertType | mailContent2                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | smsContent2                                                                                                                                                                                                                                                                                                                                                                                                                            | whatsappContent2                                                                                                                                                                                                                                                                                                                                                                                                                       |
      | Default   | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                                                                                                |
      | Custom    | Visit of [Visitor Name] with [Old Host Name] has been transferred to a new host named [Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visit Date : [Visit Date] - [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Visit of [Visitor Name] with [Old Host Name] has been transferred to a new host named [Host Name].<br>Details are as follows:<br><br>Appointment No : [Appointment No.]<br>Visit Date : [Visit Date] - [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time] | Visit of [Visitor Name] scheduled from [Visit Start Date] at [Visit Start Time] until [Visit Until Date] has transferred from [Old Host Name] to new host named [Host Name].<br>Appointment No: [Appointment No.]<br>Visit of [Visitor Name] scheduled from [Visit Start Date] at [Visit Start Time] until [Visit Until Date] has transferred from [Old Host Name] to new host named [Host Name].<br>Appointment No: [Appointment No.] | Visit of [Visitor Name] scheduled from [Visit Start Date] at [Visit Start Time] until [Visit Until Date] has transferred from [Old Host Name] to new host named [Host Name].<br>Appointment No: [Appointment No.]<br>Visit of [Visitor Name] scheduled from [Visit Start Date] at [Visit Start Time] until [Visit Until Date] has transferred from [Old Host Name] to new host named [Host Name].<br>Appointment No: [Appointment No.] |

  
  @CAVMM-9
  Scenario Outline: Visitor Pass
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_79 |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   7900000001 | cos79@gmail.com            |
    And Reset "Visitor Management" page to default
    And create visitor profile via API
      | id       | name     | active |
      | COS_79V1 | COS_79V1 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      | COS_79 | COS_79 |               1 |         1 |               1 |                  1 |                    1 |    7900000001 | cos79@gmail.com |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_79       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_79  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass"
    And Update Alert Configuration "Visitor Pass"
      | QR   | Barcode |
      | True | True    |
    And Set Alert Message Preview in Alert "Visitor Pass"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_79 |
    And "Visitor Pass" alert normal custom field value set
      | Visitor |
      | VIS_79  |
    Then Validate Alert Containt
      | AlertType   | AlertEvent   | MailRecieveTo |
      | <alertType> | Visitor Pass | <Reciever>    |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_79 |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                                                           | whatsappContent                                                                                                                                                                                                                                                                                                      |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                              |
      | Custom    | Visitor  | Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin].<br>Appointment No: [Appointment No.]<br>Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin].<br>Appointment No: [Appointment No.] | Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin].<br>Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin]. | Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin].<br>Your Visit Pass to meet [Host Name],scheduled from [Visit Start Date] to [Visit Until Date] has been generated.<br>Pin to access device is [Access Pin]. |
  
  #Pending - Actual Result is null
  @CAVMM-10
  Scenario Outline: Visit Reminder - send to Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_80 |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   8000000001 | cos80@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email  |
      | COS_80 | COS_80 |               1 |         1 |               1 |                  1 |                    1 |    8000000001 | cos80@gmail.com |
    And Set Alert Configuration "Visit Reminder"
    And Set Send Alert to parameters for "Visit Reminder" Alert
    And Update Alert Configuration "Visit Reminder"
      | ReminderPriorHours | ReminderPriorDays |
      |                  1 |                 0 |
    And Set Alert Message Preview in Alert "Visit Reminder"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |               62 |             66 | VIS_80       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_80  | SA        | Default Location   |
    And "Visit Reminder" alert normal custom field value set
      | Visitor | Reciever   | ReminderPriorHours | HourDay |
      | VIS_80  | <Reciever> |                  1 | hour/s  |
    When Wait for "5" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Visit Reminder | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | Visitor  | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

  #Pending - Actual Result is null
  @CAVMM-10_1
  Scenario Outline: Visit Reminder - send to Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_80 |
    And Delete visitor via API
      | mobilenumber |
      |   8000000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8000000011 | visitor80@gmail.com        |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_80 | COS_80 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Set Alert Configuration "Visit Reminder"
    And Set Send Alert to parameters for "Visit Reminder" Alert
    And Update Alert Configuration "Visit Reminder"
      | ReminderPriorHours | ReminderPriorDays |
      |                  1 |                 0 |
    And Set Alert Message Preview in Alert "Visit Reminder"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |               62 |             66 | VIS_80       | Matrix            | 8000000011 | visitor80@gmail.com | COS_80  | SA        | Default Location   |
    And "Visit Reminder" alert normal custom field value set
      | Visitor | Reciever   | ReminderPriorHours | HourDay |
      | VIS_80  | <Reciever> |                  1 | hour/s  |
    When Wait for "6" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent     | MailRecieveTo |
      | <alertType> | Visit Reminder | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                   | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | Host     | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] | This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.]<br>This is a friendly reminder, that your visit with [Host Name/Visitor Name] is scheduled after [Reminder Prior Hours\|Reminder Prior Day] [hour/s\|day/s] on [Visit Date] at [Visit Start Time].<br>Appointment No: [Appointment No.] |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                              | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

   @CAVMM-11
  Scenario Outline: Visitor Arrival
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID |
      | COS_81 |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And create visitor profile via API
      | id       | name     | active |
      | COS_81V1 | COS_81V1 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_81 | COS_81 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_81       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_81  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Arrival"
    And Set Alert Message Preview in Alert "Visitor Arrival"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Assign User in Alert "Visitor Arrival"
      | UserID |
      | COS_81 |
    When Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_81 |
    And "Visitor Arrival" alert normal custom field value set
      | Visitor Name | Station Location |
      | VIS_81       | Default Location |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_81 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent      | MailRecieveTo |
      | <alertType> | Visitor Arrival | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                  | smsContent                                                                                                                 | whatsappContent                                                                                                                                              |
      | Custom    | User     | [Visitor Name] has arrived at [Station Location].[DateTime].<br>[Visitor Name] has arrived at [Station Location].[DateTime]. | [Visitor Name] has arrived at [Station Location].[DateTime]<br>[Visitor Name] has arrived at [Station Location].[DateTime] | Visitor [Visitor Name] has arrived at Station [Station Location], [DateTime]<br>Visitor [Visitor Name] has arrived at Station [Station Location], [DateTime] |
      | Default   | User     | Default                                                                                                                      | Default                                                                                                                    | Default                                                                                                                                                      |
  
 @CAVMM-12
  Scenario Outline: Visitor Pass Expiry Reminder -Check for Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_82         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
      |   8200000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   8200000001 | cos82@gmail.com            |
      |   8200000021 | cos17linkess@gmail.com     |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_82V1 | COS_82V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email         |
      | COS_82         | COS_82         |               1 |         1 |               1 |                  1 |                    1 |    8200000001 | cos82@gmail.com        |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    8200000021 | cos17linkess@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              3 | VIS_82       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_82  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expiry Reminder"
    And Set Send Alert to parameters for "Visitor Pass Expiry Reminder" Alert
    And Update Alert Configuration "Visitor Pass Expiry Reminder"
      | ExpiryReminderMinutes |
      |                     1 |
    And Set Alert Message Preview in Alert "Visitor Pass Expiry Reminder"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_82 |
    When Wait for "5" min
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_82 |
    And "Visitor Pass Expiry Reminder" alert normal custom field value set
      | Visitor | ExpiryReminder |
      | VIS_82  |              1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Visitor Pass Expiry Reminder | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                | smsContent                                                                                                                                                                                 | whatsappContent                                                                                                                                                                            |
      | Default   | Visitor  | Default                                                                                                                                                                                    | Default                                                                                                                                                                                    | Default                                                                                                                                                                                    |
      | Custom    | Visitor  | Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>Your pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. |
 
  #Pending - Wrong Email and sms(issue Raise so solved in V21R02 after check )
  @CAVMM-12-1 
  Scenario Outline: Visitor Pass Expiry Reminder -Check for HOST
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_82         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8200000011 |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   8200000021 | cos17linkess@gmail.com     |
      |   8200000001 | cos82@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8200000011 | visitor82@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_82V1 | COS_82V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_82         | COS_82         |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    8200000021 | cos17linkess@gmail.com     |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              3 | VIS_82       | Matrix            | 8200000011 | visitor82@gmail.com | COS_82  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expiry Reminder"
    And Set Send Alert to parameters for "Visitor Pass Expiry Reminder" Alert
    And Update Alert Configuration "Visitor Pass Expiry Reminder"
      | ExpiryReminderMinutes |
      |                     1 |
    And Set Alert Message Preview in Alert "Visitor Pass Expiry Reminder"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_82 |
    When Wait for "4" min
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_82 |
    And "Visitor Pass Expiry Reminder" alert normal custom field value set
      | Visitor | ExpiryReminder |
      | VIS_82  |              1 |
    When Wait for "3" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Visitor Pass Expiry Reminder | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                                                                                                                                   | smsContent1                                                                                                                                                                                                    | whatsappContent1                                                                                                                                                                                               |
      | Default   | Host     | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        |
      | Custom    | Host     | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. |

  #Pending - Failed due to wrong SMS(issue Raise so solved in V21R02 after check )
  @CAVMM-12-2 
  Scenario Outline: Visitor Pass Expiry Reminder -Check for Security
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_82         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8200000011 |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8200000001 | cos82@gmail.com            |
      |   8200000021 | cos17linkess@gmail.com     |
      |   8200000011 | visitor82@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_82V1 | COS_82V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_82         | COS_82         |               1 |         1 |               1 |                  1 |                    1 |    8200000001 | cos82@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              3 | VIS_82       | Matrix            | 8200000011 | visitor82@gmail.com | COS_82  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expiry Reminder"
    And Set Send Alert to parameters for "Visitor Pass Expiry Reminder" Alert
    And Update Alert Configuration "Visitor Pass Expiry Reminder"
      | ExpiryReminderMinutes |
      |                     1 |
    And Set Alert Message Preview in Alert "Visitor Pass Expiry Reminder"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_82 |
    When Wait for "5" min
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_82 |
    And "Visitor Pass Expiry Reminder" alert normal custom field value set
      | Visitor | ExpiryReminder |
      | VIS_82  |              1 |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                   | MailRecieveTo |
      | <alertType> | Visitor Pass Expiry Reminder | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent1                                                                                                                                                                                                   | smsContent1                                                                                                                                                                                                    | whatsappContent1                                                                                                                                                                                               |
      | Default   | Security | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        | Default                                                                                                                                                                                                        |
      | Custom    | Security | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. | [Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes.<br>[Visitor Name] pass having pass number as [Pass Number] will expire within [Expiry Reminder] minutes. |

 @CAVMM-13
  Scenario Outline: Visitor Pass Expired- Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_83         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
      |   8300000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   8300000001 | cos83@gmail.com            |
      |   8300000021 | cos17linkess@gmail.com     |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_83V1 | COS_83V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email         |
      | COS_83         | COS_83         |               1 |         1 |               1 |                  1 |                    1 |    8300000001 | cos83@gmail.com        |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    8300000021 | cos17linkess@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              2 | VIS_83       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_83  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expired"
    And Set Send Alert to parameters for "Visitor Pass Expired" Alert
    And Update Alert Configuration "Visitor Pass Expired"
      | ReminderPeriodMin |
      |                 0 |
    And Set Alert Message Preview in Alert "Visitor Pass Expired"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_83 |
    When Wait for "2" min
    And "Visitor Pass Expired" alert normal custom field value set
      | Visitor |
      | VIS_83  |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_83 |
    When Wait for "4" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Visitor Pass Expired | Visitor       |

    Examples: 
      | alertType | mailContent                                                                                                                                                                                                          | smsContent                                                                                                                                                                                                           | whatsappContent                                                                                                                                                                                                      |
      | Default   | Default                                                                                                                                                                                                              | Default                                                                                                                                                                                                              | Default                                                                                                                                                                                                              |
      | Custom    | Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>Your pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. |
  
  #Actual Result is null
  @CAVMM-13-1
  Scenario Outline: Visitor Pass Expired-Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_83         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
      |   8300000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   8300000021 | cos17linkess@gmail.com     |
      |   8300000011 | vis83@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_83V1 | COS_83V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_83         | COS_83         |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    8300000021 | cos17linkess@gmail.com     |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email           | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              2 | VIS_83       | Matrix            | 8300000011 | vis83@gmail.com | COS_83  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expired"
    And Set Send Alert to parameters for "Visitor Pass Expired" Alert
    And Update Alert Configuration "Visitor Pass Expired"
      | ReminderPeriodMin |
      |                 0 |
    And Set Alert Message Preview in Alert "Visitor Pass Expired"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_83 |
    When Wait for "2" min
    And "Visitor Pass Expired" alert normal custom field value set
      | Visitor |
      | VIS_83  |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_83 |
    When Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Visitor Pass Expired | Host          |

    Examples: 
      | alertType | mailContent1                                                                                                                                                                                                                                 | smsContent1                                                                                                                                                                                                                                  | whatsappContent1                                                                                                                                                                                                                             |
      | Default   | Default                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                      |
      | Custom    | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. |

  #Actual Result is null
  @CAVMM-13-2
  Scenario Outline: Visitor Pass Expired-Security
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_83         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
      |   8300000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8300000001 | cos83@gmail.com            |
      |   8300000011 | vis83@gmail.com            |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And create visitor profile via API
      | id       | name     | active |
      | COS_83V1 | COS_83V1 |      1 |
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_83         | COS_83         |               1 |         1 |               1 |                  1 |                    1 |    8300000001 | cos83@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email           | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              2 | VIS_83       | Matrix            | 8300000011 | vis83@gmail.com | COS_83  | SA        | Default Location   |
    And Set Alert Configuration "Visitor Pass Expired"
    And Set Send Alert to parameters for "Visitor Pass Expired" Alert
    And Update Alert Configuration "Visitor Pass Expired"
      | ReminderPeriodMin |
      |                 0 |
    And Set Alert Message Preview in Alert "Visitor Pass Expired"
      | Mail1          | SMS1          | WhatsApp1          |
      | <mailContent1> | <smsContent1> | <whatsappContent1> |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | COS_83 |
    When Wait for "2" min
    And "Visitor Pass Expired" alert normal custom field value set
      | Visitor |
      | VIS_83  |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_83 |
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent           | MailRecieveTo |
      | <alertType> | Visitor Pass Expired | Security      |

    Examples: 
      | alertType | mailContent1                                                                                                                                                                                                                                 | smsContent1                                                                                                                                                                                                                                  | whatsappContent1                                                                                                                                                                                                                             |
      | Default   | Default                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                                                      |
      | Custom    | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. | [Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered.<br>[Visitor name]'s pass having pass number as [Pass Number] expired at [Departure time] and is left to be surrendered. |

  @CAVMM-14
  Scenario Outline: Visitor - Login without OTP
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_84         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8400000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_84         | COS_84         |               1 |         1 |               1 |                  1 |                    1 |    8400000001 | cos84@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | SA_COS_17 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | COS84 | Site-1   | false                     | Saved Successfully |
    And Set Alert Configuration "Visitor - Login without OTP"
    And Update Alert Configuration "Visitor - Login without OTP"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Set Alert Message Preview in Alert "Visitor - Login without OTP"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId    | Password | validation     |
      | COS84           | SA_COS_17 | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |  8400000011 | Profile    |
    And Enter visitor details in visitor portal
      | Name   | Organization | Email               | validation                                                  |
      | VIS_84 | Matrix       | visitor84@gmail.com | Request submitted successfully.Try to login after some time |
    And Go to previous Tab
    And "Visitor - Login without OTP" alert normal custom field value set
      | Visitor |
      | VIS_84  |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                  | MailRecieveTo |
      | <alertType> | Visitor - Login without OTP | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  | smsContent                                                                                                                                                                                                       | whatsappContent                                                                                                                                                                                                  |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      | Default                                                                                                                                                                                                          | Default                                                                                                                                                                                                          |
      | Custom    | Host     | [Visitor Name] has requested for Login without OTP in Cosec Visitor.<br><br>Visitor Details are as follows:<br>Name: [Visitor's Name]<br>Mobile Number: [Visitor's Mobile Number]<br>Email ID: [Visitor's Email ID]<br>Organization: [Visitor's Organization Name]<br><br>Previous Visit Details are as follows:<br><br>[Visitor Name] has requested for Login without OTP in Cosec Visitor.<br><br>Visitor Details are as follows:<br>Name: [Visitor's Name]<br>Mobile Number: [Visitor's Mobile Number]<br>Email ID: [Visitor's Email ID]<br>Organization: [Visitor's Organization Name]<br><br>Previous Visit Details are as follows:<br> | [Visitor Name] has requested for Login without OTP in Cosec Visitor.<br>Mobile Number: [Mobile Number]<br>[Visitor Name] has requested for Login without OTP in Cosec Visitor.<br>Mobile Number: [Mobile Number] | [Visitor Name] has requested for Login without Key in Cosec Visitor.<br>Mobile Number: [Mobile Number]<br>[Visitor Name] has requested for Login without Key in Cosec Visitor.<br>Mobile Number: [Mobile Number] |
  
  @CAVMM-15
  Scenario Outline: Visitor Form Execution -For Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_85         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8500000011 |
    And Delete Visitor Pre-Registration from SA
      | visitor |
      | VIS_85  |
    And Delete Visitor Form "Form85" from Database
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8500000021 | cos17linkess@gmail.com     |
      |   8500000001 | cos85@gmail.com            |
      |   8500000011 | visitor85@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_85         | COS_85         |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    8500000021 | cos17linkess@gmail.com     |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | SA_COS_17 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Visitor Form from admin module
      | Name   | ApproveOn     | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | Form85 | Any Condition | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      | COS85 | Site-1   | True                      | Form85          | All Visits         |                 |                    | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_85       | Matrix            | 8500000011 | visitor85@gmail.com | COS_85  | SA        | COS85              |
    And create visitor profile via API
      | id  | name | active |
      | v85 | v85  |      1 |
    And Set Alert Configuration "Visitor Form Execution"
    And Set Send Alert to parameters for "Visitor Form Execution" Alert
    And Set Alert Message Preview in Alert "Visitor Form Execution"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId    | Password | validation     |
      | COS85           | SA_COS_17 | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |  8500000011 | Create Visit |
    When CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | COS_85 | Option 1 | Eligibility criteria achieved |
    And Go to previous Tab
    And "Visitor Form Execution" alert normal custom field value set
      | Visitor | FormType | Attquest |
      | VIS_85  | Check-In | 1/1      |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_85 |
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent             | MailRecieveTo |
      | <alertType> | Visitor Form Execution | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                                                                                  |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | Host     | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br><br>Attempt : [Attempt No.]<br>Attempted Questions : [Attempted Questions/Total Questions]<br>Final Score : [Achieved Score/Total Score]<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br><br>Attempt : [Attempt No.]<br>Attempted Questions : [Attempted Questions/Total Questions]<br>Final Score : [Achieved Score/Total Score] | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time]. | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from the station [Station Name] using [Form Name] form at attempted period [Attempt Date-Time].<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from the station [Station Name] using [Form Name] form at attempted period [Attempt Date-Time]. |
  
   @CAVMM-15-1
  Scenario Outline: Visitor Form Execution -For Security
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_85         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8500000011 |
    And Delete Visitor Pre-Registration from SA
      | visitor |
      | VIS_85  |
    And Delete Visitor Form "Form85" from Database
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8500000111 | COS85@gmail.com            |
      |   8500000011 | visitor85@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_85         | COS_85         |               1 |         1 |               1 |                  1 |                    1 |    8500000111 | COS85@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | SA_COS_17 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Visitor Form from admin module
      | Name   | ApproveOn     | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | Form85 | Any Condition | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      | COS85 | Site-1   | True                      | Form85          | All Visits         |                 |                    | Saved Successfully |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_85       | Matrix            | 8500000011 | visitor85@gmail.com | COS_85  | SA        | COS85              |
    And create visitor profile via API
      | id  | name | active |
      | v85 | v85  |      1 |
    And Set Alert Configuration "Visitor Form Execution"
    And Set Send Alert to parameters for "Visitor Form Execution" Alert
    And Set Alert Message Preview in Alert "Visitor Form Execution"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId    | Password | validation     |
      | COS85           | SA_COS_17 | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |  8500000011 | Create Visit |
    When CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | COS_85 | Option 1 | Eligibility criteria achieved |
    And Go to previous Tab
    And "Visitor Form Execution" alert normal custom field value set
      | Visitor | FormType | Attquest |
      | VIS_85  | Check-In | 1/1      |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | COS_85 |
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent             | MailRecieveTo |
      | <alertType> | Visitor Form Execution | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                                                                                             | whatsappContent                                                                                                                                                                                                                                                                                                                                                  |
      | Default   | Security | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                                                                          |
      | Custom    | Security | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br><br>Attempt : [Attempt No.]<br>Attempted Questions : [Attempted Questions/Total Questions]<br>Final Score : [Achieved Score/Total Score]<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br><br>Attempt : [Attempt No.]<br>Attempted Questions : [Attempted Questions/Total Questions]<br>Final Score : [Achieved Score/Total Score] | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time].<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from station [Station Name] using [Form Name] form at [Attempt Date-Time]. | Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from the station [Station Name] using [Form Name] form at attempted period [Attempt Date-Time].<br>Visitor [Visitor Name] is [Allowed/Not Allowed] for [Check-In/Check-Out/Login] from the station [Station Name] using [Form Name] form at attempted period [Attempt Date-Time]. |
 
   @CAVMM-16
  Scenario Outline: Visitor Pre-registration Approval/Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_86      |
      | COS_86_RIC1 |
    And Delete visitor via API
      | mobilenumber |
      |   8600000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8600000001 | cos86@gmail.com            |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_86      | COS_86      |               1 |         1 |               1 |                  1 |                    1 |    8600000001 | cos86@gmail.com            |
      | COS_86_RIC1 | COS_86_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS86RICGrp      |        1 | COS_86_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_86 | COS86RICGrp    |                |            |              | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration |
      | Always                        |
    And Set Alert Configuration "Visitor Pre-registration Approval/Rejection"
    And Update Alert Configuration "Visitor Pre-registration Approval/Rejection"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Visitor Pre-registration Approval/Rejection"
      | UserID      |
      | COS_86_RIC1 |
    And Set Alert Message Preview in Alert "Visitor Pre-registration Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_86 |                          1 | admin        |    1 |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_86       | Matrix            | 8600000011 | visitor86@gmail.com | COS_86  | COS_86    | Default Location   |
    And "Visitor Pre-registration Approval/Rejection" alert normal custom field value set
      | Visitor | Initiated |
      | VIS_86  | Host      |
   And Reset "Visitor Management" page to default
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent                                  | MailRecieveTo |
      | <alertType> | Visitor Pre-registration Approval/Rejection | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | smsContent                                                                                                                                                                                                                                                                                                         | whatsappContent                                                                                                                                                                                                                                                                                                    |
      | Default   | RIC      | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                | Default                                                                                                                                                                                                                                                                                                            | Default                                                                                                                                                                                                                                                                                                            |
      | Custom    | RIC      | Visit Registration approval request.<br>Details are as below:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor]<br>Appointment No: [Appointment No.]<br>Visit Date: [Visit Date] - [Visit Until Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude]<br>Visit Registration approval request.<br>Details are as below:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor]<br>Appointment No: [Appointment No.]<br>Visit Date: [Visit Date] - [Visit Until Date]<br>Visit Time: [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon,Tue,Wed,..,Sun/1,2,3,...,31]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude] | Visitor registration approval request with following details:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor]<br>Visitor registration approval request with following details:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor] | Visitor registration approval request with following details:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor]<br>Visitor registration approval request with following details:<br>Host Name: [Host Name]<br>Visitor Name: [Visitor Name]<br>Initiated by: [Host/Visitor] |
  
  @CAVMM-17
  Scenario Outline: Visit Request Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_88      |
      | COS_88_RIC1 |
    And Delete visitor via API
      | mobilenumber |
      |   8800000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_88      | COS_88      |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_88_RIC1 | COS_88_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8800000021 | cos88ric1@gmail.com        |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS88RICGrp      |        1 | COS_88_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_88 | COS88RICGrp    |                |            |              | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration |
      | Always                        |
    And Set Alert Configuration "Visit Request Approval/Rejection"
    And Set Alert Message Preview in Alert "Visit Request Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_88      |                          1 | admin        |    1 |
      | COS_88_RIC1 |                          1 | admin        |    1 |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_88       | Matrix            | 8800000011 | visitor88@gmail.com | COS_88  | COS_88    | Default Location   |
    When Visitor PreRegistration Approval API
      | verdict | remark      | approvedBy  | StartDate | EndDate | HostID |
      |       1 | RICApproved | COS_88_RIC1 |         0 |       0 | COS_88 |
    And "Visit Request Approval/Rejection" alert normal custom field value set
      | Visitor | ApplicationStatus |
      | VIS_88  | approved          |
    And Wait for "4" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent                       | MailRecieveTo |
      | <alertType> | Visit Request Approval/Rejection | <Reciever>    |
    And Reset "Visitor Management" page to default

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Default                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | Host     | Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Remark: [Remark]<br>Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Remark: [Remark][Host Name] | Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No] | Your appointment with visitor [Visitor Name], is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Your appointment with visitor [Visitor Name], is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No] |

  
   @CAVMM-18
  Scenario Outline: Visit Request Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_88      |
      | COS_88_RIC1 |
    And Delete visitor via API
      | mobilenumber |
      |   8800000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_88      | COS_88      |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
      | COS_88_RIC1 | COS_88_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8800000021 | cos88ric1@gmail.com        |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS88RICGrp      |        1 | COS_88_RIC1 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | COS_88 | COS88RICGrp    |                |            |              | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration |
      | Always                        |
    And Set Alert Configuration "Visit Request Approval/Rejection"
    And Set Alert Message Preview in Alert "Visit Request Approval/Rejection"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_88      |                          1 | admin        |    1 |
      | COS_88_RIC1 |                          1 | admin        |    1 |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_88       | Matrix            | 8800000011 | visitor88@gmail.com | COS_88  | COS_88    | Default Location   |
    When Visitor PreRegistration Approval API
      | verdict | remark      | approvedBy  | StartDate | EndDate | HostID |
      |       2 | RICRejected | COS_88_RIC1 |         0 |       0 | COS_88 |
    And "Visit Request Approval/Rejection" alert normal custom field value set
      | Visitor | ApplicationStatus |
      | VIS_88  | rejected          |
    Then Validate Alert Containt
      | AlertType   | AlertEvent                       | MailRecieveTo |
      | <alertType> | Visit Request Approval/Rejection | <Reciever>    |
    And Reset "Visitor Management" page to default

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                       | smsContent                                                                                                                                                                                                                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                                                                                                                                                                                                                                      |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | Default                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                                                                                                                                                                                                                              |
      | Custom    | Host     | Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Remark: [Remark]<br>Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Remark: [Remark][Host Name] | Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Your appointment with [Visitor Name], scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No] | Your appointment with visitor [Visitor Name], is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No]<br>Your appointment with visitor [Visitor Name], is scheduled on [Visit Date] at [Visit Start Time] until [Visit Until Date], is [approved/rejected] on [Approval/Rejection Date-Time].<br>Appointment No: [Appointment No] |
  
  @CAVMM-19
  Scenario Outline: Security Clearance
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_89         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   8900000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   8900000001 | cos89@gmail.com            |
      |   8900000011 | visitor89@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_89         | COS_89         |               1 |         1 |               1 |                  1 |                    1 |    8900000001 | cos89@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | True                            |
    And Set Alert Configuration "Security Clearance"
    And Update Alert Configuration "Security Clearance"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Set Alert Message Preview in Alert "Security Clearance"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | COS_89 |                          1 | admin        |    1 |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_89       | Matrix            | 8900000011 | visitor89@gmail.com | COS_89  | COS_89    | Default Location   |
    And "Security Clearance" alert normal custom field value set
      | Visitor |
      | VIS_89  |
    And Wait for "2" min
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Security Clearance | <Reciever>    |
    And Reset "Visitor Management" page to default

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                     | whatsappContent                                                                                                                                                                                                                |
      | Custom    | Security | Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Details are as follows:<br>Appointment No: [Appointment No.]<br>Visitor Mobile No : [Visitor Mobile No.]<br>Visit Date : [Visit Date]<br>Visit Until Date : [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Visit Purpose : [Visit Purpose]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude]<br>Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Details are as follows:<br>Appointment No: [Appointment No.]<br>Visitor Mobile No : [Visitor Mobile No.]<br>Visit Date : [Visit Date]<br>Visit Until Date : [Visit Until Date]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Visit Purpose : [Visit Purpose]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Station: [Station Name]<br>Visit Location: [Location Code - Location Name/ Latitude , Longitude] | Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Appointment No: [Appointment No.]<br>Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Appointment No: [Appointment No.] | Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Appointment No: [Appointment No.]<br>Security Clearance required for [Visitor Name]'s visit with [Host Name].<br>Appointment No: [Appointment No.] |
      | Default   | Security | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                        |

  @CAVMM-20
  Scenario Outline: Visit State Change -To Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_90         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9033207186 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9000000001 | cos90@gmail.com            |
      |   9000000021 | cos17linkess@gmail.com     |
      |   9033207186 | matrixautomationreceiver@gmail.com |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email         |
      | COS_90         | COS_90         |               1 |         1 |               1 |                  1 |                    1 |    9000000001 | cos90@gmail.com        |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9000000021 | cos17linkess@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | SA_COS_17 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Visit State Change"
    And Set Send Alert to parameters for "Visit State Change" Alert
    And Update Alert Configuration "Visit State Change"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visit State Change"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                      | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                1 |                1 |             10 | VIS_90       | Matrix            | 9033207186 | matrixautomationreceiver@gmail.com | COS_90  | SA_COS_17 | Default Location   |
    And "Visit State Change" alert normal custom field value set
      | Visitor | ActorName | Visit State |
      | VIS_90  | System    | Accepted    |
    And Reset "Visitor Management" page to default
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Visit State Change | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                |
      | Custom    | Visitor  | [Actor Name] [Visit State] Visit with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>Expected Arrival : [Visit Date] at [Visit Start Time]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Last Date : [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude]<br>[Actor Name] [Visit State] Visit with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>Expected Arrival : [Visit Date] at [Visit Start Time]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Last Date : [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude] | [Actor Name] [Visit State] Visit with Appointment No: [Appointment No.]. Host: [Host Name], Visitor: [Visitor Name]<br>[Actor Name] [Visit State] Visit with Appointment No: [Appointment No.]. Host: [Host Name], Visitor: [Visitor Name] | [Actor Name] has [Visit State] the visit scheduled with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>[Actor Name] has [Visit State] the visit scheduled with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.] |
      | Default   | Visitor  | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                        |

  @CAVMM-20-1
  Scenario Outline: Visit State Change -To Host
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    #And Set Whatsapp Configuration
    And Delete user via API
      | UserID         |
      | COS_90         |
      | COS_17_LinkESS |
    And Delete visitor via API
      | mobilenumber |
      |   9000000011 |
    And Delete SMS and Mail log
      | mobilenumber | Email                      |
      |   9000000001 | cos90@gmail.com            |
      |   9033207186 | matrixautomationreceiver@gmail.com |
      |   9000000011 | visitor90@gmail.com        |
    And Reset "Visitor Management" page to default
    And Delete System Account User "SA_COS_17" from database
    And Create User via api
      | Id             | name           | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email             |
      | COS_90         | COS_90         |               1 |         1 |               1 |                  1 |                    1 |    9000000001 | cos90@gmail.com            |
      | COS_17_LinkESS | COS_17_LinkESS |               1 |         1 |               1 |                  1 |                    1 |    9033207186 | matrixautomationreceiver@gmail.com |
    And Create New System Account User
      | SAUser    | ESSUSer        | APIAccess | ValidationMessage  |
      | SA_COS_17 | COS_17_LinkESS | True      | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User      | NewPassword | ConfirmPassword | Validation |
      | SA_COS_17 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Visit State Change"
    And Set Send Alert to parameters for "Visit State Change" Alert
    And Update Alert Configuration "Visit State Change"
      | CalendarInvite | ApprovalLinks | ApprovalAcknowledgment |
      | True           | True          | True                   |
    And Set Alert Message Preview in Alert "Visit State Change"
      | Mail          | SMS          | WhatsApp          |
      | <mailContent> | <smsContent> | <whatsappContent> |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email               | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                1 |                1 |             10 | VIS_90       | Matrix            | 9000000011 | visitor90@gmail.com | COS_90  | SA_COS_17 | Default Location   |
    And "Visit State Change" alert normal custom field value set
      | Visitor | ActorName | Visit State |
      | VIS_90  | System    | Accepted    |
    And Reset "Visitor Management" page to default
    Then Validate Alert Containt
      | AlertType   | AlertEvent         | MailRecieveTo |
      | <alertType> | Visit State Change | <Reciever>    |

    Examples: 
      | alertType | Reciever | mailContent                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    | smsContent                                                                                                                                                                                                                                 | whatsappContent                                                                                                                                                                                                                                                                                                                                |
      | Custom    | Host     | [Actor Name] [Visit State] Visit with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>Expected Arrival : [Visit Date] at [Visit Start Time]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Last Date : [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude]<br>[Actor Name] [Visit State] Visit with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>Expected Arrival : [Visit Date] at [Visit Start Time]<br>Visit Time : [Visit Start Time] - [Visit End Time]<br>Repeat Visit: [Daily/Weekly/Monthly] - [Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31]<br>Visit Last Date : [Visit Until Date]<br>Visit Station: [Station Name]<br>Visit Location:  [Location Code - Location Name/ Latitude , Longitude] | [Actor Name] [Visit State] Visit with Appointment No: [Appointment No.]. Host: [Host Name], Visitor: [Visitor Name]<br>[Actor Name] [Visit State] Visit with Appointment No: [Appointment No.]. Host: [Host Name], Visitor: [Visitor Name] | [Actor Name] has [Visit State] the visit scheduled with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.]<br>[Actor Name] has [Visit State] the visit scheduled with below mentioned details:<br>Host: [Host Name]<br>Visitor: [Visitor Name]<br>Appointment No: [Appointment No.] |
      | Default   | Host     | Default                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        | Default                                                                                                                                                                                                                                    | Default                                                                                                                                                                                                                                                                                                                                        |
