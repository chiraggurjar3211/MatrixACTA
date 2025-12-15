@EnterpriseModule
Feature: Default

  @E1
  Scenario: Set parameters of Group Association for one group and verifying reflection in other group
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | True             | True               | True               | True             | True               | True                  | True                 | True         | True              | True                      | True                      | True               |
    Then Verify checkboxes enabled or disabled in Group Associations for "ESS" module in Enterprise module
      | Group  | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Branch | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    When Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | True                          | True                  | True                         | True                      | True              | True     | True                               | True                                   | True                          | True                              | True       | True           |
    Then Verify checkboxes enabled or disabled in Group Associations for "Attendance" module in Enterprise module
      | Group  | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Branch | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    When Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | True         | True           | True           | True           | True       |
    Then Verify checkboxes enabled or disabled in Group Associations for "Policy" module in Enterprise module
      | Group  | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Branch | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    When Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | True                              | True         | True       | True                       | True             | True          | True            | True        | True             | True        | True             | True                         | True                        |
    Then Verify checkboxes enabled or disabled in Group Associations for "Access Details" module in Enterprise module
      | Group  | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Branch | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    When Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | True                 | True                     | True                     | True                             | True                           | True                         | True                              | True                            |
    Then Verify checkboxes enabled or disabled in Group Associations for "Cafeteria" module in Enterprise module
      | Group  | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Branch | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    When Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    Then Verify checkboxes enabled or disabled in Group Associations for "Job Costing" module in Enterprise module
      | Group  | JobCosting |
      | Branch | False      |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    When Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    Then Verify checkboxes enabled or disabled in Group Associations for "Field Visit Management" module in Enterprise module
      | Group  | EnableFVM |
      | Branch | False     |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    When Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    Then Verify checkboxes enabled or disabled in Group Associations for "Face Recognition" module in Enterprise module
      | Group  | EnableFaceRecognition |
      | Branch | False                 |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    When Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | True        |
    Then Verify checkboxes enabled or disabled in Group Associations for "Visitor Management" module in Enterprise module
      | Group  | AuthorizedHostUser | DeviceGroup |
      | Branch | False              | False       |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E2
  Scenario: Group Association reflection on organization page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | True             | True               | True               | True             | True               | True                  | True                 | True         | True              | True                      | True                      | True               |
    Then Verify Group Associations reflection for "ESS" module in Enterprise Group
      | Group        | Name           | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | ReasonForPunchingFromUnassignedLocation | LocationAssignment | Location | LocationGroup | AllowDoorAccessThroughAPI | PINAuthenticationForDoorAccess | APTAFaceAntiSpoofing |
      | Organization | Organization-1 | True          | True             | True               | True               | True             | True               | True                  | True         | True              | True                      | True                                    | True               | True     | True          | True                      | True                           | True                 |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    When Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | True                          | True                  | True                         | True                      | True              | True     | True                               | True                                   | True                          | True                              | True       | True           |
    Then Verify Group Associations reflection for "Attendance" module in Enterprise Group
      | Group        | Name           | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MinimumWorkHrsRequired | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | AutoAuthorizeCOFF | BusRoute | EnableSiteBasedAutoTourApplication | Tour | BaseSiteSelection | AutoAuthorizeSiteBasedTourApplication | EnableLocationBasedAutoTourApplication | BaseLocationAssignment | Location | LocationGroup | AutoAuthorizeLocationBasedTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup | ApprovalPolicy |
      | Organization | Organization-1 | True                        | True                          | True                  | True                   | True                         | True                      | True              | True              | True     | True                               | True | True              | True                                  | True                                   | True                   | True     | True          | True                                      | True                          | True                              | True       | True           | True           |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    When Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | True         | True           | True           | True           | True       |
    Then Verify Group Associations reflection for "Policy" module in Enterprise Group
      | Group        | Name           | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | Organization-1 | True             | True         | True           | True           | True           | True       |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    When Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | True                              | True         | True       | True                       | True             | True          | True            | True        | True             | True        | True             | True                         | True                        |
    Then Verify Group Associations reflection for "Access Details" module in Enterprise Group
      | Group        | Name           | AccessValidity | AccessValidityDate | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | StartShift | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl | ElevatorFloorGroup |
      | Organization | Organization-1 | True           | True               | True                              | True         | True       | True                       | True             | True          | True       | True            | True        | True             | True        | True             | True                         | True                        | True               |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    When Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |                    |
      | Organization | True          | True                 | True                     | True                     | True                             | True                           | True                         | True                              | True                            | Saved Successfully |
    Then Verify Group Associations reflection for "Cafeteria" module in Enterprise Group
      | Group        | Name           | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidDeviceServerBalanceCheck | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | Organization-1 | True          | True                 | True                     | True                     | True                            | True                             | True                           | True                         | True                              | True                            |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |                    |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           | Saved Successfully |
    When Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    Then Verify Group Associations reflection for "Job Costing" module in Enterprise Group
      | Group        | Name           | JobCosting |
      | Organization | Organization-1 | True       |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    When Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    Then Verify Group Associations reflection for "Field Visit Management" module in Enterprise Group
      | Group        | Name           | EnableFVM |
      | Organization | Organization-1 | True      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    When Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    Then Verify Group Associations reflection for "Face Recognition" module in Enterprise Group
      | Group        | Name           | EnableFaceRecognition |
      | Organization | Organization-1 | True                  |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    When Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | True        |
    Then Verify Group Associations reflection for "Visitor Management" module in Enterprise Group
      | Group        | Name           | AuthorizedHostUser | DeviceGroup |
      | Organization | Organization-1 | True               | True        |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E3
  Scenario: Group Association reflection on user configuration page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_31 |
      | ECS_32 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG31 | Deleted Successfully |
      | Organization | ORG32 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG31 | ORG31 | Saved Successfully |
      | Organization | ORG32 | ORG32 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP3 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create User via api
      | Id     | name   |
      | ECS_31 | ECS_31 |
      | ECS_32 | ECS_32 |
    And Assign groups to user from user configuration
      | UserID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | ECS_31 | ORG31        |        |            |         |          |       |             |                |                |                | Saved Successfully |
      | ECS_32 | ORG32        |        |            |         |          |       |             |                |                |                | Saved Successfully |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG31 | True          | True                        | EnterpriseAP3    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Accept            | Saved Successfully |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy    | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_31 | True          | True                        | EnterpriseAP3       | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               |
      | ECS_32 | False         | False                       | Attendance Policy-1 | False          |                    | None             | Disabled   | False     | False                 | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E4
  Scenario: Group Association reflection on user configuration page, switch organization from Organization Page
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_41 |
      | ECS_42 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG41 | Deleted Successfully |
      | Organization | ORG42 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG41 | ORG41 | Saved Successfully |
      | Organization | ORG42 | ORG42 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP4 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create User via api
      | Id     | name   |
      | ECS_41 | ECS_41 |
      | ECS_42 | ECS_42 |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG41 | True          | True                        | EnterpriseAP4    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Accept            | Saved Successfully |
    And Assign user from Enterprise module
      | Group        | Name  | Userid | validation         |
      | Organization | ORG41 | ECS_42 | Saved Successfully |
      | Organization | ORG42 | ECS_41 | Saved Successfully |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy    | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_42 | True          | True                        | EnterpriseAP4       | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               |
      | ECS_41 | False         | False                       | Attendance Policy-1 | False          |                    | None             | Disabled   | False     | False                 | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E5
  Scenario: Group Association reflection on user configuration page, switch organization from User API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_51 |
      | ECS_52 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG51 | Deleted Successfully |
      | Organization | ORG52 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG51 | ORG51 | Saved Successfully |
      | Organization | ORG52 | ORG52 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP5 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create User via api
      | Id     | name   |
      | ECS_51 | ECS_51 |
      | ECS_52 | ECS_52 |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG51 | True          | True                        | EnterpriseAP5    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Accept            | Saved Successfully |
    And Create User via api
      | Id     | name   | Organization_code |
      | ECS_51 | ECS_51 | ORG52             |
      | ECS_52 | ECS_52 | ORG51             |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy    | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_52 | True          | True                        | EnterpriseAP5       | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               |
      | ECS_51 | False         | False                       | Attendance Policy-1 | False          |                    | None             | Disabled   | False     | False                 | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E6
  Scenario: Group Association reflection on user configuration page, switch organization from User Import
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_61 |
      | ECS_62 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG61 | Deleted Successfully |
      | Organization | ORG62 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG61 | ORG61 | Saved Successfully |
      | Organization | ORG62 | ORG62 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP6 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create User via api
      | Id     | name   |
      | ECS_61 | ECS_61 |
      | ECS_62 | ECS_62 |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG61 | True          | True                        | EnterpriseAP6    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Accept            | Saved Successfully |
    And Import Data "User"
      | UserID | UserName | Full Name | OrganizationID |
      | ECS_61 | ECS_61   | ECS_61    | ORG62          |
      | ECS_62 | ECS_62   | ECS_62    | ORG61          |
    And Import "XLS" and check Imported Data for "User"
      | UserID | Result  |
      | ECS_61 | Success |
      | ECS_62 | Success |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy    | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_62 | True          | True                        | EnterpriseAP6       | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               |
      | ECS_61 | False         | False                       | Attendance Policy-1 | False          |                    | None             | Disabled   | False     | False                 | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E7
  Scenario: Decline conformation pop up while changing group of user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_71 |
      | ECS_72 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG71 | Deleted Successfully |
      | Organization | ORG72 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG71 | ORG71 | Saved Successfully |
      | Organization | ORG72 | ORG72 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP7 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create User via api
      | Id     | name   |
      | ECS_71 | ECS_71 |
      | ECS_72 | ECS_72 |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG71 | True          | True                        | EnterpriseAP7    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Decline           | Saved Successfully |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy    | AccessValidity | AccessValidityDate | DiscountLevel | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_72 | False         | False                       | Attendance Policy-1 | False          |                    | None          | Disabled   | False     | False                 | False              |
      | ECS_71 | False         | False                       | Attendance Policy-1 | False          |                    | None          | Disabled   | False     | False                 | False              |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

  @E8
  Scenario: Set parameters for group association and then create user and verify
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | ECS_81 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name  | Validation           |
      | Organization | ORG81 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name  | Code  | Validation         |
      | Organization | ORG81 | ORG81 | Saved Successfully |
    And Create Attendance Policy
      | PlcName       | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | EnterpriseAP8 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | True          | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | True                        | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | True             | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True           | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | True          | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | True       |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | True      |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | True                  |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | True               | False       |
    When Set Value of Associated Parameters in Enterprise module
      | Group        | Name  | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser | ConfirmationPopup | validation         |
      | Organization | ORG81 | True          | True                        | EnterpriseAP8    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               | Decline           | Saved Successfully |
    And Create User via api
      | Id     | name   | Organization_code |
      | ECS_81 | ECS_81 | ORG81             |
    Then Verify User in User Configuration Page
      | UserID | EnableAccount | EnableAttendanceCalculation | AttendancePolicy | AccessValidity | AccessValidityDate | DiscountLevel    | JobCosting | EnableFVM | EnableFaceRecognition | AuthorizedHostUser |
      | ECS_81 | True          | True                        | EnterpriseAP8    | True           |                 10 | Discount Level 2 | Enabled    | True      | True                  | True               |
    And Set value in Group Associations for "ESS" module in Enterprise module
      | Group        | EnableAccount | EditBasicDetails | PunchMarkingViaESS | PunchMarkingViaAPI | AutoPunchMarking | ManualPunchMarking | FaceMandatoryforPunch | APTAFaceAntiSpoofing | CapturePhoto | AllowOfflinePunch | LocationMandatoryforPunch | AllowDoorAccessThroughAPI | LocationAssignment |
      | Organization | False         | False            | False              | False              | False            | False              | False                 | False                | False        | False             | False                     | False                     | False              |
    And Set value in Group Associations for "Attendance" module in Enterprise module
      | Group        | EnableAttendanceCalculation | RestrictHalfDayConsiderations | AttendanceMarkingType | MaximumPunchestobeconsidered | MaximumShortLeavesAllowed | OTCOFFEligibility | BusRoute | EnableSiteBasedAutoTourApplication | EnableLocationBasedAutoTourApplication | ShowAttendanceDetailsOnDevice | BypassFingerPalmFaceForAttendance | LeaveGroup | ReportingGroup |
      | Organization | False                       | False                         | False                 | False                        | False                     | False             | False    | False                              | False                                  | False                         | False                             | False      | False          |
    And Set value in Group Associations for "Policy" module in Enterprise module
      | Group        | AttendancePolicy | LateINPolicy | EarlyOUTPolicy | OvertimePolicy | AbsenteePolicy | COFFPolicy |
      | Organization | False            | False        | False          | False          | False          | False      |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessValidity | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | False          | False                             | False        | False      | False                      | False            | False         | False           | False       | False            | False       | False            | False                        | False                       |
    And Set value in Group Associations for "Cafeteria" module in Enterprise module
      | Group        | DiscountLevel | CafeteriaUsagePolicy | EnableOfflineTransaction | PrepaidBalanceManagement | PrepaidMaximumUsageLimitPerMonth | PrepaidMaximumUsageLimitPerDay | PostpaidAllowedUsagePerMonth | PostpaidMaximumUsageLimitPerMonth | PostpaidMaximumUsageLimitPerDay |
      | Organization | False         | False                | False                    | False                    | False                            | False                          | False                        | False                             | False                           |
    And Set value in Group Associations for "Job Costing" module in Enterprise module
      | Group        | JobCosting |
      | Organization | False      |
    And Set value in Group Associations for "Field Visit Management" module in Enterprise module
      | Group        | EnableFVM |
      | Organization | False     |
    And Set value in Group Associations for "Face Recognition" module in Enterprise module
      | Group        | EnableFaceRecognition |
      | Organization | False                 |
    And Set value in Group Associations for "Visitor Management" module in Enterprise module
      | Group        | AuthorizedHostUser | DeviceGroup |
      | Organization | False              | False       |

      
       ##################### V20R09_CSR-4531 Start ##########################
      #Enterprise Structure Module for
  #CSR-4532
  @CSR4531_1
  Scenario: Default Access Profile Must Be assigned to User when Device Is assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | PanelLite  |                    |               | AcsProflPanelLite_1 | 11:12:13:11:12:14 |                 |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile | AccessLevelForSmartIdentification | BypassFinger | BypassPalm | EnableAdvanceAccessControl | ShiftBasedAccess | ShiftSchedule | HolidaySchedule | DeviceGroup | BiometricGroupNo | RoamingUser | SmartAccessRoute | MaximumSmartAccessRouteLevel | EnableElevatorAccessControl |
      | Organization | True          |                                   |              |            |                            |                  |               |                 |             |                  |             |                  |                              |                             |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName           | PanelSelection | AcsPrflName |
      | AcsProflPanelLite_1 | true           |             |
      | AcsProflPanel200_1  | true           |             |
    When Create user from user configuration
      | userid      | Organization | DeviceName                              | Validation         |
      | AcsProflUr1 | APORG1       | AcsProflArgoFacePD1,AcsProflPanelLite_1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device              | AccessProfile |
      | AcsProflPanelLite_1 | Group-1       |
      | AcsProflPanel200_1  | Group-1       |

  # CSR-4532
  @CSR4531_2
  Scenario: Default Access Profile Must Be assigned to User when Device Group is assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Create user from user configuration
      | userid      | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | APORG1       | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4532
  @CSR4531_3
  Scenario: Change Access Profile Manually From User Configuration when device is assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProflArgoFacePD1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4532
  @CSR4531_4
  Scenario: Change Access Profile Changed Manually From User Configuration when Device Group is assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4532
  @CSR4531_5
  Scenario: Change Access Profile from Multi-User Configurations, when device is assigned to the user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    #When Create user from user configuration
    #| userid      | Active | Organization | DeviceName          |  Validation         |
    #| AcsProflUr1 | True   |        | AcsProflArgoFacePD1 | Saved Successfully |
    #| AcsProflUr2 | True   |        | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr2 | True   | APORG1       | AcsProflArgoFacePD1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Update users from multiuser Configuration page
      | UserID                  | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2 | AcsProflArgoFacePD1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4532
  @CSR4531_6
  Scenario: Revoke old Device Group and Assign new Device Group to user from Multi-User Configurations
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | Panel200   |                    |               | AcsProflPanel200_3  | 11:12:13:11:12:17 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
      | PanelDoor  | AcsProflPanel200_3 | ARGO FACE     | AcsProflArgoFacePD3 | 10:11:12:10:11:18 | 191.191.191.195 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProfl_DG2    | AcsProflArgoFacePD2 | Saved Successfully |
      | AcsProfl_DG3    | AcsProflArgoFacePD3 | Saved Successfully |
    #When Create user from user configuration
    #| userid      | Active | Organization | DeviceGroup  |Validation         |
    #| AcsProflUr1 | True   |        | AcsProfl_DG2 |Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
      | AcsProflPanel200_3 | true           | AcsProfile3 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProfl_DG2 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |
    When Update users from multiuser Configuration page
      | UserID      | RevokeDevice/DeviceGroup | Update | DeviceGroupName | AccessProfile |
      | AcsProflUr1 | true                     | true   | AcsProfl_DG2    |               |
      | AcsProflUr1 |                          | true   | AcsProfl_DG1    |               |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4532
  @CSR4531_7
  Scenario: Revoke old device and assign new device to user via API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr2 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName | Validation         |
      | AcsProflUr1 | True   | APORG1       |            | Saved Successfully |
      | AcsProflUr2 | True   | APORG1       |            | Saved Successfully |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Revoke device via API
      | DeviceType | Panel              | device              | id                      |
      | PanelDoor  | AcsProflPanel200_1 | AcsProflArgoFacePD1 | AcsProflUr1,AcsProflUr2 |
    And Assign device to user via API
      | DeviceType | Panel              | device              | id                      |
      | PanelDoor  | AcsProflPanel200_2 | AcsProflArgoFacePD2 | AcsProflUr1,AcsProflUr2 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |

  #CSR-4532
  @CSR4531_8
  Scenario: Revoke old Device Group and assign new Device Group to user via API
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | Panel200   |                    |               | AcsProflPanel200_3  | 11:12:13:11:12:17 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
      | PanelDoor  | AcsProflPanel200_3 | ARGO FACE     | AcsProflArgoFacePD3 | 10:11:12:10:11:18 | 191.191.191.195 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProfl_DG2    | AcsProflArgoFacePD2 | Saved Successfully |
      | AcsProfl_DG3    | AcsProflArgoFacePD3 | Saved Successfully |
    #When Create user from user configuration
    #| userid      | Active | Organization | DeviceGroup  | Validation         |
    #| AcsProflUr1 | True   |        | AcsProfl_DG2 | Saved Successfully |
    #| AcsProflUr2 | True   |        | AcsProfl_DG2 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
      | AcsProflPanel200_3 | true           | AcsProfile3 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProfl_DG2 | Saved Successfully |
      | AcsProflUr2 | True   | APORG1       | AcsProfl_DG2 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |
    When Revoke Device Group via API
      | device-group | id          |
      | AcsProfl_DG2 | AcsProflUr1 |
      | AcsProfl_DG2 | AcsProflUr2 |
    And Assign device group to user via API
      | device-group | id          |
      | AcsProfl_DG1 | AcsProflUr1 |
      | AcsProfl_DG1 | AcsProflUr2 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4532
  @CSR4531_9
  Scenario: Change Access Profile Manually From Enterprise Structure Module when The Device Group Is assigned to the User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | Panel200   |                    |               | AcsProflPanel200_3  | 11:12:13:11:12:17 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
      | PanelDoor  | AcsProflPanel200_3 | ARGO FACE     | AcsProflArgoFacePD3 | 10:11:12:10:11:18 | 191.191.191.195 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProfl_DG2    | AcsProflArgoFacePD2 | Saved Successfully |
      | AcsProfl_DG3    | AcsProflArgoFacePD3 | Saved Successfully |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceGroup               | Validation         |
      | AcsProflUr1 | True   |              | AcsProfl_DG2,AcsProfl_DG3 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
      | AcsProflPanel200_3 | true           | AcsProfile3 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | True   | APORG1       | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
      | AcsProflPanel200_2 | AcsProfile2   |
      | AcsProflPanel200_3 | AcsProfile3   |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
      | AcsProflPanel200_2 | true           | AcsProfile3 |
      | AcsProflPanel200_3 | true           | AcsProfile1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
      | AcsProflPanel200_2 | AcsProfile3   |
      | AcsProflPanel200_3 | AcsProfile1   |

  #CSR-4532
  @CSR4531_10
  Scenario: Assigns Multiple Device With Multiple Access Profile to the User then It should display different Access Profile for different devices in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | Panel200   |                    |               | AcsProflPanel200_3  | 11:12:13:11:12:17 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
      | PanelDoor  | AcsProflPanel200_3 | ARGO FACE     | AcsProflArgoFacePD3 | 10:11:12:10:11:18 | 191.191.191.195 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProfl_DG2    | AcsProflArgoFacePD2 | Saved Successfully |
      | AcsProfl_DG3    | AcsProflArgoFacePD3 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
      | AcsProflPanel200_3 | true           | AcsProfile3 |
    When Create user from user configuration
      | userid      | Organization | DeviceGroup                            | Validation         |
      | AcsProflUr1 | APORG1       | AcsProfl_DG1,AcsProfl_DG2,AcsProfl_DG3 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
      | AcsProflPanel200_2 | AcsProfile2   |
      | AcsProflPanel200_3 | AcsProfile3   |

  #CSR-4533
  @CSR4531_11
  Scenario: Chnage Organization using Single User from User Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
      | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
      | Organization | APORG2 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change group for "Single User" from Change Group page
      | UserId      | ChangeGroup  | FromDate | ToDate | NewGroup | Validation         |
      | AcsProflUr1 | Organization |        0 |        | APORG2   | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_12
  Scenario: Chnage Organization using Multi User from User Module- Select Users = Group Wise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
      | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr2 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr3 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
      | Organization | APORG2 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change group for "Multi User" from Change Group page
      | GroupType    | FromDate | ToDate | NewGroup | SelectUsers | SelectGroup  | GroupName | Validation        |
      | Organization |          |        | APORG2   | Group Wise  | Organization | APORG1    | Process Completed |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_13
  Scenario: Chnage Organization using Multi User from User Module- Select Users = User Wise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
      | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr2 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr3 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
      | Organization | APORG2 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change group for "Multi User" from Change Group page
      | GroupType    | FromDate | ToDate | NewGroup | SelectUsers | UserId                              | GroupName | Validation        |
      | Organization |          |        | APORG2   | User Wise   | AcsProflUr1,AcsProflUr2,AcsProflUr3 |           | Process Completed |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_14
  Scenario: If Access Profile is not configured in Organization, assign Device from multiuser configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | false         | Yes               | Saved Successfully |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | AcsProflArgoFacePD1 |               |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4533
  @CSR4531_15
  Scenario: If Access Profile is not configured in Organization, assign Device Group from multiuser configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | false         | Yes               | Saved Successfully |
    When Update users from multiuser Configuration page
      | UserID                              | Update | DeviceGroupName |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | true   | AcsProfl_DG1    |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4533
  @CSR4531_16
  Scenario: Assign Device from Multi-User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
      | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG2            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
      | Organization | APORG2 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    When Update users from multiuser Configuration page
      | UserID                  | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2 | AcsProflArgoFacePD1 | AcsProfile1   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Update users from multiuser Configuration page
      | UserID      | Organization | DeviceName          |
      | AcsProflUr3 | APORG2       | AcsProflArgoFacePD1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_17
  Scenario: Assign Device Group from Multi-User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Update users from multiuser Configuration page
      | UserID                              | Update | DeviceGroupName | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | true   | AcsProfl_DG1    |               |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4533
  @CSR4531_18
  Scenario: Assign Device from Users On Device
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When "Assign Users" users from User On Device page
      | DeviceName          | SelectUsers | UserID                              | AccessGroup |
      | AcsProflArgoFacePD1 | User Wise   | AcsProflUr1,AcsProflUr2,AcsProflUr3 |             |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4533
  @CSR4531_19
  Scenario: Assign Device and Change Access Profile from Multi-User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | AcsProflArgoFacePD1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_20
  Scenario: Assign device from Multiuser Configurations and Change Access Profile from Enterprise group = Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
      | AcsProfile4  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
       | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG2            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile4  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
      | Organization | APORG2 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
     And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile3 |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2 | AcsProflArgoFacePD1 |  AcsProfile1  |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
     When Update users from multiuser Configuration page
      | UserID      | Organization | DeviceName          |
      | AcsProflUr3 | APORG2       | AcsProflArgoFacePD1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile3   |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile4 |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile4   |
  

  #CSR-4533
  @CSR4531_21
  Scenario: Assign Device Group from Multiuser Configurations and Change Access Profile from Enterprise group = Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Update users from multiuser Configuration page
      | UserID                              | Update | DeviceGroupName | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | true   | AcsProfl_DG1    |               |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_22
  Scenario: Assign device from Multiuser Configurations and Change Access Profile from User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
      | AcsProfile4  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
       | Organization | APORG2 | APORG2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG2            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile4  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
      | Organization | APORG2 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG2"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile3 |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2 | AcsProflArgoFacePD1 |    AcsProfile1           |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
     When Update users from multiuser Configuration page
      | UserID      | Organization | DeviceName          |
      | AcsProflUr3 | APORG2       | AcsProflArgoFacePD1 |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile3   |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Change Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Change Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile4   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile4   |
      
  #CSR-4533
  @CSR4531_23
  Scenario: Assign Device Group from Multiuser Configurations and Change Access Profile from User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName | AtdEnable | MaxPunchesToBeConsidered | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | AcsProflUr1 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
      | AcsProflUr2 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
      | AcsProflUr3 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
    When Update users from multiuser Configuration page
      | UserID                              | Update | DeviceGroupName | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | true   | AcsProfl_DG1    |               |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Change Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Change Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4533
  @CSR4531_24
  Scenario: Assign Device then Change Access Profile from MultiUser Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | true          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Create user from user configuration
      | userid      | Active | Organization | DeviceName | AtdEnable | MaxPunchesToBeConsidered | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | AcsProflUr1 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
      | AcsProflUr2 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
      | AcsProflUr3 | True   | APORG1       |            | True      |                        2 | True      | True      | True      | True               | Saved Successfully |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | AcsProflArgoFacePD1 |  AcsProfile1             |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | AcsProflArgoFacePD1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  ########################################
  ####################
  #CSR-4534
  @CSR4531_25
  Scenario: Assign user to device from Device Configuration when access profile is configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Assign users to device from Device Configuration
      | DeviceName          | UserId      |
      | AcsProflArgoFacePD1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4534
  @CSR4531_26
  Scenario: Assign user to Device Group from Device Module when access profile is configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Assign users to Device Group from Device Module
      | DeviceGroupName | SelectUsers | UserId      | Validation         |
      | AcsProfl_DG1    | User Wise   | AcsProflUr1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4534
  @CSR4531_27
  Scenario: Assign user to device from Device Configuration when access profile is not configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign users to device from Device Configuration
      | DeviceName          | UserId      |
      | AcsProflArgoFacePD1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4534
  @CSR4531_28
  Scenario: Assign user to Device Group from Device Module when access profile is not configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign users to Device Group from Device Module
      | DeviceGroupName | SelectUsers | UserId      | Validation         |
      | AcsProfl_DG1    | User Wise   | AcsProflUr1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4534
  @CSR4531_29
  Scenario: Change Access Profile from default to new from User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4534
  @CSR4531_30
  Scenario: Change Access Profile from default to new from Multi-User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProflUr2 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    When Update users from multiuser Configuration page
      | UserID                  | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2 | AcsProflArgoFacePD1 | AcsProfile1   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4534
  @CSR4531_31
  Scenario: Change Access Profile from default to new from Enterprise Structure Module for Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceName          | Validation         |
      | AcsProflUr1 | True   |              | AcsProflArgoFacePD1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4534
  @CSR4531_32
  Scenario: Assign device to user and change access profile then with same device assign device group to user
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    And Create user from user configuration
      | userid      | Organization | DeviceName          | Validation         |
      | AcsProflUr1 |              | AcsProflArgoFacePD1 | Saved Successfully |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Create user from user configuration
      | userid      | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 |              | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4535
  @CSR4531_33
  Scenario: Assign Device to user via api, Access Profile not configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign device to user via API
      | DeviceType | Panel              | device              | id          |
      | PanelDoor  | AcsProflPanel200_1 | AcsProflArgoFacePD1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4535
  @CSR4531_34
  Scenario: Assign Device Group to user via API, Access Profile not configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign device group to user via API
      | device-group | id          |
      | AcsProfl_DG1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4535
  @CSR4531_35
  Scenario: Assign Device to user via api, Access Profile configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Assign device to user via API
      | DeviceType | Panel              | device              | id          |
      | PanelDoor  | AcsProflPanel200_1 | AcsProflArgoFacePD1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4535
  @CSR4531_36
  Scenario: Assign Device Group to user via api, Access Profile configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Assign device group to user via API
      | device-group | id          |
      | AcsProfl_DG1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4535
  @CSR4531_37
  Scenario: Change Access Profile from Multi-User Configuration, when device assigned via api
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr3 | AcsProflUr3 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    When Assign device to user via API
      | DeviceType | Panel              | device              | id                                  |
      | PanelDoor  | AcsProflPanel200_1 | AcsProflArgoFacePD1 | AcsProflUr1,AcsProflUr2,AcsProflUr3 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    When Update users from multiuser Configuration page
      | UserID                              | DeviceName          | AccessProfile |
      | AcsProflUr1,AcsProflUr2,AcsProflUr3 | AcsProflArgoFacePD1 | AcsProfile2   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
    And Verify Device Configuration from User Configuration for UserId= "AcsProflUr3"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |

  #CSR-4535
  @CSR4531_38
  Scenario: Change Access Profile from User Configuration, when device assigned via api
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign device to user via API
      | DeviceType | Panel              | device              | id          |
      | PanelDoor  | AcsProflPanel200_1 | AcsProflArgoFacePD1 | AcsProflUr1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    When Change Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |

  #CSR-4536
  @CSR4531_39
  Scenario: Assign Device Group to user and Visitor Profile via api, Access Profile not configured in Organization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Visitor Profile from VMS module
      | ID          | Active | Organization | Validation         |
      | AcsProflVP1 | True   | APORG1       | Saved Successfully |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           |             |
    When Assign device group to user via API
      | device-group | id          |
      | AcsProfl_DG1 | AcsProflUr1 |
    And Assign device group to visitor profile via API
      | device-group | id          |
      | AcsProfl_DG1 | AcsProflVP1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |
    And Verify Device Configuration from Visitor Profile page for VisitorProfileId= "AcsProflVP1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | Group-1       |

  #CSR-4536
  @CSR4531_40
  Scenario: Change Access Profile Manually From Enterprise Structure Module= Organization, when The Device Group Is assigned to the User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile3  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | Panel200   |                    |               | AcsProflPanel200_2  | 11:12:13:11:12:16 |                 |
      | Panel200   |                    |               | AcsProflPanel200_3  | 11:12:13:11:12:17 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
      | PanelDoor  | AcsProflPanel200_2 | ARGO FACE     | AcsProflArgoFacePD2 | 10:11:12:10:11:17 | 191.191.191.194 |
      | PanelDoor  | AcsProflPanel200_3 | ARGO FACE     | AcsProflArgoFacePD3 | 10:11:12:10:11:18 | 191.191.191.195 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
      | AcsProfl_DG2    | AcsProflArgoFacePD2 | Saved Successfully |
      | AcsProfl_DG3    | AcsProflArgoFacePD3 | Saved Successfully |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup               | Validation         |
      | AcsProflUr1 | True   |              | AcsProfl_DG2,AcsProfl_DG3 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile |
      | Organization | True          |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    And Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
      | AcsProflPanel200_2 | true           | AcsProfile2 |
      | AcsProflPanel200_3 | true           | AcsProfile3 |
    When Create user from user configuration
      | userid      | Active | Organization | Validation         |
      | AcsProflUr1 | True   | APORG1       | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_2 | AcsProfile2   |
      | AcsProflPanel200_3 | AcsProfile3   |
    When Create user from user configuration
      | userid      | Active | Organization | DeviceGroup  | Validation         |
      | AcsProflUr1 | True   |              | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile1   |
      | AcsProflPanel200_2 | AcsProfile2   |
      | AcsProflPanel200_3 | AcsProfile3   |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
      | AcsProflPanel200_2 | true           | AcsProfile3 |
      | AcsProflPanel200_3 | true           | AcsProfile1 |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      | Device             | AccessProfile |
      | AcsProflPanel200_1 | AcsProfile2   |
      | AcsProflPanel200_2 | AcsProfile3   |
      | AcsProflPanel200_3 | AcsProfile1   |
      
  #CSR-4537
  @CSR4531_41
  Scenario: Assign Access Profile, Device Group and New User to Organization from Enterprise Module
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
      | AcsProflUr2 | AcsProflUr2 |                   |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile | DeviceGroup |
      | Organization | True          | True        |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Device Group to Enterprise Group from Association Mapping in Enterprise module
      | Group        | Name   | DeviceGroup  | Validation         |
      | Organization | APORG1 | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      |DeviceGroupName| Device             | AccessProfile |
      |	AcsProfl_DG1	| AcsProflPanel200_1 | AcsProfile1   |
    When Assign user from Enterprise module
      | Group        | Name   | Userid      | validation         |
      | Organization | APORG1 | AcsProflUr2 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr2"
     |DeviceGroupName | Device             | AccessProfile |
     |AcsProfl_DG1 | AcsProflPanel200_1 | AcsProfile1   |
      
#CSR-4537
  @CSR4531_42
  Scenario: Assign Device Group to Organization from Enterprise Module, Access Profile No Configured
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile | DeviceGroup |
      | Organization | True          | True        |
    When Assign Device Group to Enterprise Group from Association Mapping in Enterprise module
      | Group        | Name   | DeviceGroup  | Validation         |
      | Organization | APORG1 | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      |DeviceGroupName| Device             | AccessProfile |
      |	AcsProfl_DG1	| AcsProflPanel200_1 | Group-1   |
   
    #CSR-4537
  @CSR4531_43
  Scenario: Change Access Profile from Enterprise Module and check device group and access profile in User Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID      |
      | AcsProflUr1 |
      | AcsProflUr2 |
      | AcsProflUr3 |
    And Delete visitor profile via API
      | id          |
      | AcsProflVP1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | APORG1 | Deleted Successfully |
      | Organization | APORG2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName          |
      | AcsProflPanelLite_1 |
      | AcsProflArgoFacePD1 |
      | AcsProflArgoFacePD2 |
      | AcsProflArgoFacePD3 |
      | AcsProflPanel200_1  |
      | AcsProflPanel200_2  |
      | AcsProflPanel200_3  |
    And Delete Device Group from Device Module
      | DeviceGroupName | Validation           |
      | AcsProfl_DG1    | Deleted Successfully |
      | AcsProfl_DG2    | Deleted Successfully |
      | AcsProfl_DG3    | Deleted Successfully |
    And Delete Access Profile from Access Control Module
      | AcsProflName |
      | AcsProfile1  |
      | AcsProfile2  |
      | AcsProfile3  |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | APORG1 | APORG1 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | AcsProflUr1 | AcsProflUr1 | APORG1            |               1 |         1 |               1 |                  1 |
    And Create Access Profile from Access Profile Page
      | AcsProflName | WorkHrs | BreakHrs | Non-WorkingHrs | Validation         |
      | AcsProfile1  |       8 |        8 |              8 | Saved Successfully |
      | AcsProfile2  |       8 |        8 |              8 | Saved Successfully |
    And Add Device from device module
      | DeviceType | PanelName          | PanelDoorType | DeviceName          | MACAddress        | IPAddress       |
      | Panel200   |                    |               | AcsProflPanel200_1  | 11:12:13:11:12:15 |                 |
      | PanelDoor  | AcsProflPanel200_1 | ARGO FACE     | AcsProflArgoFacePD1 | 10:11:12:10:11:16 | 191.191.191.193 |
    And Create Device Group from device module
      | DeviceGroupName | DeviceName          | Validation         |
      | AcsProfl_DG1    | AcsProflArgoFacePD1 | Saved Successfully |
    And Set value in Group Associations for "Access Details" module in Enterprise module
      | Group        | AccessProfile | DeviceGroup |
      | Organization | True          | True        |
    And Set Value of Associated Parameters in Enterprise module
      | Group        | Name   | AccessProfile | ConfirmationPopup | validation         |
      | Organization | APORG1 | True          | Yes               | Saved Successfully |
    When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile1 |
    And Assign Device Group to Enterprise Group from Association Mapping in Enterprise module
      | Group        | Name   | DeviceGroup  | Validation         |
      | Organization | APORG1 | AcsProfl_DG1 | Saved Successfully |
    Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      |DeviceGroupName| Device             | AccessProfile |
      |	AcsProfl_DG1	| AcsProflPanel200_1 | AcsProfile1   |
     When Assign Access Profile to device from Enterprise group= "Organization" GroupName= "APORG1"
      | PanelName          | PanelSelection | AcsPrflName |
      | AcsProflPanel200_1 | true           | AcsProfile2 |
   Then Verify Device Configuration from User Configuration for UserId= "AcsProflUr1"
      |DeviceGroupName| Device             | AccessProfile |
      |	AcsProfl_DG1	| AcsProflPanel200_1 | AcsProfile2   |
      
     ##################### V20R09_CSR-4531 End ##########################