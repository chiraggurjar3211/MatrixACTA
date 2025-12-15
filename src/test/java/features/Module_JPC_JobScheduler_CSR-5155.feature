@Job_Proccessing_and_Costing
Feature: CSR-5155, Epic Name - Job Scheduler Feature - JPC - Version: V20R8
  I want to use this template for my feature file

  #Limitation in Weekly Job Scheduler = We can check more than one date at same time for ex. dates of Mon,Tue, Wed But we can check single dates ex. dates of mon, Wed, Fri
  #check in Gherkin all user, group, job etc. deleted or not
  #CSR-5724
  #CSR-5668
  #CSR-5156
  @CSR5155_1
  Scenario Outline: Set Launch Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Create New System Account User
      | SAUser  | Role                 | Module   | Menu   | ValidationMessage  |
      | JPC_SA1 | System Administrator | <Module> | <Menu> | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    Then Verify Launch Page should be "<Menu>"

    Examples: 
      | Module                     | Menu                   |
      | Job Processing and Costing | Job Scheduler          |
      | Job Processing and Costing | Job Assignment Process |
      | Job Processing and Costing | Scheduler Logs         |

  #CSR-5724
  #CSR-5668
  #CSR-5156
  @CSR5155_2
  Scenario Outline: Roles&Rights - for View Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View | Add | Edit  | Delete | Validation         |
      | JPC_Role1 | <Module> | <Menu> | true |     | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add | Edit  | Delete |
      | <Menu> | true |     | false | false  |

    Examples: 
      | Module                     | Menu                   |
      | Job Processing and Costing | Job Scheduler          |
      | Job Processing and Costing | Job Assignment Process |
      | Job Processing and Costing | Scheduler Logs         |

  #CSR-5156
  @CSR5155_3
  Scenario Outline: Roles&Rights - for View, Add, Edit, delete Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View | Add  | Edit | Delete | Validation         |
      | JPC_Role1 | <Module> | <Menu> | true | true | true | true   | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add  | Edit | Delete |
      | <Menu> | true | true | true | true   |

    Examples: 
      | Module                     | Menu          |
      | Job Processing and Costing | Job Scheduler |

  #CSR-5156
  @CSR5155_4
  Scenario Outline: Roles&Rights - when give Edit Rights and View right Automatically enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View | Add | Edit | Delete | Validation         |
      | JPC_Role1 | <Module> | <Menu> |      |     | true |        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit | Delete |
      | <Menu> | true | false | true | false  |

    Examples: 
      | Module                     | Menu          |
      | Job Processing and Costing | Job Scheduler |

  #CSR-5724
  #CSR-5156
  @CSR5155_5
  Scenario Outline: Roles&Rights - for View Disable - No Rights
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Menu   | View  | Add   | Edit  | Delete | Validation         |
      | JPC_Role1 | <Module> | <Menu> | false | false | false | false  | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View  | Add   | Edit  | Delete |
      | <Menu> | false | false | false | false  |

    Examples: 
      | Module                     | Menu           |
      | Job Processing and Costing | Job Scheduler  |
      | Job Processing and Costing | Scheduler Logs |

  #CSR-5156
  @CSR5155_6
  Scenario Outline: Roles&Rights - Default rights check SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add  | Edit | Delete |
      | <Menu> | true | true | true | true   |

    Examples: 
      | Module                     | Menu          |
      | Job Processing and Costing | Job Scheduler |

  #CSR-5156
  @CSR5155_7
  Scenario Outline: Roles&Rights - Default rights check SE
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Make "SE" user Active= "true"
    And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | se   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | se       | admin    | Welcome System Engineer |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

    Examples: 
      | Module                     | Menu          |
      | Job Processing and Costing | Job Scheduler |

  # CSR-5156
  @CSR5155_8
  Scenario Outline: Roles&Rights - Default rights check SO
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Make "SO" user Active= "true"
    And Logout from Cosec Web
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | so   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation              |
      | so       | admin    | Welcome System Operator |
    And Open "<Menu>" Page in "<Module>" Module
    Then verify Page rights
      | Menu   | View | Add   | Edit  | Delete |
      | <Menu> | true | false | false | false  |

    Examples: 
      | Module                     | Menu          |
      | Job Processing and Costing | Job Scheduler |

  #CSR-5156
  @CSR5155_9
  Scenario Outline: Roles&Rights - Module rights - Hide module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Hide | Validation         |
      | JPC_Role1 | <Module> | true | Saved Successfully |
    And Verify Role rights for RoleName= "JPC_Role1" "<Module>"
      | Menu                            | View  | Add | Edit  | Delete | Validation         |
      | Job Scheduler						        | false |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    Then Verify "<Module>" Module is displayed or Not - "false"

    Examples: 
      | Module                     |
      | Job Processing and Costing |

  #CSR-5156
  @CSR5155_10
  Scenario Outline: Roles&Rights - Module rights - View
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Hide  | View | Validation         |
      | JPC_Role1 | <Module> | false | true | Saved Successfully |
    And Verify Role rights for RoleName= "JPC_Role1" "<Module>"
      | Menu                   | View | Add | Edit  | Delete | Validation         |
      | Job Scheduler          | true |     | false |        | Saved Successfully |
      | Job Assignment Process | true |     | false |        | Saved Successfully |
      | Scheduler Logs         | true |     | false |        | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "Job Scheduler" Page in "<Module>" Module
    Then verify Page rights
      | Menu          | View | Add | Edit  | Delete |
      | Job Scheduler | true |     | false | false  |
    And Open "Job Assignment Process" Page in "<Module>" Module
    Then verify Page rights
      | Menu                   | View | Add | Edit  | Delete |
      | Job Assignment Process | true |     | false | false  |
    And Open "Scheduler Logs" Page in "<Module>" Module
    Then verify Page rights
      | Menu           | View | Add | Edit  | Delete |
      | Scheduler Logs | true |     | false | false  |

    Examples: 
      | Module                     |
      | Job Processing and Costing |

  #CSR-5156
  @CSR5155_11
  Scenario Outline: Roles&Rights - Module rights - View, Add, Edit, Delete for Job Scheduler page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "JPC_SA1" from System Accounts page
    And Delete Role and Right "JPC_Role1" from Roles and Rights Configuration page
    And Create Role and Right from Roles and Rights Configuration
      | RoleName  | Module   | Hide  | View | Add  | Edit | Delete | Validation         |
      | JPC_Role1 | <Module> | false | true | true | true | true   | Saved Successfully |
    And Verify Role rights for RoleName= "JPC_Role1" "<Module>"
      | Menu          | View | Add  | Edit | Delete | Validation         |
      | Job Scheduler | true | true | true | true   | Saved Successfully |
    And Create New System Account User
      | SAUser  | Role      | ValidationMessage  |
      | JPC_SA1 | JPC_Role1 | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | JPC_SA1 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation      |
      | JPC_SA1  | admin    | Welcome JPC_SA1 |
    And Open "Job Scheduler" Page in "<Module>" Module
    Then verify Page rights
      | Menu          | View | Add  | Edit | Delete |
      | Job Scheduler | true | true | true | true   |

    Examples: 
      | Module                     |
      | Job Processing and Costing |

  #########Daily Job Scheduler Starts##############
  #CSR_5158
  @CSR5155_15
  Scenario: Assign Jobs on Daily Basis - Active and Inactive Job Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               3 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
      | JPC_J3  |          1 | true   |
      | JPC_J4  |          2 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        2 | Daily         | Current |
    When Update configured jobs in Job Scheduler = "JPC_JS1" Schedule Run Time= "3"
      | JobSchedulerType | JobName         | ActualRepeatDays | NewRepeatDays | Active |
      | Daily            | JPC_J1 - JPC_J1 |                1 |               | false  |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | ScheduleType | ScheduleRunTime | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   | Daily        |               3 | User Wise   | JPCUser2 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J2  |
      |    2 | JPC_J3  |
      |    3 | JPC_J4  |
      |    4 | JPC_J4  |
      |    5 | JPC_J2  |
      |    6 | JPC_J3  |
      |    7 | JPC_J4  |
      |    8 | JPC_J4  |
      |    9 | JPC_J2  |
      |   10 | JPC_J3  |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        4 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J4  |                   3 |                 4 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J4  |                   7 |                 8 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                  10 |                10 |               |               |        5 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | TableContent  | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  | No Data Found |                     |                   |               |               |          |               |         |
      | JPC_J2  |               |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |               |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |               |                   3 |                 4 |               |               |        2 | Daily         | Current |
      | JPC_J2  |               |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |               |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |               |                   7 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J2  |               |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J3  |               |                  10 |                10 |               |               |        3 | Daily         | Current |

  #CSR_5158
  @CSR5155_16
  Scenario: Assign same Job with different Repeat Days - Schedule Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               3 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J1  |          2 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   2 |                 3 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   5 |                 6 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   8 |                 9 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |               |        7 | Daily         | Current |

  #Pending Need to ask to developer
  #CSR_5158
  #@CSR5155_17
  #Scenario: Job Assignment as per Last In First Out logic - Schedule Type= Daily
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Delete user via API
      #| UserID   |
      #| JPCUser1 |
      #| JPCUser2 |
      #| JPCUser3 |
    #And Delete Worker via API
      #| WorkerID |
      #| JPCWrk_1 |
      #| JPCWrk_2 |
    #And Delete Job Scheduler
      #| SchedulerName | Validation           |
      #| JPC_JS1       | Deleted Successfully |
      #| JPC_JS2       | Deleted Successfully |
      #| JPC_JS3       | Deleted Successfully |
    #And Delete Job from Job Processing and Costing
      #| JobCode |
      #| JPC_J1  |
      #| JPC_J2  |
      #| JPC_J3  |
      #| JPC_J4  |
      #| JPC_J5  |
    #And Create Job from Job Processing and Costing
      #| Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      #| JPC_J1 | JPC_J1 |           12 |         12 | Daily            | Saved Successfully |
      #| JPC_J2 | JPC_J2 |           10 |         15 | Daily            | Saved Successfully |
      #| JPC_J3 | JPC_J3 |           13 |         15 | Daily            | Saved Successfully |
      #| JPC_J4 | JPC_J4 |           12 |         12 | Daily            | Saved Successfully |
      #| JPC_J5 | JPC_J5 |           15 |         15 | Daily            | Saved Successfully |
    #And Create user from user configuration
      #| userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      #| JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    #When Assign jobs to user="JPCUser1" from user configuration
      #| JobCode | AssignmentStart | AssignmentEnd |
      #| JPC_J3  |                 |               |
      #| JPC_J2  |                 |               |
      #| JPC_J1  |                 |               |
    #When Create Job Scheduler from JPC Module
      #| JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      #| JPC_JS1          | true   |         1 |      16 | Daily        |                  0 |               3 | Current          | JPC_J5 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    #And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      #| JobName | RepeatDays | Active |
      #| JPC_J4  |          1 | true   |
      #| JPC_J5  |          1 | true   |
    #And Wait for "3" min
    #And Verify Job Scheduler in Scheduler Log
      #| SchedulerName | Status  |
      #| JPC_JS1       | Succeed |
    #Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      #| JobCode                            |
      #| JPC_J5,JPC_J4,JPC_J1,JPC_J2,JPC_J3 |
    #And Verify Jobs from User configuration for UserID= "JPCUser1"
      #| JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      #| JPC_J5  |                  15 |                15 |               |               |        1 | Daily         | Current |
      #| JPC_J4  |                  12 |                12 |               |               |        1 | Daily         | Current |
      #| JPC_J1  |                  12 |                12 |               |               |        1 | Daily         | Current |
      #| JPC_J2  |                  10 |                15 |               |               |        1 | Daily         | Current |
      #| JPC_J3  |                  13 |                15 |               |               |        1 | Daily         | Current |
    #When Prioritize Job from user configuration for UserID= "JPCUser1"
      #| JobCode | PrioritizeJob |
      #| JPCJob4 | up            |
      #| JPCJob1 | down          |
    #Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      #| JobCode                            |
      #| JPC_J4,JPC_J5,JPC_J2,JPC_J1,JPC_J3 |
      #
      #CSR_5158
  #@CSR5155_17
  #Scenario: Job Assignment as per Last In First Out logic - Schedule Type= Daily
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Delete user via API
      #| UserID   |
      #| JPCUser1 |
      #| JPCUser2 |
      #| JPCUser3 |
    #And Delete Worker via API
      #| WorkerID |
      #| JPCWrk_1 |
      #| JPCWrk_2 |
    #And Delete Job Scheduler
      #| SchedulerName | Validation           |
      #| JPC_JS1       | Deleted Successfully |
      #| JPC_JS2       | Deleted Successfully |
      #| JPC_JS3       | Deleted Successfully |
    #And Delete Job from Job Processing and Costing
      #| JobCode |
      #| JPC_J1  |
      #| JPC_J2  |
      #| JPC_J3  |
      #| JPC_J4  |
      #| JPC_J5  |
    #And Create Job from Job Processing and Costing
      #| Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      #| JPC_J1 | JPC_J1 |           1 |         5 | Daily            | Saved Successfully |
      #| JPC_J2 | JPC_J2 |           1 |         5 | Daily            | Saved Successfully |
      #| JPC_J3 | JPC_J3 |           1 |         5 | Daily            | Saved Successfully |
      #| JPC_J4 | JPC_J4 |           1 |         5 | Daily            | Saved Successfully |
      #| JPC_J5 | JPC_J5 |           1 |         5 | Daily            | Saved Successfully |
    #And Create user from user configuration
      #| userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      #| JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    #When Assign jobs to user="JPCUser1" from user configuration
      #| JobCode | AssignmentStart | AssignmentEnd |
      #| JPC_J3  |                 |               |
      #| JPC_J4  |                 |               |
      #| JPC_J5  |                 |               |
    #When Create Job Scheduler from JPC Module
      #| JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      #| JPC_JS1          | true   |         1 |      15 | Daily        |                  0 |               3 | Current          | JPC_J2 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    #And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      #| JobName | RepeatDays | Active |
      #| JPC_J2  |          1 | true   |
      #| JPC_J1  |          1 | true   |
    #And Wait for "3" min
    #And Verify Job Scheduler in Scheduler Log
      #| SchedulerName | Status  |
      #| JPC_JS1       | Succeed |
    #Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      #| JobCode                            |
      #| JPC_J1,JPC_J2,JPC_J3,JPC_J4,JPC_J5 |
    #And Verify Jobs from User configuration for UserID= "JPCUser1"
      #| JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      #| JPC_J1  |                  1 |                5 |               |               |        1 | Daily         | Current |
      #| JPC_J2  |                  1 |                5 |               |               |        1 | Daily         | Current |
      #| JPC_J3  |                  1 |                5 |               |               |        1 | Daily         | Current |
      #| JPC_J4  |                  1 |                5 |               |               |        1 | Daily         | Current |
      #| JPC_J5  |                  1 |                5 |               |               |        1 | Daily         | Current |
    #When Prioritize Job from user configuration for UserID= "JPCUser1"
      #| JobCode | PrioritizeJob |
      #| JPCJob4 | up            |
      #| JPCJob1 | down          |
    #Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      #| JobCode                            |
      #| JPC_J2,JPC_J1,JPC_J4,JPC_J3,JPC_J5 |
  #

  #CSR_5158
  @CSR5155_18
  Scenario: No Job Assignment after Job Expiry
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         20 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |          8 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         20 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Daily        |                  0 |               4 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          3 | true   |
      | JPC_J2  |          3 | true   |
      | JPC_J3  |          3 | true   |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J1  |
      |    2 | JPC_J1  |
      |    3 | JPC_J1  |
      |    4 | JPC_J2  |
      |    5 | JPC_J2  |
      |    6 | JPC_J2  |
      |    7 | JPC_J3  |
      |    8 | JPC_J3  |
      |    9 | JPC_J3  |
      |   10 | JPC_J1  |
      |   11 | JPC_J1  |
      |   12 | JPC_J1  |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 | JPC_J3  |
      |   17 | JPC_J3  |
      |   18 | JPC_J3  |
      |   19 | JPC_J1  |
      |   20 | JPC_J1  |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 3 |               |               |        3 | Daily         | Current |
      | JPC_J2  |                   4 |                 6 |               |               |        1 | Daily         | Current |
      | JPC_J3  |                   7 |                 9 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                  10 |                12 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                  16 |                18 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                  19 |                20 |               |               |        3 | Daily         | Current |

  #CSR_5158
  @CSR5155_19
  Scenario: Job Start Date is before, after and within Job Scheduler start date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |           15 |         20 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |           21 |         30 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |        16 |      20 | Daily        |                  0 |               4 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
      | JPC_J3  |          1 | true   |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 | JPC_J2  |
      |   18 |         |
      |   19 |         |
      |   20 | JPC_J2  |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | TableContent  | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  | No Data Found |                     |                   |               |               |          |               |         |
      | JPC_J2  |               |                  17 |                17 |               |               |        2 | Daily         | Current |
      | JPC_J2  |               |                  20 |                20 |               |               |        2 | Daily         | Current |
      | JPC_J3  | No Data Found |                     |                   |               |               |          |               |         |

  #CSR_5158
  @CSR5155_20
  Scenario: Job start date is in between Job Scheduler Start and End Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            6 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         2 |      10 | Daily        |                  0 |               4 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          3 | true   |
      | JPC_J2  |          3 | true   |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 | JPC_J2  |
      |    6 | JPC_J2  |
      |    7 | JPC_J2  |
      |    8 | JPC_J1  |
      |    9 | JPC_J1  |
      |   10 | JPC_J1  |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   8 |                10 |               |               |        1 | Daily         | Current |
      | JPC_J2  |                   5 |                 7 |               |               |        1 | Daily         | Current |

  #CSR_5158
  @CSR5155_21
  Scenario: Overlapping Jobs with Two Job Schedulers, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               4 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          2 | true   |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | RepeatDays | Active |
      | JPC_J2  |          3 | true   |
    And Wait for "5" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
      | JPC_JS2       | Succeed |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                                                        |
      | JPC_J2,JPC_J2,JPC_J2,JPC_J2,JPC_J1,JPC_J1,JPC_J1,JPC_J1,JPC_J1 |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J2  |                  10 |                10 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   7 |                 9 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   4 |                 6 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   1 |                 3 |               |               |        4 | Daily         | Current |
      | JPC_J1  |                   9 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   1 |                 2 |               |               |        5 | Daily         | Current |

  #CSR_5158
  @CSR5155_22
  Scenario: Schedule Type= Daily, Update Assignment Start, Assignment End, ESS Assignment and Verify Validations
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | JobCosting | DeviceBasedJobAssign | Validation         |
      | JPCUser1 | True   | True      | True      |               | True      | True      | True               | Enabled    | True                 | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Daily        |                  0 |               3 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
      | JPC_J3  |          1 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        4 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |               |        4 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        4 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |               |        4 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J2  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
    When Update job from user configuration for UserID="JPCUser1"
      | JobCode | AssignmentStart | AssignmentEnd | NewAssignmentStartDate | NewAssignmentEndDate | ESSAssignment | JobSchedulerType |
      | JPC_J1  |               1 |             1 |                      1 |                    2 |               | Daily            |
      | JPC_J2  |               5 |             5 |                      4 |                    5 |               | Daily            |
      | JPC_J3  |               3 |             3 |                        |                      | false         | Daily            |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 2 | Yes           |               |        4 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 | Yes           |               |        4 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 | Yes           |               |        4 | Daily         | Current |
      | JPC_J1  |                  10 |                10 | Yes           |               |        4 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 | Yes           |               |        3 | Daily         | Current |
      | JPC_J2  |                   4 |                 5 | Yes           |               |        3 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 | Yes           |               |        3 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 | No            |               |        3 | Daily         | Current |
      | JPC_J3  |                   6 |                 6 | Yes           |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 | Yes           |               |        3 | Daily         | Current |
    And Update job from user configuration for UserID="JPCUser1"
      | JobCode | AssignmentStart | AssignmentEnd | NewAssignmentStartDate | NewAssignmentEndDate | ESSAssignment | JobSchedulerType | Validation                                                      |
      | JPC_J1  |               4 |             4 |                      5 |                      |               | Daily            | Assignment End Date should be later than or equal to Assignm... |
      | JPC_J2  |               2 |             2 |                    -31 |                      |               | Daily            | Assignment Start Date should be later than or Equal to Job's... |
      | JPC_J3  |               6 |             6 |                        |                   11 |               | Daily            | Assignment End Date should be earlier than or Equal to Job's... |
      | JPC_J3  |               9 |             9 |                        |                    8 |               | Daily            | Assignment End Date should be later than or equal to Assignm... |

  #CSR_5451
  @CSR5155_23
  Scenario: Scheduler Type= Daily, Assign Job Scheduler and User to Organization and wait till Job Scheduler runs
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
      | JPC_J3  |          1 | true   |
      | JPC_J4  |          2 | true   |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Wait for "5" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        2 | Daily         | Current |

  #CSR_5451
  @CSR5155_24
  Scenario: Shcheduler Type= Daily, Assign Job Scheduler and User to Organization and do Job Assignment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
      | JPC_J3  |          1 | true   |
      | JPC_J4  |          2 | true   |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   4 |                 5 |               |               |        2 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |        2 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |        2 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J4  |                   9 |                10 |               |               |        2 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_25
  Scenario: Assign 2 Job Scheduler to Organization and after Job Scheduler runs delete 1 Job Scheduler, Job Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |               6 | Current          | JPC_J3 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | RepeatDays | Active |
      | JPC_J3  |          1 | true   |
      | JPC_J4  |          1 | true   |
      | JPC_J5  |          2 | true   |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Wait for "5" min
    When Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
      | JPC_JS2       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               10 | Daily         | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               10 | Daily         | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_26
  Scenario: Assign 2 Job Scheduler to Organization and do Job Assignment Process then delete 1 Job Scheduler, Job Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |              -1 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |              -1 | Current          | JPC_J3 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | RepeatDays | Active |
      | JPC_J3  |          1 | true   |
      | JPC_J4  |          1 | true   |
      | JPC_J5  |          2 | true   |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               10 | Daily         | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               10 | Daily         | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |               |        3 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   2 |                 2 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                   6 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J4  |                  10 |                10 |               |               |        3 | Daily         | Current |
      | JPC_J5  |                   7 |                 8 |               |               |        2 | Daily         | Current |
      | JPC_J5  |                   3 |                 4 |               |               |        2 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_27
  Scenario: Change Orgnanization of User from Enterprise module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
      | Organization | JSORG3 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
      | Organization | JSORG2 | JSORG2 | Saved Successfully |
      | Organization | JSORG3 | JSORG3 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               6 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |               7 | Current          | JPC_J2 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
      | Organization | JSORG2 | JPC_JS2   | Yes               | Saved Successfully |
    When Assign user from Enterprise module
      | Group        | Name   | Userid   | validation         |
      | Organization | JSORG1 | JPCUser2 | Saved Successfully |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | TableContent |
      | No Data      |
    And Wait for "5" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
      | JPC_JS2       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   2 |                 2 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   8 |                 8 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |               |       10 | Daily         | Current |
    When Assign user from Enterprise module
      | Group        | Name   | Userid   | validation         |
      | Organization | JSORG2 | JPCUser2 | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    When Assign user from Enterprise module
      | Group        | Name   | Userid   | validation         |
      | Organization | JSORG3 | JPCUser2 | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |

  #CSR_6103
  @CSR5155_28
  Scenario: Change Orgnanization of user from User Configuration, User= Active, Inactive, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
      | Organization | JSORG2 | JSORG2 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | True      | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J2 |          1 | True      | User Wise   | JPCUser1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
      | Organization | JSORG2 | JPC_JS2   | Yes               | Saved Successfully |
    When Create user from user configuration
      | userid   | Active | Organization | Validation         |
      | JPCUser2 | True   | JSORG1       | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    When Create user from user configuration
      | userid   | Active | Organization | Validation         |
      | JPCUser2 | True   | JSORG2       | Saved Successfully |
      | JPCUser3 | True   | JSORG2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |

  #CSR_6103
  @CSR5155_29
  Scenario: Change Orgnanization of worker from CWM module, and check Job Scheduler in user Configuration, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Delete Contractor via API
      | id       |
      | JPCCON_1 |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | JPCCON_1 | JPCCON_1 |              10 | JPCCON_1       |     1111111100 | JPCCON_1@cwm.com |     10000 | JPClic1     | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | Organization | AtdEnable | SkillName | ContractorName | JobCosting | Validation         |
      | JPCWrk_1 | JPCWrk_1 | True   |              | true      | Skill-1   | JPCCON_1       | Enabled    | Saved Successfully |
      | JPCWrk_2 | JPCWrk_2 | True   |              | true      | Skill-1   | JPCCON_1       | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCWrk_1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    When Create Worker from CWM module
      | WorkerId | name     | Active | Organization | Validation         |
      | JPCWrk_2 | JPCWrk_2 | True   | JSORG1       | Saved Successfully |
    Then Verify Job Scheduler from Worker Profile for WorkerId= "JPCWrk_2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_30
  Scenario: Change Orgnanization of user via API and check Job Scheduler in user Configuration, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Create User via api
      | Id       | name     | Organization_code |
      | JPCUser2 | JPCUser2 | JSORG1            |
    And Wait for "4" min
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

  #CSR_6103
  @CSR5155_31
  Scenario: Change Orgnanization of user from Multi-User Options and check Job Scheduler in user Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    When Update users from multiuser Configuration page
      | UserID   | Organization |
      | JPCUser2 | JSORG1       |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

  #CSR_6103
  @CSR5155_32
  Scenario Outline: Change Orgnanization of user via Import Data and check Job Scheduler in user Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               6 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    When Import Data "User"
      | UserID   | UserName | Full Name | OrganizationID |
      | JPCUser2 | JPCUser2 | JPCUser2  | JSORG1         |
    And Import "<File Format>" and check Imported Data for "User"
      | UserID   | Result  |
      | JPCUser2 | Success |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

    Examples: 
      | File Format |
      | CSV         |
      | XLS         |

  #CSR_6103
  @CSR5155_33
  Scenario: Change Orgnanization of user and worker From Multi User page and check Job Scheduler in user Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Delete Contractor via API
      | id       |
      | JPCCON_1 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | JPCCON_1 | JPCCON_1 |              10 | JPCCON_1       |     1111111100 | JPCCON_1@cwm.com |     10000 | JPClic1     | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | Organization | AtdEnable | SkillName | ContractorName | JobCosting | Validation         |
      | JPCWrk_1 | JPCWrk_1 | True   |              | true      | Skill-1   | JPCCON_1       | Enabled    | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    When Change group for "Multi User" from Change Group page
      | GroupType    | FromDate | ToDate | NewGroup | SelectUsers | UserId            | GroupName | Validation        |
      | Organization |          |        | JSORG1   | User Wise   | JPCUser2,JPCWrk_1 |           | Process Completed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from Worker Profile for WorkerId= "JPCWrk_1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

  #CSR_6103
  @CSR5155_34
  Scenario: Change Orgnanization of user and worker From Single User and check Job Scheduler in user Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Delete Contractor via API
      | id       |
      | JPCCON_1 |
    And Create Contractor from CWM module
      | Id       | name     | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | JPCCON_1 | JPCCON_1 |              10 | JPCCON_1       |     1111111100 | JPCCON_1@cwm.com |     10000 | JPClic1     | True          | True             | Saved Successfully |
    And Create Worker from CWM module
      | WorkerId | name     | Active | Organization | AtdEnable | SkillName | ContractorName | JobCosting | Validation         |
      | JPCWrk_1 | JPCWrk_1 | True   |              | true      | Skill-1   | JPCCON_1       | Enabled    | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    When Change group for "Single User" from Change Group page
      | UserId   | ChangeGroup  | FromDate | ToDate | NewGroup | Validation         |
      | JPCUser2 | Organization |        0 |        | JSORG1   | Saved Successfully |
    And Change group for "Single User" from Change Group page
      | UserId   | ChangeGroup  | FromDate | ToDate | NewGroup | Validation         |
      | JPCWrk_1 | Organization |        0 |        | JSORG1   | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Job Scheduler from Worker Profile for WorkerId= "JPCWrk_1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_35
  Scenario: Assign Job Using Organization and Change Organization then change Job Scheduler of Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
      | Organization | JSORG3 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
      | Organization | JSORG2 | JSORG2 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               3 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    When Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   2 |                 2 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   8 |                 8 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |               |       10 | Daily         | Current |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS2          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J2 |          1 | True      | User Wise   | JPCUser2 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG2 | JPC_JS2   | Yes               | Saved Successfully |
    When Assign user from Enterprise module
      | Group        | Name   | Userid   | validation         |
      | Organization | JSORG2 | JPCUser1 | Saved Successfully |
    When Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS2       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS2       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   2 |                 2 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   8 |                 8 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |       10 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   1 |                 1 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   3 |                 3 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   5 |                 5 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                   9 |                 9 |               |               |       10 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |       10 | Daily         | Current |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS3          | true   |         1 |      10 | Daily        |                  0 |               5 | Current          | JPC_J3 |          1 | true      | User Wise   | JPCUser2 | Saved Successfully |
    And Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG2 | JPC_JS2       | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG2 | JPC_JS3   | Yes               | Saved Successfully |
    When Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS3       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
      | JPC_JS3       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |       10 | Daily         | Current |
      | JPC_J1  |                   2 |                 2 |               |       10 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |       10 | Daily         | Current |
      | JPC_J1  |                   4 |                 4 |               |       10 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |       10 | Daily         | Current |
      | JPC_J1  |                   6 |                 6 |               |       10 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |       10 | Daily         | Current |
      | JPC_J1  |                   8 |                 8 |               |       10 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |       10 | Daily         | Current |
      | JPC_J1  |                  10 |                10 |               |       10 | Daily         | Current |
      | JPC_J2  |                   1 |                 1 |               |       10 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |       10 | Daily         | Current |
      | JPC_J2  |                   3 |                 3 |               |       10 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |       10 | Daily         | Current |
      | JPC_J2  |                   5 |                 5 |               |       10 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |       10 | Daily         | Current |
      | JPC_J2  |                   7 |                 7 |               |       10 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |       10 | Daily         | Current |
      | JPC_J2  |                   9 |                 9 |               |       10 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |       10 | Daily         | Current |
      | JPC_J3  |                   1 |                 1 |               |       10 | Daily         | Current |
      | JPC_J3  |                   2 |                 2 |               |       10 | Daily         | Current |
      | JPC_J3  |                   3 |                 3 |               |       10 | Daily         | Current |
      | JPC_J3  |                   4 |                 4 |               |       10 | Daily         | Current |
      | JPC_J3  |                   5 |                 5 |               |       10 | Daily         | Current |
      | JPC_J3  |                   6 |                 6 |               |       10 | Daily         | Current |
      | JPC_J3  |                   7 |                 7 |               |       10 | Daily         | Current |
      | JPC_J3  |                   8 |                 8 |               |       10 | Daily         | Current |
      | JPC_J3  |                   9 |                 9 |               |       10 | Daily         | Current |
      | JPC_J3  |                  10 |                10 |               |       10 | Daily         | Current |

  #
  #CSR_6103
  @CSR5155_36
  Scenario: Job Costing enable and disable in Organization, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
      | Organization | JSORG3 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email | job-assignment-type |
      | JPCUser1 | JPCUser1 |               1 |         1 |               1 |                  1 |               |                |                   1 |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               3 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | JobCosting | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 |            | JPC_JS1   | Yes               | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser2 | True   | JSORG1       | True      |                        2 |            | Saved Successfully |
    Then Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCosting |
      | Disabled   |
    When Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | True       |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | JobCosting | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | Enabled    | JPC_JS1   | Yes               | Saved Successfully |
    Then Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCosting |
      | Enabled    |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | JobCosting | ConfirmationPopup | validation         |
      | Organization | JSORG1 | Disabled   | Yes               | Saved Successfully |
    Then Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCosting |
      | Disabled   |

  #CSR-5657
  @CSR5155_37
  Scenario: Assign Jobs via Job Assignment Process, Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Daily            | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |              -1 | Current          | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | RepeatDays | Active |
      | JPC_J1  |          1 | true   |
      | JPC_J2  |          1 | true   |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J1  |
      |    2 | JPC_J2  |
      |    3 | JPC_J1  |
      |    4 | JPC_J2  |
      |    5 | JPC_J1  |
      |    6 | JPC_J2  |
      |    7 | JPC_J1  |
      |    8 | JPC_J2  |
      |    9 | JPC_J1  |
      |   10 | JPC_J2  |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    When Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               10 | Daily         | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 1 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   2 |                 2 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   3 |                 3 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   4 |                 4 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   5 |                 5 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   6 |                 6 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   7 |                 7 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                   8 |                 8 |               |               |        5 | Daily         | Current |
      | JPC_J1  |                   9 |                 9 |               |               |        5 | Daily         | Current |
      | JPC_J2  |                  10 |                10 |               |               |        5 | Daily         | Current |

  #CSR_5657
  @CSR5155_38
  Scenario: Scheduler Date Range for Current Month and Run Job Scheduler for Next Month, Schedule Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Daily        |                  0 |               3 | Next             | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

  #CSR_5657
  @CSR5155_39
  Scenario: Schedule Range for Current and Next month, Processing Period= Next, Schedule Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         60 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      60 | Daily        |                  0 |               3 | Next             | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month |
      | JPC_J1  |                   1 |                 1 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   2 |                 2 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   3 |                 3 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   4 |                 4 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   5 |                 5 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   6 |                 6 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   7 |                 7 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   8 |                 8 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   9 |                 9 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  10 |                10 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  11 |                11 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  12 |                12 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  13 |                13 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  14 |                14 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  15 |                15 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  16 |                16 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  17 |                17 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  18 |                18 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  19 |                19 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  20 |                20 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  21 |                21 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  22 |                22 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  23 |                23 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  24 |                24 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  25 |                25 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  26 |                26 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  27 |                27 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  28 |                28 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  29 |                29 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  30 |                30 |               |               |       30 | Daily         | Next  |

  #CSR_5657
  @CSR5155_40
  Scenario: Schedule Type= Daily, Make changes in scheduler after scheduler runs and run again
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         20 | Daily            | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         20 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Daily        |                  0 |               3 | Current          | JPC_J1 |          3 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 3 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   4 |                 6 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   7 |                 9 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  10 |                12 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  13 |                15 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  16 |                18 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  19 |                20 |               |               |        7 | Daily         | Current |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | ScheduleType | ScheduleRunTime | Job    | RepeatDays | ActiveJob | Validation         |
      | JPC_JS1          | true   | Daily        |               3 | JPC_J2 |          3 | true      | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 3 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                   4 |                 6 |               |               |        7 | Daily         | Current |
      | JPC_J2  |                   4 |                 6 |               |               |        3 | Daily         | Current |
      | JPC_J1  |                   7 |                 9 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  10 |                12 |               |               |        7 | Daily         | Current |
      | JPC_J2  |                  10 |                12 |               |               |        3 | Daily         | Current |
      | JPC_J1  |                  13 |                15 |               |               |        7 | Daily         | Current |
      | JPC_J1  |                  16 |                18 |               |               |        7 | Daily         | Current |
      | JPC_J2  |                  16 |                18 |               |               |        3 | Daily         | Current |
      | JPC_J1  |                  19 |                20 |               |               |        7 | Daily         | Current |

  #CSR_5657
  @CSR5155_41
  Scenario: Schedule Range for Next month - 1 to 30, Processing Period= Next, Job Scheduler Type= Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         60 | Daily            | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |        32 |      60 | Daily        |                  0 |               3 | Next             | JPC_J1 |          1 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month |
      | JPC_J1  |                   1 |                 1 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   2 |                 2 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   3 |                 3 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   4 |                 4 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   5 |                 5 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   6 |                 6 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   7 |                 7 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   8 |                 8 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                   9 |                 9 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  10 |                10 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  11 |                11 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  12 |                12 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  13 |                13 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  14 |                14 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  15 |                15 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  16 |                16 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  17 |                17 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  18 |                18 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  19 |                19 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  20 |                20 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  21 |                21 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  22 |                22 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  23 |                23 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  24 |                24 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  25 |                25 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  26 |                26 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  27 |                27 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  28 |                28 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  29 |                29 |               |               |       30 | Daily         | Next  |
      | JPC_J1  |                  30 |                30 |               |               |       30 | Daily         | Next  |

  #######################################################################
  #############Weekly Job Scheduler Starts##############
  #CSR_5367
  @CSR5155_42
  Scenario: Assign Jobs on Weekly Basis for Last Week using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
      | Organization | JSORG3 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |        100 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |     100 | Weekly       |                  0 |               3 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | Last        | Mon, Wed   | true   |
      | JPC_J2  | Last        | Tue, Thu   | true   |
      | JPC_J3  | Last        | Fri, Sun   | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | Last | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | Last | Fri,Sun |          | Weekly        | Current |

  #CSR_5367
  @CSR5155_43
  Scenario: Assign Jobs on Weekly Basis for 4th and Last Week using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
      | Organization | JSORG3 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |        100 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |     100 | Weekly       |                  0 |               3 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 4th,Last    | Mon, Wed   | true   |
      | JPC_J2  | 4th,Last    | Tue, Thu   | true   |
      | JPC_J3  | 4th,Last    | Fri, Sun   | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week     | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 4th,Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 4th,Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 4th,Last | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week     | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 4th,Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 4th,Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 4th,Last | Fri,Sun |          | Weekly        | Current |

  #CSR_5367
  @CSR5155_44
  Scenario: Assign Jobs on Weekly Basis for 2nd, 3rd and 4th Week using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |        100 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |     100 | Weekly       |                  0 |               4 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 2nd,3rd     | Mon, Wed   | true   |
      | JPC_J2  | 3rd,4th     | Tue, Thu   | true   |
      | JPC_J3  | 2nd,4th     | Fri, Sun   | true   |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd,4th | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,4th | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd,4th | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,4th | Fri,Sun |          | Weekly        | Current |

  #
  #
  #CSR_5367
  @CSR5155_45
  Scenario: Schedule Type= Weekly, Job Priority Scenario using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         10 | Weekly           | Saved Successfully |
    And Assign jobs to user="JPCUser1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPC_J5  |                 |               |
      | JPC_J4  |                 |               |
      | JPC_J3  |                 |               |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Weekly       |                  0 |               3 | Current          | JPC_J2 | 2nd         | Mon        | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J2  | 2nd         | Mon   | true   |
      | JPC_J1  | 2nd         | Mon   | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J1,JPC_J2,JPC_J3,JPC_J4,JPC_J5 |
    When Prioritize Job from user configuration for UserID= "JPCUser1"
      | JobCode | PrioritizeJob |
      | JPC_J2  | up            |
      | JPC_J3  | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J2,JPC_J1,JPC_J4,JPC_J3,JPC_J5 |

  #CSR_5367
  @CSR5155_46
  Scenario: Job date is out of Scheduler date range and inactive Job Scenario, Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          2 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            3 |          4 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            5 |          6 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            7 |          8 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         3 |      31 | Weekly       |                  0 |               3 | Current          | JPC_J1 | 1st,2nd     | Tue,Wed    | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J2  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J3  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J4  | 1st, 2nd    | Mon, Wed   | false  |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | TableContent  | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  | No Data Found |                     |                   |         |         |          |               |         |
      | JPC_J2  |               |                     |                   | 1st,2nd | Mon,Wed |          | Weekly        | Current |
      | JPC_J3  |               |                     |                   | 1st,2nd | Mon,Wed |          | Weekly        | Current |
      | JPC_J4  | No Data Found |                     |                   |         |         |          |               |         |

  #CSR_5367
  @CSR5155_47
  Scenario: Job Scheduler = Weekly, Job date between 2 months
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          2 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            3 |          4 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            5 |          6 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            7 |          8 | Weekly           | Saved Successfully |
      | JPC_J5 | JPC_J5 |           28 |         32 | Weekly           | Saved Successfully |
      | JPC_J6 | JPC_J6 |           30 |         33 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek      | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |      51 | Weekly       |                  0 |               3 | Current          | JPC_J1 | Check All   | Mon,Wed,Fri,Sun | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek      | Active |
      | JPC_J1  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J2  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J3  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J4  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J5  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J6  | Check All   | Mon,Wed,Fri,Sun | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week                     | Days            | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J4  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J5  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J6  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |

  #
  #CSR-5657
  #CSR_5367
  @CSR5155_48
  Scenario: Configure jobs for Current Month and Run Job Scheduler for Next Month, Scheduler Type = Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek  | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      51 | Weekly       |                  0 |               3 | Next             | JPC_J1 | Check All   | Mon,Wed,Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Next"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

  #CSR_5367
  @CSR5155_49
  Scenario: Assign Jobs on Weekly Basis for 4th and Last Week using Job Assignment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |        100 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |        100 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |     100 | Weekly       |                  0 |              -1 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 4th,Last    | Mon, Wed   | true   |
      | JPC_J2  | 4th,Last    | Tue, Thu   | true   |
      | JPC_J3  | 4th,Last    | Fri, Sun   | true   |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week     | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 4th,Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 4th,Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 4th,Last | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week     | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 4th,Last | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 4th,Last | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 4th,Last | Fri,Sun |          | Weekly        | Current |

  #CSR_5367
  @CSR5155_50
  Scenario: Schedule Type= Weekly, Job Priority Scenario using Job Assignment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Weekly           | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         10 | Weekly           | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    When Assign jobs to user="JPCUser1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPC_J5  |                 |               |
      | JPC_J4  |                 |               |
      | JPC_J3  |                 |               |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      10 | Weekly       |                  1 |              -1 | Current          | JPC_J2 | 1st         | Mon        | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J2  | 2nd         | Mon  | true   |
      | JPC_J1  | 2nd         | Mon   | true   |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J1,JPC_J2,JPC_J3,JPC_J4,JPC_J5 |
    When Prioritize Job from user configuration for UserID= "JPCUser1"
      | JobCode | PrioritizeJob |
      | JPC_J2  | up            |
      | JPC_J3  | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J2,JPC_J1,JPC_J4,JPC_J3,JPC_J5 |

  #CSR_5367
  @CSR5155_51
  Scenario: Job date is out of Scheduler date range and Inactive Job Scenario using Job Assignment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          2 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            3 |          4 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            5 |          6 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            7 |          8 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         3 |      31 | Weekly       |                  0 |              -1 | Current          | JPC_J1 | 1st,2nd     | Tue,Wed    | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J2  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J3  | 1st, 2nd    | Mon, Wed   | true   |
      | JPC_J4  | 1st, 2nd    | Mon, Wed   | false  |
    When Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | TableContent  | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  | No Data Found |                     |                   |         |         |          |               |         |
      | JPC_J2  |               |                     |                   | 1st,2nd | Mon,Wed |          | Weekly        | Current |
      | JPC_J3  |               |                     |                   | 1st,2nd | Mon,Wed |          | Weekly        | Current |
      | JPC_J4  | No Data Found |                     |                   |         |         |          |               |         |

  #CSR_5367
  @CSR5155_52
  Scenario: Group Wise Job Assignment, Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          2 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            3 |          4 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            5 |          6 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            7 |          8 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek      | SelectUsers | SelectGroup  | GroupName | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Weekly       |                  0 |               4 | Current          | JPC_J1 | Check All   | Mon,Wed,Fri,Sun | Group Wise  | Organization | JSORG1    | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek      | Active |
      | JPC_J1  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J2  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J3  | Check All   | Mon,Wed,Fri,Sun | true   |
      | JPC_J4  | Check All   | Mon,Wed,Fri,Sun | true   |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week                     | Days            | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J4  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week                     | Days            | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
      | JPC_J4  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | TableContent |
      | No Data      |

  #CSR_5367
  @CSR5155_53
  Scenario: Group Wise Job Assignment using Job Assignment Process, Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          2 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            3 |          4 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            5 |          6 | Weekly           | Saved Successfully |
      | JPC_J4 | JPC_J4 |            7 |          8 | Weekly           | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek  | SelectUsers | SelectGroup  | GroupName | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Weekly       |                  1 |              -1 | Current          | JPC_J1 | Check All   | Mon,Wed,Fri | Group Wise  | Organization | JSORG1    | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek  | Active |
      | JPC_J1  | Check All   | Mon,Wed,Fri | true   |
      | JPC_J2  | Check All   | Mon,Wed,Fri | true   |
      | JPC_J3  | Check All   | Mon,Wed,Fri | true   |
      | JPC_J4  | Check All   | Mon,Wed,Fri | true   |
    When Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week                     | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J4  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week                     | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J4  |                     |                   | 1st,2nd,3rd,4th,5th,Last | Mon,Wed,Fri |          | Weekly        | Current |

  #CSR_5451
  @CSR5155_54
  Scenario: Processing Period=Weekly, Assign Job Scheduler and User to Organization and wait till Scheduler Runs
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         25 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         25 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         25 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      25 | Weekly       |                  0 |               4 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 2nd,3rd     | Mon, Wed   | true   |
      | JPC_J2  | 2nd,3rd     | Tue, Thu   | true   |
      | JPC_J3  | 2nd,3rd     | Fri, Sun   | true   |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               25 | Weekly        | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               25 | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,3rd | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,3rd | Fri,Sun |          | Weekly        | Current |

  #CSR_5451
  @CSR5155_55
  Scenario: Processing Period=Weekly, Assign Job Scheduler and User to Organization and do Job Assignment Process
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         25 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         25 | Weekly           | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         25 | Weekly           | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      25 | Weekly       |                  1 |              -1 | Current          | JPC_J1 | Last        | Mon        | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek | Active |
      | JPC_J1  | 2nd,3rd     | Mon, Wed   | true   |
      | JPC_J2  | 2nd,3rd     | Tue, Thu   | true   |
      | JPC_J3  | 2nd,3rd     | Fri, Sun   | true   |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               25 | Weekly        | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               25 | Weekly        | Current |
    Then Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,3rd | Fri,Sun |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days    | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu |          | Weekly        | Current |
      | JPC_J3  |                     |                   | 2nd,3rd | Fri,Sun |          | Weekly        | Current |

  #CSR_6103
  @CSR5155_56
  Scenario: Assign 2 Job Scheduler to Organization and do Job Assignment Process then delete 1 Job Scheduler, Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         20 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         20 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek     | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Weekly       |                  0 |               3 | Current          | JPC_J1 | 2nd         | Mon, Wed, Fri, | true      | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      20 | Weekly       |                  0 |               3 | Current          | JPC_J2 | 3rd         | Tue, Thu, Sat  | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       |                  1 |               20 | Weekly        | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       |                  1 |               20 | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |

  #CSR_6103
  @CSR5155_57
  Scenario: Assign 2 Job Scheduler to Organization and after Job Scheduler runs delete 1 Job Scheduler, Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         20 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         20 | Weekly           | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek    | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Weekly       |                  0 |               4 | Current          | JPC_J1 | 2nd         | Mon, Wed, Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      20 | Weekly       |                  0 |               4 | Current          | JPC_J2 | 3rd         | Tue, Thu, Sat | true      | User Wise   | JPCUser1 | Saved Successfully |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
      | JPC_JS2       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       |                  1 |               20 | Weekly        | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       |                  1 |               20 | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue,Thu,Sat |          | Weekly        | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               20 | Weekly        | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days          | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon, Wed, Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue, Thu, Sat |          | Weekly        | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week | Days          | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd  | Mon, Wed, Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 3rd  | Tue, Thu, Sat |          | Weekly        | Current |
  
  #CSR-5657
  @CSR5155_58
  Scenario: Scheduler Date Range for Current Month and Run Job Scheduler for Next Month
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek  | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Weekly       |                  0 |               3 | Next             | JPC_J1 | Check All   | Mon,Wed,Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Next"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

  #CSR-5657
  @CSR5155_59
  Scenario: Schedule Range for Current and Next month, Job Scheduler Type= Weekly, Processing Period= Next
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         70 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         70 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek   | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      70 | Weekly       |                  0 |               3 | Next             | JPC_J1 | 2nd,3rd     | Mon, Wed,Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek    | Active |
      | JPC_J1  | 2nd,3rd     | Mon, Wed,Fri  | true   |
      | JPC_J2  | 2nd,3rd     | Tue, Thu, Sat | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days        | RowCount | SchedulerType | Month |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed,Fri |          | Weekly        | Next  |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu,Sat |          | Weekly        | Next  |

  #CSR-5657
  @CSR5155_60
  Scenario: Job Scheduler Type= Weekly, Make changes in scheduler after scheduler runs and wait to run again
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek  | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Weekly       |                  0 |               3 | Current          | JPC_J1 | 2nd,3rd     | Mon,Wed,Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed,Fri |          | Weekly        | Current |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | ScheduleType | ScheduleRunTime | Job    | WeekofMonth | DaysOfWeek    | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   | Weekly       |               3 | JPC_J2 | 2nd,3rd     | Tue, Thu, Sat | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days        | RowCount | SchedulerType | Month   |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed,Fri |          | Weekly        | Current |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu,Sat |          | Weekly        | Current |

  #
  #CSR-5657
  @CSR5155_61
  Scenario: Schedule Range= Next month- 1 to 30, Processing Period= Next, Job Scheduler Type= Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         70 | Weekly           | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         70 | Weekly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | WeekofMonth | DaysOfWeek  | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |        32 |      60 | Weekly       |                  0 |               3 | Next             | JPC_J1 | 2nd,3rd     | Mon,Wed,Fri | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | WeekofMonth | DaysOfWeek    | Active |
      | JPC_J1  | 2nd,3rd     | Mon, Wed,Fri  | true   |
      | JPC_J2  | 2nd,3rd     | Tue, Thu, Sat | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | Week    | Days        | RowCount | SchedulerType | Month |
      | JPC_J1  |                     |                   | 2nd,3rd | Mon,Wed,Fri |          | Weekly        | Next  |
      | JPC_J2  |                     |                   | 2nd,3rd | Tue,Thu,Sat |          | Weekly        | Next  |

  #
  ####################################################
  ###################Monthly Job Scheduler Starts##############
  #CSR_5368
  @CSR5155_62
  Scenario: Assign Jobs on Monthly Basis
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         90 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         90 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         90 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      90 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           20 | true   |
      | JPC_J3  | Check All   |             21 |           30 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  21 |                30 |               |               |        1 | Monthly       | Current |

  # CSR_5368
  @CSR5155_63
  Scenario: Schedule Type= Monthly, Job Priority Scenario using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         20 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         20 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         20 | Monthly          | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         20 | Monthly          | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         20 | Monthly          | Saved Successfully |
    And Assign jobs to user="JPCUser1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd |
      | JPC_J5  |                 |               |
      | JPC_J4  |                 |               |
      | JPC_J3  |                 |               |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |           20 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J2  | Check All   |              1 |           20 | true   |
      | JPC_J1  | Check All   |              1 |           20 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J1,JPC_J2,JPC_J3,JPC_J4,JPC_J5 |
    When Prioritize Job from user configuration for UserID= "JPCUser1"
      | JobCode | PrioritizeJob |
      | JPC_J2  | up            |
      | JPC_J3  | down          |
    Then Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode                            |
      | JPC_J2,JPC_J1,JPC_J4,JPC_J3,JPC_J5 |

  #CSR_5368
  @CSR5155_64
  Scenario: Schedule Type= Monthly, Assign job on last day of the month using Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
        | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         31 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID            | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |             31 |           31 | User Wise   | JPCUser1,JPCUser2 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear                 | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Jan,Mar,May,Jul,Aug,Oct,Dec |             31 |           31 | true   |
      | JPC_J1  | Apr,Jun,Sep,Nov             |             30 |           30 | true   |
      | JPC_J1  | Feb                         |             29 |           29 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  | LastDateOfMonth     | LastDateOfMonth   |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  | LastDateOfMonth     | LastDateOfMonth   |               |               |        1 | Monthly       | Current |

  #
  #CSR_5368
  @CSR5155_65
  Scenario: Example 4: Schedule Type= Monthly, Job date out of assignment date in Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | EstimatedHours | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 |                | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |           15 |         20 |                | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |             15 |           20 | true   |
      | JPC_J2  | Check All   |              1 |           14 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

  #CSR_5368
  @CSR5155_66
  Scenario: Schedule Type= Monthly, Overlapping Job with same and different Dates, Processing Period= Current,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
       | JPC_J5  |
      | JPC_J6  |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |          3 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            4 |         10 | Monthly          | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Assign jobs to user="JPCUser1" from user configuration
      | JobCode | AssignmentStart | AssignmentEnd | JobSchedulerType |
      | JPC_J1  |               1 |             3 | Monthly          |
      | JPC_J2  |               4 |             6 | Monthly          |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      20 | Monthly      |                  0 |               4 | Current          | JPC_J1 |           0 |              1 |            3 | True      | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  |           0 |              1 |            3 | true   |
      | JPC_J2  |           0 |              7 |           10 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J1  |
      |    2 | JPC_J1  |
      |    3 | JPC_J1  |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 | JPC_J2  |
      |    8 | JPC_J2  |
      |    9 | JPC_J2  |
      |   10 | JPC_J2  |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 3 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                   4 |                 6 |               |               |        2 | Monthly       | Current |
      | JPC_J2  |                   7 |                10 |               |               |        2 | Monthly       | Current |

  #
  #CSR_5368 - Example 5 and Mark Punch
  @CSR5155_67
  Scenario: Schedule Type= Monthly, Processing Period= Current, Overlapping Job Dates and Mark Punch scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
       | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | ReportingGroup | LeaveGroup | AtdEnable | ACSEnable | ShiftSchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | JobCosting | DeviceBasedJobAssign | Validation         |
      | JPCUser1 | True   |                |            | True      | True      |               | True      | True      | True               | Enabled    | True                 | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID   |
      | JPCUser1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID   |
      | JPCUser1 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser1 |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | JPCUser1 |                          1 | admin        |    1 |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         10 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               3 | Current          | JPC_J1 |           0 |              1 |            30 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  |           0 |              1 |           30 | true   |
      | JPC_J2  |           0 |              1 |           30 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J2  |
      |    2 | JPC_J2  |
      |    3 | JPC_J2  |
      |    4 | JPC_J2  |
      |    5 | JPC_J2  |
      |    6 | JPC_J2  |
      |    7 | JPC_J2  |
      |    8 | JPC_J2  |
      |    9 | JPC_J2  |
      |   10 | JPC_J2  |
      |   11 | JPC_J2  |
      |   12 | JPC_J2  |
      |   13 | JPC_J2  |
      |   14 | JPC_J2  |
      |   15 | JPC_J2  |
      |   16 | JPC_J2  |
      |   17 | JPC_J2  |
      |   18 | JPC_J2  |
      |   19 | JPC_J2  |
      |   20 | JPC_J2  |
      |   21 | JPC_J2  |
      |   22 | JPC_J2  |
      |   23 | JPC_J2  |
      |   24 | JPC_J2  |
      |   25 | JPC_J2  |
      |   26 | JPC_J2  |
      |   27 | JPC_J2  |
      |   28 | JPC_J2  |
      |   29 | JPC_J2  |
      |   30 | JPC_J2  |
      |   31 |         |
    And Verify Job Priority from User configuration for UserID= "JPCUser1"
      | JobCode       |
      | JPC_J2,JPC_J1 |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J2  |                   1 |                30 |               |               |        1 | Monthly       | Current |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | JPCUser1 | admin    | Welcome JPCUser1 |
    When Mark punch via ESS
      | SpecialFunction | Job         | PunchConfirmationMessage                                              |
      | Regular IN      | Default Job | Regular IN punch submitted successfully with Job code as Default Job  |
      | Regular OUT     | Default Job | Regular OUT punch submitted successfully with Job code as Default Job |
    Then Validate punch from Timesheet Correction Application page in ESS
      | JobCode | StartDate |
      | JPC_J2  |         0 |
    When Mark punch via ESS
      | SpecialFunction | Job    | PunchConfirmationMessage                                                  |
      | Regular IN      | JPC_J1 - JPC_J1| Regular IN punch submitted successfully with Job code as JPC_J1 - JPC_J1  |
      | Regular OUT     | JPC_J1 - JPC_J1| Regular OUT punch submitted successfully with Job code as JPC_J1 - JPC_J1 |
    Then Validate punch from Timesheet Correction Application page in ESS
      | JobCode |
      | JPC_J1  |
#

  #CSR-5657
  #CSR_5368
  @CSR5155_68
  Scenario: Example 7: Schedule Type= Monthly, Job Scheduler Date range for Current and next month and Processing Period= Next
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         90 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         90 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      60 | Monthly      |                  0 |               4 | Next             | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |            5 | true   |
      | JPC_J2  | Check All   |              5 |            7 | true   |
      | JPC_J1  | Check All   |              9 |           15 | true   |
      | JPC_J2  | Check All   |             13 |           20 | true   |
      | JPC_J1  | Check All   |             10 |           20 | true   |
      | JPC_J2  | Check All   |              1 |            7 | true   |
      | JPC_J2  | Check All   |              9 |           30 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Next"
      | Date | JobCode |
      |    1 | JPC_J2  |
      |    2 | JPC_J2  |
      |    3 | JPC_J2  |
      |    4 | JPC_J2  |
      |    5 | JPC_J2  |
      |    6 | JPC_J2  |
      |    7 | JPC_J2  |
      |    8 |         |
      |    9 | JPC_J2  |
      |   10 | JPC_J2  |
      |   11 | JPC_J2  |
      |   12 | JPC_J2  |
      |   13 | JPC_J2  |
      |   14 | JPC_J2  |
      |   15 | JPC_J2  |
      |   16 | JPC_J2  |
      |   17 | JPC_J2  |
      |   18 | JPC_J2  |
      |   19 | JPC_J2  |
      |   20 | JPC_J2  |
      |   21 | JPC_J2  |
      |   22 | JPC_J2  |
      |   23 | JPC_J2  |
      |   24 | JPC_J2  |
      |   25 | JPC_J2  |
      |   26 | JPC_J2  |
      |   27 | JPC_J2  |
      |   28 | JPC_J2  |
      |   29 | JPC_J2  |
      |   30 | JPC_J2  |
      |   31 |         |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month |
      | JPC_J2  |                   9 |                30 |               |               |        4 | Monthly       | Next  |
      | JPC_J2  |                   1 |                 7 |               |               |        4 | Monthly       | Next  |
      | JPC_J1  |                  10 |                20 |               |               |        3 | Monthly       | Next  |
      | JPC_J2  |                  13 |                20 |               |               |        4 | Monthly       | Next  |
      | JPC_J1  |                   9 |                15 |               |               |        3 | Monthly       | Next  |
      | JPC_J2  |                   5 |                 7 |               |               |        4 | Monthly       | Next  |
      | JPC_J1  |                   1 |                 5 |               |               |        3 | Monthly       | Next  |

  #CSR-5657
  #CSR_5368
  @CSR5155_69
  Scenario: Example 8: Schedule Type= Monthly, Job Scheduler Date range for current month and Processing Period= Next
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
    | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         90 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         90 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               4 | Next             | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |            5 | true   |
      | JPC_J2  | Check All   |              5 |            7 | true   |
      | JPC_J1  | Check All   |              9 |           15 | true   |
      | JPC_J2  | Check All   |             13 |           20 | true   |
      | JPC_J1  | Check All   |             10 |           20 | true   |
      | JPC_J2  | Check All   |              1 |            7 | true   |
      | JPC_J2  | Check All   |              9 |           31 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Next"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 |         |
      |   21 |         |
      |   22 |         |
      |   23 |         |
      |   24 |         |
      |   25 |         |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |         |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

 #Expected Result: JPC_J2 Must Be Displayed For Whole Month Except 08-05-24.
  #CSR_5368
  @CSR5155_70
  Scenario: Example 9: Schedule Type= Monthly, JPC_J2 Must Be Displayed For Whole Month Except 08-05-24.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
     | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         90 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         90 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Monthly      |                  0 |               4 | Current          | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |            5 | true   |
      | JPC_J2  | Check All   |              5 |            7 | true   |
      | JPC_J1  | Check All   |              9 |           15 | true   |
      | JPC_J2  | Check All   |             13 |           20 | true   |
      | JPC_J1  | Check All   |             10 |           20 | true   |
      | JPC_J2  | Check All   |              1 |            7 | true   |
      | JPC_J2  | Check All   |              9 |           30 | true   |
    And Wait for "4		" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 | JPC_J2  |
      |    2 | JPC_J2  |
      |    3 | JPC_J2  |
      |    4 | JPC_J2  |
      |    5 | JPC_J2  |
      |    6 | JPC_J2  |
      |    7 | JPC_J2  |
      |    8 |         |
      |    9 | JPC_J2  |
      |   10 | JPC_J2  |
      |   11 | JPC_J2  |
      |   12 | JPC_J2  |
      |   13 | JPC_J2  |
      |   14 | JPC_J2  |
      |   15 | JPC_J2  |
      |   16 | JPC_J2  |
      |   17 | JPC_J2  |
      |   18 | JPC_J2  |
      |   19 | JPC_J2  |
      |   20 | JPC_J2  |
      |   21 | JPC_J2  |
      |   22 | JPC_J2  |
      |   23 | JPC_J2  |
      |   24 | JPC_J2  |
      |   25 | JPC_J2  |
      |   26 | JPC_J2  |
      |   27 | JPC_J2  |
      |   28 | JPC_J2  |
      |   29 | JPC_J2  |
      |   30 | JPC_J2  |
      |   31 |   |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J2  |                   9 |                30 |               |               |        4 | Monthly       | Current |
      | JPC_J2  |                   1 |                 7 |               |               |        4 | Monthly       | Current |
      | JPC_J1  |                  10 |                20 |               |               |        3 | Monthly       | Current |
      | JPC_J2  |                  13 |                20 |               |               |        4 | Monthly       | Current |
      | JPC_J1  |                   9 |                15 |               |               |        3 | Monthly       | Current |
      | JPC_J2  |                   5 |                 7 |               |               |        4 | Monthly       | Current |
      | JPC_J1  |                   1 |                 5 |               |               |        3 | Monthly       | Current |
#
  #Expected Result: No Jobs Will Be Assigned to user When Scheduler Is Executed.
  #CSR_5368
  @CSR5155_71
  Scenario: Example 10: Schedule Type= Monthly, Job Date Range out of Job Scheduler date and Inactive Job Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
     | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |          -31 |        -31 |                  | Saved Successfully |
      | JPC_J2 | JPC_J2 |          -31 |         90 |                  | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      31 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |            5 | true   |
      | JPC_J2  | Check All   |              5 |           30 | false  |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

   #Expected Result: In This Case Job Scheduler Will Be Assigned To user & Jobs Of That Schedulers Must Not Be Assigned To User.
  #CSR_5368
  @CSR5155_72
  Scenario: Example 17: Schedule Type= Monthly, Processing Period= Current, make User Inactive after assigning Job Scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         15 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         90 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               4 | Current          | JPC_J1 | Check All   |              1 |            1 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           20 | true   |
      | JPC_J2  | Check All   |             20 |           30 | false  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | false  |       |                        |     | Saved Successfully |
    And Wait for "4" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | TableContent |
      | No Data      |

 #CSR_5451
  @CSR5155_73
  Scenario: Processing Period=Monthly, Assign Job Scheduler from Enterprise Structure Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               5 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           20 | true   |
      | JPC_J3  | Check All   |             21 |           30 | true   |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Wait for "5" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  21 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  21 |                30 |               |               |        1 | Monthly       | Current |

 #CSR_5451
  @CSR5155_74
  Scenario: Processing Period=Monthly, Assign Job Scheduler from Enterprise Structure Module and Assign Jobs using Job Assignment Process page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5 |
      | JPC_J6  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |              -3 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           20 | true   |
      | JPC_J3  | Check All   |             21 |           30 | true   |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1   | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  21 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  21 |                30 |               |               |        1 | Monthly       | Current |

  #CSR_6103
  @CSR5155_75
  Scenario: Assign 2 Job Scheduler to Organization and after Job Scheduler runs delete 1 Job Scheduler, Job Scheduler Type= Monthly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5 |
      | JPC_J6  |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 |   Monthly             | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 |    Monthly            | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         30 |    Monthly            | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         30 |     Monthly           | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         30 |     Monthly           | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               5 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      30 | Monthly      |                  0 |               5 | Current          | JPC_J3 | Check All   |             11 |           20 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           15 | true   |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J3  | Check All   |             16 |           20 | true   |
      | JPC_J4  | Check All   |             21 |           25 | true   |
      | JPC_J5  | Check All   |             26 |           30 | true   |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Wait for "5" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
      | JPC_JS2       | Succeed |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       |                  1 |               30 | Monthly       | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       |                  1 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
    	| JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |

 
  #CSR_6103
  @CSR5155_76
  Scenario: Assign 2 Job Scheduler to Organization and do Job Assignment Process then delete 1 Job Scheduler, Job Scheduler Type= Monthly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | JSORG1 | Deleted Successfully |
      | Organization | JSORG2 | Deleted Successfully |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5 |
      | JPC_J6  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | JSORG1 | JSORG1 | Saved Successfully |
    And Create user from user configuration
      | userid   | Active | Organization | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   |              | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | JSORG1       | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |              -1 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
      | JPC_JS2          | true   |         1 |      30 | Monthly      |                  0 |              -1 | Current          | JPC_J3 | Check All   |             11 |           20 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           15 | true   |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J3  | Check All   |             16 |           20 | true   |
      | JPC_J4  | Check All   |             21 |           25 | true   |
      | JPC_J5  | Check All   |             26 |           30 | true   |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobScheduler | JobCosting |
      | Organization | True         | false      |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | Scheduler       | ConfirmationPopup | validation         |
      | Organization | JSORG1 | JPC_JS1,JPC_JS2 | Yes               | Saved Successfully |
    And Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser2 |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       |                  1 |               30 | Monthly       | Current |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       |                  1 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    When Remove Job Scheduler from Enterprise Group
      | Group        | Name   | SchedulerName | Validation         |
      | Organization | JSORG1 | JPC_JS2       | Saved Successfully |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | TableContent  | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |               |                  1 |               30 | Monthly       | Current |
      | JPC_JS2       | No Data Found |                    |                  |               |         |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  16 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |

    #CSR_5368
  @CSR5155_77
  Scenario: Schedule Type= Monthly, job assignment starts from job start date and assigned within scheduler date range
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |           20 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | RepeatDays | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      25 | Monthly      |                  0 |               3 | Current          | JPC_J1 |            |           0 |              1 |           30 | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                  20 |                25 |               |               |        1 | Monthly       | Current |
  
  #CSR_5368
  @CSR5155_78
  Scenario: Schedule Type= Monthly, Job end date expiry and Job Assignment Process Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser3 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |           20 |         25 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |           15 |         16 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |           15 |         29 | Monthly          | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         10 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |        20 |      30 | Monthly      |                  0 |               3 | Current          | JPC_J1 |           0 |              1 |           30 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS1" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 |         |
      |   16 |         |
      |   17 |         |
      |   18 |         |
      |   19 |         |
      |   20 | JPC_J1  |
      |   21 | JPC_J1  |
      |   22 | JPC_J1  |
      |   23 | JPC_J1  |
      |   24 | JPC_J1  |
      |   25 | JPC_J1  |
      |   26 |         |
      |   27 |         |
      |   28 |         |
      |   29 |         |
      |   30 |         |
      |   31 |   |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser1"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS1       |                 20 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                  20 |                25 |               |               |        1 | Monthly       | Current |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS2          | true   |        15 |      30 | Monthly      |                  0 |               3 | Current          | JPC_J2 |           0 |             15 |           18 | true      | User Wise   | JPCUser2 | Saved Successfully |
      | JPC_JS3          | true   |         1 |      10 | Monthly      |                  0 |              -5 | Current          | JPC_J4 |           0 |              1 |           10 | true      | User Wise   | JPCUser3 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS2"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J2  |           0 |             15 |           18 | true   |
      | JPC_J3  |           0 |             19 |           30 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS2       | Succeed |
    Then Preview Schedule from Job Scheduler page for SchedulerName= "JPC_JS2" and ProcessingPeriod= "Current"
      | Date | JobCode |
      |    1 |         |
      |    2 |         |
      |    3 |         |
      |    4 |         |
      |    5 |         |
      |    6 |         |
      |    7 |         |
      |    8 |         |
      |    9 |         |
      |   10 |         |
      |   11 |         |
      |   12 |         |
      |   13 |         |
      |   14 |         |
      |   15 | JPC_J2  |
      |   16 | JPC_J2  |
      |   17 |         |
      |   18 |         |
      |   19 | JPC_J3  |
      |   20 | JPC_J3  |
      |   21 | JPC_J3  |
      |   22 | JPC_J3  |
      |   23 | JPC_J3  |
      |   24 | JPC_J3  |
      |   25 | JPC_J3  |
      |   26 | JPC_J3  |
      |   27 | JPC_J3  |
      |   28 | JPC_J3  |
      |   29 | JPC_J3  |
      |   30 |         |
      |   31 |   |
    And Verify Job Scheduler from User configuration for UserID= "JPCUser2"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS2       |                 15 |               30 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J2  |                  15 |                16 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  19 |                29 |               |               |        1 | Monthly       | Current |
    When Run Job Assignment Process for Month = "0" and Year = "0"
      | UserID   |
      | JPCUser3 |
    Then Verify Job Scheduler from User configuration for UserID= "JPCUser3"
      | SchedulerName | SchedulerStartDate | SchedulerEndDate | SchedulerType | Month   |
      | JPC_JS3       |                  1 |               10 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser3"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J4  |                   1 |                10 |               |               |        1 | Monthly       | Current |
 
  #CSR_5368
  @CSR5155_79
  Scenario: Schedule Type= Monthly, Inactive Job after assigned job scheduler
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
      | JPCUser2 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         15 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      15 | Monthly      |                  0 |               3 | Current          | JPC_J1 |           0 |              1 |           15 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                15 |               |               |        1 | Monthly       | Current |
    When Update configured jobs in Job Scheduler = "JPC_JS1" Schedule Run Time= "3"
      | JobSchedulerType | JobName         | NewMonthOfYear | ActualFromDayOfMonth | NewFromDayOfMonth | ActualToDayOfMonth | NewToDayOfMonth | Active |
      | Monthly          | JPC_J1 - JPC_J1 |                |                    1 |                   |                 15 |                 | false  |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | ScheduleType | ScheduleRunTime | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   | Monthly      |               3 | User Wise   | JPCUser2 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                15 |               |               |        1 | Monthly       | Current |
    And Verify Jobs from User configuration for UserID= "JPCUser2"
      | TableContent |
      | No Data      |

  #CSR_5368
  @CSR5155_80
  Scenario: Schedule Type= Monthly, Update Assignment Start, Assignment End, ESS Assignment and Verify Validations
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J3 | JPC_J3 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J4 | JPC_J4 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J5 | JPC_J5 |            1 |         30 | Monthly          | Saved Successfully |
    And Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      90 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |           10 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |            5 | true   |
      | JPC_J2  | Check All   |              6 |           10 | true   |
      | JPC_J3  | Check All   |             11 |           20 | true   |
      | JPC_J4  | Check All   |             21 |           25 | true   |
      | JPC_J5  | Check All   |             26 |           30 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                 5 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                   6 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J3  |                  11 |                20 |               |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 |               |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 |               |               |        1 | Monthly       | Current |
    When Update job from user configuration for UserID="JPCUser1"
      | JobCode | AssignmentStart | AssignmentEnd | NewAssignmentStartDate | NewAssignmentEndDate | ESSAssignment | JobSchedulerType |
      | JPC_J1  |               1 |             5 |                      2 |                      |               | Monthly          |
      | JPC_J2  |               6 |            10 |                        |                   11 |               | Monthly          |
      | JPC_J5  |              26 |            30 |                        |                      | false         | Monthly          |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   2 |                 5 | Yes           |               |        1 | Monthly       | Current |
      | JPC_J2  |                   6 |                11 | Yes           |               |        1 | Monthly       | Current |
      | JPC_J3  |                  11 |                20 | Yes           |               |        1 | Monthly       | Current |
      | JPC_J4  |                  21 |                25 | Yes           |               |        1 | Monthly       | Current |
      | JPC_J5  |                  26 |                30 | No            |               |        1 | Monthly       | Current |
    And Update job from user configuration for UserID="JPCUser1"
      | JobCode | AssignmentStart | AssignmentEnd | NewAssignmentStartDate | NewAssignmentEndDate | ESSAssignment | JobSchedulerType | Validation                                                      |
      | JPC_J1  |               2 |             5 |                    -31 |                      |               | Monthly          | Assignment Start Date should be later than or Equal to Job's... |
      | JPC_J2  |               6 |            11 |                        |                    5 |               | Monthly          | Assignment End Date should be later than or equal to Assignm... |
      | JPC_J3  |              11 |            20 |                        |                   32 |               | Monthly          | Assignment End Date should be earlier than or Equal to Job's... |
      | JPC_J4  |              21 |            25 |                     26 |                      |               | Monthly          | Assignment End Date should be later than or equal to Assignm... |

  #CSR_5368
  @CSR5155_81
  Scenario: Scheduler Type= Monthly, Make changes in scheduler after scheduler runs and wait to run again
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
      | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         30 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         30 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |         1 |      30 | Monthly      |                  0 |               3 | Current          | JPC_J1 | Check All   |              1 |           10 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | ScheduleType | ScheduleRunTime | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | ActiveJob | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   | Monthly      |               3 | JPC_J2 | Check All   |             11 |           20 | true      | User Wise   | JPCUser1 | Saved Successfully |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           20 | true   |
    Then Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month   |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Current |
      | JPC_J2  |                  11 |                20 |               |               |        1 | Monthly       | Current |

  #CSR-5657
  @CSR5155_82
  Scenario: Schedule Type= Monthly, Schedule Range for next month, Processing Period= Next
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | JPCUser1 |
      | JPCUser2 |
      | JPCUser3 |
    And Delete Worker via API
      | WorkerID |
      | JPCWrk_1 |
      | JPCWrk_2 |
    And Delete Job Scheduler
      | SchedulerName | Validation           |
      | JPC_JS1       | Deleted Successfully |
      | JPC_JS2       | Deleted Successfully |
      | JPC_JS3       | Deleted Successfully |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | JPC_J1  |
      | JPC_J2  |
      | JPC_J3  |
      | JPC_J4  |
     | JPC_J5  |
      | JPC_J6  |
    And Create user from user configuration
      | userid   | Active | AtdEnable | MaxPunchesToBeConsidered | JobCosting | Validation         |
      | JPCUser1 | True   | True      |                        2 | Enabled    | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | JobSchedulerType | Validation         |
      | JPC_J1 | JPC_J1 |            1 |         70 | Monthly          | Saved Successfully |
      | JPC_J2 | JPC_J2 |            1 |         70 | Monthly          | Saved Successfully |
    When Create Job Scheduler from JPC Module
      | JobSchedulerName | Active | StartDate | EndDate | ScheduleType | EveryDayOftheMonth | ScheduleRunTime | ProcessingPeriod | Job    | MonthOfYear | FromDayOfMonth | ToDayOfMonth | SelectUsers | UserID   | Validation         |
      | JPC_JS1          | true   |        32 |      61 | Monthly      |                  0 |               4 | Next             | JPC_J1 | Check All   |              1 |            5 | User Wise   | JPCUser1 | Saved Successfully |
    And Configure Job Parameters in Job Scheduler= "JPC_JS1"
      | JobName | MonthOfYear | FromDayOfMonth | ToDayOfMonth | Active |
      | JPC_J1  | Check All   |              1 |           10 | true   |
      | JPC_J2  | Check All   |             11 |           15 | true   |
    And Wait for "3" min
    And Verify Job Scheduler in Scheduler Log
      | SchedulerName | Status  |
      | JPC_JS1       | Succeed |
    And Verify Jobs from User configuration for UserID= "JPCUser1"
      | JobCode | AssignmentStartDate | AssignmentEndDate | ESSAssignment | PrioritizeJob | RowCount | SchedulerType | Month |
      | JPC_J1  |                   1 |                10 |               |               |        1 | Monthly       | Next  |
      | JPC_J2  |                  11 |                15 |               |               |        1 | Monthly       | Next  |
#########################################
