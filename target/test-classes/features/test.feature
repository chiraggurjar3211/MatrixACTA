@ShiftAndSchedules
Feature: 5 Level RIC - All Sequential Approval Policy - Shift Change Application and Approval
  I want to use this template for my feature file

  @TS_CPA_134
  Scenario: CSR-11827 - Task Scheduler - Continuous Absence - Cons Half Day PR Checked - Case6
      #And Approve Reject Leave Application from SA Date From= "0" To= "0"
      #| UserID      | Approve | Reject | Validation         |
      #| OnBehalf_U1 | true    |        | Saved Successfully |
     # And Apply Tour Application from leave module
     # | userid      | FromDate   | ToDate     | Leave   | Validation                   |
     # | OnBehalf_U1 |  0         | 0          | ME - ME | No more absent records exist |
      #And Approve Reject Tour Application from SA Date From= "0" To= "0"
     # | UserID      | Approve | Reject | Validation         |
     # | OnBehalf_U1 | true    |        | Saved Successfully |
      #And Approve Reject Coff Application from SA Date From= "0" To= "0"
      #| UserID      | Approve | Reject | Validation         |
     # | OnBehalf_U1 | true    |        | Saved Successfully |
     # And Manual Correction Application from cafeteria
    #  | Userid      | TrnDate | TrnTime | DeviceName | MenuName  | ItemName  | NewQuantity | Validation         |
    #  | OnBehalf_U1 |       0 | 10:00   | OnBehalf1  | OnBehalf1 | OnBehalf1 |           1 | Saved Successfully |


     # And Authorize time sheet corrrection application from JPC module
     # | UserName    | AttendanceDate | FilterUser | Approval | Validation         |
    #  | OnBehalf_U1 |              0 | Individual | Reject   | Saved Successfully |
    #  | OnBehalf_W1 |              0 | Individual | Reject   | Saved Successfully |
      #When Approval of RIC from Visit Registration Approval page in VMS module
     # | FromDate | ToDate | HostID | Approval |
     # |        1 |      1 | VM_55  | Approve  |
     # When Short leave Official InOut entry from TnA module
      #| UserID      | AttendanceDate | Punch1-Time | SpFunction1 | SelectReason1 | CustomReason1 | Punch2-Time | SpFunction2 | SelectReason2 | CustomReason2 | Punch3-Time | SpFunction3 | SelectReason3 | CustomReason3 | Punch4-Time | SpFunction4 | SelectReason4 | CustomReason4 | BreakStartTime | BreakEndTime | Validation         |
     # | OnBehalf_U1 |             0  | 10:00       | Official IN |               |               |             |             |               |               |             |             |               |               |             |             |               |               |                |              | Saved Successfully |

     # And Create Worker from CWM module
      #| WorkerId    | name        | Active | SkillName | ContractorName | ReportingGroup | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | Validation         |
     # | OnBehalf_W1 | OnBehalf_W1 | True   | Skill-1   | OnBehalf1        | OnBehalf_R1    | True      | True      | True               | True      | Saved Successfully |

      
      
      
