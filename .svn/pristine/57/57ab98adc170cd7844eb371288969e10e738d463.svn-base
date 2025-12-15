@tag
Feature: Export Reports in Time and Attendence Report
 
 
  @tag1
  Scenario: Attendence Register in Basic Format in Time and Attendence Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
       #Write true false in Holiday column
       #Missing Add To Export & Output Code For Leaving Date config	
    Given "Export Day-Wise Attendance with Code Mapping" in Configuration of the "Attendence Register" in TAndA Exports
    |   First Half   |    Second Half   |   	Present     |    Holiday   |   Output Code   |  
    |   AB-Absent    |     PR-Present   |                 |     true     |        AP       |  
    | FB-Field-Break |  FB-Field-Break  |                 |     true     |        FB       |
    |       IN       |     AB-Absent    |                 |     true     |        IN       |
    |       P1       |     PR-Present   |                 |     true     |        PP       |
    |   PH-Holiday   |     PH-Holiday   |                 |     true     |        PH       |
    |       PL       |     PR-Present   |                 |     true     |        PL       |
    |   PR-Present   |     PR-Present   |                 |     true     |        PR       |
    |   PR-Present   |     AB-Absent    |                 |     true     |        PA       |
    |   PR-Present   |        PL        |                 |     true     |        Le       |
    |   WO-Week-Off  |     WO-Week-Off  |                 |     true     |        WO       |
     #Missing Select Fields To Export config
    And "Attendance Register Configuration" in Configuration of the "Attendence Register" in TAndA Exports
    |   Leave ID    |    	Leave Name    |    	Output Code   |   Fields  |    Checked   | Include Summary |   Add To Export |
    |      PL       |       PL          |        PL         |    All    |      true    |       true      |       true      |
    And "Form 25 Configuration" in Configuration of the "Attendence Register" in TAndA Exports
    |  Header Message  |   Week-Off  |   PH   |   Code Mapping  |
    |  Matrix Comsec   |    true     |  true  |      true       |
     #Missing group selection for group by
    Then Export the "Attendence Register" in TAndA Exports
    |     Format       |    FromDate  |     ToDate     |        FileName       |    GroupBy   |    GroupBy1    |   SelectUsers   |    Generate Export For  |  
    |   Basic Format   |   01/04/2017 |    02/04/2017  |  AttendanceRegisterBa |    true      |   Organization |       All       |         All Users       |
    And Validate exported file from UI selection.
    |	      FileName      |   FileFormat  |   Compare  |
    | AttendanceRegisterBa |     XLS       |   Compared |

 #All comments same as per above
 #@tag2
  #Scenario: Attendence Register Report in Form 25 Format in Time and Attendence Module  [Issue:Header contains current date and time]
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |	
    #Given "Export Day-Wise Attendance with Code Mapping" in Configuration of the "Attendence Register" in TAndA Exports
    #|   First Half   |    Second Half   |   	Present      |    Holiday   |   Output Code   |  
    #|   AB-Absent    |     PR-Present   |                 |     true     |        AP       |  
    #| FB-Field-Break |  FB-Field-Break  |                 |     true     |        FB       |
    #|       IN       |     AB-Absent    |                 |     true     |        IN       |
    #|       P1       |     PR-Present   |                 |     true     |        PP       |
    #|   PH-Holiday   |     PH-Holiday   |                 |     true     |        PH       |
    #|       PL       |     PR-Present   |                 |     true     |        PL       |
    #|   PR-Present   |     PR-Present   |                 |     true     |        PR       |
    #|   PR-Present   |     AB-Absent    |                 |     true     |        PA       |
    #|   PR-Present   |        PL        |                 |     true     |        Le       |
    #|   WO-Week-Off  |     WO-Week-Off  |                 |     true     |        WO       |
    #And "Attendance Register Configuration" in Configuration of the "Attendence Register" in TAndA Exports
    #|   Leave ID    |    	Leave Name    |    	Output Code   |   Fields  |    Checked   | Include Summary |   Add To Export |
    #|      PL       |       PL          |        PL         |    All    |      true    |       true      |       true      |
    #And "Form 25 Configuration" in Configuration of the "Attendence Register" in TAndA Exports
    #|  Header Message  |   Week-Off  |   PH   |   Code Mapping  |
    #|  Matrix Comsec   |    true     |  true  |      true       |
    #Then Export the "Attendence Register" in TAndA Exports
    #|     Format    |  Month  |  Year  |   CustomAttendencePeriod |       FileName       |    GroupBy   |    GroupBy1    |   SelectUsers   |    Generate Export For  |  
    #|     Form 25   |  April  |  2017  |           true           | AttendanceRegisterFo |    true      |   Organization |       All       |         All Users       |
    #And Validate exported file from UI selection.
    #|	      FileName       |   FileFormat  |   Compare  |
    #| AttendanceRegisterFo |     XLS       |   Compared |
    
@tag3
  Scenario: Site-Wise Head Count/Man Hours in Head Count in Time and Attendence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |	
   Then Export the "Site-Wise Head Count Man Hours" in TAndA Exports
      |    FromDate   |    ToDate    |   GroupBy    |    Data     | Present User |      FileName     |   SelectUsers   |    Generate Export For   |
      |    01/04/2017 |   10/04/2017 | Organization | Head Count  |     true     |  SiteWiseHeadCnt  |       All       |         All Users        |
   Then Validate exported file from UI selection.
      |    FileName    | FileFormat|   Compare  |
      | SiteWiseHeadCnt|   XLS     |   Compared |
      
@tag4
  Scenario: Site-Wise Head Count/Man Hours in Man Hours in Time and Attendence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |	
   Then Export the "Site-Wise Head Count Man Hours" in TAndA Exports 
      |    FromDate   |    ToDate    |   GroupBy    |    Data      |      FileName    |   SelectUsers   |    Generate Export For   |
      |    01/04/2017 |   10/04/2017 | Organization |  Man Hours   |  SiteWiseManHrs  |       All       |         All Users        |
   Then Validate exported file from UI selection.
      |    FileName    |FileFormat |   Compare  |
      | SiteWiseManHrs |   XLS     |   Compared |    
    
@tag5
  Scenario: Site-Wise Head Count/Man Hours in Work Hours in Time and Attendence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   Then Export the "Site-Wise Head Count Man Hours" in TAndA Exports
      |    FromDate   |    ToDate    |    GroupBy    |    Data      |      FileName    |  SelectedSites  |  SelectUsers   |    Generate Export For   |
      |    01/04/2017 |   10/04/2017 | Organization  |  Work Hours  |   SiteWiseWrkHr  |       All       |       All      |         All Users        |
   Then Validate exported file from UI selection.
      |    FileName    |FileFormat |   Compare  |
      | SiteWiseWrkHr  |   XLS     |   Compared |       
    
#@tag6 
   #Scenario: Short Leave/Official OUT Time in Time and Attendence (Ordering Issue so not compared always failed)
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #Given "No Tab" in Configuration of the "Short Leave Official OUT Time" in TAndA Exports
      #|  Fields  |   Checked  |  
      #|   All    |     true   |    
    #And "Reason-Wise Out Time" in Configuration of the "Short Leave Official OUT Time" in TAndA Exports
       #|  Add To Export |   Total Out Time  |   No Reason  |
       #|    true        |        true       |      true    |
    #Then Export the "Short Leave Official OUT Time" in TAndA Exports
      #|   FromDate  |   ToDate   |      FileName     |   SelectUsers  |   Generate Export For   |
      #|  01/04/2017 |  10/04/2017| ShortLeaveOfficial|       All      |       All Users         |
    #Then Validate exported file from UI selection.
      #|     FileName        |FileFormat |   Compare  |
      #| ShortLeaveOfficial  |   XLS     |   Compared | 
      
@tag7
   Scenario: Group-Wise Shift Headcount in Daily Format in Time and Attendence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   Given "Enterprise Group Configuration" in Configuration of the "Group-Wise Shift Headcount" in TAndA Exports
      |     Group-1    |  Group-2  |   Group-3   |  Filter By  |   Select Organization   |
      |  Organization  |  Branch   |  Department |   Group-1   |          All            |
    And  "Shift Configuration" in Configuration of the "Group-Wise Shift Headcount" in TAndA Exports
      |  ShiftID-1  |  ShiftID-2  |  Group-1 Code  |   Group-2 Code  |  
      |    A1,A2    |    BR,GS    |      Day       |      Night      |
    Then Export the "Group-Wise Shift Headcount" in TAndA Exports
      |      Format      |    FromDate    |    ToDate    |      FileName     |   SelectUsers  |  Generate Export For  |
      |   Daily Format   |   01/04/2017   |  10/04/2017  | GroupWiseShiftDly |       All      |       All Users       |  
    Then Validate exported file from UI selection.
      |     FileName        | FileFormat|   Compare  |
      | GroupWiseShiftDly   |   XLS     |   Compared | 
      
@tag8
   Scenario: Group-Wise Shift Headcount in Monthly Format in Time and Attendence
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
   Given "Enterprise Group Configuration" in Configuration of the "Group-Wise Shift Headcount" in TAndA Exports
      |     Group-1    |  Group-2  |   Group-3   |  Filter By  |   Select Organization   |
      |  Organization  |  Branch   |  Department |   Group-1   |          All            |
    And "Shift Configuration" in Configuration of the "Group-Wise Shift Headcount" in TAndA Exports
      |  ShiftID-1  |  ShiftID-2  |  Group-1 Code  |   Group-2 Code  |  
      |    A1,A2    |    BR,GS    |      Day       |      Night      |
    Then Export the "Group-Wise Shift Headcount" in TAndA Exports
      |      Format      |    Month     |   Year  |      FileName     |   SelectUsers  |  Generate Export For  |
      |   Monthly Format |    April     |   2017  | GroupWiseShiftMo  |       All      |       All Users       |  
    Then Validate exported file from UI selection.
      |     FileName        |FileFormat |   Compare  |
      |  GroupWiseShiftMo   |   XLS     |   Compared |       
      
@tag9 
   Scenario: Enterprise Group-Wise Presence Count Report in Time and Attendence Module 
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Given "No Tab" in Configuration of the "Enterprise Group-Wise Presence Count" in TAndA Exports
      |    Group-1    |  Group-2  |   FilterBy  |   SelectOrganization   |
      |  Organization |  Branch   |    Group-1  |           All          |
    Then Export the "Enterprise Group-Wise Presence Count" in TAndA Exports
      |  FromDate  |   ToDate   |       FileName      |  Show Export Header | Generate Export For  |
      | 01/04/2017 | 10/04/2017 | EnterpriseGrpWisePC |        true         |       All Users      |
    Then Validate exported file from UI selection.
      |     FileName        |FileFormat |   Compare  |
      | EnterpriseGrpWisePC |   XLS     |   Compared |    

 @tag10
    Scenario: Monthly Hours Summary Report in Time and Attendence Module 
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Given "Export Configuration" in Configuration of the "Monthly Hours Summary" in TAndA Exports
      |  Fields  |   Checked  |
      |   All    |   true     |
    And "Attendance Register Configuration" in Configuration of the "Monthly Hours Summary" in TAndA Exports
      |  First Half  |  Second Half  |  Applicable Days  |   Show Output Code  |  Output Code  |
      |  AB-Absent   |  PR-Present   |        All        |        true         |      AP       |
      |FB-Field-Break| FB-Field-Break|        All        |        true         |      FB       |
      |      IN      |  AB-Absent    |        All        |        true         |      IN       |
      |    P1-P1     |  PR-Present   |        All        |        true         |      PP       |
      |  PH-Holiday  |  PH-Holiday   |        All        |        true         |      PH       |
      |    PL-PL     |  PR-Present   |        All        |        true         |      PL       |
      |  PR-Present  |  PR-Present   |        All        |        true         |      PR       |
      |  PR-Present  |  AB-Absent    |        All        |        true         |      PA       |
      |  PR-Present  |    PL-PL      |        All        |        true         |      Le       |
      |  WO-Week-Off |  WO-Week-Off  |        All        |        true         |      WO       |
    Then Export the "Monthly Hours Summary" in TAndA Exports
      |  Month  |  Year  |       FileName       |  Show Export Header |  SelectUsers  |  Generate Export For  |
      |  April  |  2017  | MonthlyHoursSummary  |        true         |      All      |        All Users      |
    Then Validate exported file from UI selection.
      |     FileName        |FileFormat |   Compare  |
      | MonthlyHoursSummary |   lsx     |   Compared |    
      
@tag11 
    Scenario: Site Wise Monthly Summary Report in Time and Attendence Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin | 
    Given "No Tab" in Configuration of the "Site Wise Monthly Summary" in TAndA Exports
      |   Fields   |   Checked   | Absent   |   leave  |
      |    All     |    true     |  true    |   true   |
    And "Custom Export Field Configuration" in Configuration of the "Site Wise Monthly Summary" in TAndA Exports
      |      Field Name      |           Field Value           |
      |  Total Present Days  | Total Days,-,Absents,-,Holidays |
      |     Total Leave      |      Leaves,+,Tours,+,COFF      |
    Then Export the "Site Wise Monthly Summary" in TAndA Exports
      |   Month   |  Year  |         FileName         |  Show Export Header | SelectUsers  |  Generate Export For  |
      |   April   |  2017  |  SiteWiseMonthlySummary  |        true         |     All      |        All Users      |
    Then Validate exported file from UI selection.
      |       FileName         |FileFormat |   Compare  |
      | SiteWiseMonthlySummary |   XLS     |   Compared |
      
@tag12 
    Scenario: Muster Roll Report in Time and Attendence Module 
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin | 
   Given "Export Shift-Wise Attendence with Code Mapping" in Configuration of the "Muster Roll" in TAndA Exports
      |  Shift   |  ShiftID | First half  |  Second half  |  Holiday  |  Output Code1  |  Output Code2  |
      | Randomly |    HO    | PR-Present  |  PR-Present   |    No     |       PR       |       PR       |
      | Randomly |    HO    | AB-Absent   |  AB-Absent    |    No     |       AB       |       AB       |
   And "Select Fields to Export" in Configuration of the "Muster Roll" in TAndA Exports
      |  Fields  |   Checked   |
      |   All    |     false   |
   Then Export the "Muster Roll" in TAndA Exports
      |  FromDate  |   ToDate   |  FileName  |  Show Export Header |  SelectUsers  |User|   Generate Export For  |
      | 01/04/2017 | 10/04/2017 | MusterRoll |        true         |      User Wise| 2breaklatein,2pGraceinWH,2pgracelatein,2pgraceshiftEO		    |   All Users       |
    Then Validate exported file from UI selection.
      |  FileName  |FileFormat |   Compare  |
      | MusterRoll |   XLS     |   Compared |
        
   