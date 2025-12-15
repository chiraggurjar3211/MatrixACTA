@tag
Feature: User Module Reports

  Background: All repx file datetime field can published value change in repx file.
    Given Open Cosec Web
    And Update value of can publish field for all .repx reports.

  @tag1
  Scenario Outline: Check IN/OUT Event report (Group By=Date) in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "In/Out Event" user module reports configuration
      | fromDate   | toDate     | GroupBy1     | GroupNeededInReport | GroupBy2 | NewPageForEachDateOrUser | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Organization | true                | Date     | true                     | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptDTInOut | XLS        | Compared |
      | rptDTInOut | PDF        | Compared |
      | rptDTInOut | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Check IN/OUT Event report(Group By=user) in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "In/Out Event" user module reports configuration
      | fromDate   | toDate     | GroupBy1     | GroupNeededInReport | GroupBy2 | NewPageForEachDateOrUser | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Organization | true                | User     | true                     | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptUserInOut | XLS        | Compared |
      | rptUserInOut | PDF        | Compared |
      | rptUserInOut | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag4_Format1
  Scenario Outline: Check In/Out Summary report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "In/Out Summary" user module reports configuration
      | fromDate   | GroupBy    | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | Department | Format 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptInOutSum      | XLS        | Compared |
      | rptInOutSumSub-1 | XLS        | Compared |
      | rptInOutSum      | xlsx       | Compared |
      | rptInOutSumSub-1 | xlsx       | Compared |
      | rptInOutSum      | pdf        | Compared |
      | rptInOutSumSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |
      
      @tag4_Format2
  Scenario Outline: Check In/Out Summary report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "In/Out Summary" user module reports configuration
      | fromDate   | GroupBy    | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | Department | Format 2 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptInOutSumFormat2      | XLS        | Compared |
      | rptInOutSumFormat2Sub-1 | XLS        | Compared |
      | rptInOutSumFormat2      | xlsx       | Compared |
      | rptInOutSumFormat2Sub-1 | xlsx       | Compared |
      | rptInOutSumFormat2      | pdf        | Compared |
      | rptInOutSumFormat2Sub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: Check Access Denied report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Access Denied" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptAccessDeniedDpt | XLS        | Compared |
      | rptAccessDeniedDpt | xlsx       | Compared |
      | rptAccessDeniedDpt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario: Check Panel-Wise Users  report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Panel-Wise Users" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptMasterwiseUser | XLS        | Compared |
      | rptMasterwiseUser | xlsx       | Compared |
      | rptMasterwiseUser | pdf        | Compared |

  @tag7
  Scenario: Check Door-Wise Users report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Door-Wise Users" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptDoorwiseUser | XLS        | Compared |
      | rptDoorwiseUser | xlsx       | Compared |
      | rptDoorwiseUser | pdf        | Compared |

  @tag8
  Scenario: Check User-Wise Controllers report in user module (Issue in Ordering. suggestion : Userid,MID,deviceName)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "User-Wise Controllers" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptUserwiseMCDoor | XLS        | Compared |
      | rptUserwiseMCDoor | xlsx       | Compared |
      | rptUserwiseMCDoor | pdf        | Compared |

  @tag9
  Scenario: Check Blocked Users report in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Blocked Users Report" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptUserBlk | XLS        | Compared |
      | rptUserBlk | xlsx       | Compared |
      | rptUserBlk | pdf        | Compared |

  @tag10
  Scenario Outline: Device Assignment Information in user module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Device Assignment Information" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptDeviceAssignmentInfo | XLS        | Compared |
      | rptDeviceAssignmentInfo | xlsx       | Compared |
      | rptDeviceAssignmentInfo | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag11
  Scenario: Access Profile Report in user Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Access Profile" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptUserACSProfileFR | XLS        | Compared |
      | rptUserACSProfileFR | xlsx       | Compared |
      | rptUserACSProfileFR | pdf        | Compared |

  @tag11
  Scenario: Personal Info Report in user Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Personal Info" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptUserPersonalInfo | XLS        | Compared |
      | rptUserPersonalInfo | xlsx       | Compared |
      | rptUserPersonalInfo | pdf        | Compared |

  @tag12
  Scenario: Contact Info Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Contact Info" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptUserContactInfo | XLS        | Compared |
      | rptUserContactInfo | xlsx       | Compared |
      | rptUserContactInfo | pdf        | Compared |

  @tag13
  Scenario: Offical Info Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Offical Info" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptUserOfficialInfo | XLS        | Compared |
      | rptUserOfficialInfo | xlsx       | Compared |
      | rptUserOfficialInfo | pdf        | Compared |

  @tag14
  Scenario Outline: Retirement Info Report in User Module(issue in mm/dd/yyyy format: Process Failed validation)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Retirement Info" user module reports configuration
      | fromDate   | toDate     | RetireAge | SelectUsers | ExportFormat |
      | 01/01/2017 | 31/12/2017 |        27 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptUserRetire | XLS        | Compared |
      | rptUserRetire | xlsx       | Compared |
      | rptUserRetire | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag15
  Scenario: Enrollment Info Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Enrollment Info" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptPendingEnrollment | XLS        | Compared |
      | rptPendingEnrollment | xlsx       | Compared |
      | rptPendingEnrollment | pdf        | Compared |

  @tag16
  Scenario Outline: Change group Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Change Group" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptGroupChange | XLS        | Compared |
      | rptGroupChange | xlsx       | Compared |
      | rptGroupChange | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag17
  Scenario: Biometric Enrollment Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Biometric Enrollment Report" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                         | FileFormat | Compare  |
      | rptUserBiometricEnrollmentInfo | XLS        | Compared |
      | rptUserBiometricEnrollmentInfo | xlsx       | Compared |
      | rptUserBiometricEnrollmentInfo | pdf        | Compared |

  @tag18
  Scenario Outline: Doors Accessed by user Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Doors Accessed by User" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptDoorsUsedByPersonDpt | XLS        | Compared |
      | rptDoorsUsedByPersonDpt | xlsx       | Compared |
      | rptDoorsUsedByPersonDpt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag19
  Scenario Outline: Doors Usage Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Doors Usage" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptDoorUsg | XLS        | Compared |
      | rptDoorUsg | xlsx       | Compared |
      | rptDoorUsg | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag20
  Scenario Outline: Former Users Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Former Users" user module reports configuration
      | Month | Year | SelectUsers | ExportFormat |
      | May   | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptUserResignation | XLS        | Compared |
      | rptUserResignation | xlsx       | Compared |
      | rptUserResignation | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag21
  Scenario Outline: New Joining Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "New Joining" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/01/2017 | 31/12/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptNewJoining | XLS        | Compared |
      | rptNewJoining | xlsx       | Compared |
      | rptNewJoining | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag22
  Scenario Outline: Pending Conformation Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Pending Confirmation" user module reports configuration
      | fromDate   | toDate     | ConformationPeriod | SelectUsers | ExportFormat |
      | 01/01/2017 | 31/12/2017 |                 10 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptPendingConfirmation | XLS        | Compared |
      | rptPendingConfirmation | xlsx       | Compared |
      | rptPendingConfirmation | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag23
  Scenario: Reporting Groups Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Reporting Groups" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptRepoGroupWiseUsers | XLS        | Compared |
      | rptRepoGroupWiseUsers | xlsx       | Compared |
      | rptRepoGroupWiseUsers | pdf        | Compared |

  @tag24
  Scenario: Users Without Reporting In-Charge Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Users Without Reporting In-Charge" user module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptUsersWORepoGrp | XLS        | Compared |
      | rptUsersWORepoGrp | xlsx       | Compared |
      | rptUsersWORepoGrp | pdf        | Compared |

  @tag25
  Scenario: User-Wise Policy Assignment Report in User Module(Fail due to file size)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "User-Wise Policy Assignment" user module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptUsePolicyInfo | XLS        | Compared |
      | rptUsePolicyInfo | xlsx       | Compared |
      | rptUsePolicyInfo | pdf        | Compared |

  @tag27
  Scenario Outline: Out Time Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Out Time" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptOutTime | XLS        | Compared |
      | rptOutTime | xlsx       | Compared |
      | rptOutTime | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag28
  Scenario Outline: User Event Interval Report in User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Event Interval" user module reports configuration
      | fromDate   | toDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptUserEventInterval | XLS        | Compared |
      | rptUserEventInterval | xlsx       | Compared |
      | rptUserEventInterval | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario: Panel Report in Device Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Panel" device module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptMasterController | XLS        | Compared |
      | rptMasterController | xlsx       | Compared |
      | rptMasterController | pdf        | Compared |

  @tag2
  Scenario: Door Report in Device Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Door" device module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptDoorController | XLS        | Compared |
      | rptDoorController | xlsx       | Compared |
      | rptDoorController | pdf        | Compared |

  @tag3
  Scenario Outline: Invalid Events Report in Device Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Invalid Events" device module reports configuration
      | fromDate   | toDate     | SelectDoors | ExportFormat |
      | 31/12/2016 | 02/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptInvalidUser | XLS        | Compared |
      | rptInvalidUser | xlsx       | Compared |
      | rptInvalidUser | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag4
  Scenario Outline: Device-Wise Event Report in Device Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Device-Wise Event" device module reports configuration
      | fromDate   | toDate     | SelectDoors | ExportFormat |
      | 31/12/2016 | 02/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptDevice-wiseEvent | XLS        | Compared |
      | rptDevice-wiseEvent | xlsx       | Compared |
      | rptDevice-wiseEvent | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: Door Offline Report in Device Module("Process Failed" while SystemDate=mm/dd/yyyy selected)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Door Offline" device module reports configuration
      | fromDate   | toDate     | FilterDevices | ExportFormat |
      | 31/12/2016 | 02/01/2024 | All           | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptDoorOffline | XLS        | Compared |
      | rptDoorOffline | xlsx       | Compared |
      | rptDoorOffline | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario Outline: Intercom Events Report in Device Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Intercom Events" device module reports configuration
      | fromDate   | toDate     | ExportFormat |
      | 31/12/2016 | 02/01/2024 | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptIntercomEvents | XLS        | Compared |
      | rptIntercomEvents | xlsx       | Compared |
      | rptIntercomEvents | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario: Organization Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Organization" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptOrganization | XLS        | Compared |
      | rptOrganization | PDF        | Compared |
      | rptOrganization | XLSX       | Compared |

  @tag2
  Scenario: Branch Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Branch" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptBranch | XLS        | Compared |
      | rptBranch | PDF        | Compared |
      | rptBranch | XLSX       | Compared |

  @tag3
  Scenario: Department Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Department" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptDepartment | XLS        | Compared |
      | rptDepartment | PDF        | Compared |
      | rptDepartment | XLSX       | Compared |

  @tag4
  Scenario: Designation Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Designation" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptDesignation | XLS        | Compared |
      | rptDesignation | PDF        | Compared |
      | rptDesignation | XLSX       | Compared |

  @tag5
  Scenario: Section Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Section" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptSection | XLS        | Compared |
      | rptSection | PDF        | Compared |
      | rptSection | XLSX       | Compared |

  @tag6
  Scenario: Category Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Category" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptCategory | XLS        | Compared |
      | rptCategory | PDF        | Compared |
      | rptCategory | XLSX       | Compared |

  @tag7
  Scenario: Grade Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Grade" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report   | FileFormat | Compare  |
      | rptGrade | XLS        | Compared |
      | rptGrade | PDF        | Compared |
      | rptGrade | XLSX       | Compared |

  @tag8
  Scenario: Custom Group1 Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Custom Group 1" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptCustomGroup1 | XLS        | Compared |
      | rptCustomGroup1 | PDF        | Compared |
      | rptCustomGroup1 | XLSX       | Compared |

  @tag9
  Scenario: Custom Group2 Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Custom Group 2" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptCustomGroup2 | XLS        | Compared |
      | rptCustomGroup2 | PDF        | Compared |
      | rptCustomGroup2 | XLSX       | Compared |

  @tag10
  Scenario: Custom Group3 Report of Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Custom Group 3" enterprise module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptCustomGroup3 | XLS        | Compared |
      | rptCustomGroup3 | PDF        | Compared |
      | rptCustomGroup3 | XLSX       | Compared |

  @tag1
  Scenario: Shift Report in ShiftSchedule Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Shift" shiftschedule module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptShiftMst | XLS        | Compared |
      | rptShiftMst | PDF        | Compared |
      | rptShiftMst | XLSX       | Compared |

  @tag2
  Scenario: Schedule Groups Report in ShiftSchedule Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Schedule Groups" shiftschedule module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptShiftSchGrp | XLS        | Compared |
      | rptShiftSchGrp | PDF        | Compared |
      | rptShiftSchGrp | XLSX       | Compared |

  @tag3
  Scenario Outline: Holiday Schedules Report in ShiftSchedule Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Holiday Schedules" shiftschedule module reports configuration
      | SelectSchedules | ExportFormat |
      | All             | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptHolidaySch | XLS        | Compared |
      | rptHolidaySch | PDF        | Compared |
      | rptHolidaySch | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag4
  Scenario: Shift Schedules Report in ShiftSchedule Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Shift Schedule" shiftschedule module reports configuration
      | Month | Year | SelectUsers | ExportFormat |
      | April | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptScheduledShift | XLS        | Compared |
      | rptScheduledShift | PDF        | Compared |
      | rptScheduledShift | XLSX       | Compared |

  @tag5
  Scenario Outline: Week-Off Change Report in ShiftSchedule Module (No data in Existing Database)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Week-Off Change" shiftschedule module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 03/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptWeekoffChange | XLS        | Compared |
      | rptWeekoffChange | PDF        | Compared |
      | rptWeekoffChange | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario: Access Zone Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Access Zone" Access Control module reports configuration
      | SelectPanels | ExportFormat |
      | All          | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptAccessZone | XLS        | Compared |
      | rptAccessZone | xlsx       | Compared |
      | rptAccessZone | pdf        | Compared |

  @tag2
  Scenario: Time Zone Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Time Zone" Access Control module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptTimeZoneList | XLS        | Compared |
      | rptTimeZoneList | xlsx       | Compared |
      | rptTimeZoneList | pdf        | Compared |

  @tag3
  Scenario: Access Group Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Access Group" Access Control module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptAccessGroup | XLS        | Compared |
      | rptAccessGroup | xlsx       | Compared |
      | rptAccessGroup | pdf        | Compared |

  @tag4
  Scenario: Functional Group Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Functional Group" Access Control module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptFunctionalGrpList | XLS        | Compared |
      | rptFunctionalGrpList | xlsx       | Compared |
      | rptFunctionalGrpList | pdf        | Compared |

  @tag5
  Scenario: 2-Person Group Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "2-Person Group" Access Control module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rpt2PersonGrpList | XLS        | Compared |
      | rpt2PersonGrpList | xlsx       | Compared |
      | rpt2PersonGrpList | pdf        | Compared |

  @tag6
  Scenario: Access Group-Wise Time Zone Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Access Group-Wise Time Zone" Access Control module reports configuration
      | SelectAccessGroups | ExportFormat |
      | All                | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptAGwiseTimeZone | XLS        | Compared |
      | rptAGwiseTimeZone | xlsx       | Compared |
      | rptAGwiseTimeZone | pdf        | Compared |

  @tag7
  Scenario: Input Port Group Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Input Port Group" Access Control module reports configuration
      | SelectPanels | ExportFormat |
      | All          | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptInputPortGroup | XLS        | Compared |
      | rptInputPortGroup | xlsx       | Compared |
      | rptInputPortGroup | pdf        | Compared |

  @tag8
  Scenario: Output Port Group Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Output Port Group" Access Control module reports configuration
      | SelectPanels | ExportFormat |
      | All          | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptOutputPortGroup | XLS        | Compared |
      | rptOutputPortGroup | xlsx       | Compared |
      | rptOutputPortGroup | pdf        | Compared |

  @tag9
  Scenario: Panels Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Panels" Access Control module reports configuration
      | SelectPanels | ExportFormat |
      | All          | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptIOGroup | XLS        | Compared |
      | rptIOGroup | xlsx       | Compared |
      | rptIOGroup | pdf        | Compared |

  @tag10
  Scenario: Direct Doors Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Direct Doors" Access Control module reports configuration
      | SelectDirectDoors | ExportFormat |
      | All               | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptIOGroupV2 | XLS        | Compared |
      | rptIOGroupV2 | xlsx       | Compared |
      | rptIOGroupV2 | pdf        | Compared |

  @tag11
  Scenario: First IN User Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "First IN User" Access Control module reports configuration
      | SelectFirstInUserGroup | ExportFormat |
      | All                    | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptFirstInUserList | XLS        | Compared |
      | rptFirstInUserList | xlsx       | Compared |
      | rptFirstInUserList | pdf        | Compared |

  @tag12
  Scenario Outline: Zones Accessed by User Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Zones Accessed by User" Access Control module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptPersonInZone | XLS        | Compared |
      | rptPersonInZone | xlsx       | Compared |
      | rptPersonInZone | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag13
  Scenario Outline: 2-Person Access Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "2-Person Access" Access Control module reports configuration
      | FromDate   | ToDate     | SelectDoors | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                    | FileFormat | Compare  |
      | rpt2PersonRuleTransaction | XLS        | Compared |
      | rpt2PersonRuleTransaction | xlsx       | Compared |
      | rpt2PersonRuleTransaction | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag14
  Scenario: Guard Tour Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Guard Tour" Access Control module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptGuardTourList | XLS        | Compared |
      | rptGuardTourList | xlsx       | Compared |
      | rptGuardTourList | pdf        | Compared |

  @tag15
  Scenario Outline: Tour Details Report of format1 in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Tour Details" Access Control module reports configuration
      | FromDate   | ToDate     | Format   | SelectTours | ExportFormat |
      | 01/05/2022 | 10/05/2022 | Format 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptGuardTourDetail | XLS        | Compared |
      | rptGuardTourDetail | xlsx       | Compared |
      | rptGuardTourDetail | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag16
  Scenario: Access Route Master Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Access Route Master" Access Control module reports configuration
      | SelectPanel | SelectAccessRoute | ExportFormat |
      | All         | All               | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptAccessRouteMaster | XLS        | Compared |
      | rptAccessRouteMaster | xlsx       | Compared |
      | rptAccessRouteMaster | pdf        | Compared |

  @tag17
  Scenario Outline: Elevator Access Report Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Elevator Access Report" Access Control module reports configuration
      | FromDate   | ToDate     | SelectElevator | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All            | xls,xlsx,pdf |
    Then Validate report
      | Report                      | FileFormat | Compare  |
      | rptElevatorWiseUsrACSReport | XLS        | Compared |
      | rptElevatorWiseUsrACSReport | xlsx       | Compared |
      | rptElevatorWiseUsrACSReport | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag18
  Scenario: Elevator Floor Group Master Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Elevator Floor Group Master" Access Control module reports configuration
      | SelectElevatorFloorGroup | GenerateReportFor | ExportFormat |
      | All                      | All Users         | xls,xlsx,pdf |
    Then Validate report
      | Report                         | FileFormat | Compare  |
      | rptElevatorFloorGrpMaster      | XLS        | Compared |
      | rptElevatorFloorGrpMaster      | xlsx       | Compared |
      | rptElevatorFloorGrpMaster      | pdf        | Compared |
      | rptElevatorFloorGrpMasterSub-1 | XLS        | Compared |
      | rptElevatorFloorGrpMasterSub-1 | xlsx       | Compared |
      | rptElevatorFloorGrpMasterSub-1 | pdf        | Compared |

  @tag19
  Scenario Outline: Door Held Open Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Door Held Open" Access Control module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 31/12/2016 | 04/01/2024 | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptExcessiveDoor | XLS        | Compared |
      | rptExcessiveDoor | xlsx       | Compared |
      | rptExcessiveDoor | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag20
  Scenario Outline: Alarm Details Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Alarm Details" Access Control module reports configuration
      | FromDate   | ToDate     | SelectDevices | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All           | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptAlarmDetails | XLS        | Compared |
      | rptAlarmDetails | xlsx       | Compared |
      | rptAlarmDetails | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag21
  Scenario Outline: Emergency Evacuation Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Emergency Evacuation" Access Control module reports configuration
      | FromDate   | ToDate     | UserType | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Users    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                      | FileFormat | Compare  |
      | rptEmergencyEvacuation      | XLS        | Compared |
      | rptEmergencyEvacuation      | xlsx       | Compared |
      | rptEmergencyEvacuation      | pdf        | Compared |
      | rptEmergencyEvacuationSub-1 | XLS        | Compared |
      | rptEmergencyEvacuationSub-1 | xlsx       | Compared |
      | rptEmergencyEvacuationSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag22
  Scenario Outline: Emergency Evacuation Report in Access Control Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Emergency Evacuation" Access Control module reports configuration
      | FromDate   | ToDate     | UserType | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Both     | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                                 | FileFormat | Compare  |
      | rptUserVisitorEmergencyEvacuation      | XLS        | Compared |
      | rptUserVisitorEmergencyEvacuation      | xlsx       | Compared |
      | rptUserVisitorEmergencyEvacuation      | pdf        | Compared |
      | rptUserVisitorEmergencyEvacuationSub-1 | XLS        | Compared |
      | rptUserVisitorEmergencyEvacuationSub-1 | xlsx       | Compared |
      | rptUserVisitorEmergencyEvacuationSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario Outline: Check Monthly Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Monthly Details" Time and Attendence module reports configuration
      | forMonth | forYear | FormatSelection | SelectUsers | ExportFormat |
      | April    |    2017 | Count-Wise      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptMonDetCount | XLS        | Compared |
      | rptMonDetCount | PDF        | Compared |
      | rptMonDetCount | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Late-IN Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Late-IN" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptLateIn | XLS        | Compared |
      | rptLateIn | xlsx       | Compared |
      | rptLateIn | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag3
  Scenario Outline: Early-IN Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Early-IN" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptEarlyIn | XLS        | Compared |
      | rptEarlyIn | xlsx       | Compared |
      | rptEarlyIn | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag4
  Scenario Outline: Early-OUT Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Early-OUT" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptEarlyOut | XLS        | Compared |
      | rptEarlyOut | xlsx       | Compared |
      | rptEarlyOut | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: Overstay Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Overstay" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptOverstay | XLS        | Compared |
      | rptOverstay | xlsx       | Compared |
      | rptOverstay | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | Date    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptDtAttendance | XLS        | Compared |
      | rptDtAttendance | xlsx       | Compared |
      | rptDtAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag7
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 | Date    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptDtAttendance6p | XLS        | Compared |
      | rptDtAttendance6p | xlsx       | Compared |
      | rptDtAttendance6p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag8
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 3 | Date    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptDtAttendance12p | XLS        | Compared |
      | rptDtAttendance12p | xlsx       | Compared |
      | rptDtAttendance12p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag9
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 4 | Date    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptDtAttendancetemp4 | XLS        | Compared |
      | rptDtAttendancetemp4 | xlsx       | Compared |
      | rptDtAttendancetemp4 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag10
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | Date    | Disabled  | True            | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                    | FileFormat | Compare  |
      | rptDtAttendanceLessFields | XLS        | Compared |
      | rptDtAttendanceLessFields | xlsx       | Compared |
      | rptDtAttendanceLessFields | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag11
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | User    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptAttendance | XLS        | Compared |
      | rptAttendance | xlsx       | Compared |
      | rptAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag12
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 | User    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptAttendance6p | XLS        | Compared |
      | rptAttendance6p | xlsx       | Compared |
      | rptAttendance6p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag13
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 3 | User    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptAttendance12p | XLS        | Compared |
      | rptAttendance12p | xlsx       | Compared |
      | rptAttendance12p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag14
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 4 | User    | Disabled  |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptAttendancetemp4 | XLS        | Compared |
      | rptAttendancetemp4 | xlsx       | Compared |
      | rptAttendancetemp4 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag15
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup            | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | Date    | For Enterprise Group |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptGpDtAttendance | XLS        | Compared |
      | rptGpDtAttendance | xlsx       | Compared |
      | rptGpDtAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag16
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup            | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 | Date    | For Enterprise Group |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptGpDtAttendance6p | XLS        | Compared |
      | rptGpDtAttendance6p | xlsx       | Compared |
      | rptGpDtAttendance6p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag17
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup            | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 3 | Date    | For Enterprise Group |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptGpDtAttendance12p | XLS        | Compared |
      | rptGpDtAttendance12p | xlsx       | Compared |
      | rptGpDtAttendance12p | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag18
  Scenario Outline: Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | GroupBy | EachGroup            | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 4 | Date    | For Enterprise Group |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptGpDtAttendancetemp4 | XLS        | Compared |
      | rptGpDtAttendancetemp4 | xlsx       | Compared |
      | rptGpDtAttendancetemp4 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag19
  Scenario Outline: Attendance Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptAtdSum      | XLS        | Compared |
      | rptAtdSum      | xlsx       | Compared |
      | rptAtdSum      | pdf        | Compared |
      | rptAtdSumSub-1 | XLS        | Compared |
      | rptAtdSumSub-1 | xlsx       | Compared |
      | rptAtdSumSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag20
  Scenario Outline: Attendance Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | True            | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptAtdSumLessFields      | XLS        | Compared |
      | rptAtdSumLessFields      | xlsx       | Compared |
      | rptAtdSumLessFields      | pdf        | Compared |
      | rptAtdSumLessFieldsSub-1 | XLS        | Compared |
      | rptAtdSumLessFieldsSub-1 | xlsx       | Compared |
      | rptAtdSumLessFieldsSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag21
  Scenario Outline: Attendance Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | ShowLessDetials | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 |                 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptAtdSumFormat2 | XLS        | Compared |
      | rptAtdSumFormat2 | xlsx       | Compared |
      | rptAtdSumFormat2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag22
  Scenario Outline: Late Arrival Memo Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Late Arrival Memo" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptLateMemo | XLS        | Compared |
      | rptLateMemo | xlsx       | Compared |
      | rptLateMemo | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag23
  Scenario Outline: Grace Time Usage Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Grace Time Usage" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptGraceTime | XLS        | Compared |
      | rptGraceTime | xlsx       | Compared |
      | rptGraceTime | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag24
  Scenario Outline: N-Punch Work Hours Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "N-Punch Work Hours" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User Then Date | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptNetWorkTime | XLS        | Compared |
      | rptNetWorkTime | xlsx       | Compared |
      | rptNetWorkTime | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag25
  Scenario Outline: N-Punch Work Hours Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "N-Punch Work Hours" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date Then User | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptNetWorkTimeDt | XLS        | Compared |
      | rptNetWorkTimeDt | xlsx       | Compared |
      | rptNetWorkTimeDt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag26
  Scenario Outline: Daily Work Hours Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Work Hours" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptAttendanceNF | XLS        | Compared |
      | rptAttendanceNF | xlsx       | Compared |
      | rptAttendanceNF | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag27
  Scenario Outline: Daily Work Hours Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Work Hours" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptDtAttendanceNF | XLS        | Compared |
      | rptDtAttendanceNF | xlsx       | Compared |
      | rptDtAttendanceNF | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag28
  Scenario Outline: Absent Adjustments Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When "Absent Adjustments" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptMonthlyAtdAdj | XLS        | Compared |
      | rptMonthlyAtdAdj | xlsx       | Compared |
      | rptMonthlyAtdAdj | pdf        | Compared |

  @tag29
  Scenario Outline: Hourly Attendance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Hourly Attendance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptHourlyAttendance | XLS        | Compared |
      | rptHourlyAttendance | xlsx       | Compared |
      | rptHourlyAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag30
  Scenario Outline: Work Hours Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Work Hours Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptWorkHoursSummary | XLS        | Compared |
      | rptWorkHoursSummary | xlsx       | Compared |
      | rptWorkHoursSummary | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag31
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format      | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | All Punches | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat1 | XLS        | Compared |
      | rptDailyDetailFormat1 | xlsx       | Compared |
      | rptDailyDetailFormat1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag32
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format               | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | All Punch and Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat2 | XLS        | Compared |
      | rptDailyDetailFormat2 | xlsx       | Compared |
      | rptDailyDetailFormat2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag33
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format           | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | First-Last Punch | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat3 | XLS        | Compared |
      | rptDailyDetailFormat3 | xlsx       | Compared |
      | rptDailyDetailFormat3 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag34
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format                       | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | First-Last Punch with Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat4 | XLS        | Compared |
      | rptDailyDetailFormat4 | xlsx       | Compared |
      | rptDailyDetailFormat4 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag35
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format                | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Date    | Working Hours Details | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat5 | XLS        | Compared |
      | rptDailyDetailFormat5 | xlsx       | Compared |
      | rptDailyDetailFormat5 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag36
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format      | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | All Punches | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat6 | XLS        | Compared |
      | rptDailyDetailFormat6 | xlsx       | Compared |
      | rptDailyDetailFormat6 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag37
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format               | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | All Punch and Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat7 | XLS        | Compared |
      | rptDailyDetailFormat7 | xlsx       | Compared |
      | rptDailyDetailFormat7 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag38
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format           | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | First-Last Punch | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat8 | XLS        | Compared |
      | rptDailyDetailFormat8 | xlsx       | Compared |
      | rptDailyDetailFormat8 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag39
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format                       | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | First-Last Punch with Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptDailyDetailFormat9 | XLS        | Compared |
      | rptDailyDetailFormat9 | xlsx       | Compared |
      | rptDailyDetailFormat9 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag40
  Scenario Outline: Daily Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | GroupBy | Format                | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | User    | Working Hours Details | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptDailyDetailFormat10 | XLS        | Compared |
      | rptDailyDetailFormat10 | xlsx       | Compared |
      | rptDailyDetailFormat10 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag41
  Scenario Outline: Daily Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format        | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Daily Summary | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptDailySummaryFormat1 | XLS        | Compared |
      | rptDailySummaryFormat1 | xlsx       | Compared |
      | rptDailySummaryFormat1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag42
  Scenario Outline: Daily Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format                    | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Daily Summary with Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptDailySummaryFormat2 | XLS        | Compared |
      | rptDailySummaryFormat2 | xlsx       | Compared |
      | rptDailySummaryFormat2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag43
  Scenario Outline: Daily Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format         | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Daily Analysis | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptDailySummaryFormat3 | XLS        | Compared |
      | rptDailySummaryFormat3 | xlsx       | Compared |
      | rptDailySummaryFormat3 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag44
  Scenario Outline: Daily Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format                     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Daily Analysis with Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptDailySummaryFormat4 | XLS        | Compared |
      | rptDailySummaryFormat4 | xlsx       | Compared |
      | rptDailySummaryFormat4 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag45
  Scenario Outline: Daily Work Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Work Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptDailyWorkDetails | XLS        | Compared |
      | rptDailyWorkDetails | xlsx       | Compared |
      | rptDailyWorkDetails | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag46
  Scenario Outline: Break Deviation Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Break Deviation" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptBreakDeviationrpt | XLS        | Compared |
      | rptBreakDeviationrpt | xlsx       | Compared |
      | rptBreakDeviationrpt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag47
  Scenario Outline: Shift-Wise Count Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Shift-Wise Count Summary" Time and Attendence module reports configuration
      | FromDate   | SelectUsers | ExportFormat |
      | 01/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptShiftWiseCount | XLS        | Compared |
      | rptShiftWiseCount | xlsx       | Compared |
      | rptShiftWiseCount | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag48
  Scenario Outline: First IN-Last OUT Punch Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "First IN-Last OUT Punch Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptFirstInLastOutPunches | XLS        | Compared |
      | rptFirstInLastOutPunches | xlsx       | Compared |
      | rptFirstInLastOutPunches | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag49
  Scenario Outline: Absentee Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Absentee" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptAbsentee | XLS        | Compared |
      | rptAbsentee | xlsx       | Compared |
      | rptAbsentee | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag50
  Scenario Outline: Absenteeism Memo Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Absenteeism Memo" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptAbsentMemo | XLS        | Compared |
      | rptAbsentMemo | xlsx       | Compared |
      | rptAbsentMemo | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag51
  Scenario Outline: Continuous Absence/Presence Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Continuous Absence/Presence" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptContAbs | XLS        | Compared |
      | rptContAbs | xlsx       | Compared |
      | rptContAbs | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag52
  Scenario Outline: Week-Off & Holiday Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Week-Off & Holiday" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 02/02/2022 | 28/02/2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report  | FileFormat | Compare  |
      | rptWOPH | XLS        | Compared |
      | rptWOPH | xlsx       | Compared |
      | rptWOPH | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag53
  Scenario Outline: User Field Break Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Field Break" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptFieldBreak | XLS        | Compared |
      | rptFieldBreak | xlsx       | Compared |
      | rptFieldBreak | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag54
  Scenario Outline: Overtime Report Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Overtime Report" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptOvertime | XLS        | Compared |
      | rptOvertime | xlsx       | Compared |
      | rptOvertime | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag55
  Scenario Outline: Overtime Details Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Overtime Details" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptOvertimeDet | XLS        | Compared |
      | rptOvertimeDet | xlsx       | Compared |
      | rptOvertimeDet | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag56
  Scenario Outline: Total Head Count & Overtime Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Total Head Count & Overtime" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptHeadCountOT | XLS        | Compared |
      | rptHeadCountOT | xlsx       | Compared |
      | rptHeadCountOT | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag57
  Scenario Outline: User Presence & Overtime Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Presence & Overtime" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptSiteWiseAttendance | XLS        | Compared |
      | rptSiteWiseAttendance | xlsx       | Compared |
      | rptSiteWiseAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag58
  Scenario Outline: Weekly Working Hrs & Overtime Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Weekly Working Hrs & Overtime" Time and Attendence module reports configuration
      | FromDate   | SelectUsers | ExportFormat |
      | 01/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptWrkOTWeekly | XLS        | Compared |
      | rptWrkOTWeekly | xlsx       | Compared |
      | rptWrkOTWeekly | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag59
  Scenario Outline: Daily Overtime Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Overtime Summary" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptDailyOvertimeSum | XLS        | Compared |
      | rptDailyOvertimeSum | xlsx       | Compared |
      | rptDailyOvertimeSum | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag60
  Scenario Outline: Exceptions Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Exceptions" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptException | XLS        | Compared |
      | rptException | xlsx       | Compared |
      | rptException | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag61
  Scenario Outline: Attendance Exception Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Exception" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptAttendanceException | XLS        | Compared |
      | rptAttendanceException | xlsx       | Compared |
      | rptAttendanceException | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag62
  Scenario Outline: Attendance Exception Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Exception" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                        | FileFormat | Compare  |
      | rptAttendanceExceptionFormat2 | XLS        | Compared |
      | rptAttendanceExceptionFormat2 | xlsx       | Compared |
      | rptAttendanceExceptionFormat2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag63
  Scenario Outline: Attendance Exception Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Exception" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 3 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                        | FileFormat | Compare  |
      | rptAttendanceExceptionFormat3 | XLS        | Compared |
      | rptAttendanceExceptionFormat3 | xlsx       | Compared |
      | rptAttendanceExceptionFormat3 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag64
  Scenario Outline: Manual Correction Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Manual Correction" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptManualAtdCorrection | XLS        | Compared |
      | rptManualAtdCorrection | xlsx       | Compared |
      | rptManualAtdCorrection | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag65
  Scenario Outline: Manual Correction Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Manual Correction" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format   | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Format 2 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptManualAtdCorrection2 | XLS        | Compared |
      | rptManualAtdCorrection2 | xlsx       | Compared |
      | rptManualAtdCorrection2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag66
  Scenario Outline: Pending Authorization Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Pending Authorization" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptPendingAuth | XLS        | Compared |
      | rptPendingAuth | xlsx       | Compared |
      | rptPendingAuth | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag67
  Scenario Outline: Special Function Punch Report in T&A Module(Always Failed due to excel current date time consider so)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Special Function Punch" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Event-Wise | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptSPFPunch | XLS        | Compared |
      | rptSPFPunch | xlsx       | Compared |
      | rptSPFPunch | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag68
  Scenario Outline: Special Function Punch Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Special Function Punch" Time and Attendence module reports configuration
      | FromDate   | ToDate     | Format     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | Punch-Wise | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptSPFPunchFormat2 | XLS        | Compared |
      | rptSPFPunchFormat2 | xlsx       | Compared |
      | rptSPFPunchFormat2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag69
  Scenario Outline: Shift Change Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Shift Change" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptSftChg | XLS        | Compared |
      | rptSftChg | xlsx       | Compared |
      | rptSftChg | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag70
  Scenario: Shift Allowance Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Shift Allowance" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptshiftalw | XLS        | Compared |
      | rptshiftalw | xlsx       | Compared |
      | rptshiftalw | pdf        | Compared |

  @tag71
  Scenario Outline: Authorization Status Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Authorization Status" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptAuthStatus | XLS        | Compared |
      | rptAuthStatus | xlsx       | Compared |
      | rptAuthStatus | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag72
  Scenario: Muster Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Muster Summary" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptMusterSum | XLS        | Compared |
      | rptMusterSum | xlsx       | Compared |
      | rptMusterSum | pdf        | Compared |

  @tag73
  Scenario Outline: Previous Adjustment Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Previous Adjustment Summary" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptPrevAdjSum | XLS        | Compared |
      | rptPrevAdjSum | xlsx       | Compared |
      | rptPrevAdjSum | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag74
  Scenario: Salary Data Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Salary Data" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptSalaryData | XLS        | Compared |
      | rptSalaryData | xlsx       | Compared |
      | rptSalaryData | pdf        | Compared |

  @tag75
  Scenario: Absentee Detail Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Absentee Detail" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptAbsDet | XLS        | Compared |
      | rptAbsDet | xlsx       | Compared |
      | rptAbsDet | pdf        | Compared |

  @tag76
  Scenario: Check Monthly Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Details" Time and Attendence module reports configuration
      | forMonth | forYear | FormatSelection | SelectUsers | ExportFormat |
      | February |    2022 | Day-Wise        | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptMonDetDayWise | XLS        | Compared |
      | rptMonDetDayWise | PDF        | Compared |
      | rptMonDetDayWise | XLSX       | Compared |

  @tag77
  Scenario Outline: Check Monthly Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Details" Time and Attendence module reports configuration
      | forMonth | forYear | FormatSelection      | SelectUsers | ExportFormat |
      | February |    2022 | Day-Wise with Status | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptMonDetDayWiseWithStat | XLS        | Compared |
      | rptMonDetDayWiseWithStat | PDF        | Compared |
      | rptMonDetDayWiseWithStat | XLSX       | Compared |

  @tag78
  Scenario Outline: Check Monthly Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Monthly Details" Time and Attendence module reports configuration
      | forMonth | forYear | FormatSelection       | SelectUsers | ExportFormat |
      | February |    2022 | Month-Wise Attendance | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptMonAtdSum | XLS        | Compared |
      | rptMonAtdSum | PDF        | Compared |
      | rptMonAtdSum | XLSX       | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag79
  Scenario: Check Monthly Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Details" Time and Attendence module reports configuration
      | forMonth | forYear | FormatSelection        | SelectUsers | ExportFormat |
      | February |    2022 | Status & Count Summary | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptCountWiseMonSum | XLS        | Compared |
      | rptCountWiseMonSum | PDF        | Compared |
      | rptCountWiseMonSum | XLSX       | Compared |

  @tag80
  Scenario: Monthly Summary report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Summary" Time and Attendence module reports configuration
      | Month    | Year | Format         | SelectUsers | ExportFormat |
      | February | 2022 | Status Summary | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptMonStatusSum | XLS        | Compared |
      | rptMonStatusSum | PDF        | Compared |
      | rptMonStatusSum | XLSX       | Compared |

  @tag81
  Scenario: Monthly Summary report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Summary" Time and Attendence module reports configuration
      | Month    | Year | Format             | SelectUsers | ExportFormat |
      | February | 2022 | Work Hours Summary | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptMonWrkHrsSum | XLS        | Compared |
      | rptMonWrkHrsSum | PDF        | Compared |
      | rptMonWrkHrsSum | XLSX       | Compared |

  @tag82
  Scenario: Monthly Log report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Log" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptMonthlyLog | XLS        | Compared |
      | rptMonthlyLog | PDF        | Compared |
      | rptMonthlyLog | XLSX       | Compared |

  @tag83
  Scenario: Shift Details report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Shift Details" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptShiftDetails | XLS        | Compared |
      | rptShiftDetails | PDF        | Compared |
      | rptShiftDetails | XLSX       | Compared |

  @tag84
  Scenario: Head Count report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Head Count" Time and Attendence module reports configuration
      | Month    | Year | ExportFormat |
      | February | 2022 | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptShiftWiseHeadCnt | XLS        | Compared |
      | rptShiftWiseHeadCnt | PDF        | Compared |
      | rptShiftWiseHeadCnt | XLSX       | Compared |

  @tag85
  Scenario: Flexible Summary report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Flexible Summary" Time and Attendence module reports configuration
      | Month | Year | Target | SelectUsers | ExportFormat |
      | April | 2017 | None   | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptFlexibleSumNone | XLS        | Compared |
      | rptFlexibleSumNone | PDF        | Compared |
      | rptFlexibleSumNone | XLSX       | Compared |

  @tag86
  Scenario: Flexible Summary report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Flexible Summary" Time and Attendence module reports configuration
      | Month    | Year | Target | SelectUsers | ExportFormat |
      | February | 2022 | Weekly | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptFlexibleSumWeekly | XLS        | Compared |
      | rptFlexibleSumWeekly | PDF        | Compared |
      | rptFlexibleSumWeekly | XLSX       | Compared |

  @tag87
  Scenario Outline: Flexible Summary report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Flexible Summary" Time and Attendence module reports configuration
      | Month | Year | Target  | SelectUsers | ExportFormat |
      | April | 2017 | Monthly | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptFlexibleSumMonthly | XLS        | Compared |
      | rptFlexibleSumMonthly | PDF        | Compared |
      | rptFlexibleSumMonthly | XLSX       | Compared |

  @tag88
  Scenario: Attendance Register report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Attendance Register" Time and Attendence module reports configuration
      | Month    | Year | Format                | SelectUsers | ExportFormat |
      | February | 2022 | Attendance Register 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptAttendanceReg | XLS        | Compared |
      | rptAttendanceReg | PDF        | Compared |
      | rptAttendanceReg | XLSX       | Compared |

  @tag89
  Scenario: Attendance Register report in T&A module(Always Fail due to page load)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Attendance Register" Time and Attendence module reports configuration
      | Month    | Year | Format                | SelectUsers | ExportFormat |
      | February | 2022 | Attendance Register 2 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptAttendanceRegLf | XLS        | Compared |
      | rptAttendanceRegLf | PDF        | Compared |
      | rptAttendanceRegLf | XLSX       | Compared |

  @tag90
  Scenario: Late-IN Register report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Late-IN Register" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptLateInReg | XLS        | Compared |
      | rptLateInReg | PDF        | Compared |
      | rptLateInReg | XLSX       | Compared |

  @tag91
  Scenario: Early-OUT Register report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Early-OUT Register" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptEarlyOutReg | XLS        | Compared |
      | rptEarlyOutReg | PDF        | Compared |
      | rptEarlyOutReg | XLSX       | Compared |

  @tag92
  Scenario: Overtime Register report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Overtime Register" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptOvertimeReg | XLS        | Compared |
      | rptOvertimeReg | PDF        | Compared |
      | rptOvertimeReg | XLSX       | Compared |

  @tag93
  Scenario: Yearly Performance report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Yearly Performance" Time and Attendence module reports configuration
      | forMonth | forYear | toMonth | toYear | Format   | SelectUsers | ExportFormat |
      | February |    2022 | January |   2023 | Format 1 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptYearlyPerformance | XLS        | Compared |
      | rptYearlyPerformance | PDF        | Compared |
      | rptYearlyPerformance | XLSX       | Compared |

  @tag94
  Scenario: Yearly Performance report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Yearly Performance" Time and Attendence module reports configuration
      | forMonth | forYear | toMonth | toYear | Format   | SelectUsers | ExportFormat |
      | February |    2022 | January |   2023 | Format 2 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                      | FileFormat | Compare  |
      | rptYearlyPerformanceFormat2 | XLS        | Compared |
      | rptYearlyPerformanceFormat2 | PDF        | Compared |
      | rptYearlyPerformanceFormat2 | XLSX       | Compared |

  @tag95
  Scenario Outline: Form T Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Form T" Time and Attendence module reports configuration
      | Month    | Year | Message | OrgName | OrgAddress | LeaveId  | SelectUsers | ExportFormat |
      | February | 2022 | Kamal   | Matrix  | RND1       | CR,P1,PL | All         | xls,xlsx,pdf |
    Then Validate report
      | Report   | FileFormat | Compare  |
      | rptFormT | XLS        | Compared |
      | rptFormT | xlsx       | Compared |
      | rptFormT | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag96
  Scenario Outline: Form 18 Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Form 18" Time and Attendence module reports configuration
      | Year | Message | OrgName | OrgAddress | LeaveId  | SelectUsers | ExportFormat |
      | 2022 | Kamal   | Matrix  | RND1       | CR,P1,PL | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptForm18 | XLS        | Compared |
      | rptForm18 | xlsx       | Compared |
      | rptForm18 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag97
  Scenario Outline: Form 28 Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Form 28" Time and Attendence module reports configuration
      | Month    | Year | Format   | Message | OrgName | OrgAddress | SelectUsers | ExportFormat |
      | February | 2022 | Format 1 | Kamal   | Matrix  | RND1       | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptForm28 | XLS        | Compared |
      | rptForm28 | xlsx       | Compared |
      | rptForm28 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag98
  Scenario Outline: Form 28 Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Form 28" Time and Attendence module reports configuration
      | Month    | Year | Format   | Message | OrgName | OrgAddress | SelectUsers | ExportFormat |
      | February | 2022 | Format 2 | Kamal   | Matrix  | RND1       | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptForm28Format2 | XLS        | Compared |
      | rptForm28Format2 | xlsx       | Compared |
      | rptForm28Format2 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag99
  Scenario: Custom Attendance Register report in T&A module(Fail due to page load)
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Custom Attendance Register" Time and Attendence module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptDAttendanceReg | XLS        | Compared |
      | rptDAttendanceReg | XLSX       | Compared |
      | rptDAttendanceReg | PDF        | Compared |

  @tag100
  Scenario: Form 26 report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Form 26" Time and Attendence module reports configuration
      | Month    | Year | Message | LeftUpperLabel | LeftLowerLabel | RigthUpperLabel | RightLowerLabel | Footer  | SelectUsers | ExportFormat |
      | February | 2022 | Matrix  | Matrix1        | Matrix2        | Matrix3         | Matrix4         | Matrix5 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptForm26 | XLS        | Compared |
      | rptForm26 | PDF        | Compared |
      | rptForm26 | XLSX       | Compared |

  @tag101
  Scenario Outline: Time Loss Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Time Loss" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 10/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptTimeLoss | XLS        | Compared |
      | rptTimeLoss | xlsx       | Compared |
      | rptTimeLoss | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag102
  Scenario Outline: Overtime Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Overtime Chart" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptOvertimeGraph | XLS        | Compared |
      | rptOvertimeGraph | xlsx       | Compared |
      | rptOvertimeGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag103
  Scenario Outline: Absent Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Absent" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptAbsentGraph | XLS        | Compared |
      | rptAbsentGraph | xlsx       | Compared |
      | rptAbsentGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag104
  Scenario Outline: User Absent Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Absent" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptUserAbsentGraph | XLS        | Compared |
      | rptUserAbsentGraph | xlsx       | Compared |
      | rptUserAbsentGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag105
  Scenario Outline: User Late-IN Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Late-IN" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptLateInGraph | XLS        | Compared |
      | rptLateInGraph | xlsx       | Compared |
      | rptLateInGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag106
  Scenario Outline: User Early-OUT Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Early-OUT" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report           | FileFormat | Compare  |
      | rptEarlyOutGraph | XLS        | Compared |
      | rptEarlyOutGraph | xlsx       | Compared |
      | rptEarlyOutGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag107
  Scenario Outline: User Irregularity Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Irregularity" Time and Attendence module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 01/04/2017 | 30/04/2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptIrregularity | XLS        | Compared |
      | rptIrregularity | xlsx       | Compared |
      | rptIrregularity | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag108
  Scenario: Month-Wise Overtime report in T&A module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Month-Wise Overtime" Time and Attendence module reports configuration
      | forMonth | forYear | toMonth | toYear | SelectUsers | ExportFormat |
      | February |    2022 | January |   2023 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptMnthOvertimeGraph | XLS        | Compared |
      | rptMnthOvertimeGraph | PDF        | Compared |
      | rptMnthOvertimeGraph | XLSX       | Compared |

  @tag109
  Scenario Outline: Attendance Summary Report in T&A Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Attendance Summary Chart" Time and Attendence module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 01/04/2017 | 30/04/2017 | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptATDSumGraph | XLS        | Compared |
      | rptATDSumGraph | xlsx       | Compared |
      | rptATDSumGraph | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario: Monthly Leave Details Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Leave Details" Leave module reports configuration
      | Month | Year | SelectUsers | ExportFormat |
      | April | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptMonthlyLeaveDetails | XLS        | Compared |
      | rptMonthlyLeaveDetails | xlsx       | Compared |
      | rptMonthlyLeaveDetails | pdf        | Compared |

  @tag2
  Scenario Outline: C-OFF Register Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "C-OFF Register" Leave module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptCOFFReg | XLS        | Compared |
      | rptCOFFReg | xlsx       | Compared |
      | rptCOFFReg | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag3
  Scenario: Leave Register Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Leave Register" Leave module reports configuration
      | Period | Year | SelectUsers | ExportFormat |
      | Yearly | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptLeaveReg | XLS        | Compared |
      | rptLeaveReg | xlsx       | Compared |
      | rptLeaveReg | pdf        | Compared |

  @tag4
  Scenario: Leave Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Leave" Leave module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptLeaveMst | XLS        | Compared |
      | rptLeaveMst | xlsx       | Compared |
      | rptLeaveMst | pdf        | Compared |

  @tag5
  Scenario: Leave Group Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Leave Group" Leave module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptLeaveGroup | XLS        | Compared |
      | rptLeaveGroup | xlsx       | Compared |
      | rptLeaveGroup | pdf        | Compared |

  @tag6
  Scenario Outline: Leave Application Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Leave Application" Leave module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptLeaveEntry | XLS        | Compared |
      | rptLeaveEntry | xlsx       | Compared |
      | rptLeaveEntry | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag7
  Scenario Outline: Leave Application Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Leave Application" Leave module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Date    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptLeaveEntryDt | XLS        | Compared |
      | rptLeaveEntryDt | xlsx       | Compared |
      | rptLeaveEntryDt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag8
  Scenario Outline: Leave Encashment Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Leave Encashment" Leave module reports configuration
      | Period | Year | SelectUsers | ExportFormat |
      | Yearly | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptLeaveEncash | XLS        | Compared |
      | rptLeaveEncash | xlsx       | Compared |
      | rptLeaveEncash | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag9
  Scenario Outline: Leave  Credit/Debit Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Leave  Credit/Debit" Leave module reports configuration
      | Period | Year | SelectUsers | ExportFormat |
      | Yearly | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptLeaveCrDb | XLS        | Compared |
      | rptLeaveCrDb | xlsx       | Compared |
      | rptLeaveCrDb | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag10
  Scenario: Form B Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Form B" Leave module reports configuration
      | Year | SelectUsers | ExportFormat |
      | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report   | FileFormat | Compare  |
      | rptFormB | XLS        | Compared |
      | rptFormB | xlsx       | Compared |
      | rptFormB | pdf        | Compared |

  @tag11
  Scenario: Form 15 Report of Leave Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Form 15" Leave module reports configuration
      | Year | SelectUsers | ExportFormat |
      | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report    | FileFormat | Compare  |
      | rptForm15 | XLS        | Compared |
      | rptForm15 | xlsx       | Compared |
      | rptForm15 | pdf        | Compared |

 
  @tag2
  Scenario: Muster Roll Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Muster Roll" CWM module reports configuration
      | Month    | Year | SelectContractor | SelectWorkerOrder | SelectWorkers | ExportFormat |
      | February | 2022 | All              | All               | All           | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptMusterRoll | XLS        | Compared |
      | rptMusterRoll | xlsx       | Compared |
      | rptMusterRoll | pdf        | Compared |

  @tag4
  Scenario Outline: Monthly Attendance Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Monthly Attendance" CWM module reports configuration
      | FromDate   | ToDate     | SelectContractor | SelectWorkerOrder | SelectWorkers | ExportFormat |
      | 01/02/2022 | 28/02/2022 | All              | All               | All           | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptCWMMonthlyAttendance | XLS        | Compared |
      | rptCWMMonthlyAttendance | xlsx       | Compared |
      | rptCWMMonthlyAttendance | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: Daily Summary Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Summary" CWM module reports configuration
      | FromDate   | ToDate     | SelectContractor | SelectWorkerOrder | SelectWorkers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All              | All               | All           | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptCWMDailySummary | XLS        | Compared |
      | rptCWMDailySummary | xlsx       | Compared |
      | rptCWMDailySummary | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario Outline: Daily Work Hours Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Work Hours" CWM module reports configuration
      | FromDate   | ToDate     | SelectContractor | SelectWorkerOrder | SelectWorkers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All              | All               | All           | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptCWMDailyWorkHours | XLS        | Compared |
      | rptCWMDailyWorkHours | xlsx       | Compared |
      | rptCWMDailyWorkHours | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag7
  Scenario Outline: Daily Head Count Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Head Count" CWM module reports configuration
      | FromDate   | ToDate     | SelectContractor | SelectWorkerOrder | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All              | All               | xls,xlsx,pdf |
    Then Validate report
      | Report               | FileFormat | Compare  |
      | rptCWMDailyHeadCount | XLS        | Compared |
      | rptCWMDailyHeadCount | xlsx       | Compared |
      | rptCWMDailyHeadCount | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag8
  Scenario Outline: Work Order Man Days Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Work Order Man Days" CWM module reports configuration
      | FromDate   | ToDate     | SelectContractor | SelectWorkerOrder | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All              | All               | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptCWMWOManDays | XLS        | Compared |
      | rptCWMWOManDays | xlsx       | Compared |
      | rptCWMWOManDays | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag9
  Scenario: Blacklisted Workers Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Blacklisted Workers" CWM module reports configuration
      | SelectContractor | ExportFormat |
      | All              | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptCWMBlacklistedWorkers | XLS        | Compared |
      | rptCWMBlacklistedWorkers | xlsx       | Compared |
      | rptCWMBlacklistedWorkers | pdf        | Compared |

  @tag10
  Scenario Outline: Work Order Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Work Order Details" CWM module reports configuration
      | SelectContractor | SelectWorkerOrder | ExportFormat |
      | All              | All               | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptCWMWorkOrderDetail | XLS        | Compared |
      | rptCWMWorkOrderDetail | xlsx       | Compared |
      | rptCWMWorkOrderDetail | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag11
  Scenario Outline: Contractor Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Contractor Details" CWM module reports configuration
      | SelectContractor | ExportFormat |
      | All              | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptCWMContractorDetails | XLS        | Compared |
      | rptCWMContractorDetails | xlsx       | Compared |
      | rptCWMContractorDetails | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag12
  Scenario: Worker Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Worker Details" CWM module reports configuration
      | SelectContractor | SelectWorkerOrder | SelectWorkers | ExportFormat |
      | All              | All               | All           | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptCWMWorkerDetail | XLS        | Compared |
      | rptCWMWorkerDetail | xlsx       | Compared |
      | rptCWMWorkerDetail | pdf        | Compared |

  @tag1
  Scenario Outline: Visitor Punch Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Punch" Visitor Management module reports configuration
      | FromDate   | ToDate     | SelectDoors | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptVisitorPunch | XLS        | Compared |
      | rptVisitorPunch | xlsx       | Compared |
      | rptVisitorPunch | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Visitor Punch Detail Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Punch Detail" Visitor Management module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 31/12/2016 | 04/01/2024 | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptVisitorDet | XLS        | Compared |
      | rptVisitorDet | xlsx       | Compared |
      | rptVisitorDet | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag3
  Scenario Outline: Visitor Punch Exception Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Punch Exception" Visitor Management module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 31/12/2016 | 04/01/2024 | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptVisitorExc | XLS        | Compared |
      | rptVisitorExc | xlsx       | Compared |
      | rptVisitorExc | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario: Panel-Wise Visitor Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Panel-Wise Visitor" Visitor Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptMasterwiseVSTR | XLS        | Compared |
      | rptMasterwiseVSTR | xlsx       | Compared |
      | rptMasterwiseVSTR | pdf        | Compared |

  @tag6
  Scenario Outline: Visitor Access Denied Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Access Denied" Visitor Management module reports configuration
      | FromDate   | ToDate     | SelectVisitors | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All            | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptVSTRAccessDenied | XLS        | Compared |
      | rptVSTRAccessDenied | xlsx       | Compared |
      | rptVSTRAccessDenied | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag7
  Scenario Outline: Visitor Pass Validity Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Pass Validity" Visitor Management module reports configuration
      | Date       | Time  | ExportFormat |
      | 02/02/2022 | 18:15 | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptVisitorValidity | XLS        | Compared |
      | rptVisitorValidity | xlsx       | Compared |
      | rptVisitorValidity | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag10
  Scenario: Visitor Watchlist/Blacklist Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Visitor Watchlist/Blacklist" Visitor Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptBlockVisitor | XLS        | Compared |
      | rptBlockVisitor | xlsx       | Compared |
      | rptBlockVisitor | pdf        | Compared |

  @tag11
  Scenario Outline: Pre-Registered Visitors Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Pre-Registered Visitors" Visitor Management module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 01/01/2022 | 30/06/2022 | xls,xlsx,pdf |
    Then Validate report
      | Report     | FileFormat | Compare  |
      | rptAdvVSTR | XLS        | Compared |
      | rptAdvVSTR | xlsx       | Compared |
      | rptAdvVSTR | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag12
  Scenario Outline: Visitor History Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor History" Visitor Management module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptVSTRHistory | XLS        | Compared |
      | rptVSTRHistory | xlsx       | Compared |
      | rptVSTRHistory | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag13
  Scenario Outline: Visitor Head Count Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Head Count" Visitor Management module reports configuration
      | FromDate   | ToDate     | SelectVisitors | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All            | xls,xlsx,pdf |
    Then Validate report
      | Report      | FileFormat | Compare  |
      | rptVSTRCnt1 | XLS        | Compared |
      | rptVSTRCnt1 | xlsx       | Compared |
      | rptVSTRCnt1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag14
  Scenario Outline: Visitor Evacuation Report in Visitor Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Visitor Evacuation" Visitor Management module reports configuration
      | FromDate   | ToDate     | Time  | SelectVisitors | ExportFormat |
      | 31/12/2016 | 04/01/2024 | 11:30 | All            | xls,xlsx,pdf |
    Then Validate report
      | Report                    | FileFormat | Compare  |
      | rptVisitorEvacuation      | XLS        | Compared |
      | rptVisitorEvacuation      | xlsx       | Compared |
      | rptVisitorEvacuation      | pdf        | Compared |
      | rptVisitorEvacuationSub-1 | XLS        | Compared |
      | rptVisitorEvacuationSub-1 | xlsx       | Compared |
      | rptVisitorEvacuationSub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario Outline: Job Summary in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Job Summary" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectJobs | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All        | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptJobWorkSummary | XLS        | Compared |
      | rptJobWorkSummary | xlsx       | Compared |
      | rptJobWorkSummary | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Phase Summary in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Phase Summary" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectPhases | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All          | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptPhaseWorkSummary      | XLS        | Compared |
      | rptPhaseWorkSummary      | xlsx       | Compared |
      | rptPhaseWorkSummary      | pdf        | Compared |
      | rptPhaseWorkSummarySub-1 | XLS        | Compared |
      | rptPhaseWorkSummarySub-1 | xlsx       | Compared |
      | rptPhaseWorkSummarySub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag3
  Scenario Outline: Project Summary in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Project Summary" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectProjects | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All            | xls,xlsx,pdf |
    Then Validate report
      | Report                     | FileFormat | Compare  |
      | rptProjectWorkSummary      | XLS        | Compared |
      | rptProjectWorkSummary      | xlsx       | Compared |
      | rptProjectWorkSummary      | pdf        | Compared |
      | rptProjectWorkSummarySub-1 | XLS        | Compared |
      | rptProjectWorkSummarySub-1 | xlsx       | Compared |
      | rptProjectWorkSummarySub-1 | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag4
  Scenario Outline: Transaction-Wise Hours Summary Report in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Transaction-Wise Hours Summary" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptJPCTrnWiseHrsSum | XLS        | Compared |
      | rptJPCTrnWiseHrsSum | xlsx       | Compared |
      | rptJPCTrnWiseHrsSum | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: Daily Job Details Report in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Job Details" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptJPCDailyJobDetails | XLS        | Compared |
      | rptJPCDailyJobDetails | xlsx       | Compared |
      | rptJPCDailyJobDetails | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario: Monthly Job Details Report in Job Process  Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Job Details" Job Processing Costing  module reports configuration
      | Month | Year | SelectUsers | ExportFormat |
      | April | 2017 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptJPCMonthlyJobDet | XLS        | Compared |
      | rptJPCMonthlyJobDet | xlsx       | Compared |
      | rptJPCMonthlyJobDet | pdf        | Compared |

  @tag7
  Scenario Outline: Job Transactions Report in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Job Transactions" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Date    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                     | FileFormat | Compare  |
      | rptDatewiseJobTransactions | XLS        | Compared |
      | rptDatewiseJobTransactions | xlsx       | Compared |
      | rptDatewiseJobTransactions | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag8
  Scenario Outline: Job Transactions Report in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Job Transactions" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                     | FileFormat | Compare  |
      | rptUserwiseJobTransactions | XLS        | Compared |
      | rptUserwiseJobTransactions | xlsx       | Compared |
      | rptUserwiseJobTransactions | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag9
  Scenario Outline: User Job Details Report in Job Process Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Job Details" Job Processing Costing  module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report       | FileFormat | Compare  |
      | rptJobDetail | XLS        | Compared |
      | rptJobDetail | xlsx       | Compared |
      | rptJobDetail | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario Outline: Schedule Status Summary in Field Visit Management  Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Schedule Status Summary" Field Visit Management  module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report              | FileFormat | Compare  |
      | rptFVMSchStatusSumt | XLS        | Compared |
      | rptFVMSchStatusSumt | xlsx       | Compared |
      | rptFVMSchStatusSumt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag2
  Scenario Outline: Field Visit Summary Report in Field Visit Management  Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Field Visit Summary" Field Visit Management  module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report        | FileFormat | Compare  |
      | rptFVMSummary | XLS        | Compared |
      | rptFVMSummary | xlsx       | Compared |
      | rptFVMSummary | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag1
  Scenario: Items Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Items" Cafeteria Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptCntnItemMst | XLS        | Compared |
      | rptCntnItemMst | xlsx       | Compared |
      | rptCntnItemMst | pdf        | Compared |

  @tag2
  Scenario: Menu Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Menu" Cafeteria Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptCntnMenuMst | XLS        | Compared |
      | rptCntnMenuMst | xlsx       | Compared |
      | rptCntnMenuMst | pdf        | Compared |

  @tag3
  Scenario: Menu Schedule  Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Menu Schedule" Cafeteria Management module reports configuration
      | SelectDoors | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report          | FileFormat | Compare  |
      | rptCntnMenushce | XLS        | Compared |
      | rptCntnMenushce | xlsx       | Compared |
      | rptCntnMenushce | pdf        | Compared |

  @tag4
  Scenario Outline: Head Count Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Head Count" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | ExportFormat |
      | 31/12/2016 | 04/01/2024 | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptCntnDailyHeadCount | XLS        | Compared |
      | rptCntnDailyHeadCount | xlsx       | Compared |
      | rptCntnDailyHeadCount | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag5
  Scenario Outline: User Transactions Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Transactions" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report         | FileFormat | Compare  |
      | rptCntnUserTrn | XLS        | Compared |
      | rptCntnUserTrn | xlsx       | Compared |
      | rptCntnUserTrn | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag6
  Scenario Outline: User Transactions Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Transactions" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Device  | All         | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptCntnUserTrnDoor | XLS        | Compared |
      | rptCntnUserTrnDoor | xlsx       | Compared |
      | rptCntnUserTrnDoor | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag7
  Scenario: Users Account Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Users Account Details" Cafeteria Management module reports configuration
      | SelectUsers | ExportFormat |
      | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptCntnUserAccountDetail | XLS        | Compared |
      | rptCntnUserAccountDetail | xlsx       | Compared |
      | rptCntnUserAccountDetail | pdf        | Compared |

  @tag8
  Scenario Outline: User Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                | FileFormat | Compare  |
      | rptCntnUserConsmption | XLS        | Compared |
      | rptCntnUserConsmption | xlsx       | Compared |
      | rptCntnUserConsmption | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag9
  Scenario: Credit/Debit Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Credit/Debit" Cafeteria Management module reports configuration
      | Month    | Year | SelectUsers | ExportFormat |
      | February | 2022 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptCntnMonthlyCreditDue | XLS        | Compared |
      | rptCntnMonthlyCreditDue | xlsx       | Compared |
      | rptCntnMonthlyCreditDue | pdf        | Compared |

  @tag10
  Scenario Outline: Blocked Users Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Blocked Users" Cafeteria Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptEcanteenBlockedUsers | XLS        | Compared |
      | rptEcanteenBlockedUsers | xlsx       | Compared |
      | rptEcanteenBlockedUsers | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag11
  Scenario Outline: User Pre-Order Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Pre-Order Details" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User then Date | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                 | FileFormat | Compare  |
      | rptCntnPreOrderBooking | XLS        | Compared |
      | rptCntnPreOrderBooking | xlsx       | Compared |
      | rptCntnPreOrderBooking | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag12
  Scenario Outline: User Pre-Order Details Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "User Pre-Order Details" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Date then User | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                   | FileFormat | Compare  |
      | rptCntnPreOrderBookingDt | XLS        | Compared |
      | rptCntnPreOrderBookingDt | xlsx       | Compared |
      | rptCntnPreOrderBookingDt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag13
  Scenario Outline: Sales Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Sales" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | All         | xls,xlsx,pdf |
    Then Validate report
      | Report            | FileFormat | Compare  |
      | rptCntnDailySales | XLS        | Compared |
      | rptCntnDailySales | xlsx       | Compared |
      | rptCntnDailySales | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag14
  Scenario Outline: Device-Wise Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Device-Wise Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | FormatSelection        | SelectDevices | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Daily Item Consumption | All           | xls,xlsx,pdf |
    Then Validate report
      | Report                            | FileFormat | Compare  |
      | rptCntnDeviceWiseConsumptionDaily | XLS        | Compared |
      | rptCntnDeviceWiseConsumptionDaily | xlsx       | Compared |
      | rptCntnDeviceWiseConsumptionDaily | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag15
  Scenario Outline: Device-Wise Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Device-Wise Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | FormatSelection          | SelectDevices | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Item Consumption Summary | All           | xls,xlsx,pdf |
    Then Validate report
      | Report                              | FileFormat | Compare  |
      | rptCntnDeviceWiseConsumptionSummary | XLS        | Compared |
      | rptCntnDeviceWiseConsumptionSummary | xlsx       | Compared |
      | rptCntnDeviceWiseConsumptionSummary | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag16
  Scenario Outline: Item-Wise Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Item-Wise Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User Then Date | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                      | FileFormat | Compare  |
      | rptCntnDailyItemConsumption | XLS        | Compared |
      | rptCntnDailyItemConsumption | xlsx       | Compared |
      | rptCntnDailyItemConsumption | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag17
  Scenario Outline: Item-Wise Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Item-Wise Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy        | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Date Then User | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                        | FileFormat | Compare  |
      | rptCntnDailyItemConsumptionDt | XLS        | Compared |
      | rptCntnDailyItemConsumptionDt | xlsx       | Compared |
      | rptCntnDailyItemConsumptionDt | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag18
  Scenario Outline: Daily Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                     | FileFormat | Compare  |
      | rptCntnDailyConsumptionUsr | XLS        | Compared |
      | rptCntnDailyConsumptionUsr | xlsx       | Compared |
      | rptCntnDailyConsumptionUsr | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag19
  Scenario Outline: Daily Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    When "Daily Consumption" Cafeteria Management module reports configuration
      | FromDate   | ToDate     | GroupBy | SelectUsers | ExportFormat |
      | 31/12/2016 | 04/01/2024 | Item    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                  | FileFormat | Compare  |
      | rptCntnDailyConsumption | XLS        | Compared |
      | rptCntnDailyConsumption | xlsx       | Compared |
      | rptCntnDailyConsumption | pdf        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @tag20
  Scenario: Monthly Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Consumption" Cafeteria Management module reports configuration
      | Month    | Year | GroupBy | SelectUsers | ExportFormat |
      | February | 2022 | User    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                       | FileFormat | Compare  |
      | rptCntnMonthlyConsumptionUsr | XLS        | Compared |
      | rptCntnMonthlyConsumptionUsr | xlsx       | Compared |
      | rptCntnMonthlyConsumptionUsr | pdf        | Compared |

  @tag21
  Scenario: Monthly Consumption Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Monthly Consumption" Cafeteria Management module reports configuration
      | Month    | Year | GroupBy | SelectUsers | ExportFormat |
      | February | 2022 | Item    | All         | xls,xlsx,pdf |
    Then Validate report
      | Report                    | FileFormat | Compare  |
      | rptCntnMonthlyConsumption | XLS        | Compared |
      | rptCntnMonthlyConsumption | xlsx       | Compared |
      | rptCntnMonthlyConsumption | pdf        | Compared |

  @tag22
  Scenario: Cafeteria Devices Report in Cafeteria Management Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "dd/mm/yyyy" in global policy.
    When "Cafeteria Devices" Cafeteria Management module reports configuration
      | ExportFormat |
      | xls,xlsx,pdf |
    Then Validate report
      | Report             | FileFormat | Compare  |
      | rptECanteenDevices | XLS        | Compared |
      | rptECanteenDevices | xlsx       | Compared |
      | rptECanteenDevices | pdf        | Compared |
