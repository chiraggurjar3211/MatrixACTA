@tag
Feature: Check users module Report scheduler

  Background: All repx file datetime field can published value change in repx file.
    Given Open Cosec Web
    And Update value of can publish field for all alert service reports.

  @tag1
  Scenario Outline: Check In/Out event report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName   | Active | Report       | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | In_Out EventXLS | true   | In/Out Event | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | In_Out EventCSV | true   | In/Out Event | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | In_Out EventPDF | true   | In/Out Event | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "In/Out Event" Report scheduler parameter configuration update
      | ReportName      | StartDaysB | EndDaysB | GroupNeededInReport | GroupBy |
      | In_Out EventXLS |          9 |        0 | true                | Date    |
      | In_Out EventPDF |          9 |        0 | true                | Date    |
      | In_Out EventCSV |          9 |        0 | true                | Date    |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report       | FileFormat | Compare  |
      | In/Out Event | XLS        | Compared |
      | In/Out Event | CSV        | Compared |
      | In/Out Event | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Check InOut Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report        | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | InOut SummaryXLS | true   | InOut Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | InOut SummaryPDF | true   | InOut Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | InOut SummaryCSV | true   | InOut Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
   And "InOut Summary" Report scheduler parameter configuration update
      | ReportName       | StartDaysB | GroupBy    | GroupNeededInReport |
      | InOut SummaryXLS |          9 | Department | Format 1            |
      | InOut SummaryPDF |          9 | Department | Format 1            |
      | InOut SummaryCSV |          9 | Department | Format 1            |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report        | FileFormat | Compare  |
      | InOut Summary | XLS        | Compared |
      | InOut Summary | CSV        | Compared |
      | InOut Summary | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-83
  Scenario: Check Blocked User report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName   | Active | Report       | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Blocked UserXLS | true   | Blocked User | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Blocked UserPDF | true   | Blocked User | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Blocked UserCSV | true   | Blocked User | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report       | FileFormat | Compare  |
      | Blocked User | XLS        | Compared |
      | Blocked User | CSV        | Compared |
      | Blocked User | PDF        | Compared |

  @CS-84
  Scenario Outline: Check Access Denied report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report        | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Access DeniedXLS | true   | Access Denied | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Access DeniedPDF | true   | Access Denied | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Access DeniedCSV | true   | Access Denied | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Access Denied" Report scheduler parameter configuration update
      | ReportName       | StartDaysB | EndDaysB |
      | Access DeniedXLS |          9 |        0 |
      | Access DeniedPDF |          9 |        0 |
      | Access DeniedCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report        | FileFormat | Compare  |
      | Access Denied | XLS        | Compared |
      | Access Denied | CSV        | Compared |
      | Access Denied | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-85
  Scenario Outline: Check Late In report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report  | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Late InXLS    | true   | Late In | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Late InPDF    | true   | Late In | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Late InCSV    | true   | Late In | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Late In" Report scheduler parameter configuration update
      | ReportName | StartDaysB | EndDaysB |
      | Late InXLS |          9 |        0 |
      | Late InPDF |          9 |        0 |
      | Late InCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report  | FileFormat | Compare  |
      | Late In | XLS        | Compared |
      | Late In | CSV        | Compared |
      | Late In | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-86
  Scenario Outline: Check Absentee report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report   | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | AbsenteeXLS   | true   | Absentee | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | AbsenteePDF   | true   | Absentee | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | AbsenteeCSV   | true   | Absentee | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Absentee" Report scheduler parameter configuration update
      | ReportName  | StartDaysB | EndDaysB |
      | AbsenteeXLS |          9 |        0 |
      | AbsenteePDF |          9 |        0 |
      | AbsenteeCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report   | FileFormat | Compare  |
      | Absentee | XLS        | Compared |
      | Absentee | CSV        | Compared |
      | Absentee | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-87
  Scenario Outline: Check Exception report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report    | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | ExceptionXLS  | true   | Exception | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | ExceptionPDF  | true   | Exception | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | ExceptionCSV  | true   | Exception | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Exception" Report scheduler parameter configuration update
      | ReportName   | StartDaysB | EndDaysB |
      | ExceptionXLS |          9 |        0 |
      | ExceptionPDF |          9 |        0 |
      | ExceptionCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report    | FileFormat | Compare  |
      | Exception | XLS        | Compared |
      | Exception | CSV        | Compared |
      | Exception | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-88
  Scenario Outline: Check Attendance Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName         | Active | Report             | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Attendance SummaryXLS | true   | Attendance Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Attendance SummaryPDF | true   | Attendance Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Attendance SummaryCSV | true   | Attendance Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Attendance Summary" Report scheduler parameter configuration update
      | ReportName            | StartDaysB | EndDaysB | GroupBy  |
      | Attendance SummaryXLS |          9 |        0 | Format 1 |
      | Attendance SummaryPDF |          9 |        0 | Format 1 |
      | Attendance SummaryCSV |          9 |        0 | Format 1 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report             | FileFormat | Compare  |
      | Attendance Summary | XLS        | Compared |
      | Attendance Summary | CSV        | Compared |
      | Attendance Summary | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-89
  Scenario: Check Muster Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Muster SummaryXLS | true   | Muster Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Muster SummaryPDF | true   | Muster Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Muster SummaryCSV | true   | Muster Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Muster Summary" Report scheduler parameter configuration update
      | ReportName        | StartDaysB |
      | Muster SummaryXLS |          0 |
      | Muster SummaryPDF |          0 |
      | Muster SummaryCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Muster Summary | XLS        | Compared |
      | Muster Summary | CSV        | Compared |
      | Muster Summary | PDF        | Compared |

  @CS-90
  Scenario: Check Salary Data report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName  | Active | Report      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Salary DataXLS | true   | Salary Data | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Salary DataPDF | true   | Salary Data | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Salary DataCSV | true   | Salary Data | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Salary Data" Report scheduler parameter configuration update
      | ReportName     | StartDaysB |
      | Salary DataXLS |          0 |
      | Salary DataPDF |          0 |
      | Salary DataCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report      | FileFormat | Compare  |
      | Salary Data | XLS        | Compared |
      | Salary Data | CSV        | Compared |
      | Salary Data | PDF        | Compared |

  @CS-91
  Scenario: Check Attendance Register report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName          | Active | Report              | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Attendance RegisterXLS | true   | Attendance Register | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Attendance RegisterPDF | true   | Attendance Register | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Attendance RegisterCSV | true   | Attendance Register | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Attendance Register" Report scheduler parameter configuration update
      | ReportName             | StartDaysB | GroupBy               |
      | Attendance RegisterXLS |          0 | Attendance Register 1 |
      | Attendance RegisterPDF |          0 | Attendance Register 1 |
      | Attendance RegisterCSV |          0 | Attendance Register 1 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report              | FileFormat | Compare  |
      | Attendance Register | XLS        | Compared |
      | Attendance Register | CSV        | Compared |
      | Attendance Register | PDF        | Compared |

  @CS-92
  Scenario: Check Overtime Register report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report            | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Overtime RegisterXLS | true   | Overtime Register | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Overtime RegisterPDF | true   | Overtime Register | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Overtime RegisterCSV | true   | Overtime Register | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Overtime Register" Report scheduler parameter configuration update
      | ReportName           | StartDaysB |
      | Overtime RegisterXLS |          0 |
      | Overtime RegisterPDF |          0 |
      | Overtime RegisterCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report            | FileFormat | Compare  |
      | Overtime Register | XLS        | Compared |
      | Overtime Register | CSV        | Compared |
      | Overtime Register | PDF        | Compared |

  @CS-93
  Scenario Outline: Check Leave Application report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report            | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Leave ApplicationXLS | true   | Leave Application | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Leave ApplicationPDF | true   | Leave Application | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Leave ApplicationCSV | true   | Leave Application | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Leave Application" Report scheduler parameter configuration update
      | ReportName           | StartDaysB | EndDaysB |
      | Leave ApplicationXLS |          9 |        0 |
      | Leave ApplicationPDF |          9 |        0 |
      | Leave ApplicationCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report            | FileFormat | Compare  |
      | Leave Application | XLS        | Compared |
      | Leave Application | CSV        | Compared |
      | Leave Application | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-94
  Scenario Outline: Check Attendance report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | AttendanceXLS | true   | Attendance | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | AttendancePDF | true   | Attendance | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | AttendanceCSV | true   | Attendance | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Attendance" Report scheduler parameter configuration update
      | ReportName    | StartDaysB | EndDaysB | GroupNeededInReport | GroupBy |
      | AttendanceXLS |          9 |        0 | true                | Date    |
      | AttendancePDF |          9 |        0 | true                | Date    |
      | AttendanceCSV |          9 |        0 | true                | Date    |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report     | FileFormat | Compare  |
      | Attendance | XLS        | Compared |
      | Attendance | CSV        | Compared |
      | Attendance | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-95
  Scenario Outline: Check Early Out report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report    | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Early OutXLS  | true   | Early Out | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Early OutPDF  | true   | Early Out | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Early OutCSV  | true   | Early Out | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Early Out" Report scheduler parameter configuration update
      | ReportName   | StartDaysB | EndDaysB |
      | Early OutXLS |          9 |        0 |
      | Early OutPDF |          9 |        0 |
      | Early OutCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report    | FileFormat | Compare  |
      | Early Out | XLS        | Compared |
      | Early Out | CSV        | Compared |
      | Early Out | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  #########################
  @CS-98
  Scenario Outline: Check Doors Accessed by User report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName             | Active | Report                 | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Doors Accessed by UserXLS | true   | Doors Accessed by User | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Doors Accessed by UserPDF | true   | Doors Accessed by User | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Doors Accessed by UserCSV | true   | Doors Accessed by User | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Doors Accessed by User" Report scheduler parameter configuration update
      | ReportName                | StartDaysB | EndDaysB |
      | Doors Accessed by UserXLS |          9 |        0 |
      | Doors Accessed by UserPDF |          9 |        0 |
      | Doors Accessed by UserCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report                 | FileFormat | Compare  |
      | Doors Accessed by User | XLS        | Compared |
      | Doors Accessed by User | CSV        | Compared |
      | Doors Accessed by User | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-99
  Scenario Outline: Check Pending Confirmations report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName            | Active | Report                | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Pending ConfirmationsXLS | true   | Pending Confirmations | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Pending ConfirmationsPDF | true   | Pending Confirmations | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Pending ConfirmationsCSV | true   | Pending Confirmations | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Pending Confirmations" Report scheduler parameter configuration update
      | ReportName               | StartDaysB | EndDaysB | ConfirmationPeriodDays |
      | Pending ConfirmationsXLS |          9 |        0 |                     10 |
      | Pending ConfirmationsPDF |          9 |        0 |                     10 |
      | Pending ConfirmationsCSV |          9 |        0 |                     10 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report                | FileFormat | Compare  |
      | Pending Confirmations | XLS        | Compared |
      | Pending Confirmations | CSV        | Compared |
      | Pending Confirmations | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-101
  Scenario Outline: Check Out Time report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report   | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Out TimeXLS   | true   | Out Time | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Out TimePDF   | true   | Out Time | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Out TimeCSV   | true   | Out Time | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Out Time" Report scheduler parameter configuration update
      | ReportName  | StartDaysB | EndDaysB |
      | Out TimeXLS |          9 |        0 |
      | Out TimePDF |          9 |        0 |
      | Out TimeCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report   | FileFormat | Compare  |
      | Out Time | XLS        | Compared |
      | Out Time | CSV        | Compared |
      | Out Time | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-102
  Scenario Outline: Check Invalid Events report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Invalid EventsXLS | true   | Invalid Events | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Invalid EventsPDF | true   | Invalid Events | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Invalid EventsCSV | true   | Invalid Events | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Invalid Events" Report scheduler parameter configuration update
      | ReportName        | StartDaysB | EndDaysB |
      | Invalid EventsXLS |          9 |        0 |
      | Invalid EventsPDF |          9 |        0 |
      | Invalid EventsCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Invalid Events | XLS        | Compared |
      | Invalid Events | CSV        | Compared |
      | Invalid Events | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-103
  Scenario Outline: Check Guard Tour report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Guard TourXLS | true   | Guard Tour | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Guard TourPDF | true   | Guard Tour | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Guard TourCSV | true   | Guard Tour | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report     | FileFormat | Compare  |
      | Guard Tour | XLS        | Compared |
      | Guard Tour | CSV        | Compared |
      | Guard Tour | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-104
  Scenario Outline: Check 2-Person Access report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | 2-Person AccessXLS | true   | 2-Person Access | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | 2-Person AccessPDF | true   | 2-Person Access | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | 2-Person AccessCSV | true   | 2-Person Access | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "2-Person Access" Report scheduler parameter configuration update
      | ReportName         | StartDaysB | EndDaysB |
      | 2-Person AccessXLS |          9 |        0 |
      | 2-Person AccessPDF |          9 |        0 |
      | 2-Person AccessCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-05-22".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | 2-Person Access | XLS        | Compared |
      | 2-Person Access | CSV        | Compared |
      | 2-Person Access | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-105
  Scenario Outline: Check Door Held Open report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Door Held OpenXLS | true   | Door Held Open | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Door Held OpenPDF | true   | Door Held Open | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Door Held OpenCSV | true   | Door Held Open | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Door Held Open" Report scheduler parameter configuration update
      | ReportName        | StartDaysB | EndDaysB |
      | Door Held OpenXLS |          9 |        0 |
      | Door Held OpenPDF |          9 |        0 |
      | Door Held OpenCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-05-22".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Door Held Open | XLS        | Compared |
      | Door Held Open | CSV        | Compared |
      | Door Held Open | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-106
  Scenario Outline: Check Early In report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report   | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Early InXLS   | true   | Early In | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Early InPDF   | true   | Early In | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Early InCSV   | true   | Early In | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Early In" Report scheduler parameter configuration update
      | ReportName  | StartDaysB | EndDaysB |
      | Early InXLS |          9 |        0 |
      | Early InPDF |          9 |        0 |
      | Early InCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report   | FileFormat | Compare  |
      | Early In | XLS        | Compared |
      | Early In | CSV        | Compared |
      | Early In | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-107
  Scenario Outline: Check N-Punch Work Hours report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName         | Active | Report             | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | N-Punch Work HoursXLS | true   | N-Punch Work Hours | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | N-Punch Work HoursPDF | true   | N-Punch Work Hours | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | N-Punch Work HoursCSV | true   | N-Punch Work Hours | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "N-Punch Work Hours" Report scheduler parameter configuration update
      | ReportName            | StartDaysB | EndDaysB |
      | N-Punch Work HoursXLS |          9 |        0 |
      | N-Punch Work HoursPDF |          9 |        0 |
      | N-Punch Work HoursCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report             | FileFormat | Compare  |
      | N-Punch Work Hours | XLS        | Compared |
      | N-Punch Work Hours | CSV        | Compared |
      | N-Punch Work Hours | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-108
  Scenario Outline: Check Overstay report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report   | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | OverstayXLS   | true   | Overstay | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | OverstayPDF   | true   | Overstay | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | OverstayCSV   | true   | Overstay | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Overstay" Report scheduler parameter configuration update
      | ReportName  | StartDaysB | EndDaysB |
      | OverstayXLS |          9 |        0 |
      | OverstayPDF |          9 |        0 |
      | OverstayCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report   | FileFormat | Compare  |
      | Overstay | XLS        | Compared |
      | Overstay | CSV        | Compared |
      | Overstay | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-109
  Scenario Outline: Check Total Headcount and Overtime report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report                       | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Total HeadcountX | true   | Total Headcount and Overtime | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Total HeadcountP | true   | Total Headcount and Overtime | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Total HeadcountC | true   | Total Headcount and Overtime | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Total Headcount and Overtime" Report scheduler parameter configuration update
      | ReportName       | StartDaysB | EndDaysB |
      | Total HeadcountX |          9 |        0 |
      | Total HeadcountP |          9 |        0 |
      | Total HeadcountC |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report                       | FileFormat | Compare  |
      | Total Headcount and Overtime | XLS        | Compared |
      | Total Headcount and Overtime | CSV        | Compared |
      | Total Headcount and Overtime | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-110
  Scenario Outline: Check User Presence and Overtime report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName                 | Active | Report                     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | User Presence and OvertimeXLS | true   | User Presence and Overtime | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | User Presence and OvertimePDF | true   | User Presence and Overtime | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | User Presence and OvertimeCSV | true   | User Presence and Overtime | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "User Presence and Overtime" Report scheduler parameter configuration update
      | ReportName                    | StartDaysB | EndDaysB |
      | User Presence and OvertimeXLS |          9 |        0 |
      | User Presence and OvertimePDF |          9 |        0 |
      | User Presence and OvertimeCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report                     | FileFormat | Compare  |
      | User Presence and Overtime | XLS        | Compared |
      | User Presence and Overtime | CSV        | Compared |
      | User Presence and Overtime | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-111
  Scenario Outline: Check Manual Correction report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report            | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Manual CorrectionXLS | true   | Manual Correction | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Manual CorrectionPDF | true   | Manual Correction | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Manual CorrectionCSV | true   | Manual Correction | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Manual Correction" Report scheduler parameter configuration update
      | ReportName           | StartDaysB | EndDaysB |
      | Manual CorrectionXLS |          9 |        0 |
      | Manual CorrectionPDF |          9 |        0 |
      | Manual CorrectionCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report            | FileFormat | Compare  |
      | Manual Correction | XLS        | Compared |
      | Manual Correction | CSV        | Compared |
      | Manual Correction | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-112
  Scenario: Check Shift schedule report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Shift scheduleXLS | true   | Shift schedule | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Shift schedulePDF | true   | Shift schedule | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Shift scheduleCSV | true   | Shift schedule | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Shift schedule" Report scheduler parameter configuration update
      | ReportName        | StartDaysB |
      | Shift scheduleXLS |          0 |
      | Shift schedulePDF |          0 |
      | Shift scheduleCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Shift schedule | XLS        | Compared |
      | Shift schedule | CSV        | Compared |
      | Shift schedule | PDF        | Compared |

  @CS-113
  Scenario: Check Muster roll report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName  | Active | Report      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Muster rollXLS | true   | Muster roll | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Muster rollPDF | true   | Muster roll | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Muster rollCSV | true   | Muster roll | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Muster roll" Report scheduler parameter configuration update
      | ReportName     | StartDaysB |
      | Muster rollXLS |          0 |
      | Muster rollPDF |          0 |
      | Muster rollCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report      | FileFormat | Compare  |
      | Muster roll | XLS        | Compared |
      | Muster roll | CSV        | Compared |
      | Muster roll | PDF        | Compared |

  @CS-114
  Scenario: Check Leave Encashment report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName       | Active | Report           | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Leave EncashmentXLS | true   | Leave Encashment | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              31 |
      | Reports       | Leave EncashmentPDF | true   | Leave Encashment | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              31 |
      | Reports       | Leave EncashmentCSV | true   | Leave Encashment | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              31 |
    And "Leave Encashment" Report scheduler parameter configuration update
      | ReportName          | StartDaysB |
      | Leave EncashmentXLS |          0 |
      | Leave EncashmentPDF |          0 |
      | Leave EncashmentCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "31-01-22".
    Then Validate report scheduler
      | Report           | FileFormat | Compare  |
      | Leave Encashment | XLS        | Compared |
      | Leave Encashment | CSV        | Compared |
      | Leave Encashment | PDF        | Compared |

  @CS-115
  Scenario: Check Leave Credit/Debit report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName         | Active | Report             | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Leave Credit_DebitXLS | true   | Leave Credit/Debit | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              31 |
      | Reports       | Leave Credit_DebitPDF | true   | Leave Credit/Debit | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              31 |
      | Reports       | Leave Credit_DebitCSV | true   | Leave Credit/Debit | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              31 |
    And "Leave Credit/Debit" Report scheduler parameter configuration update
      | ReportName            | StartDaysB |
      | Leave Credit_DebitXLS |          0 |
      | Leave Credit_DebitPDF |          0 |
      | Leave Credit_DebitCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "31-01-22".
    Then Validate report scheduler
      | Report             | FileFormat | Compare  |
      | Leave Credit/Debit | XLS        | Compared |
      | Leave Credit/Debit | CSV        | Compared |
      | Leave Credit/Debit | PDF        | Compared |

  @CS-116
  Scenario: Check Leave Register report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Leave RegisterXLS | true   | Leave Register | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              31 |
      | Reports       | Leave RegisterPDF | true   | Leave Register | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              31 |
      | Reports       | Leave RegisterCSV | true   | Leave Register | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              31 |
    And "Leave Register" Report scheduler parameter configuration update
      | ReportName        | StartDaysB | EndDaysB |
      | Leave RegisterXLS |          0 |        0 |
      | Leave RegisterPDF |          0 |        0 |
      | Leave RegisterCSV |          0 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "31-01-22".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Leave Register | XLS        | Compared |
      | Leave Register | CSV        | Compared |
      | Leave Register | PDF        | Compared |

  #@CS-117
  #Scenario Outline: Check Expired passes report scheduler (data not available so check manual)
  #Given Open Cosec Web
  #And Login with user
  #| username | password | Validation           |
  #| sa       | admin    | Welcome System Admin |
  ##And Set SMS Configuration
  ##And Set Email Configuration
  #And Set system date format "<SystemDate>" in global policy.
  #And Report configuration in Report Scheduler
  #| SchedulerType | SchedulerName     | Active | Report         | EmailId                        | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
  #| Reports       | Expired passesXLS | true   | Expired passes | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
  #| Reports       | Expired passesPDF | true   | Expired passes | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
  #| Reports       | Expired passesCSV | true   | Expired passes | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
  #And "Expired passes" Report scheduler parameter configuration update
  #| ReportName        | StartDaysB | EndDaysB |
  #| Expired passesXLS |          9 |        0 |
  #| Expired passesPDF |          9 |        0 |
  #| Expired passesCSV |          9 |        0 |
  #And Logout from Cosec Web
  #When change system date from current date to "10-04-17".
  #And Login with user
  #| username | password | Validation           |
  #| sa       | admin    | Welcome System Admin |
  #Then Validate report scheduler
  #| Report         | FileFormat | Compare  |
  #| Expired passes | XLS        | Compared |
  #| Expired passes | CSV        | Compared |
  #| Expired passes | PDF        | Compared |
  #
  #Examples:
  #| SystemDate |
  #| dd/mm/yyyy |
  #| mm/dd/yyyy |
  #| yyyy/mm/dd |
  @CS-118
  Scenario Outline: Check Pre-registered visitors report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName           | Active | Report                  | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | PreRegistered visitorsX | true   | Pre-registered visitors | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | PreRegistered visitorsP | true   | Pre-registered visitors | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | PreRegistered visitorsC | true   | Pre-registered visitors | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Pre-registered visitors" Report scheduler parameter configuration update
      | ReportName              | StartDaysB | EndDaysB |
      | PreRegistered visitorsX |          9 |        0 |
      | PreRegistered visitorsP |          9 |        0 |
      | PreRegistered visitorsC |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report                  | FileFormat | Compare  |
      | Pre-registered visitors | XLS        | Compared |
      | Pre-registered visitors | CSV        | Compared |
      | Pre-registered visitors | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-119
  Scenario Outline: Check Visitor headcount report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report            | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Visitor headcountXLS | true   | Visitor headcount | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Visitor headcountPDF | true   | Visitor headcount | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Visitor headcountCSV | true   | Visitor headcount | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Visitor headcount" Report scheduler parameter configuration update
      | ReportName           | StartDaysB | EndDaysB |
      | Visitor headcountXLS |          9 |        0 |
      | Visitor headcountPDF |          9 |        0 |
      | Visitor headcountCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report            | FileFormat | Compare  |
      | Visitor headcount | XLS        | Compared |
      | Visitor headcount | CSV        | Compared |
      | Visitor headcount | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-120
  Scenario Outline: Check User Transactions report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report            | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | User TransactionsXLS | true   | User Transactions | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | User TransactionsPDF | true   | User Transactions | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | User TransactionsCSV | true   | User Transactions | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "User Transactions" Report scheduler parameter configuration update
      | ReportName           | StartDaysB | EndDaysB |
      | User TransactionsXLS |          9 |        0 |
      | User TransactionsPDF |          9 |        0 |
      | User TransactionsCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report            | FileFormat | Compare  |
      | User Transactions | XLS        | Compared |
      | User Transactions | CSV        | Compared |
      | User Transactions | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-121
  Scenario: Check Blocked  Users report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report        | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Blocked UsersXLS | true   | Blocked Users | suraj.pawar@matrixrd.org | XLS          |            4 | Monthly        |              10 |
      | Reports       | Blocked UsersPDF | true   | Blocked Users | suraj.pawar@matrixrd.org | PDF          |            4 | Monthly        |              10 |
      | Reports       | Blocked UsersCSV | true   | Blocked Users | suraj.pawar@matrixrd.org | CSV          |            4 | Monthly        |              10 |
    And Logout from Cosec Web
    When change system date from current date to "10-03-22".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | Blocked  Users | XLS        | Compared |
      | Blocked  Users | CSV        | Compared |
      | Blocked  Users | PDF        | Compared |

  @CS-122
  Scenario: Check Credit/Debit report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName   | Active | Report       | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Credit_DebitXLS | true   | Credit/Debit | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Credit_DebitPDF | true   | Credit/Debit | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Credit_DebitCSV | true   | Credit/Debit | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Credit/Debit" Report scheduler parameter configuration update
      | ReportName      | StartDaysB |
      | Credit_DebitXLS |          0 |
      | Credit_DebitPDF |          0 |
      | Credit_DebitCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report       | FileFormat | Compare  |
      | Credit/Debit | XLS        | Compared |
      | Credit/Debit | CSV        | Compared |
      | Credit/Debit | PDF        | Compared |

  @CS-123
  Scenario Outline: Check Sales report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | SalesXLS      | true   | Sales  | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | SalesPDF      | true   | Sales  | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | SalesCSV      | true   | Sales  | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Sales" Report scheduler parameter configuration update
      | ReportName | StartDaysB | EndDaysB |
      | SalesXLS   |          9 |        0 |
      | SalesPDF   |          9 |        0 |
      | SalesCSV   |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report | FileFormat | Compare  |
      | Sales  | XLS        | Compared |
      | Sales  | CSV        | Compared |
      | Sales  | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-124
  Scenario Outline: Check Visitor History report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Visitor HistoryXLS | true   | Visitor History | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Visitor HistoryPDF | true   | Visitor History | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Visitor HistoryCSV | true   | Visitor History | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Visitor History" Report scheduler parameter configuration update
      | ReportName         | StartDaysB | EndDaysB |
      | Visitor HistoryXLS |          9 |        0 |
      | Visitor HistoryPDF |          9 |        0 |
      | Visitor HistoryCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | Visitor History | XLS        | Compared |
      | Visitor History | CSV        | Compared |
      | Visitor History | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-125
  Scenario Outline: Check Head Count report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Head CountXLS | true   | Head Count | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Head CountPDF | true   | Head Count | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Head CountCSV | true   | Head Count | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Head Count" Report scheduler parameter configuration update
      | ReportName    | StartDaysB | EndDaysB |
      | Head CountXLS |          9 |        0 |
      | Head CountPDF |          9 |        0 |
      | Head CountCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report     | FileFormat | Compare  |
      | Head Count | XLS        | Compared |
      | Head Count | CSV        | Compared |
      | Head Count | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-127
  Scenario Outline: Check Tour Details report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName   | Active | Report       | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Tour DetailsXLS | true   | Tour Details | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Tour DetailsPDF | true   | Tour Details | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Tour DetailsCSV | true   | Tour Details | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Tour Details" Report scheduler parameter configuration update
      | ReportName      | StartDaysB | EndDaysB |
      | Tour DetailsXLS |          9 |        0 |
      | Tour DetailsPDF |          9 |        0 |
      | Tour DetailsCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-05-22".
    Then Validate report scheduler
      | Report       | FileFormat | Compare  |
      | Tour Details | XLS        | Compared |
      | Tour Details | CSV        | Compared |
      | Tour Details | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-128
  Scenario Outline: Check User Consumption report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName       | Active | Report           | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | User ConsumptionXLS | true   | User Consumption | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | User ConsumptionPDF | true   | User Consumption | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | User ConsumptionCSV | true   | User Consumption | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "User Consumption" Report scheduler parameter configuration update
      | ReportName          | StartDaysB | EndDaysB |
      | User ConsumptionXLS |          9 |        0 |
      | User ConsumptionPDF |          9 |        0 |
      | User ConsumptionCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report           | FileFormat | Compare  |
      | User Consumption | XLS        | Compared |
      | User Consumption | CSV        | Compared |
      | User Consumption | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-129
  Scenario Outline: Check Daily Work Hours report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName       | Active | Report           | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Daily Work HoursXLS | true   | Daily Work Hours | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Daily Work HoursPDF | true   | Daily Work Hours | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Daily Work HoursCSV | true   | Daily Work Hours | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Daily Work Hours" Report scheduler parameter configuration update
      | ReportName          | StartDaysB | EndDaysB |
      | Daily Work HoursXLS |          9 |        0 |
      | Daily Work HoursPDF |          9 |        0 |
      | Daily Work HoursCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report           | FileFormat | Compare  |
      | Daily Work Hours | XLS        | Compared |
      | Daily Work Hours | CSV        | Compared |
      | Daily Work Hours | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-130
  Scenario Outline: Check Daily Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report        | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Daily SummaryXLS | true   | Daily Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Daily SummaryPDF | true   | Daily Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Daily SummaryCSV | true   | Daily Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Daily Summary" Report scheduler parameter configuration update
      | ReportName       | StartDaysB | EndDaysB |
      | Daily SummaryXLS |          9 |        0 |
      | Daily SummaryPDF |          9 |        0 |
      | Daily SummaryCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report        | FileFormat | Compare  |
      | Daily Summary | XLS        | Compared |
      | Daily Summary | CSV        | Compared |
      | Daily Summary | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-131
  Scenario: Check Monthly Details report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Monthly DetailsXLS | true   | Monthly Details | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Monthly DetailsPDF | true   | Monthly Details | suraj.pawar@matrixrd.org | PDF          |            5 | Monthly        |              30 |
      | Reports       | Monthly DetailsCSV | true   | Monthly Details | suraj.pawar@matrixrd.org | CSV          |            5 | Monthly        |              30 |
    And "Monthly Details" Report scheduler parameter configuration update
      | ReportName         | StartDaysB |
      | Monthly DetailsXLS |          0 |
      | Monthly DetailsPDF |          0 |
      | Monthly DetailsCSV |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | Monthly Details | XLS        | Compared |
      | Monthly Details | CSV        | Compared |
      | Monthly Details | PDF        | Compared |

  @CS-132
  Scenario Outline: Check Overtime Report report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Overtime ReportXLS | true   | Overtime Report | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Overtime ReportPDF | true   | Overtime Report | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Overtime ReportCSV | true   | Overtime Report | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Overtime Report" Report scheduler parameter configuration update
      | ReportName         | StartDaysB | EndDaysB |
      | Overtime ReportXLS |          9 |        0 |
      | Overtime ReportPDF |          9 |        0 |
      | Overtime ReportCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | Overtime Report | XLS        | Compared |
      | Overtime Report | CSV        | Compared |
      | Overtime Report | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-133
  Scenario Outline: Check User Job Details report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName       | Active | Report           | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | User Job DetailsXLS | true   | User Job Details | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | User Job DetailsPDF | true   | User Job Details | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | User Job DetailsCSV | true   | User Job Details | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "User Job Details" Report scheduler parameter configuration update
      | ReportName          | StartDaysB | EndDaysB |
      | User Job DetailsXLS |          9 |        0 |
      | User Job DetailsPDF |          9 |        0 |
      | User Job DetailsCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report           | FileFormat | Compare  |
      | User Job Details | XLS        | Compared |
      | User Job Details | CSV        | Compared |
      | User Job Details | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-134
  Scenario Outline: Check Device-Wise Consumption report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName    | Active | Report                  | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Device_Wise CXLS | true   | Device-Wise Consumption | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Device_Wise CPDF | true   | Device-Wise Consumption | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Device_Wise CCSV | true   | Device-Wise Consumption | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Device-Wise Consumption" Report scheduler parameter configuration update
      | ReportName       | StartDaysB | EndDaysB |
      | Device_Wise CXLS |          9 |        0 |
      | Device_Wise CPDF |          9 |        0 |
      | Device_Wise CCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report                  | FileFormat | Compare  |
      | Device-Wise Consumption | XLS        | Compared |
      | Device-Wise Consumption | CSV        | Compared |
      | Device-Wise Consumption | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-135
  Scenario Outline: Check Job Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName  | Active | Report      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Job SummaryXLS | true   | Job Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Job SummaryPDF | true   | Job Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Job SummaryCSV | true   | Job Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Job Summary" Report scheduler parameter configuration update
      | ReportName     | StartDaysB | EndDaysB |
      | Job SummaryXLS |          9 |        0 |
      | Job SummaryPDF |          9 |        0 |
      | Job SummaryCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report      | FileFormat | Compare  |
      | Job Summary | XLS        | Compared |
      | Job Summary | CSV        | Compared |
      | Job Summary | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-136
  Scenario Outline: Check Project Summary report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Project SummaryXLS | true   | Project Summary | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | Project SummaryPDF | true   | Project Summary | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
      | Reports       | Project SummaryCSV | true   | Project Summary | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
    And "Project Summary" Report scheduler parameter configuration update
      | ReportName         | StartDaysB | EndDaysB |
      | Project SummaryXLS |          9 |        0 |
      | Project SummaryPDF |          9 |        0 |
      | Project SummaryCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | Project Summary | XLS        | Compared |
      | Project Summary | CSV        | Compared |
      | Project Summary | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-137
  Scenario Outline: Check Device-Wise Events report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName         | Active | Report             | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Device_Wise EventsXLS | true   | Device-Wise Events | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Device_Wise EventsPDF | true   | Device-Wise Events | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Device_Wise EventsCSV | true   | Device-Wise Events | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Device-Wise Events" Report scheduler parameter configuration update
      | ReportName            | StartDaysB | EndDaysB |
      | Device_Wise EventsXLS |          9 |        0 |
      | Device_Wise EventsPDF |          9 |        0 |
      | Device_Wise EventsCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report             | FileFormat | Compare  |
      | Device-Wise Events | XLS        | Compared |
      | Device-Wise Events | CSV        | Compared |
      | Device-Wise Events | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-138
  Scenario Outline: Check 'Elevator Access Report' report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName        | Active | Report                 | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Elevator Access RXLS | true   | Elevator Access Report | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Elevator Access RPDF | true   | Elevator Access Report | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Elevator Access RCSV | true   | Elevator Access Report | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Elevator Access Report" Report scheduler parameter configuration update
      | ReportName           | StartDaysB | EndDaysB |
      | Elevator Access RXLS |          9 |        0 |
      | Elevator Access RPDF |          9 |        0 |
      | Elevator Access RCSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-05-22".
    Then Validate report scheduler
      | Report                 | FileFormat | Compare  |
      | Elevator Access Report | XLS        | Compared |
      | Elevator Access Report | CSV        | Compared |
      | Elevator Access Report | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-139
  Scenario Outline: Check Enrollment Info report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Enrollment InfoXLS | true   | Enrollment Info | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Enrollment InfoPDF | true   | Enrollment Info | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Enrollment InfoCSV | true   | Enrollment Info | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | Enrollment Info | XLS        | Compared |
      | Enrollment Info | CSV        | Compared |
      | Enrollment Info | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-140
  Scenario Outline: Check Continuous Absence/Presence report scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Set system date format "<SystemDate>" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName   | Active | Report                      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | Continuous AXLS | true   | Continuous Absence/Presence | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | Continuous APDF | true   | Continuous Absence/Presence | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
      | Reports       | Continuous ACSV | true   | Continuous Absence/Presence | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
    And "Continuous Absence/Presence" Report scheduler parameter configuration update
      | ReportName      | StartDaysB | EndDaysB |
      | Continuous AXLS |          9 |        0 |
      | Continuous APDF |          9 |        0 |
      | Continuous ACSV |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report                      | FileFormat | Compare  |
      | Continuous Absence/Presence | XLS        | Compared |
      | Continuous Absence/Presence | CSV        | Compared |
      | Continuous Absence/Presence | PDF        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @FIT-6952_1
  Scenario: Custom report design using report type=Custom and filtering range=Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName | ReportType | TableView  | FilterRequired | FilteringRange | ApplyFilter | OptionalParameterRequired | UserSelectionRequired | UserValue | ModuleSelection | ParentMenu |
      | Test     | C_Date     | Custom     | Mx_UserMst | true           | Date           | CreationDT  | true                      | true                  | UserID    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | C_DateXLS     | true   | C_Date | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              24 |
      | Reports       | C_DateCSV     | true   | C_Date | suraj.pawar@matrixrd.org | CSV          |            5 | Monthly        |              24 |
      | Reports       | C_DatePDF     | true   | C_Date | suraj.pawar@matrixrd.org | PDF          |            5 | Monthly        |              24 |
    And "C_Date" Report scheduler parameter configuration update
      | ReportName | StartDaysB |
      | C_DateXLS  |          0 |
      | C_DateCSV  |          0 |
      | C_DatePDF  |          0 |
    And Logout from Cosec Web
    When change system date from current date to "24-04-17".
    Then Validate report scheduler
      | Report | FileFormat | Compare  |
      | C_Date | XLS        | Compared |
      | C_Date | CSV        | Compared |
      | C_Date | PDF        | Compared |

  @FIT-6952_2
  Scenario: Custom report design using report type=Custom and filtering range=DateRange
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName | ReportType | TableView  | FilterRequired | FilteringRange | ApplyFilter | OptionalParameterRequired | UserSelectionRequired | UserValue | ModuleSelection | ParentMenu |
      | Test     | CDateRange | Custom     | Mx_UserMst | true           | Date-Range     | CreationDT  | true                      | true                  | UserID    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | CDateRangeXLS | true   | CDateRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | CDateRangeCSV | true   | CDateRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
      | Reports       | CDateRangePDF | true   | CDateRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
    And "CDateRange" Report scheduler parameter configuration update
      | ReportName    | StartDaysB | EndDaysB |
      | CDateRangeXLS |          6 |        0 |
      | CDateRangeCSV |          6 |        0 |
      | CDateRangePDF |          6 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report     | FileFormat | Compare  |
      | CDateRange | XLS        | Compared |
      | CDateRange | CSV        | Compared |
      | CDateRange | PDF        | Compared |

  @FIT-6952_3
  Scenario: Custom report design using report type=Custom and filtering range=Month
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName | ReportType | TableView  | FilterRequired | FilteringRange | ApplyFilter | OptionalParameterRequired | UserSelectionRequired | UserValue | ModuleSelection | ParentMenu |
      | Test     | CMonth     | Custom     | Mx_UserMst | true           | Month          | CreationDT  | true                      | true                  | UserID    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | CMonthXLS     | true   | CMonth | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | CMonthCSV     | true   | CMonth | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
      | Reports       | CMonthPDF     | true   | CMonth | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
    And "CMonth" Report scheduler parameter configuration update
      | ReportName | StartDaysB |
      | CMonthXLS  |          0 |
      | CMonthCSV  |          0 |
      | CMonthPDF  |          0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report | FileFormat | Compare  |
      | CMonth | XLS        | Compared |
      | CMonth | CSV        | Compared |
      | CMonth | PDF        | Compared |

  @FIT-6952_4
  Scenario: Custom report design using report type=Custom and filtering range=Month-Range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName  | ReportType | TableView  | FilterRequired | FilteringRange | ApplyFilter | OptionalParameterRequired | UserSelectionRequired | UserValue | ModuleSelection | ParentMenu |
      | Test     | CMonthRange | Custom     | Mx_UserMst | true           | Month-Range    | CreationDT  | true                      | true                  | UserID    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName  | Active | Report      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | CMonthRangeXLS | true   | CMonthRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              30 |
      | Reports       | CMonthRangeCSV | true   | CMonthRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              30 |
      | Reports       | CMonthRangePDF | true   | CMonthRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              30 |
    And "CMonthRange" Report scheduler parameter configuration update
      | ReportName     | StartDaysB | EndDaysB |
      | CMonthRangeXLS |          0 |        0 |
      | CMonthRangeCSV |          0 |        0 |
      | CMonthRangePDF |          0 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "30-04-17".
    Then Validate report scheduler
      | Report      | FileFormat | Compare  |
      | CMonthRange | XLS        | Compared |
      | CMonthRange | CSV        | Compared |
      | CMonthRange | PDF        | Compared |

  @FIT-6952_5
  Scenario: Custom report design using report type=Events and filtering range=Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName | ReportType | FilteringRange | ModuleSelection | ParentMenu |
      | Events   | EventsDate | Events     | Date           | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName | Active | Report     | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | EventsDateXLS | true   | EventsDate | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | EventsDateCSV | true   | EventsDate | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | EventsDatePDF | true   | EventsDate | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "EventsDate" Report scheduler parameter configuration update
      | ReportName    | StartDaysB |
      | EventsDateXLS |          9 |
      | EventsDateCSV |          9 |
      | EventsDatePDF |          9 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report     | FileFormat | Compare  |
      | EventsDate | XLS        | Compared |
      | EventsDate | CSV        | Compared |
      | EventsDate | PDF        | Compared |

  @FIT-6952_6
  Scenario: Custom report design using report type=Events and filtering range=Date-Range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName | ReportName      | ReportType | FilteringRange | ModuleSelection | ParentMenu |
      | Events   | EventsDateRange | Events     | Date-Range     | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | EventsDateRangeXLS | true   | EventsDateRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | EventsDateRangeCSV | true   | EventsDateRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | EventsDateRangePDF | true   | EventsDateRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "EventsDateRange" Report scheduler parameter configuration update
      | ReportName         | StartDaysB | EndDaysB |
      | EventsDateRangeXLS |          9 |        8 |
      | EventsDateRangeCSV |          9 |        8 |
      | EventsDateRangePDF |          9 |        8 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | EventsDateRange | XLS        | Compared |
      | EventsDateRange | CSV        | Compared |
      | EventsDateRange | PDF        | Compared |

  @FIT-6952_7
  Scenario: Custom report design using report type=DailyAttendanceDetails and filtering range=Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName                | ReportName      | ReportType               | FilteringRange | ModuleSelection | ParentMenu |
      | DailyAttendanceDetails1 | DailyAtdDetDate | Daily Attendance Details | Date           | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | DailyAtdDetDateXLS | true   | DailyAtdDetDate | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | DailyAtdDetDateCSV | true   | DailyAtdDetDate | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | DailyAtdDetDatePDF | true   | DailyAtdDetDate | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "EventsDate" Report scheduler parameter configuration update
      | ReportName         | StartDaysB |
      | DailyAtdDetDateXLS |          9 |
      | DailyAtdDetDateCSV |          9 |
      | DailyAtdDetDatePDF |          9 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | DailyAtdDetDate | XLS        | Compared |
      | DailyAtdDetDate | CSV        | Compared |
      | DailyAtdDetDate | PDF        | Compared |

  @FIT-6952_8
  Scenario: Custom report design using report type=DailyAttendanceDetails and filtering range=Date-Range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName               | ReportName           | ReportType               | FilteringRange | ModuleSelection | ParentMenu |
      | DailyAttendanceDetails | DailyAtdDetDateRange | Daily Attendance Details | Date-Range     | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName           | Active | Report               | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | DailyAtdDetDateRangeXLS | true   | DailyAtdDetDateRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | DailyAtdDetDateRangeCSV | true   | DailyAtdDetDateRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | DailyAtdDetDateRangePDF | true   | DailyAtdDetDateRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "DailyAtdDetDateRange" Report scheduler parameter configuration update
      | ReportName              | StartDaysB | EndDaysB |
      | DailyAtdDetDateRangeXLS |          9 |        0 |
      | DailyAtdDetDateRangeCSV |          9 |        0 |
      | DailyAtdDetDateRangePDF |          9 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-04-17".
    Then Validate report scheduler
      | Report               | FileFormat | Compare  |
      | DailyAtdDetDateRange | XLS        | Compared |
      | DailyAtdDetDateRange | CSV        | Compared |
      | DailyAtdDetDateRange | PDF        | Compared |

  @FIT-6952_9
  Scenario: Custom report design using report type=Monthly Summary and filtering range=Month
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName       | ReportName      | ReportType      | FilteringRange | ModuleSelection | ParentMenu |
      | MonthlySummary | MonSummaryMonth | Monthly Summary | Month          | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName      | Active | Report          | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | MonSummaryMonthXLS | true   | MonSummaryMonth | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | MonSummaryMonthCSV | true   | MonSummaryMonth | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | MonSummaryMonthPDF | true   | MonSummaryMonth | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "MonSummaryMonth" Report scheduler parameter configuration update
      | ReportName         | StartDaysB |
      | MonSummaryMonthXLS |          0 |
      | MonSummaryMonthCSV |          0 |
      | MonSummaryMonthPDF |          0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report          | FileFormat | Compare  |
      | MonSummaryMonth | XLS        | Compared |
      | MonSummaryMonth | CSV        | Compared |
      | MonSummaryMonth | PDF        | Compared |

  @FIT-6952_10
  Scenario: Custom report design using report type=Monthly Summary and filtering range=Month-Range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName       | ReportName         | ReportType      | FilteringRange | ModuleSelection | ParentMenu |
      | MonthlySummary | MonSummaryMonRange | Monthly Summary | Month-Range    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName         | Active | Report             | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | MonSummaryMonRangeXLS | true   | MonSummaryMonRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | MonSummaryMonRangeCSV | true   | MonSummaryMonRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | MonSummaryMonRangePDF | true   | MonSummaryMonRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "MonSummaryMonRange" Report scheduler parameter configuration update
      | ReportName            | StartDaysB | EndDaysB |
      | MonSummaryMonRangeXLS |          0 |        0 |
      | MonSummaryMonRangeCSV |          0 |        0 |
      | MonSummaryMonRangePDF |          0 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report             | FileFormat | Compare  |
      | MonSummaryMonRange | XLS        | Compared |
      | MonSummaryMonRange | CSV        | Compared |
      | MonSummaryMonRange | PDF        | Compared |

  @FIT-6952_11
  Scenario: Custom report design using report type=Monthly Details and filtering range=Month
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName       | ReportName  | ReportType      | FilteringRange | ModuleSelection | ParentMenu |
      | MonthlyDetails | MonDetMonth | Monthly Details | Month          | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName  | Active | Report      | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | MonDetMonthXLS | true   | MonDetMonth | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | MonDetMonthCSV | true   | MonDetMonth | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | MonDetMonthPDF | true   | MonDetMonth | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "MonDetMonth" Report scheduler parameter configuration update
      | ReportName     | StartDaysB |
      | MonDetMonthXLS |          0 |
      | MonDetMonthCSV |          0 |
      | MonDetMonthPDF |          0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report      | FileFormat | Compare  |
      | MonDetMonth | XLS        | Compared |
      | MonDetMonth | CSV        | Compared |
      | MonDetMonth | PDF        | Compared |

  @FIT-6952_12
  Scenario: Custom report design using report type=Monthly Details and filtering range=Month-Range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    #And Set SMS Configuration
    #And Set Email Configuration
    And Custom report design Repx file is uploaded in the Report Builder
      | FileName       | ReportName     | ReportType      | FilteringRange | ModuleSelection | ParentMenu |
      | MonthlyDetails | MonDetMonRange | Monthly Details | Month-Range    | Users           | None       |
    And Set system date format "dd/mm/yyyy" in global policy.
    And Report configuration in Report Scheduler
      | SchedulerType | SchedulerName     | Active | Report         | EmailId                  | ReportFormat | ScheduleTime | ScheduleRunDay | EveryDayOfMonth |
      | Reports       | MonDetMonRangeXLS | true   | MonDetMonRange | suraj.pawar@matrixrd.org | XLS          |            2 | Monthly        |              10 |
      | Reports       | MonDetMonRangeCSV | true   | MonDetMonRange | suraj.pawar@matrixrd.org | CSV          |            2 | Monthly        |              10 |
      | Reports       | MonDetMonRangePDF | true   | MonDetMonRange | suraj.pawar@matrixrd.org | PDF          |            2 | Monthly        |              10 |
    And "MonDetMonthRange" Report scheduler parameter configuration update
      | ReportName        | StartDaysB | EndDaysB |
      | MonDetMonRangeXLS |          0 |        0 |
      | MonDetMonRangeCSV |          0 |        0 |
      | MonDetMonRangePDF |          0 |        0 |
    And Logout from Cosec Web
    When change system date from current date to "10-02-22".
    Then Validate report scheduler
      | Report         | FileFormat | Compare  |
      | MonDetMonRange | XLS        | Compared |
      | MonDetMonRange | CSV        | Compared |
      | MonDetMonRange | PDF        | Compared |
