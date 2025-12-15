@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @CS-73
  Scenario Outline: Export Data - API_Template_Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    And Export Data from Admin Module
      | TemplateType | Template           | FromDate   | ToDate     | Month | Year | FileFormat  | FileName     | SelectUsers | User | GenerateExportfor |
      | Custom       | API_Template_Daily | 01/04/2017 | 30/04/2017 |       |      | Excel Files | APITempDaily | All         |      | All Users         |
      | Custom       | API_Template_Daily | 01/04/2017 | 30/04/2017 |       |      | Text Files  | APITempDaily | All         |      | All Users         |
      | Custom       | API_Template_Daily | 01/04/2017 | 30/04/2017 |       |      | CSV Files   | APITempDaily | All         |      | All Users         |
    Then Validate exported file
      | FileName     | FileFormat | Compare  |
      | APITempDaily | XLS        | Compared |
      | APITempDaily | txt        | Compared |
      | APITempDaily | CSV        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-74
  Scenario: Export Data - API_Template_Monthly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Export Data from Admin Module
      | TemplateType | Template             | FromDate | ToDate | Month | Year | FileFormat  | FileName             | SelectUsers | User | GenerateExportfor |
      | Custom       | API_Template_Monthly |          |        | April | 2017 | Excel Files | APITempMonthly | All         |      | All Users         |
      | Custom       | API_Template_Monthly |          |        | April | 2017 | Text Files  | APITempMonthly  | All         |      | All Users         |
      | Custom       | API_Template_Monthly |          |        | April | 2017 | CSV Files   | APITempMonthly   | All         |      | All Users         |
    Then Validate exported file
      | FileName             | FileFormat | Compare  |
      | APITempMonthly | XLS        | Compared |
      | APITempMonthly  | Txt       | Compared |
      | APITempMonthly   | CSV        | Compared |
     
  @CS-75
  Scenario Outline: Export Data - API_Template_ATDEvents
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    And Export Data from Admin Module
      | TemplateType | Template               | FromDate   | ToDate     | Month | Year | FileFormat  | FileName               | EventSelection | SelectUsers | User | GenerateExportfor |
      | Custom       | API_Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | Excel Files | APITempATDEvents | Both           | All         |      | All Users         |
      | Custom       | API_Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | Text Files  | APITempATDEvents  | Both           | All         |      | All Users         |
      | Custom       | API_Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | CSV Files   | APITempATDEvents   | Both           | All         |      | All Users         |
    Then Validate exported file
      | FileName               | FileFormat | Compare  |
      | APITempATDEvents | XLS        | Compared |
      | APITempATDEvents  | Txt       | Compared |
      | APITempATDEvents   | CSV        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  

  @CS-77
  Scenario Outline: Export Data - Template Daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    And Export Data from Admin Module
      | TemplateType | Template       | FromDate   | ToDate     | Month | Year | FileFormat  | FileName        | SelectUsers | User | GenerateExportfor |
      | Custom       | Template_Daily | 01/04/2017 | 30/04/2017 |       |      | Excel Files | TempDaily | All         |      | All Users         |
      | Custom       | Template_Daily | 01/04/2017 | 30/04/2017 |       |      | Text Files  | TempDaily  | All         |      | All Users         |
      | Custom       | Template_Daily | 01/04/2017 | 30/04/2017 |       |      | CSV Files   | TempDaily   | All         |      | All Users         |
    Then Validate exported file
      | FileName        | FileFormat | Compare  |
      | TempDaily | XLS        | Compared |
      | TempDaily  | Txt       | Compared |
      | TempDaily   | CSV        | Compared |
 
    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-78
  Scenario: Export Data - Template Monthly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Export Data from Admin Module
      | TemplateType | Template         | FromDate | ToDate | Month | Year | FileFormat  | FileName          | SelectUsers | User | GenerateExportfor |
      | Custom       | Template_Monthly |          |        | April | 2017 | Excel Files | TempMonthly | All         |      | All Users         |
      | Custom       | Template_Monthly |          |        | April | 2017 | Text Files  | TempMonthly  | All         |      | All Users         |
      | Custom       | Template_Monthly |          |        | April | 2017 | CSV Files   | TempMonthly   | All         |      | All Users         |
    Then Validate exported file
      | FileName          | FileFormat | Compare  |
      | TempMonthly | XLS        | Compared |
      | TempMonthly  | Txt       | Compared |
      | TempMonthly   | CSV        | Compared |
    
  @CS-79
  Scenario Outline: Export Data - Template ATDEvents
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    And Export Data from Admin Module
      | TemplateType | Template           | FromDate   | ToDate     | Month | Year | FileFormat  | FileName            | EventSelection | SelectUsers | User | GenerateExportfor |
      | Custom       | Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | Excel Files | TempATDEvents | Both           | All         |      | All Users         |
      | Custom       | Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | Text Files  | TempATDEvents  | Both           | All         |      | All Users         |
      | Custom       | Template_ATDEvents | 01/04/2017 | 30/04/2017 |       |      | CSV Files   | TempATDEvents   | Both           | All         |      | All Users         |
    Then Validate exported file
      | FileName            | FileFormat | Compare  |
      | TempATDEvents | XLS        | Compared |
      | TempATDEvents  | Txt       | Compared |
      | TempATDEvents   | CSV        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  

  @CS-81
  Scenario Outline: Export Data - Attendance Summary
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set system date format "<SystemDate>" in global policy.
    And Export Data from Admin Module
      | TemplateType   | Template           | FromDate   | ToDate     | Month | Year | FileFormat  | FileName         | SelectUsers | User | GenerateExportfor |
      | System Defined | Attendance Summary | 01/04/2017 | 30/04/2017 |       |      |  					| ATDSummary | All         |      | All Users         |
    Then Validate exported file
      | FileName         | FileFormat | Compare  |
      | ATDSummary | XLS        | Compared |

    Examples: 
      | SystemDate |
      | dd/mm/yyyy |
      | mm/dd/yyyy |
      | yyyy/mm/dd |

  @CS-82
  Scenario: Export Data - Create template with Database view = User details and export
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create template "Temp1" with DatabaseView = "User Details" from Admin Module
      | FieldType      | DisplayName | Fields | FieldName | FieldValue | DataLength | CustomField       |
      | Database Field | UID         | USERID |           |            |            |                   |
      | Static Field   | Uname       |        | UserNm    | abc        |         15 |                   |
      | Custom Field   | IdName      |        |           |            |         15 | USERID + USERNAME |
    And Export Data from Admin Module
      | TemplateType | Template | FromDate | ToDate | Month | Year | FileFormat  | FileName    | SelectUsers | User | GenerateExportfor |
      | Custom       | Temp1    |          |        |       |      | Excel Files | Temp1_Excel | All         |      | All Users         |
      | Custom       | Temp1    |          |        |       |      | Text Files  | Temp1_Text  | All         |      | All Users         |
      | Custom       | Temp1    |          |        |       |      | CSV Files   | Temp1_CSV   | All         |      | All Users         |
    Then Validate exported file
      | FileName    | FileFormat | Compare  |
      | Temp1_Excel | XLS        | Compared |
      | Temp1_Text  | Text       | Compared |
      | Temp1_CSV   | CSV        | Compared |
