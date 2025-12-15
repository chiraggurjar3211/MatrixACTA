@FVM
Feature: Field Visit Management Module API
  I want to use this template for my feature file

  #*********************************************************************************
  # 71 field-visit-correction
  #*********************************************************************************
  @FVMAPI_1
  Scenario: Field Visit Correction Application and Authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | FVMAPIUr1  |
      | FVMAPIUr2  |
      | FVMAPIUr3  |
      | FVMAPIUr4  |
      | FVMAPIUr5  |
      | FVMAPIRic1 |
      | FVMAPIRic2 |
    And Delete "BG" shift schedule
    And Delete "BG" shift
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | BreakStart | BreakEnd | BrkDeviationAllowed | Validation         |
      | BG      | 09:00     | 18:00   | 04:00   | 08:00   | 13:00      | 14:00    | true                | Saved Successfully |
    And Create Shift Schedule "BG" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays | Active |
      | BG      |               7 | true   |
    And Configure Off Day Configuration in Shift Schedule "BG"
      | OffDay1 |
      | None    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | FVMAPIRic1 | FVMAPIRic1 |               1 |         1 |               1 |                  1 |
      | FVMAPIRic2 | FVMAPIRic2 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName     | RIC1       | RIC2       | RIC3 | RIC4 | RIC5 | Validation         |
      | APIFVM_RGrp1     | AnyOne         | FVMAPIRic1 |            |      |      |      | Saved Successfully |
      | APIFVM_RGrp2     | All Sequential | FVMAPIRic1 | FVMAPIRic2 |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | Active | ReportingGroup | JoiningDate | LeavingDate | AtdEnable | ShiftSchedule | EnableFVM | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | FVMAPIUr1 | True   | APIFVM_RGrp1   |             |             | True      | BG            | true      | True      | True      | True      | True               | Saved Successfully |
      | FVMAPIUr2 | True   | APIFVM_RGrp2   |             |             | True      | BG            | true      | True      | True      | True      | True               | Saved Successfully |
      | FVMAPIUr3 | True   |                |             |             | True      | BG            | true      | True      | True      | True      | True               | Saved Successfully |
      | FVMAPIUr4 | True   | APIFVM_RGrp1   |             |             | false     | BG            | true      | True      | True      | True      | True               | Saved Successfully |
      | FVMAPIUr5 | True   | APIFVM_RGrp1   |             |             | True      | BG            | true      | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID    |
      | FVMAPIUr1 |
      | FVMAPIUr2 |
      | FVMAPIUr3 |
      | FVMAPIUr4 |
    And Create Location from Location master
      | Code  | Name         | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | FVML1 | FVMLocation1 | Wi-Fi |         |         |          |           |                      | 00:00:00:01:11:12 | RnD2    | Saved Successfully |
      | FVML2 | FVMLocation2 | Wi-Fi |         |         |          |           |                      | 00:00:00:02:12:13 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description    | Validation         |
      | FVMTask1 | FVM Automation | Saved Successfully |
    And Create Field Visit Schedule for User "FVMAPIUr1" and date "-1" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark    |
      |                -1 |              0900 |              -1 |            1000 | FVMTask1 | FVML1    | Schedule1 |
    And Create Field Visit Schedule for User "FVMAPIUr1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark    |
      |                 0 |              0900 |               0 |            1000 | FVMTask1 | FVML1    | Schedule2 |
    And Create Field Visit Schedule for User "FVMAPIUr2" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark    |
      |                 0 |              0900 |               0 |            1000 | FVMTask1 | FVML1    | Schedule3 |
    And Create Field Visit Schedule for User "FVMAPIUr3" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark    |
      |                 0 |              0900 |               0 |            1000 | FVMTask1 | FVML1    | Schedule4 |
    And Set Password via API
      | Userid     | user-verified-for-password | new-password | type |
      | FVMAPIUr1  |                          1 | admin        |    1 |
      | FVMAPIUr2  |                          1 | admin        |    1 |
      | FVMAPIUr3  |                          1 | admin        |    1 |
      | FVMAPIUr4  |                          1 | admin        |    1 |
      | FVMAPIUr5  |                          1 | admin        |    1 |
      | FVMAPIRic1 |                          1 | admin        |    1 |
      | FVMAPIRic2 |                          1 | admin        |    1 |
    When Execute scenario start from "Scenario 1" to "Scenario 50" in API sheet named "field-visit-correction".
    Then Verify API sheet named "field-visit-correction" and scenario start from "Scenario 1" to "Scenario 50" result "Pass".
