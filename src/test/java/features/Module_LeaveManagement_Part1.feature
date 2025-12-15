@LeaveManagement
Feature: Leave Management Part1
  I want to use this template for my feature file

  #################Reserved Words [PR,AB,WO,PH,IN,FB,RD]##############
  #################################Leave Group########################
  @LMPart1_1
  Scenario: Auto Adjustment checkbox Enable in Leave Group Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Attendance Policy
      | PlcName        | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | AutoAtdCorrectLeave | validation         |
      | LM_AP_AutoAdj1 |                2 |               |                      |                  |                    |                       |              |                                   | true                | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | AA      | LM_AA_AutoAdj1 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | AD      | LM_AD_AutoAdj2 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | AC      | LM_AC_AutoAdj3 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrpAutoAdj1" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | AA      | true           |
      | AD      | false          |
      | AC      | true           |
    And Create user from user configuration
      | userid | Active | LeaveGroup          | AtdEnable | AttendancePlc  | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrpAutoAdj1 | True      | LM_AP_AutoAdj1 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | AA      |            |           1 | User Wise   | LMUr1   | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_AA_AutoAdj1 | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    1.00 |    0.00 |     0.00 |
      | LMUr1  | LM_AD_AutoAdj2 | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
      | LMUr1  | LM_AC_AutoAdj3 | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
 
  @LMPart1_2
  Scenario: Auto Adjustment checkbox Enable in Leave Group Scenario 2
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Attendance Policy
      | PlcName             | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | AutoAtdCorrectLeave | validation         |
      | LM_AP_AutoAdjCheck2 |                2 |               |                      |                  |                    |                       |              |                                   | true                | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | AE      | LM_AE_AutoAdj2 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | AF      | LM_AF_AutoAdj2 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
      | AG      | LM_AG_AutoAdj2 | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrpAutoAdjCheck2" with Pro-rata "False"
      | LeaveID | AutoAdjustment |
      | AE      | true           |
      | AF      | false          |
      | AG      | true           |
    And Create user from user configuration
      | userid | Active | LeaveGroup               | AtdEnable | AttendancePlc       | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrpAutoAdjCheck2 | True      | LM_AP_AutoAdjCheck2 | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | AF      |            |           1 | User Wise   | LMUr1   | Saved Successfully |
      | Monthly |     0 |    0 | AG      |            |           1 | User Wise   | LMUr1   | Saved Successfully |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_AE_AutoAdj2 | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
      | LMUr1  | LM_AF_AutoAdj2 | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr1  | LM_AG_AutoAdj2 | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    1.00 |    0.00 |     0.00 |

  #################################Leave Group End########################
  #################################Leave Credit Starts########################
  @LMPart1_3
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Fixed, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | AccrPlcName | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CD      | Fixed      |           1 |             | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_4
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy in Credit/Debit/Encashment page, Accrual Mode= Fixed, Credit In Terms Of= Days in Accrual Policy, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | January | February | March | April | May | June | July | August | September | October | November | December | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Fixed       | Days            |            |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CD      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_5
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit = Days, Attendance Days= Payable days, Payable Days= Presents, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Calculated  | Days            |             1 | Payable Days | Presents    |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPlc_LvCr1" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CD      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_6
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Calculated  | Days            |             1 | Non-Payable Days | Absents        |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPlc_LvCr1" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CD      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_7
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Fixed, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | AccrPlcName | CreditValue | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CD      | Fixed      |             |           2 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

   @LMPart1_8
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy in Credit/Debit/Encashment page, Policy Period= Monthly, Accrual Mode= Fixed, Credit In Terms Of= Days in Accrual Policy, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | January | February | March | April | May | June | July | August | September | October | November | December | Validation         |
      | LM_AcrPl_LvCr8 | Monthly      | Fixed       | Days            |            |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CD      | Using Accrual Policy | LM_AcrPl_LvCr8 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |
  
  
 @LMPart1_9
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy in Credit/Debit/Encashment page, Policy Period= Yearly, Accrual Mode= Fixed, Credit In Terms Of= Days in Accrual Policy, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName   | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | Validation         |
      | LM_Acr_LvCr9 | Yearly       | Fixed       | Days            |          1 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName   | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CD      | Using Accrual Policy | LM_Acr_LvCr9 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_10
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Payable days, Payable Days= Presents Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviYearConsi | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPl_LvCr10 | Yearly       | Calculated  | Days            |              1 | Payable Days | Presents    |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPl_LvCr10" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CD      | Using Accrual Policy | LM_AcrPl_LvCr10 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_11
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviYearConsi | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPl_LvCr11 | Yearly       | Calculated  | Days            |              1 | Non-Payable Days | Absents        |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPl_LvCr11" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CD      | Using Accrual Policy | LM_AcrPl_LvCr11 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
 
 @LMPart1_12
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CF      | LM_CF_LeaveCr_ProRata | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CreditLeav_ProRat" with Pro-rata "True"
      | LeaveID |
      | CF      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ReportingGroup | LeaveGroup                    | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 12/01/2024  |                | LM_LeaveGrp_CreditLeav_ProRat | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Monthly | January | 2024 | CF      | Fixed      |           7 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName             | Period  | Month   | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CF_LeaveCr_ProRata | Monthly | January | 2024 |    0.00 |   4.52 |  0.00 |       0.00 |    0.00 |    4.52 |     0.00 |

  @LMPart1_13
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CF      | LM_CF_LeaveCr_ProRata | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CreditLeav_ProRat" with Pro-rata "True"
      | LeaveID |
      | CF      |
    And Create user from user configuration
      | userid | Active | JoiningDate | ReportingGroup | LeaveGroup                    | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 11/01/2024  |                | LM_LeaveGrp_CreditLeav_ProRat | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Yearly |       | 2024 | CF      | Fixed      |           9 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName             | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CF_LeaveCr_ProRata | Yearly |       | 2024 |    0.00 |   8.75 |  0.00 |       0.00 |    0.00 |    8.75 |     0.00 |
      

  @LMPart1_14
  Scenario: Leave Credit Scenario for Groupwise users, Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name        | Validation           |
      | Organization | LM_OR1_LvCr | Deleted Successfully |
      | Organization | LM_OR2_LvCr | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name        | Code   | Validation         |
      | Organization | LM_OR1_LvCr | LM_OR1 | Saved Successfully |
      | Organization | LM_OR2_LvCr | LM_OR2 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_OR1_LvCr  |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   | LM_OR2_LvCr  |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs    | Validation         |
      | Monthly |     0 |    0 | CD      | Fixed      |           1 | Group Wise  | Organization | LM_OR1_LvCr | Saved Successfully |
      | Monthly |     0 |    0 | CD      | Fixed      |           2 | Group Wise  | Organization | LM_OR2_LvCr | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_15
  Scenario: Leave Credit Scenario for Groupwise users, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name        | Validation           |
      | Organization | LM_OR3_LvCr | Deleted Successfully |
      | Organization | LM_OR4_LvCr | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name        | Code   | Validation         |
      | Organization | LM_OR3_LvCr | LM_OR3 | Saved Successfully |
      | Organization | LM_OR4_LvCr | LM_OR4 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_OR3_LvCr  |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   | LM_OR4_LvCr  |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs    | Validation         |
      | Yearly |       |    0 | CD      | Fixed      |           5 | Group Wise  | Organization | LM_OR3_LvCr | Saved Successfully |
      | Yearly |       |    0 | CD      | Fixed      |           7 | Group Wise  | Organization | LM_OR4_LvCr | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  @LMPart1_16
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs           | Validation         |
      | Monthly |     0 |    0 | CD      | Fixed      |           3 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |
      | LMUr3  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |

  @LMPart1_17
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs           | Validation         |
      | Yearly |       |    0 | CD      | Fixed      |          12 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |
      | LMUr3  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |

  @LMPart1_18
  Scenario: Leave Credit Scenario for Period= Monthly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 2, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CG      | LM_CG_LeaveCr_MaxAcum | Paid Leave |           0.0 |        99.0 | Single App     | true          |         2 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CredtLvMaxAcm" with Pro-rata "False"
      | LeaveID |
      | CG      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_CredtLvMaxAcm | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Monthly |     0 |    0 | CG      | Fixed      |           2 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Monthly |     0 |    0 | CG      | Fixed      |           1 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName             | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CG_LeaveCr_MaxAcum | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_19
  Scenario: Leave Credit Scenario for Period= Monthly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 2, Status= "Only partial amount of Leave credited (1.00/2) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CG      | LM_CG_LeaveCr_MaxAcum | Paid Leave |           0.0 |        99.0 | Single App     | True          |         2 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CredtLvMaxAcm" with Pro-rata "False"
      | LeaveID |
      | CG      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_CredtLvMaxAcm | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                         | Validation                                              |
      | Monthly |     0 |    0 | CG      | Fixed      |           1 | User Wise   | LMUr1   |                                                                                | Saved Successfully                                      |
      | Monthly |     0 |    0 | CG      | Fixed      |           2 | User Wise   | LMUr1   | Only partial amount of Leave credited (1.00/2) due to max allowed accumulation,Only partial amount of Leave credited (1/2) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName             | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CG_LeaveCr_MaxAcum | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_20
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 7, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CH      | LM_CH_LeaveCr_MaxAcm | Paid Leave |           0.0 |        99.0 | Single App     | True          |         7 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CredtLvMxAcm" with Pro-rata "False"
      | LeaveID |
      | CH      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_CredtLvMxAcm | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Yearly |       |    0 | CH      | Fixed      |           7 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Yearly |       |    0 | CH      | Fixed      |           1 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CH_LeaveCr_MaxAcm | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  @LMPart1_21
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 7, Status= "Only partial amount of Leave credited (2.00/4) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CH      | LM_CH_LeaveCr_MaxAcm | Paid Leave |           0.0 |        99.0 | Single App     | True          |         7 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CredtLvMxAcm" with Pro-rata "False"
      | LeaveID |
      | CH      |
    And Create user from user configuration
      | userid | Active | LeaveGroup               | AtdEnable | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_CredtLvMxAcm | True      | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                         | Validation                                              |
      | Yearly |       |    0 | CH      | Fixed      |           5 | User Wise   | LMUr1   |                                                                                | Saved Successfully                                      |
      | Yearly |       |    0 | CH      | Fixed      |           4 | User Wise   | LMUr1   | Only partial amount of Leave credited (2.00/4) due to max allowed accumulation,Only partial amount of Leave credited (2/4) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CH_LeaveCr_MaxAcm | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  @LMPart1_22
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Fixed, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 01:00     | 04:00           | 08:00           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CI      | Fixed      |     010 |     00 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |

  @LMPart1_23
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy in Credit/Debit/Encashment page, Accrual Mode= Fixed, Credit In Terms Of= Hours in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName    | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | January | February | March | April | May   | June  | July  | August | September | October | November | December | Validation         |
      | LM_AcrP_CrLv23 | Monthly      | Fixed       | Hours           |            | 10:00   | 10:00    | 10:00 | 10:00 | 10:00 | 10:00 | 10:00 | 10:00  | 10:00     | 10:00   | 10:00    | 10:00    | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CI      | Using Accrual Policy | LM_AcrP_CrLv23    | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |

  @LMPart1_24
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Hours, Attendance Days= Payable days, Payable Days= Presents in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName   | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_Acr_CrLv24 | Monthly      | Calculated  | Hours           |             1 | Payable Days | Presents    |        0 |      1 | 010:00 | Saved Successfully |
    And Add Considered Attendance values in "LM_Acr_CrLv24" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CI      | Using Accrual Policy | LM_Acr_CrLv24     | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_25
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Hours, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName    | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrP_LvCr25 | Monthly      | Calculated  | Hours           |             1 | Non-Payable Days | Absents        |        0 |      1 | 010:00 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrP_LvCr25" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CI      | Using Accrual Policy | LM_AcrP_LvCr25    | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 00:00  | 00:00 | 00:00      | 00:00   | 00:00   | 00:00    |
  
  @LMPart1_26
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Fixed, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CI      | Fixed      |     010 |     00 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |

 @LMPart1_27
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy, Policy Period= Yearly, Accrual Mode= Fixed, Credit In Terms Of= Hours in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName    | PolicyPeriod | AccrualMode | CreditInTermsOf | CrHrs  | Validation         |
      | LM_AcrP_CrLv27 | Yearly       | Fixed       | Hours           | 030:00 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CI      | Using Accrual Policy | LM_AcrP_CrLv27    | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_28
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Hours, Attendance Days= Payable days, Payable Days= Presents in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName   | PolicyPeriod | AccrualMode | CreditInTermsOf | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_Acr_CrLv28 | Yearly       | Calculated  | Hours           | Payable Days | Presents    |        0 |      1 | 010:00 | Saved Successfully |
    And Add Considered Attendance values in "LM_Acr_CrLv28" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CI      | Using Accrual Policy | LM_Acr_CrLv28     | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_29
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Hours, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName    | PolicyPeriod | AccrualMode | CreditInTermsOf | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrP_LvCr29 | Yearly       | Calculated  | Hours           | Non-Payable Days | Absents        |        0 |      1 | 010:00 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrP_LvCr29" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 | 030:00 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | HourlyAccrPlcName | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CI      | Using Accrual Policy | LM_AcrP_LvCr29    | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 00:00  | 00:00 | 00:00      | 00:00   | 00:00   | 00:00    |
 
 @LMPart1_30
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CJ      | LM_CJ_LvCrProRata | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrProRata" with Pro-rata "True"
      | LeaveID |
      | CJ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 12/01/2024  |              |                | LM_LeaveGrp_LvCrProRata | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | TimeHHH | TimeMM | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Monthly | January | 2024 | CJ      | Fixed      |     010 |     00 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period  | Month   | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CJ_LvCrProRata | Monthly | January | 2024 | 00:00   | 06:27  | 00:00 | 00:00      | 00:00   | 06:27   | 00:00    |

  @LMPart1_31
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CJ      | LM_CJ_LvCrProRata | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrProRata" with Pro-rata "True"
      | LeaveID |
      | CJ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 11/01/2024  |              |                | LM_LeaveGrp_LvCrProRata | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Yearly |       | 2024 | CJ      | Fixed      |     010 |     00 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CJ_LvCrProRata | Yearly |       | 2024 | 00:00   | 09:44  | 00:00 | 00:00      | 00:00   | 09:44   | 00:00    |
      

  @LMPart1_32
  Scenario: Leave Credit Scenario for Groupwise users, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name        | Validation           |
      | Organization | LM_OR5_CrLv | Deleted Successfully |
      | Organization | LM_OR6_CrLv | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name        | Code   | Validation         |
      | Organization | LM_OR5_CrLv | LM_OR5 | Saved Successfully |
      | Organization | LM_OR6_CrLv | LM_OR6 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR5_CrLv  |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR6_CrLv  |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs    | Validation         |
      | Monthly |     0 |    0 | CI      | Fixed      |     010 |     00 | Group Wise  | Organization | LM_OR5_CrLv | Saved Successfully |
      | Monthly |     0 |    0 | CI      | Fixed      |     015 |     00 | Group Wise  | Organization | LM_OR6_CrLv | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 15:00  | 00:00 | 00:00      | 00:00   | 15:00   | 00:00    |

  @LMPart1_33
  Scenario: Leave Credit Scenario for Groupwise users, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name        | Validation           |
      | Organization | LM_OR7_CrLv | Deleted Successfully |
      | Organization | LM_OR8_CrLv | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name        | Code   | Validation         |
      | Organization | LM_OR7_CrLv | LM_OR7 | Saved Successfully |
      | Organization | LM_OR8_CrLv | LM_OR8 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR7_CrLv  |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR8_CrLv  |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs    | Validation         |
      | Yearly |       |    0 | CI      | Fixed      |     020 |     00 | Group Wise  | Organization | LM_OR7_CrLv | Saved Successfully |
      | Yearly |       |    0 | CI      | Fixed      |     030 |     00 | Group Wise  | Organization | LM_OR8_CrLv | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 20:00  | 00:00 | 00:00      | 00:00   | 20:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_34
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs           | Validation         |
      | Monthly |     0 |    0 | CI      | Fixed      |     010 |     00 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |
      | LMUr3  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 10:00  | 00:00 | 00:00      | 00:00   | 10:00   | 00:00    |

  @LMPart1_35
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs           | Validation         |
      | Yearly |       |    0 | CI      | Fixed      |     030 |     00 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |
      | LMUr3  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 30:00  | 00:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_36
  Scenario: Leave Credit Scenario for Period= Monthly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 020:00, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CK      | LM_CK_LvCr | Hourly Paid Leave |               |             |                | 02:00     | 04:00           | 06:00           | true          |      020 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrMaxAcum" with Pro-rata "False"
      | LeaveID |
      | CK      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCrMaxAcum | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Monthly |     0 |    0 | CK      | Fixed      |     020 |     00 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Monthly |     0 |    0 | CK      | Fixed      |     010 |     00 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName  | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CK_LvCr | Monthly |     0 |    0 | 00:00   | 20:00  | 00:00 | 00:00      | 00:00   | 20:00   | 00:00    |

  @LMPart1_37
  Scenario: Leave Credit Scenario for Period= Monthly,Maximum Accumulation Check= enable, Maximum Balance Allowed= 020:00, Status= "Only partial amount of Leave credited (10:00/20:00) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CK      | LM_CK_LvCr | Hourly Paid Leave |               |             |                | 02:00     | 04:00           | 06:00           | true          |      020 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrMaxAcum" with Pro-rata "False"
      | LeaveID |
      | CK      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCrMaxAcum | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Status                                                                              | Validation                                              |
      | Monthly |     0 |    0 | CK      | Fixed      |     010 |     00 | User Wise   | LMUr1   |                                                                                     | Saved Successfully                                      |
      | Monthly |     0 |    0 | CK      | Fixed      |     020 |     00 | User Wise   | LMUr1   | Only partial amount of Leave credited (10:00/20:00) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName  | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CK_LvCr | Monthly |     0 |    0 | 00:00   | 20:00  | 00:00 | 00:00      | 00:00   | 20:00   | 00:00    |

  @LMPart1_38
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 070:00, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CM      | LM_CM_LvCr | Hourly Paid Leave |               |             |                | 02:00     | 04:00           | 06:00           | true          |      070 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrMxAcm" with Pro-rata "False"
      | LeaveID |
      | CM      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCrMxAcm | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Yearly |       |    0 | CM      | Fixed      |     070 |     00 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Yearly |       |    0 | CM      | Fixed      |     010 |     00 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName  | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CM_LvCr | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 00:00      | 00:00   | 70:00   | 00:00    |

  @LMPart1_39
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 070:00, Status= "Only partial amount of Leave credited (20:00/40:00) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CM      | LM_CM_LvCr | Hourly Paid Leave |               |             |                | 02:00     | 04:00           | 06:00           | true          |      070 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCrMxAcm" with Pro-rata "False"
      | LeaveID |
      | CM      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCrMxAcm | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Status                                                                              | Validation                                              |
      | Yearly |       |    0 | CM      | Fixed      |     050 |     00 | User Wise   | LMUr1   |                                                                                     | Saved Successfully                                      |
      | Yearly |       |    0 | CM      | Fixed      |     040 |     00 | User Wise   | LMUr1   | Only partial amount of Leave credited (20:00/40:00) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName  | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CM_LvCr | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 00:00      | 00:00   | 70:00   | 00:00    |

  @LMPart1_40
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Fixed, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CA      | Fixed      |           1 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_41
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy, Accrual Mode= Fixed, Credit In Terms Of= Days in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | January | February | March | April | May | June | July | August | September | October | November | December | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Fixed       | Days            |            |       1 |        1 |     1 |     1 |   1 |    1 |    1 |      1 |         1 |       1 |        1 |        1 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CA      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_42
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Payable days, Payable Days= Presents in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Calculated  | Days            |             1 | Payable Days | Presents    |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPlc_LvCr1" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CA      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_43
  Scenario: Leave Credit Scenario for Period= Monthly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviMonConsi | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPlc_LvCr1 | Monthly      | Calculated  | Days            |             1 | Non-Payable Days | Absents        |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPlc_LvCr1" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CA      | Using Accrual Policy | LM_AcrPlc_LvCr1 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_44
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Fixed, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CA      | Fixed      |           2 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_45
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy, Policy Period= Yearly, Accrual Mode= Fixed, Credit In Terms Of= Days in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | CreditDays | Validation         |
      | LM_AcrPl_LvCr45 | Yearly       | Fixed       | Days            |          5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CA      | Using Accrual Policy | LM_AcrPl_LvCr45 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_46
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Payable days, Payable Days= Presents in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviYearConsi | AtdDays      | PayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPl_LvCr46 | Yearly       | Calculated  | Days            |              1 | Payable Days | Presents    |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPl_LvCr46" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CA      | Using Accrual Policy | LM_AcrPl_LvCr46 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_47
  Scenario: Leave Credit Scenario for Period= Yearly, Credit Mode= Using Accrual Policy and Accrual Mode= Calculated, Credit In Terms Of= Days, Attendance Days= Non-Payable, Non-Payable Days= Absents in Accrual Policy, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When Create Accrual Policy from Accrual Policy page
      | AccrPlcName     | PolicyPeriod | AccrualMode | CreditInTermsOf | PreviYearConsi | AtdDays          | NonPayableDays | FromDate | ToDate | FixVal | Validation         |
      | LM_AcrPl_LvCr47 | Yearly       | Calculated  | Days            |              1 | Non-Payable Days | Absents        |        0 |      1 |      1 | Saved Successfully |
    And Add Considered Attendance values in "LM_AcrPl_LvCr47" Accrual Policy
      | FromDate | ToDate | FixVal | Validation         |
      |        0 |      5 |      5 | Saved Successfully |
    Then "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode           | AccrPlcName     | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CA      | Using Accrual Policy | LM_AcrPl_LvCr47 | User Wise   | LMUr1   | Saved Successfully |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   0.00 |  0.00 |       0.00 |    0.00 |    0.00 |     0.00 |
  
   @LMPart1_48
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName    | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CB      | LM_CB_LvCrdt | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CreditLv" with Pro-rata "True"
      | LeaveID |
      | CB      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 12/01/2024  |              |                | LM_LeaveGrp_CreditLv | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month   | Year | LeaveID | CreditMode | CreditValue | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Monthly | January | 2024 | CB      | Fixed      |           7 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName    | Period  | Month   | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CB_LvCrdt | Monthly | January | 2024 |    0.00 |   4.52 |  0.00 |       0.00 |    0.00 |    4.52 |     0.00 |

  @LMPart1_49
  Scenario: Leave Credit Scenario with Pro-rata Enable, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName    | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CB      | LM_CB_LvCrdt | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_CreditLv" with Pro-rata "True"
      | LeaveID |
      | CB      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | 11/01/2024  |              |                | LM_LeaveGrp_CreditLv | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | AplyPro-rata | SelectUsers | UserIDs | Validation         |
      | Yearly |       | 2024 | CB      | Fixed      |           9 | true         | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName    | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CB_LvCrdt | Yearly |       | 2024 |    0.00 |   8.75 |  0.00 |       0.00 |    0.00 |    8.75 |     0.00 |

  @LMPart1_50
  Scenario: Leave Credit Scenario for Groupwise users, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name         | Validation           |
      | Organization | LM_ORG1_LvCr | Deleted Successfully |
      | Organization | LM_ORG2_LvCr | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name         | Code   | Validation         |
      | Organization | LM_ORG1_LvCr | LM_OG1 | Saved Successfully |
      | Organization | LM_ORG2_LvCr | LM_OG2 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG1_LvCr |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG2_LvCr |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Monthly |     0 |    0 | CA      | Fixed      |           1 | Group Wise  | Organization | LM_ORG1_LvCr | Saved Successfully |
      | Monthly |     0 |    0 | CA      | Fixed      |           2 | Group Wise  | Organization | LM_ORG2_LvCr | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_51
  Scenario: Leave Credit Scenario for Groupwise users, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name         | Validation           |
      | Organization | LM_ORG3_LvCr | Deleted Successfully |
      | Organization | LM_ORG4_LvCr | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name         | Code   | Validation         |
      | Organization | LM_ORG3_LvCr | LM_OG3 | Saved Successfully |
      | Organization | LM_ORG4_LvCr | LM_OG4 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG3_LvCr |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG4_LvCr |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Yearly |       |    0 | CA      | Fixed      |           5 | Group Wise  | Organization | LM_ORG3_LvCr | Saved Successfully |
      | Yearly |       |    0 | CA      | Fixed      |           7 | Group Wise  | Organization | LM_ORG4_LvCr | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   5.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  @LMPart1_52
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs           | Validation         |
      | Monthly |     0 |    0 | CA      | Fixed      |           3 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |
      | LMUr3  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       0.00 |    0.00 |    3.00 |     0.00 |

  @LMPart1_53
  Scenario: Leave Credit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr3  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs           | Validation         |
      | Yearly |       |    0 | CA      | Fixed      |          12 | User Wise   | LMUr1,LMUr2,LMUr3 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |
      | LMUr3  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |  12.00 |  0.00 |       0.00 |    0.00 |   12.00 |     0.00 |

  @LMPart1_54
  Scenario: Leave Credit Scenario for Period= Monthly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 2, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CC      | LM_CC_LvCrdt_MaxAcum | Restricted Holiday |           0.0 |        99.0 | Single App     | true          |         2 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCredit_MaxAcum" with Pro-rata "False"
      | LeaveID |
      | CC      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup                   | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCredit_MaxAcum | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Monthly |     0 |    0 | CC      | Fixed      |           2 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Monthly |     0 |    0 | CC      | Fixed      |           1 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CC_LvCrdt_MaxAcum | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_55
  Scenario: Leave Credit Scenario for Period= Monthly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 2, Status= "Only partial amount of Leave credited (1.00/2) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CC      | LM_CC_LvCrdt_MaxAcum | Restricted Holiday |           0.0 |        99.0 | Single App     | true          |         2 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCredit_MaxAcum" with Pro-rata "False"
      | LeaveID |
      | CC      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup                   | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCredit_MaxAcum | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                         | Validation                                              |
      | Monthly |     0 |    0 | CC      | Fixed      |           1 | User Wise   | LMUr1   |                                                                                | Saved Successfully                                      |
      | Monthly |     0 |    0 | CC      | Fixed      |           2 | User Wise   | LMUr1   | Only partial amount of Leave credited (1.00/2) due to max allowed accumulation,Only partial amount of Leave credited (1/2) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CC_LvCrdt_MaxAcum | Monthly |     0 |    0 |    0.00 |   2.00 |  0.00 |       0.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_56
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 7, Status= "Entry will generate leave balance in excess of max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CE      | LM_CE_LvCrdt_MaxAcum | Restricted Holiday |           0.0 |        99.0 | Single App     | true          |         7 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCredit_MaxAcuChk" with Pro-rata "False"
      | LeaveID |
      | CE      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup                     | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_LvCredit_MaxAcuChk | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                  | Validation                                      |
      | Yearly |       |    0 | CE      | Fixed      |           7 | User Wise   | LMUr1   |                                                                         | Saved Successfully                              |
      | Yearly |       |    0 | CE      | Fixed      |           1 | User Wise   | LMUr1   | Entry will generate leave balance in excess of max allowed accumulation | No Records Processed. Check Process Error List. |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CE_LvCrdt_MaxAcum | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  @LMPart1_57
  Scenario: Leave Credit Scenario for Period= Yearly, Maximum Accumulation Check= enable, Maximum Balance Allowed= 7, Status= "Only partial amount of Leave credited (2.00/4) due to max allowed accumulation"
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MaxAccumCheck | MaxBalAlw | Validation         |
      | CE      | LM_CE_LvCrdt_MaxAcum | Restricted Holiday |           0.0 |        99.0 | Single App     | true          |         7 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LvCredit_MaxAcuChk" with Pro-rata "False"
      | LeaveID |
      | CE      |
    And Create user from user configuration
      | userid | Active | LeaveGroup                     | AtdEnable | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_LvCredit_MaxAcuChk | True      | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Status                                                                         | Validation                                              |
      | Yearly |       |    0 | CE      | Fixed      |           5 | User Wise   | LMUr1   |                                                                                | Saved Successfully                                      |
      | Yearly |       |    0 | CE      | Fixed      |           4 | User Wise   | LMUr1   | Only partial amount of Leave credited (2.00/4) due to max allowed accumulation,Only partial amount of Leave credited (2/4) due to max allowed accumulation | Check Process Error List For User records not processed |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName            | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CE_LvCrdt_MaxAcum | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       0.00 |    0.00 |    7.00 |     0.00 |

  ###################################Leave Credit End########################
  #################################Leave Debit Starts########################
  @LMPart1_58
  Scenario: Leave Debit Scenario for Groupwise users, Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name         | Validation           |
      | Organization | LM_OR1_LvDbt | Deleted Successfully |
      | Organization | LM_OR2_LvDbt | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name         | Code   | Validation         |
      | Organization | LM_OR1_LvDbt | OR1LVD | Saved Successfully |
      | Organization | LM_OR2_LvDbt | OR2LVD | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR1_LvDbt |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR2_LvDbt |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Monthly |     0 |    0 | CD      | Fixed      |           2 | Group Wise  | Organization | LM_OR1_LvDbt | Saved Successfully |
      | Monthly |     0 |    0 | CD      | Fixed      |           2 | Group Wise  | Organization | LM_OR2_LvDbt | Saved Successfully |
    When "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | DebitValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Monthly |     0 |    0 | CD      |          1 | Group Wise  | Organization | LM_OR1_LvDbt | Saved Successfully |
      | Monthly |     0 |    0 | CD      |          2 | Group Wise  | Organization | LM_OR2_LvDbt | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  2.00 |       0.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_59
  Scenario: Leave Debit Scenario for Groupwise users, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name         | Validation           |
      | Organization | LM_OR3_LvDbt | Deleted Successfully |
      | Organization | LM_OR4_LvDbt | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name         | Code   | Validation         |
      | Organization | LM_OR3_LvDbt | OR3LVD | Saved Successfully |
      | Organization | LM_OR4_LvDbt | OR4LVD | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR3_LvDbt |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR4_LvDbt |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Yearly |       |    0 | CD      | Fixed      |           5 | Group Wise  | Organization | LM_OR3_LvDbt | Saved Successfully |
      | Yearly |       |    0 | CD      | Fixed      |           5 | Group Wise  | Organization | LM_OR4_LvDbt | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | DebitValue | SelectUsers | Group        | GroupIDs     | Validation         |
      | Yearly |       |    0 | CD      |          1 | Group Wise  | Organization | LM_OR3_LvDbt | Saved Successfully |
      | Yearly |       |    0 | CD      |          2 | Group Wise  | Organization | LM_OR4_LvDbt | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   5.00 |  1.00 |       0.00 |    0.00 |    4.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   5.00 |  2.00 |       0.00 |    0.00 |    3.00 |     0.00 |

  @LMPart1_60
  Scenario: Leave Debit Scenario for Select Users= User Wise, Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CD      | Fixed      |           2 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | DebitValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CD      |          1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_61
  Scenario: Leave Debit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CD      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | DebitValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CD      |          1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName       | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   7.00 |  1.00 |       0.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CD_PaidLeave | Yearly |       |    0 |    0.00 |   7.00 |  1.00 |       0.00 |    0.00 |    6.00 |     0.00 |

  @LMPart1_62
  Scenario: Leave Debit Scenario for Groupwise users, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_ORG1_LvDebit | Deleted Successfully |
      | Organization | LM_ORG2_LvDebit | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_ORG1_LvDebit | ORG1LD | Saved Successfully |
      | Organization | LM_ORG2_LvDebit | ORG2LD | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG1_LvDebit |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG2_LvDebit |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CA      | Fixed      |           2 | Group Wise  | Organization | LM_ORG1_LvDebit | Saved Successfully |
      | Monthly |     0 |    0 | CA      | Fixed      |           2 | Group Wise  | Organization | LM_ORG2_LvDebit | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | DebitValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CA      |          1 | Group Wise  | Organization | LM_ORG1_LvDebit | Saved Successfully |
      | Monthly |     0 |    0 | CA      |          2 | Group Wise  | Organization | LM_ORG2_LvDebit | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  2.00 |       0.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_63
  Scenario: Leave Debit Scenario for Groupwise users, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_ORG3_LvDebit | Deleted Successfully |
      | Organization | LM_ORG4_LvDebit | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_ORG3_LvDebit | ORG3LD | Saved Successfully |
      | Organization | LM_ORG4_LvDebit | ORG4LD | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG3_LvDebit |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG4_LvDebit |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CA      | Fixed      |           5 | Group Wise  | Organization | LM_ORG3_LvDebit | Saved Successfully |
      | Yearly |       |    0 | CA      | Fixed      |           5 | Group Wise  | Organization | LM_ORG4_LvDebit | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | DebitValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CA      |          1 | Group Wise  | Organization | LM_ORG3_LvDebit | Saved Successfully |
      | Yearly |       |    0 | CA      |          2 | Group Wise  | Organization | LM_ORG4_LvDebit | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   5.00 |  1.00 |       0.00 |    0.00 |    4.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   5.00 |  2.00 |       0.00 |    0.00 |    3.00 |     0.00 |

  @LMPart1_64
  Scenario: Leave Debit Scenario for Select Users= User Wise, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CA      | Fixed      |           2 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | DebitValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CA      |          1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Monthly |     0 |    0 |    0.00 |   2.00 |  1.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_65
  Scenario: Leave Debit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_RHLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CA      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | DebitValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CA      |          1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName     | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   7.00 |  1.00 |       0.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CA_RHLeave | Yearly |       |    0 |    0.00 |   7.00 |  1.00 |       0.00 |    0.00 |    6.00 |     0.00 |

  @LMPart1_66
  Scenario: Leave Debit Scenario for Groupwise users, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG1_LeavDebt | Deleted Successfully |
      | Organization | LM_OG2_LeavDebt | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG1_LeavDebt | OG1LDT | Saved Successfully |
      | Organization | LM_OG2_LeavDebt | OG2LDT | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OG1_LeavDebt |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OG2_LeavDebt |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CI      | Fixed      |     020 |     00 | Group Wise  | Organization | LM_OG1_LeavDebt | Saved Successfully |
      | Monthly |     0 |    0 | CI      | Fixed      |     020 |     00 | Group Wise  | Organization | LM_OG2_LeavDebt | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CI      |     010 |     00 | Group Wise  | Organization | LM_OG1_LeavDebt | Saved Successfully |
      | Monthly |     0 |    0 | CI      |     020 |     00 | Group Wise  | Organization | LM_OG2_LeavDebt | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 20:00  | 10:00 | 00:00      | 00:00   | 10:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 20:00  | 20:00 | 00:00      | 00:00   | 00:00   | 00:00    |

  @LMPart1_67
  Scenario: Leave Debit Scenario for Groupwise users, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG3_LeavDebt | Deleted Successfully |
      | Organization | LM_OG4_LeavDebt | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG3_LeavDebt | OG3LDT | Saved Successfully |
      | Organization | LM_OG4_LeavDebt | OG4LDT | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OG3_LeavDebt |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OG4_LeavDebt |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CI      | Fixed      |     050 |     00 | Group Wise  | Organization | LM_OG3_LeavDebt | Saved Successfully |
      | Yearly |       |    0 | CI      | Fixed      |     050 |     00 | Group Wise  | Organization | LM_OG4_LeavDebt | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CI      |     010 |     00 | Group Wise  | Organization | LM_OG3_LeavDebt | Saved Successfully |
      | Yearly |       |    0 | CI      |     020 |     00 | Group Wise  | Organization | LM_OG4_LeavDebt | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 50:00  | 10:00 | 00:00      | 00:00   | 40:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 50:00  | 20:00 | 00:00      | 00:00   | 30:00   | 00:00    |

  @LMPart1_68
  Scenario: Leave Debit Scenario for Select Users= User Wise,Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CI      | Fixed      |     020 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CI      |     010 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 20:00  | 10:00 | 00:00      | 00:00   | 10:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Monthly |     0 |    0 | 00:00   | 20:00  | 10:00 | 00:00      | 00:00   | 10:00   | 00:00    |

  @LMPart1_69
  Scenario: Leave Debit Scenario for Select Users= User Wise, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave |               |             |                | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CI      | Fixed      |     070 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Debit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CI      |     010 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 70:00  | 10:00 | 00:00      | 00:00   | 60:00   | 00:00    |
      | LMUr2  | LM_CI_HrPLeave | Yearly |       |    0 | 00:00   | 70:00  | 10:00 | 00:00      | 00:00   | 60:00   | 00:00    |

  ##################################Leave Debit End###############################
  #################################Leave Encashment Starts########################
  @LMPart1_70
  Scenario: Leave Encashment for Period= Monthly, Encashment Mode= Defined, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | User Wise   | LMUr1   | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CQ      | Defined        |               1 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_71
  Scenario: Leave Encashment for Period= Monthly, Encashment Mode= Available, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | User Wise   | LMUr1   | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CQ      | Available      |                 | User Wise   | LMUr1   | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_72
  Scenario: Leave Encashment for Groupwise users, Period= Monthly, Encashment Mode= Defined, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OR1_LvEncash | Deleted Successfully |
      | Organization | LM_OR2_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OR1_LvEncash | OR_LE1 | Saved Successfully |
      | Organization | LM_OR2_LvEncash | OR_LE2 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR1_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR2_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | Group Wise  | Organization | LM_OR1_LvEncash,LM_OR2_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CQ      | Defined        |               1 | Group Wise  | Organization | LM_OR1_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CQ      | Defined        |               2 | Group Wise  | Organization | LM_OR2_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       2.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_73
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Monthly, Encashment Mode= Available, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OR3_LvEncash | Deleted Successfully |
      | Organization | LM_OR4_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OR3_LvEncash | OR_LE3 | Saved Successfully |
      | Organization | LM_OR4_LvEncash | OR_LE4 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR3_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR4_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | Group Wise  | Organization | LM_OR3_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CQ      | Fixed      |           4 | Group Wise  | Organization | LM_OR4_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Monthly |     0 |    0 | CQ      | Available      |                 | Group Wise  | Organization | LM_OR3_LvEncash,LM_OR4_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   4.00 |  0.00 |       4.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_74
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Monthly, Encashment Mode= Defined, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CQ      | Defined        |               1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_75
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Monthly, Encashment Mode= Available, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CQ      | Fixed      |           3 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CQ      | Available      |                 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_76
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Defined, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OR5_LvEncash | Deleted Successfully |
      | Organization | LM_OR6_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OR5_LvEncash | OR_LE5 | Saved Successfully |
      | Organization | LM_OR6_LvEncash | OR_LE6 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR5_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR6_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Yearly |       |    0 | CQ      | Fixed      |           7 | Group Wise  | Organization | LM_OR5_LvEncash,LM_OR6_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CQ      | Defined        |               1 | Group Wise  | Organization | LM_OR5_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CQ      | Defined        |               2 | Group Wise  | Organization | LM_OR6_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       2.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_77
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Available, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OR7_LvEncash | Deleted Successfully |
      | Organization | LM_OR8_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OR7_LvEncash | OR_LE7 | Saved Successfully |
      | Organization | LM_OR8_LvEncash | OR_LE8 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OR7_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OR8_LvEncash |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CQ      | Fixed      |           7 | Group Wise  | Organization | LM_OR7_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CQ      | Fixed      |           8 | Group Wise  | Organization | LM_OR8_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | UserId | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs                        | Validation         |
      | LMUr1  | Yearly |       |    0 | CQ      | Available      |                 | Group Wise  | Organization | LM_OR7_LvEncash,LM_OR8_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   8.00 |  0.00 |       8.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_78
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Yearly, Encashment Mode= Defined, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CQ      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CQ      | Defined        |               1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |

  @LMPart1_79
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Yearly, Encashment Mode= Available, Leave Type= Paid Leave,
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CQ      | LM_CQ_LvEncash | Paid Leave |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LvEncash" with Pro-rata "False"
      | LeaveID |
      | CQ      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup          | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_LvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CQ      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CQ      | Available      |                 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName      | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CQ_LvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_80
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Monthly, Encashment Mode= Defined, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name             | Validation           |
      | Organization | LM_ORG1_LvEncash | Deleted Successfully |
      | Organization | LM_ORG2_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name             | Code   | Validation         |
      | Organization | LM_ORG1_LvEncash | ORGLE1 | Saved Successfully |
      | Organization | LM_ORG2_LvEncash | ORGLE2 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization     | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG1_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG2_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs                          | Validation         |
      | Monthly |     0 |    0 | CP      | Fixed      |           3 | Group Wise  | Organization | LM_ORG1_LvEncash,LM_ORG2_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs         | Validation         |
      | Monthly |     0 |    0 | CP      | Defined        |               1 | Group Wise  | Organization | LM_ORG1_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CP      | Defined        |               2 | Group Wise  | Organization | LM_ORG2_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       2.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_81
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Monthly, Encashment Mode= Available, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name             | Validation           |
      | Organization | LM_ORG3_LvEncash | Deleted Successfully |
      | Organization | LM_ORG4_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name             | Code   | Validation         |
      | Organization | LM_ORG3_LvEncash | ORGLE3 | Saved Successfully |
      | Organization | LM_ORG4_LvEncash | ORGLE4 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization     | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG3_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG4_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs         | Validation         |
      | Monthly |     0 |    0 | CP      | Fixed      |           3 | Group Wise  | Organization | LM_ORG3_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CP      | Fixed      |           4 | Group Wise  | Organization | LM_ORG4_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs                          | Validation         |
      | Monthly |     0 |    0 | CP      | Available      |                 | Group Wise  | Organization | LM_ORG3_LvEncash,LM_ORG4_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   4.00 |  0.00 |       4.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_82
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Monthly, Encashment Mode= Defined, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CP      | Fixed      |           3 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CP      | Defined        |               1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       1.00 |    0.00 |    2.00 |     0.00 |

  @LMPart1_83
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Monthly, Encashment Mode= Available, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CP      | Fixed      |           3 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CP      | Available      |                 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Monthly |     0 |    0 |    0.00 |   3.00 |  0.00 |       3.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_84
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Defined, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name             | Validation           |
      | Organization | LM_ORG5_LvEncash | Deleted Successfully |
      | Organization | LM_ORG6_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name             | Code   | Validation         |
      | Organization | LM_ORG5_LvEncash | ORGLE5 | Saved Successfully |
      | Organization | LM_ORG6_LvEncash | ORGLE6 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMUr1 | LMUr1 |               1 |         1 |               1 |                  1 |
      | LMUr2 | LMUr2 |               1 |         1 |               1 |                  1 |
    And Assign groups to user from user configuration
      | UserID | Organization     | ApprovalPolicy | LeaveGroup            | WeekOffGroup | Validation         |
      | LMUr1  | LM_ORG5_LvEncash |                | LM_LeavGrp_RHLvEncash |              | Saved Successfully |
      | LMUr2  | LM_ORG6_LvEncash |                | LM_LeavGrp_RHLvEncash |              | Saved Successfully |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs                          | Validation         |
      | Yearly |       |    0 | CP      | Fixed      |           7 | Group Wise  | Organization | LM_ORG5_LvEncash,LM_ORG6_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs         | Validation         |
      | Yearly |       |    0 | CP      | Defined        |               1 | Group Wise  | Organization | LM_ORG5_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CP      | Defined        |               2 | Group Wise  | Organization | LM_ORG6_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       2.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_85
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Available, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name             | Validation           |
      | Organization | LM_ORG7_LvEncash | Deleted Successfully |
      | Organization | LM_ORG8_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name             | Code   | Validation         |
      | Organization | LM_ORG7_LvEncash | ORGLE7 | Saved Successfully |
      | Organization | LM_ORG8_LvEncash | ORGLE8 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization     | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_ORG7_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_ORG8_LvEncash |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | Group        | GroupIDs         | Validation         |
      | Yearly |       |    0 | CP      | Fixed      |           7 | Group Wise  | Organization | LM_ORG7_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CP      | Fixed      |           8 | Group Wise  | Organization | LM_ORG8_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | UserId | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | Group        | GroupIDs                          | Validation         |
      | LMUr1  | Yearly |       |    0 | CP      | Available      |                 | Group Wise  | Organization | LM_ORG7_LvEncash,LM_ORG8_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   8.00 |  0.00 |       8.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_86
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Yearly, Encashment Mode= Defined, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CP      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CP      | Defined        |               1 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       1.00 |    0.00 |    6.00 |     0.00 |

  @LMPart1_87
  Scenario: Leave Encashment Scenario for Select Users, Period= Yearly, Encashment Mode= Available, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CP      | LM_CP_RHLvEncash | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_RHLvEncash" with Pro-rata "False"
      | LeaveID |
      | CP      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             |              |                | LM_LeavGrp_RHLvEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CP      | Fixed      |           7 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | EncashmentValue | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CP      | Available      |                 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |
      | LMUr2  | LM_CP_RHLvEncash | Yearly |       |    0 |    0.00 |   7.00 |  0.00 |       7.00 |    0.00 |    0.00 |     0.00 |

  @LMPart1_88
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Monthly, Encashment Mode= Defined, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG1_LvEncash | Deleted Successfully |
      | Organization | LM_OG2_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG1_LvEncash | OG_LE1 | Saved Successfully |
      | Organization | LM_OG2_LvEncash | OG_LE2 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OG1_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OG2_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Monthly |     0 |    0 | CN      | Fixed      |     030 |     00 | Group Wise  | Organization | LM_OG1_LvEncash,LM_OG2_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CN      | Defined        |     010 |     00 | Group Wise  | Organization | LM_OG1_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CN      | Defined        |     020 |     00 | Group Wise  | Organization | LM_OG2_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 10:00      | 00:00   | 20:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 20:00      | 00:00   | 10:00   | 00:00    |

  @LMPart1_89
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Monthly, Encashment Mode= Available, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG3_LvEncash | Deleted Successfully |
      | Organization | LM_OG4_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG3_LvEncash | OG_LE3 | Saved Successfully |
      | Organization | LM_OG4_LvEncash | OG_LE4 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | JoiningDate | Organization    | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |             | LM_OG3_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |             | LM_OG4_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Monthly |     0 |    0 | CN      | Fixed      |     030 |     00 | Group Wise  | Organization | LM_OG3_LvEncash | Saved Successfully |
      | Monthly |     0 |    0 | CN      | Fixed      |     040 |     00 | Group Wise  | Organization | LM_OG4_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Monthly |     0 |    0 | CN      | Available      | Group Wise  | Organization | LM_OG3_LvEncash,LM_OG4_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 30:00      | 00:00   | 00:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 40:00  | 00:00 | 40:00      | 00:00   | 00:00   | 00:00    |

  @LMPart1_90
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Monthly, Encashment Mode= Defined, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CN      | Fixed      |     030 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CN      | Defined        |     010 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 10:00      | 00:00   | 20:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 10:00      | 00:00   | 20:00   | 00:00    |

  @LMPart1_91
  Scenario: Leave Encashment Scenario for Select Users= User Wise,Period= Monthly, Encashment Mode= Available, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CN      | Fixed      |     030 |     00 | User Wise   | LMUr1   | Saved Successfully |
      | Monthly |     0 |    0 | CN      | Fixed      |     040 |     00 | User Wise   | LMUr2   | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | EncashmentMode | SelectUsers | UserIDs     | Validation         |
      | Monthly |     0 |    0 | CN      | Available      | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 30:00  | 00:00 | 30:00      | 00:00   | 00:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Monthly |     0 |    0 | 00:00   | 40:00  | 00:00 | 40:00      | 00:00   | 00:00   | 00:00    |

  @LMPart1_92
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Defined, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG5_LvEncash | Deleted Successfully |
      | Organization | LM_OG6_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG5_LvEncash | OG_LE5 | Saved Successfully |
      | Organization | LM_OG6_LvEncash | OG_LE6 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization    | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_OG5_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   | LM_OG6_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs                        | Validation         |
      | Yearly |       |    0 | CN      | Fixed      |     070 |     00 | Group Wise  | Organization | LM_OG5_LvEncash,LM_OG6_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CN      | Defined        |     010 |     00 | Group Wise  | Organization | LM_OG5_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CN      | Defined        |     020 |     00 | Group Wise  | Organization | LM_OG6_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 10:00      | 00:00   | 60:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 20:00      | 00:00   | 50:00   | 00:00    |

  @LMPart1_93
  Scenario: Leave Encashment Scenario for Groupwise users, Period= Yearly, Encashment Mode= Available, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name            | Validation           |
      | Organization | LM_OG7_LvEncash | Deleted Successfully |
      | Organization | LM_OG8_LvEncash | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name            | Code   | Validation         |
      | Organization | LM_OG7_LvEncash | OG_LE7 | Saved Successfully |
      | Organization | LM_OG8_LvEncash | OG_LE8 | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization    | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_OG7_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   | LM_OG8_LvEncash |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | Group        | GroupIDs        | Validation         |
      | Yearly |       |    0 | CN      | Fixed      |     070 |     00 | Group Wise  | Organization | LM_OG7_LvEncash | Saved Successfully |
      | Yearly |       |    0 | CN      | Fixed      |     080 |     00 | Group Wise  | Organization | LM_OG8_LvEncash | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | UserId | Period | Month | Year | LeaveID | EncashmentMode | SelectUsers | Group        | GroupIDs                        | Validation         |
      | LMUr1  | Yearly |       |    0 | CN      | Available      | Group Wise  | Organization | LM_OG7_LvEncash,LM_OG8_LvEncash | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 70:00      | 00:00   | 00:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 80:00  | 00:00 | 80:00      | 00:00   | 00:00   | 00:00    |

  @LMPart1_94
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Yearly, Encashment Mode= Defined, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CN      | Fixed      |     070 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | TimeHHH | TimeMM | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CN      | Defined        |     010 |     00 | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 10:00      | 00:00   | 60:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 10:00      | 00:00   | 60:00   | 00:00    |

  @LMPart1_95
  Scenario: Leave Encashment Scenario for Select Users= User Wise, Period= Yearly, Encashment Mode= Available, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | Validation         |
      | CN      | LM_CN_HrPLvEncash | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLeavEncash" with Pro-rata "False"
      | LeaveID |
      | CN      |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
      | LMUr2  | True   |              |                | LM_LeavGrp_HrPLeavEncash | True      |               | True      | True      | True      | True               | Saved Successfully |
    When "Credit" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Yearly |       |    0 | CN      | Fixed      |     070 |     00 | User Wise   | LMUr1   | Saved Successfully |
      | Yearly |       |    0 | CN      | Fixed      |     080 |     00 | User Wise   | LMUr2   | Saved Successfully |
    And "Encashment" Leave from Credit_Debit_Encashment page
      | Period | Month | Year | LeaveID | EncashmentMode | SelectUsers | UserIDs     | Validation         |
      | Yearly |       |    0 | CN      | Available      | User Wise   | LMUr1,LMUr2 | Saved Successfully |
    Then Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName         | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 70:00  | 00:00 | 70:00      | 00:00   | 00:00   | 00:00    |
      | LMUr2  | LM_CN_HrPLvEncash | Yearly |       |    0 | 00:00   | 80:00  | 00:00 | 80:00      | 00:00   | 00:00   | 00:00    |

  #################################Leave Encashment End########################
  #################################C-OFF Encashment Starts########################
  @LMPart1_96
  Scenario: C-OFF Encashment Scenario for Encashment Mode=Defined
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CR      | LM_CR_COffEncash | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_COffEncash" with Pro-rata "False"
      | LeaveID |
      | CR      |
    And Create user from user configuration
      | userid | AtdEnable | LeaveGroup            | OtCoffEligibility | Validation         |
      | LMUr1  | True      | LM_LeavGrp_COffEncash | Both              | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    Then Encash C-OFF from C-OFF Encashment page
      | UserId | Leave                 | EncashMode | AtdDate | Hours | Validation         |
      | LMUr1  | CR - LM_CR_COffEncash | Defined    |       0 | 02:00 | Saved Successfully |
    And Verify C-OFF from C-OFF Encashment page for UserId="LMUr1"
      | C-OffHours |
      | 02:00      |

  @LMPart1_97
  Scenario: C-OFF Encashment Scenario for Encashment Mode=Available
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | CR      | LM_CR_COffEncash | Compensatory Off |           0.0 |        99.0 | Single App     | true     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_COffEncash" with Pro-rata "False"
      | LeaveID |
      | CR      |
    And Create user from user configuration
      | userid | AtdEnable | LeaveGroup            | OtCoffEligibility | Validation         |
      | LMUr1  | True      | LM_LeavGrp_COffEncash | Both              | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 04:00 | Saved Successfully |
    Then Encash C-OFF from C-OFF Encashment page
      | UserId | Leave                 | EncashMode | Hours | Validation         |
      | LMUr1  | CR - LM_CR_COffEncash | Available  |       | Saved Successfully |
    And Verify C-OFF from C-OFF Encashment page for UserId="LMUr1"
      | C-OffHours |
      | 04:00      |

  #################################C-OFF Encashment End########################
  #################################Overflow Management Starts########################
  @LMPart1_98
  Scenario: Overflow Management Scenario for Adjustment Type= Discard and Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CS      | LM_CS_PLOverflow | Paid Leave |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLOverflow" with Pro-rata "False"
      | LeaveID |
      | CS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              | LM_ReportingGrp1 | LM_LeaveGrp_PLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CS      | Fixed      |           5 | User Wise   | LMUr1   | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CS         |                     1 | LMUr1     |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CS      | Fixed      |           1 | User Wise   | LMUr1   | Saved Successfully |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RequestRejected | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Discard" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          |
      | LMUr1  | CS - LM_CS_PLOverflow |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_99
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse and Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CS      | LM_CS_PLOverflow | Paid Leave |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLOverflow" with Pro-rata "False"
      | LeaveID |
      | CS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              | LM_ReportingGrp1 | LM_LeaveGrp_PLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CS         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RequestRejected | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period  | Month | Year |
      | LMUr1  | CS - LM_CS_PLOverflow | Monthly |     0 |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    1 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_100
  Scenario: Overflow Management Scenario for Adjustment Type = Encash and Period= Monthly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CS      | LM_CS_PLOverflow | Paid Leave |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLOverflow" with Pro-rata "False"
      | LeaveID |
      | CS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              | LM_ReportingGrp1 | LM_LeaveGrp_PLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CS         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period  | Month | Year |
      | LMUr1  | CS - LM_CS_PLOverflow | Monthly |     0 |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       1.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_101
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CS      | LM_CS_PLOverflow | Paid Leave |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLOverflow" with Pro-rata "False"
      | LeaveID |
      | CS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              | LM_ReportingGrp1 | LM_LeaveGrp_PLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CS         |      1 |       |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CS         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period | Month | Year |
      | LMUr1  | CS - LM_CS_PLOverflow | Yearly |       |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Yearly |       |    1 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_102
  Scenario: Overflow Management Scenario for Adjustment Type = Encash, Period= Yearly, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CS      | LM_CS_PLOverflow | Paid Leave |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLOverflow" with Pro-rata "False"
      | LeaveID |
      | CS      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | Organization | ReportingGroup   | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |              | LM_ReportingGrp1 | LM_LeaveGrp_PLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CS         |      1 |       |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CS         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CS         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period | Month | Year |
      | LMUr1  | CS - LM_CS_PLOverflow | Yearly |       |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CS_PLOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       1.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_103
  Scenario: Overflow Management Scenario for Adjustment Type= Discard, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_OverflowHS1 |
    And Create Holiday Schedule "LM_OverflowHS1"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | OverflowRH1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_OverflowHS1"
      | Date | RestrictedHolidayName |
      |    0 | RHOverflowTest1       |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CT      | LM_CT_RHOverflow | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHOverflow" with Pro-rata "False"
      | LeaveID |
      | CT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHOverflow | True      | True      | LM_OverflowHS1  | True      | True      | True               | Saved Successfully |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CT      | Fixed      |           5 | User Wise   | LMUr1   | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CT         |                     1 | LMUr1     |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | CreditValue | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CT      | Fixed      |           1 | User Wise   | LMUr1   | Saved Successfully |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RequestRejected | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Discard" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          |
      | LMUr1  | CT - LM_CT_RHOverflow |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_104
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_OverflowHS2 |
    And Create Holiday Schedule "LM_OverflowHS2"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | OverflowRH2 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_OverflowHS2"
      | Date | RestrictedHolidayName |
      |    0 | RHOverflowTest2       |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CT      | LM_CT_RHOverflow | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHOverflow" with Pro-rata "False"
      | LeaveID |
      | CT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHOverflow | True      | True      | LM_OverflowHS2  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CT         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period  | Month | Year |
      | LMUr1  | CT - LM_CT_RHOverflow | Monthly |     0 |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    1 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_105
  Scenario: Overflow Management Scenario for Adjustment Type = Encash, Period= Monthly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_OverflowHS3 |
    And Create Holiday Schedule "LM_OverflowHS3"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | OverflowRH3 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_OverflowHS3"
      | Date | RestrictedHolidayName |
      |    0 | RHOverflowTest3       |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CT      | LM_CT_RHOverflow | Restricted Holiday |           0.0 |        99.0 | Single App     | True     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHOverflow" with Pro-rata "False"
      | LeaveID |
      | CT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHOverflow | True      | True      | LM_OverflowHS3  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CT         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period  | Month | Year |
      | LMUr1  | CT - LM_CT_RHOverflow | Monthly |     0 |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Monthly |     0 |    0 |    0.00 |   6.00 |  0.00 |       1.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_106
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_OverflowHS4 |
    And Create Holiday Schedule "LM_OverflowHS4"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | OverflowRH4 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_OverflowHS4"
      | Date | RestrictedHolidayName |
      |    0 | RHOverflowTest4       |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CT      | LM_CT_RHOverflow | Restricted Holiday |           0.0 |        99.0 | Single App     | true     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHOverflow" with Pro-rata "False"
      | LeaveID |
      | CT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHOverflow | True      | True      | LM_OverflowHS4  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CT         |      1 |       |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CT         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period | Month | Year |
      | LMUr1  | CT - LM_CT_RHOverflow | Yearly |       |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Yearly |       |    1 |    0.00 |   1.00 |  0.00 |       0.00 |    0.00 |    1.00 |     0.00 |

  @LMPart1_107
  Scenario: Overflow Management Scenario for Adjustment Type = Encash, Period= Yearly, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_OverflowHS5 |
    And Create Holiday Schedule "LM_OverflowHS5"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | OverflowRH5 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_OverflowHS5"
      | Date | RestrictedHolidayName |
      |    0 | RHOverflowTest5       |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CT      | LM_CT_RHOverflow | Restricted Holiday |           0.0 |        99.0 | Single App     | True     | True          |         5 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHOverflow" with Pro-rata "False"
      | LeaveID |
      | CT      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup             | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHOverflow | True      | True      | LM_OverflowHS5  | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    5 |          |                | CT         |      1 |       |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CT         |                     1 | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    1 |          |                | CT         |      0 |     0 |    0 |          | credit |       |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       0.00 |    0.00 |    5.00 |     1.00 |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name          | Period | Month | Year |
      | LMUr1  | CT - LM_CT_RHOverflow | Yearly |       |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName        | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CT_RHOverflow | Yearly |       |    0 |    0.00 |   6.00 |  0.00 |       1.00 |    0.00 |    5.00 |     0.00 |

  @LMPart1_108
  Scenario: Overflow Management Scenario for Adjustment Type= Discard, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CU      | LM_CU_HrPLOverflow | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True     | True          |      050 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLOverflow" with Pro-rata "False"
      | LeaveID |
      | CU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_HrPLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 050:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CU         |                     1 |               0 | 09:00             | 18:00           | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 009:00 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RequestRejected | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 09:00    |
    Then "Discard" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name            | AdjustmentValue |
      | LMUr1  | CU - LM_CU_HrPLOverflow |                 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 00:00    |

  @LMPart1_109
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | CarryFrdToNxtYr | LvEncash | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CU      | LM_CU_HrPLOverflow | Hourly Paid Leave | 00:00     | 23:59           | 23:59           |                 | True     | True          |      050 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLOverflow" with Pro-rata "False"
      | LeaveID |
      | CU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_HrPLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CU      | Fixed      |     050 |     00 | User Wise   | LMUr1   | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CU         |                     1 |               0 | 09:00             | 18:00           | LMUr1     |
    And "Credit" Leave from Credit_Debit_Encashment page
      | Period  | Month | Year | LeaveID | CreditMode | TimeHHH | TimeMM | SelectUsers | UserIDs | Validation         |
      | Monthly |     0 |    0 | CU      | Fixed      |     009 |     00 | User Wise   | LMUr1   | Saved Successfully |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 09:00    |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name            | AdjustmentValue | Period  | Month | Year |
      | LMUr1  | CU - LM_CU_HrPLOverflow |                 | Monthly |     0 |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    1 | 00:00   | 09:00  | 00:00 | 00:00      | 00:00   | 09:00   | 00:00    |

  @LMPart1_110
  Scenario: Overflow Management Scenario for Adjustment Type = Encash, Period= Monthly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CU      | LM_CU_HrPLOverflow | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True     | True          |      050 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLOverflow" with Pro-rata "False"
      | LeaveID |
      | CU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_HrPLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 050:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CU         |                     1 |               0 | 09:00             | 18:00           | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 009:00 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 09:00    |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name            | Period  | Month | Year |
      | LMUr1  | CU - LM_CU_HrPLOverflow | Monthly |     0 |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period  | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Monthly |     0 |    0 | 00:00   | 59:00  | 00:00 | 09:00      | 00:00   | 50:00   | 00:00    |

  @LMPart1_111
  Scenario: Overflow Management Scenario for Adjustment Type = Reuse, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | CarryFrdToNxtYr | LvEncash | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CU      | LM_CU_HrPLOverflow | Hourly Paid Leave | 00:00     | 23:59           | 23:59           |                 | True     | True          |      050 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLOverflow" with Pro-rata "False"
      | LeaveID |
      | CU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_HrPLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      1 |       |    0 |          | credit | 050:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CU         |                     1 |               0 | 09:00             | 18:00           | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 009:00 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Yearly |       |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 09:00    |
    Then "Reuse" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name            | AdjustmentValue | Period | Month | Year |
      | LMUr1  | CU - LM_CU_HrPLOverflow |                 | Yearly |       |    1 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Yearly |       |    1 | 00:00   | 09:00  | 00:00 | 00:00      | 00:00   | 09:00   | 00:00    |

  @LMPart1_112
  Scenario: Overflow Management Scenario for Adjustment Type = Encash, Period= Yearly, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | LvEncash | MaxAccumCheck | MaxHHAlw | MaxMMAlw | Validation         |
      | CU      | LM_CU_HrPLOverflow | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | True     | True          |      050 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLOverflow" with Pro-rata "False"
      | LeaveID |
      | CU      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_HrPLOverflow | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      1 |       |    0 |          | credit | 050:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CU         |                     1 |               0 | 09:00             | 18:00           | LMUr1     |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CU         |      0 |     0 |    0 |          | credit | 009:00 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        2 | RejectedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Yearly |       |    0 | 00:00   | 59:00  | 00:00 | 00:00      | 00:00   | 50:00   | 09:00    |
    Then "Encash" Overflow Leaves from Overflow Management page
      | UserId | LeaveId-Name            | Period | Month | Year |
      | LMUr1  | CU - LM_CU_HrPLOverflow | Yearly |       |    0 |
    And Verify Leave Balance in Leave Balance Page
      | UserID | LeaveName          | Period | Month | Year | Opening | Credit | Debit | Encashment | Availed | Closing | Overflow |
      | LMUr1  | LM_CU_HrPLOverflow | Yearly |       |    0 | 00:00   | 59:00  | 00:00 | 09:00      | 00:00   | 50:00   | 00:00    |

  #################################Overflow Management End########################
  #################################Leave Application Starts########################
  @LMPart1_113
  Scenario: Leave Application from ESS, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                | Validation                   |
      |        0 |      0 | CD - LM_CD_PaidLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_114
  Scenario: Leave Application from ESS, Leave Type= Lay Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CV - LM_CV_LayOffLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_115
  Scenario: Leave Application from ESS, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName     |
      | LM_HSLvApp |
    And Create Holiday Schedule "LM_HSLvApp"
      | FromDate | ToDate | HolidayName      | DeviceSynced |
      |       -1 |     -1 | LeaveApplication | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvApp"
      | Date | RestrictedHolidayName |
      |    0 | RHLvApplication       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | LeaveGroup          | AtdEnable | ACSEnable | HolidaySchedule | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_RHLeave | True      | True      | LM_HSLvApp      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                   |
      |        0 |      0 | CA - LM_CA_RHLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_116
  Scenario: Leave Application from ESS, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CW - LM_CW_UnpaidLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_117
  Scenario: Leave Application from ESS, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 006:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CI - LM_CI_HrPLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_118
  Scenario: Leave Application from ESS, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CX - LM_CX_HrUnpaidLeave | No more absent records exist |
    Then Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_119
  Scenario: Leave Application from ESS for Minimum Allowed Limit, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | CY      | LM_CY_PaidLvMinAlwLmt | Paid Leave |           2.0 |        99.0 | Single App     |          |               |           | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_PdLvMinAlwLmt" with Pro-rata "False"
      | LeaveID |
      | CY      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_PdLvMinAlwLmt | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    3 |          |                | CY         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                      | Validation                                               |
      |        0 |      0 | CY - LM_CY_PaidLvMinAlwLmt | Leave cannot be applied because of Minimum Allowed Limit |

  @LMPart1_120
  Scenario: Leave Application from ESS for Minimum Allowed Limit, Leave Type= Lay Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CZ      | LM_CZ_LayOffMinAlwLmt | Lay off   |           2.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_LayOfMinAlwLmt" with Pro-rata "False"
      | LeaveID |
      | CZ      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_LayOfMinAlwLmt | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                      | Validation                                               |
      |        0 |      0 | CZ - LM_CZ_LayOffMinAlwLmt | Leave cannot be applied because of Minimum Allowed Limit |

  @LMPart1_121
  Scenario: Leave Application from ESS for Minimum Allowed Limit, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName          |
      | LM_HS_MinAlwLmt |
    And Create Holiday Schedule "LM_HS_MinAlwLmt"
      | FromDate | ToDate | HolidayName | DeviceSynced |
      |       -1 |     -1 | TestDay     | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HS_MinAlwLmt"
      | Date | RestrictedHolidayName |
      |    0 | RHMinAlwLmt           |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | AH      | LM_AH_RHMinAlwLmt | Restricted Holiday |           2.0 |        99.0 | Single App     |          |               |           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHMinAlwLmt" with Pro-rata "False"
      | LeaveID |
      | AH      |
    And Create user from user configuration
      | userid | Active | LeaveGroup              | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_RHMinAlwLmt | True      | True      | True      | True      | True               | LM_HS_MinAlwLmt | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    4 |          |                | AH         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                                               |
      |        0 |      0 | AH - LM_AH_RHMinAlwLmt | Leave cannot be applied because of Minimum Allowed Limit |

  @LMPart1_122
  Scenario: Leave Application from ESS for Minimum Allowed Limit, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName             | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MaxAccumCheck | MaxBalAlw | Validation         |
      | AI      | LM_AI_UnpaidMinAlwLmt | Unpaid    |           2.0 |        99.0 | Single App     |          |               |           | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_UnpaidMnAlwLmt" with Pro-rata "False"
      | LeaveID |
      | AI      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_UnpaidMnAlwLmt | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                      | Validation                                               |
      |        0 |      0 | AI - LM_AI_UnpaidMinAlwLmt | Leave cannot be applied because of Minimum Allowed Limit |

  @LMPart1_123
  Scenario: Leave Application from ESS for Minimum Allowed Duration, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | AJ      | LM_AJ_HrPLMinAlwLmt | Hourly Paid Leave | 02:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLMinAlwLmt" with Pro-rata "False"
      | LeaveID |
      | AJ      |
    And Create user from user configuration
      | userid | Active | LeaveGroup                | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HldSchedule | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_HrPLMinAlwLmt | True      | True      | True      | True      | True               |             | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | AJ         |      0 |     0 |    0 |          | credit | 006:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                                                  |
      | Hourly         |       0 |        0 |      0 | 10:00    | 11:00  | AJ - LM_AJ_HrPLMinAlwLmt | Leave cannot be applied because of Minimum Allowed Duration |

  @LMPart1_124
  Scenario: Leave Application from ESS for Minimum Allowed Duration, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName               | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | AK      | LM_AK_HrUnpaidMinAlwLmt | Hourly Unpaid Leave | 02:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrUnpdMnAlwLmt" with Pro-rata "False"
      | LeaveID |
      | AK      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_HrUnpdMnAlwLmt | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                        | Validation                                                  |
      | Hourly         |       0 |        0 |      0 | 10:00    | 11:00  | AK - LM_AK_HrUnpaidMinAlwLmt | Leave cannot be applied because of Minimum Allowed Duration |

  @LMPart1_125
  Scenario: Half Day Leave Application from ESS Scenario, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | ConsiInTermsOf  | Leave                | Validation                   |
      |        0 |      0 | First Half Only | CD - LM_CD_PaidLeave | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_126
  Scenario: Half Day Leave Application from ESS Scenario, Leave Type= Lay Off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | ConsiInTermsOf  | Leave                  | Validation                   |
      |        0 |      0 | First Half Only | CV - LM_CV_LayOffLeave | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_127
  Scenario: Half Day Leave Application from ESS Scenario, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSHalfDayApp |
    And Create Holiday Schedule "LM_HSHalfDayApp"
      | FromDate | ToDate | HolidayName        | DeviceSynced |
      |       -1 |     -1 | HalfDayApplication | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSHalfDayApp"
      | Date | RestrictedHolidayName |
      |    0 | RHHalfDayApp          |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create user from user configuration
      | userid | Active | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSHalfDayApp | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | ConsiInTermsOf  | Leave              | Validation                   |
      |        0 |      0 | First Half Only | CA - LM_CA_RHLeave | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_128
  Scenario: Half Day Leave Application from ESS Scenario, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | ConsiInTermsOf  | Leave                  | Validation                   |
      |        0 |      0 | First Half Only | CW - LM_CW_UnpaidLeave | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_129
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Paid Leave, Validation= Medical Certificate must be uploaded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq     | MinLvForCertComp | Validation         |
      | AL      | LM_AL_PLMedCertReq | Paid Leave |           0.0 |        99.0 | Single App     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLMedCertReq" with Pro-rata "False"
      | LeaveID |
      | AL      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PLMedCertReq | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | AL         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                   | MedCertAvail | Validation                           |
      |        0 |      0 | AL - LM_AL_PLMedCertReq | true         | Medical Certificate must be uploaded |

  @LMPart1_130
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Paid Leave, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName          | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq     | MinLvForCertComp | Validation         |
      | AL      | LM_AL_PLMedCertReq | Paid Leave |           0.0 |        99.0 | Single App     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PLMedCertReq" with Pro-rata "False"
      | LeaveID |
      | AL      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_PLMedCertReq | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | AL         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                   | MedCertAvail | MedCert    | Validation                   |
      |        0 |      0 | AL - LM_AL_PLMedCertReq | true         | UploadFile | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_131
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Unpaid, Validation= Medical Certificate must be uploaded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq     | MinLvForCertComp | Validation         |
      | AM      | LM_AM_UnPLMedCertReq | Unpaid    |           0.0 |        99.0 | Single App     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_UnPLMedCertReq" with Pro-rata "False"
      | LeaveID |
      | AM      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_UnPLMedCertReq | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                     | MedCertAvail | Validation                           |
      |        0 |      0 | AM - LM_AM_UnPLMedCertReq | true         | Medical Certificate must be uploaded |

  @LMPart1_132
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Unpaid, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MediCertReq     | MinLvForCertComp | Validation         |
      | AM      | LM_AM_UnPLMedCertReq | Unpaid    |           0.0 |        99.0 | Single App     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_UnPLMedCertReq" with Pro-rata "False"
      | LeaveID |
      | AM      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_UnPLMedCertReq | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | FromDate | ToDate | Leave                     | MedCertAvail | MedCert    | Validation                   |
      |        0 |      0 | AM - LM_AM_UnPLMedCertReq | true         | UploadFile | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_133
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Hourly Paid Leave, Validation= Medical Certificate must be uploaded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | AN      | LM_AN_HrPLMedCertReq | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLMedCertReq" with Pro-rata "False"
      | LeaveID |
      | AN      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_HrPLMedCertReq | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | AN         |      0 |     0 |    0 |          | credit | 006:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                     | MedCertAvail | Validation                           |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | AN - LM_AN_HrPLMedCertReq | true         | Medical Certificate must be uploaded |

  @LMPart1_134
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Hourly Paid Leave, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | AN      | LM_AN_HrPLMedCertReq | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrPLMedCert" with Pro-rata "False"
      | LeaveID |
      | AN      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_HrPLMedCert | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | AN         |      0 |     0 |    0 |          | credit | 006:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                     | MedCertAvail | MedCert    | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | AN - LM_AN_HrPLMedCertReq | true         | UploadFile | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_135
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Hourly Unpaid Leave, Validation= Medical Certificate must be uploaded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | AP      | LM_AP_HrUnPlMedCert | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrUnPlMedCert" with Pro-rata "False"
      | LeaveID |
      | AP      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_HrUnPlMedCert | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | MedCertAvail | Validation                           |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | AP - LM_AP_HrUnPlMedCert | true         | Medical Certificate must be uploaded |

  @LMPart1_136
  Scenario: Medical Certificate Required= Upload Document, Leave Type= Hourly Unpaid Leave, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | MediCertReq     | MinDurHHH | MinDurMM | Validation         |
      | AP      | LM_AP_HrUnPlMedCert | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Upload Document |       001 |       00 | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_HrUnPlMedCert" with Pro-rata "False"
      | LeaveID |
      | AP      |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeavGrp_HrUnPlMedCert | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | MedCertAvail | MedCert    | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | AP - LM_AP_HrUnPlMedCert | true         | UploadFile | No more absent records exist |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_137
  Scenario: Add Leave Hours In Work Hours =  false, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | AQ      | LM_AQ_AdLvHrInWrkHr | Hourly Paid Leave | 01:00     | 23:59           | 23:59           | false           | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_AdLvHrInWrkHr" with Pro-rata "False"
      | LeaveID |
      | AQ      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup               | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_AdLvHrInWrkHr | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | AQ         |      0 |     0 |    0 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | LMUr1  |            0 |            0900 |            1700 | GS    | LMUr1     |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID  | process-date |
      | LMUr1  |       1 | AtdCorApproved | LMRic1 |            0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    |
      | Hourly         |       0 |        0 |      0 | 17:00    | 18:00  | AQ - LM_AQ_AdLvHrInWrkHr |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "0" year= "0"
      | Date | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark       |
      |    0 | GS    | 09:00   | 17:00   | 07:00     |           |          | 01:00      |         |         |           | PR      | AB      | AB:Early-OUT |

  @LMPart1_138
  Scenario: Add Leave Hours In Work Hours= true, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | AO      | LM_AO_AdLvHrInWrkHr | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_AdLvHrInWrkHs1" with Pro-rata "False"
      | LeaveID |
      | AO      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_AdLvHrInWrkHs1 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | AO         |      0 |     0 |    0 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | LMUr1  |            0 |            0900 |            1700 | GS    | LMUr1     |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID  | process-date |
      | LMUr1  |       1 | AtdCorApproved | LMRic1 |            0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    |
      | Hourly         |       0 |        0 |      0 | 17:00    | 18:00  | AO - LM_AO_AdLvHrInWrkHr |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "0" year= "0"
      | Date | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      |    0 | GS    | 09:00   | 17:00   | 08:00     |           |          | 01:00      |         |         |           | PR      | PR      |        |

  @LMPart1_139
  Scenario: Add Leave Hours In Work Hours= false, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | AR      | LM_AR_AdLvHrInWrkHr | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | false           | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_AdLvHrInWrkHr2" with Pro-rata "False"
      | LeaveID |
      | AR      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_AdLvHrInWrkHr2 | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | LMUr1  |            0 |            0900 |            1700 | GS    | LMUr1     |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID  | process-date |
      | LMUr1  |       1 | AtdCorApproved | LMRic1 |            0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    |
      | Hourly         |       0 |        0 |      0 | 17:00    | 18:00  | AR - LM_AR_AdLvHrInWrkHr |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "0" year= "0"
      | Date | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark       |
      |    0 | GS    | 09:00   | 17:00   | 07:00     |           |          | 01:00      |         |         |           | PR      | AB      | AB:Early-OUT |

  @LMPart1_140
  Scenario: Add Leave Hours In Work Hours= true, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName            | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | AdLvHrsInWrkHrs | Validation         |
      | ES      | LM_ES_AdLvHrInWrkHrs | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | true            | Saved Successfully |
    And Create Leave Group "LM_LeavGrp_AdLvHrInWrkHrs" with Pro-rata "False"
      | LeaveID |
      | ES      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeavGrp_AdLvHrInWrkHrs | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Generate Attendance Correction Application via API
      | userid | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | LMUr1  |            0 |            0900 |            1700 | GS    | LMUr1     |
    And Approve Reject Attendance Correction Application via API
      | userid | Verdict | remark         | ricID  | process-date |
      | LMUr1  |       1 | AtdCorApproved | LMRic1 |            0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                     |
      | Hourly         |       0 |        0 |      0 | 17:00    | 18:00  | ES - LM_ES_AdLvHrInWrkHrs |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID  | userid | Start-date | end-date |
      |        1 | ApprovedRequest | LMRic1 | LMUr1  |          0 |        0 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Verify user Attendance in Attendance Summary page for userid= "LMUr1" and month= "0" year= "0"
      | Date | Shift | FirstIN | LastOUT | WorkHours | ExtraWork | Net-Work | BreakHours | TotalOT | Late-IN | Early-OUT | 1stHalf | 2ndHalf | Remark |
      |    0 | GS    | 09:00   | 17:00   | 08:00     |           |          | 01:00      |         |         |           | PR      | PR      |        |

  @LMPart1_141
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                | Validation                   |
      |       -1 |     -1 | CD - LM_CD_PaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "0"
      | Status   |
      | Approved |

  @LMPart1_142
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                | Validation                   |
      |       -1 |     -1 | CD - LM_CD_PaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_143
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |       -1 |     -1 | CV - LM_CV_LayOffLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "0"
      | Status   |
      | Approved |

  @LMPart1_144
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |       -1 |     -1 | CV - LM_CV_LayOffLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_145
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |       -1 |     -1 | CW - LM_CW_UnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "0"
      | Status   |
      | Approved |

  @LMPart1_146
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |       -1 |     -1 | CW - LM_CW_UnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyToDate | Validation                      |
      |            0 | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_147
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvModify1 |
    And Create Holiday Schedule "LM_HSLvModify1"
      | FromDate | ToDate | HolidayName      | DeviceSynced |
      |       -2 |     -2 | LeaveModifyTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvModify1"
      | Date | RestrictedHolidayName |
      |    0 | RHLvModfyTest01       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvModify1  | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                   |
      |        0 |      0 | CA - LM_CA_RHLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "0" To= "0"
      | DayType    | Validation                      |
      | First Half | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_148
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvModify2 |
    And Create Holiday Schedule "LM_HSLvModify2"
      | FromDate | ToDate | HolidayName      | DeviceSynced |
      |       -2 |     -2 | LeaveModifyTest2 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvModify2"
      | Date | RestrictedHolidayName |
      |   -1 | RHLvModifyTest2       |
      |    0 | RHLvModfyTest02       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvModify2  | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     -1 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                   |
      |       -1 |     -1 | CA - LM_CA_RHLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | DayType    | Validation                      |
      | First Half | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_149
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     -1 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                   |
      | Hourly         |      -1 |       -1 |     -1 | 10:00    | 12:00  | CI - LM_CI_HrPLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyFromTime | ModifyToTime | Validation                      |
      | 09:00          |              | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Approved |

  @LMPart1_150
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     -1 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                   |
      | Hourly         |      -1 |       -1 |     -1 | 10:00    | 12:00  | CI - LM_CI_HrPLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyFromTime | Validation                      |
      | 09:00          | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_151
  Scenario: Leave Modification Application and Approved by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                   |
      | Hourly         |      -1 |       -1 |     -1 | 10:00    | 12:00  | CX - LM_CX_HrUnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyFromTime | Validation                      |
      | 09:00          | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Approved |

  @LMPart1_152
  Scenario: Leave Modification Application and Rejected by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                   |
      | Hourly         |      -1 |       -1 |     -1 | 10:00    | 12:00  | CX - LM_CX_HrUnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "modification" from ESS Date From= "-1" To= "-1"
      | ModifyFromTime | Validation                      |
      | 09:00          | Leave Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |       -1 |     -1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "-1" To= "-1"
      | Status   |
      | Rejected |

  @LMPart1_153
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                | Validation                   |
      |        0 |      0 | CD - LM_CD_PaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | Validation                      |
      | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_154
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                | Validation                   |
      |        0 |      0 | CD - LM_CD_PaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_155
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CV - LM_CV_LayOffLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_156
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CV - LM_CV_LayOffLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_157
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CW - LM_CW_UnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_158
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave                  | Validation                   |
      |        0 |      0 | CW - LM_CW_UnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_159
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvCancel1 |
    And Create Holiday Schedule "LM_HSLvCancel1"
      | FromDate | ToDate | HolidayName      | DeviceSynced |
      |       -1 |     -1 | LeaveCancelTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvCancel1"
      | Date | RestrictedHolidayName |
      |    0 | RHLvCancelTest1       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvCancel1  | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                   |
      |        0 |      0 | CA - LM_CA_RHLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_160
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName         |
      | LM_HSLvCancel2 |
    And Create Holiday Schedule "LM_HSLvCancel2"
      | FromDate | ToDate | HolidayName      | DeviceSynced |
      |       -1 |     -1 | LeaveCancelTest2 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvCancel2"
      | Date | RestrictedHolidayName |
      |    0 | RHLvCancelTest2       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvCancel2  | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | FromDate | ToDate | Leave              | Validation                   |
      |        0 |      0 | CA - LM_CA_RHLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_161
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CI - LM_CI_HrPLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_162
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave               | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CI - LM_CI_HrPLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_163
  Scenario: Leave Cancellation Application Approved by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CX - LM_CX_HrUnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_164
  Scenario: Leave Cancellation Application Rejected by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Leave Application from ESS
      | ConsiInTermsOf | AtdDate | FromDate | ToDate | FromTime | ToTime | Leave                    | Validation                   |
      | Hourly         |       0 |        0 |      0 | 10:00    | 12:00  | CX - LM_CX_HrUnpaidLeave | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for leave application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                      |
      |              | Leave Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  #################################Leave Application End########################
  #################################Leave Approval Start########################
  @LMPart1_165
  Scenario: Leave Application Approved by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CD         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_166
  Scenario: Leave Application Rejected by RIC, Leave Type= Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName       | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CD      | LM_CD_PaidLeave | Paid Leave |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_PaidLeave" with Pro-rata "False"
      | LeaveID |
      | CD      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup            | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_PaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CD         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CD         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_167
  Scenario: Leave Application Approved by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CV         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_168
  Scenario: Leave Application Rejected by RIC, Leave Type= Lay off
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CV      | LM_CV_LayOffLeave | Lay off   |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_LayOffLeave" with Pro-rata "False"
      | LeaveID |
      | CV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_LayOffLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CV         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_169
  Scenario: Leave Application Approved by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSLvApprove1 |
    And Create Holiday Schedule "LM_HSLvApprove1"
      | FromDate | ToDate | HolidayName       | DeviceSynced |
      |       -1 |     -1 | HSLvApprovalTest1 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvApprove1"
      | Date | RestrictedHolidayName |
      |    0 | RHLvApprovTest1       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvApprove1 | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CA         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

 @LMPart1_170
  Scenario: Leave Application Rejected by RIC, Leave Type= Restricted Holiday
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Delete Holiday Schedule
      | HSName          |
      | LM_HSLvApprove2 |
    And Create Holiday Schedule "LM_HSLvApprove2"
      | FromDate | ToDate | HolidayName       | DeviceSynced |
      |       -1 |     -1 | HSLvApprovalTest2 | False        |
    And Create Restricted Holidays for Holiday Schedule "LM_HSLvApprove2"
      | Date | RestrictedHolidayName |
      |    0 | RHLvApprovTest2       |
    And Create Leave
      | LeaveID | LeaveName     | LeaveType          | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CA      | LM_CA_RHLeave | Restricted Holiday |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_RHLeave" with Pro-rata "False"
      | LeaveID |
      | CA      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup          | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | HolidaySchedule | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_RHLeave | True      | True      | True      | True      | True               | LM_HSLvApprove2 | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours |
      | LMUr1  |          0 |           0 |                 |                 |    2 |          |                | CA         |      0 |     0 |    0 |          | credit |       |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CA         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |
 

  @LMPart1_171
  Scenario: Leave Application Approved by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CW         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_172
  Scenario: Leave Application Rejected by RIC, Leave Type= Unpaid
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | Validation         |
      | CW      | LM_CW_UnpaidLeave | Unpaid    |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_UnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CW      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_UnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | CW         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_173
  Scenario: Leave Application Approved by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CI         |                     1 |               0 | 10:00             | 12:00           | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_174
  Scenario: Leave Application Rejected by RIC, Leave Type= Hourly Paid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName      | LeaveType         | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CI      | LM_CI_HrPLeave | Hourly Paid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrPLeave" with Pro-rata "False"
      | LeaveID |
      | CI      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup           | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrPLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | LMUr1  |          0 |           0 |                 |                 |      |          |                | CI         |      0 |     0 |    0 |          | credit | 010:00 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CI         |                     1 |               0 | 10:00             | 12:00           | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_175
  Scenario: Leave Application Approved by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CX         |                     1 |               0 | 10:00             | 12:00           | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_176
  Scenario: Leave Application Rejected by RIC, Leave Type= Hourly Unpaid Leave
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName           | LeaveType           | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | CX      | LM_CX_HrUnpaidLeave | Hourly Unpaid Leave | 00:00     | 23:59           | 23:59           | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_HrUnpaidLeave" with Pro-rata "False"
      | LeaveID |
      | CX      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup                | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_HrUnpaidLeave | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | attendance-date | hourly-start-time | hourly-end-time | appliedBy |
      | LMUr1  |                  4 |          0 |        0 | CX         |                     1 |               0 | 10:00             | 12:00           | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Leave" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Leave Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  #################################Leave Approval End########################
  #################################Tour Application and Approval Starts########################
  @LMPart1_177
  Scenario: Tour Application from ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour            | Validation                   |
      |        0 |      0 | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_178
  Scenario: Tour Application for Min. Allow Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName         | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AT     | LM_AT_TourMinAlw |             2 |          99 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TourMinAlw" with Pro-rata "False"
      | TourID |
      | AT     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup             | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_TourMinAlw | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour                  | Validation                                              |
      |        0 |      0 | OfficialWork | AT - LM_AT_TourMinAlw | Tour cannot be applied because of Minimum Allowed Limit |

  @LMPart1_179
  Scenario: Tour Application for Half day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Duration   | Reason       | Tour            | Validation                   |
      |        0 |      0 | First Half | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_180
  Scenario: Tour Application for Medical Certificate Required, Validation= Tour Document must be uploaded.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName          | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | TourDocReq      | MinTrDayForDocCom | Validation         |
      | AU     | LM_AU_TourMedCert |           0.0 |        99.0 | Single App     | Upload Document |                 1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TourMedCert" with Pro-rata "False"
      | TourID |
      | AU     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_TourMedCert | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour                   | MedDocAvail | Validation                      |
      |        0 |      0 | OfficialWork | AU - LM_AU_TourMedCert | true        | Tour Document must be uploaded. |

  @LMPart1_181
  Scenario: Tour Application for Medical Certificate Required, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName          | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | TourDocReq      | MinTrDayForDocCom | Validation         |
      | AU     | LM_AU_TourMedCert |           0.0 |        99.0 | Single App     | Upload Document |                 1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_TourMedCert" with Pro-rata "False"
      | TourID |
      | AU     |
    And Create user from user configuration
      | userid | Active | ReportingGroup | LeaveGroup              | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   |                | LM_LeaveGrp_TourMedCert | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    When Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour                   | MedDocAvail | MedCert    | Validation                   |
      |        0 |      0 | OfficialWork | AU - LM_AU_TourMedCert | true        | UploadFile | No more absent records exist |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_182
  Scenario: Tour Application Approval from RIC = Approved
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AS         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_183
  Scenario: Tour Application Approval from RIC = Rejected
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AS         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_184
  Scenario: Tour Modification Application Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour            | Validation                   |
      |        0 |      0 | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for tour application "modification" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                     |
      |            1 | Tour Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      1 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "1"
      | Status   |
      | Approved |

  @LMPart1_185
  Scenario: Tour Modification Application Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour            | Validation                   |
      |        0 |      0 | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for tour application "modification" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                     |
      |            1 | Tour Modification Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      1 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_186
  Scenario: Tour Cancellation Application Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour            | Validation                   |
      |        0 |      0 | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for tour application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                     |
      |              | Tour Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  @LMPart1_187
  Scenario: Tour Cancellation Application Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Tour
      | TourID | TourName   | MinAlwAtATime | MaxAlwLimit | MaxAlwLimitFor | Validation         |
      | AS     | LM_AS_Tour |           0.0 |        99.0 | Single App     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_Tour" with Pro-rata "False"
      | TourID |
      | AS     |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | AttendancePlc | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_Tour | True      |               | True      | True      | True      | True               | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    When Apply Tour Application from ESS
      | FromDate | ToDate | Reason       | Tour            | Validation                   |
      |        0 |      0 | OfficialWork | AS - LM_AS_Tour | No more absent records exist |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply for tour application "cancellation" from ESS Date From= "0" To= "0"
      | ModifyToDate | Validation                     |
      |              | Tour Cancellation Request Sent |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    And Approve Reject "Tour" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify Tour Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  #################################Tour Application End########################
  #################################C-Off Application Starts########################
  @LMPart1_188
  Scenario: C-Off Application from ESS for Full Day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | AV      | LM_AV_COff | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COff" with Pro-rata "False"
      | LeaveID |
      | AV      |
    And Create user from user configuration
      | userid | Active | LeaveGroup       | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COff | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave           | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        0 |      0 | AV - LM_AV_COff |       0 | 08:00         | sick   | No more absent records exist |
    And Verify C-OFF Application Status in ESS date From= "0" To= "0"
      | Status  |
      | Applied |

  @LMPart1_189
  Scenario: C-Off Application for Min. Allow Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName        | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | AW      | LM_AW_COffMinAlw | Compensatory Off |           2.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffMinAlw" with Pro-rata "False"
      | LeaveID |
      | AW      |
    And Create user from user configuration
      | userid | Active | LeaveGroup             | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COffMinAlw | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave                 | AtdDate | SelectCOffHrs | Reason | Validation                                               |
      |        0 |      0 | AW - LM_AW_COffMinAlw |       0 | 08:00         | sick   | C-OFF cannot be applied because of Minimum Allowed Limit |

  @LMPart1_190
  Scenario: C-Off Application from ESS for Half day
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | AV      | LM_AV_COff | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COff" with Pro-rata "False"
      | LeaveID |
      | AV      |
    And Create user from user configuration
      | userid | Active | LeaveGroup       | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COff | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Duration   | Leave           | AtdDate | SelectCOffHrs | Reason | Validation                   |
      |        0 |      0 | First Half | AV - LM_AV_COff |       0 | 04:00         | sick   | No more absent records exist |
    And Verify C-OFF Application Status in ESS date From= "0" To= "0"
      | PostedDuration | Status  |
      |            0.5 | Applied |

  @LMPart1_191
  Scenario: C-Off Application for Medical Certificate Required, Validation= Medical Certificate must be uploaded
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MediCertReq     | MinLvForCertComp | Validation         |
      | AX      | LM_AX_COffMedCert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffMedCert" with Pro-rata "False"
      | LeaveID |
      | AX      |
    And Create user from user configuration
      | userid | Active | LeaveGroup              | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COffMedCert | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave                  | AtdDate | SelectCOffHrs | Reason | MedCertAvail | Validation                           |
      |        1 |      1 | AX - LM_AX_COffMedCert |       0 | 08:00         | sick   | true         | Medical Certificate must be uploaded |

  @LMPart1_192
  Scenario: C-Off Application for Medical Certificate Required, Validation= No more absent records exist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName         | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | MediCertReq     | MinLvForCertComp | Validation         |
      | AX      | LM_AX_COffMedCert | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Upload Document |                1 | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COffMedCert" with Pro-rata "False"
      | LeaveID |
      | AX      |
    And Create user from user configuration
      | userid | Active | LeaveGroup              | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_LeaveGrp_COffMedCert | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Logout from Cosec Web
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    Then Apply COff Application from ESS
      | FromDate | ToDate | Leave                  | AtdDate | SelectCOffHrs | Reason | MedCertAvail | MedCert    | Validation                   |
      |        1 |      1 | AX - LM_AX_COffMedCert |       0 | 08:00         | sick   | true         | UploadFile | No more absent records exist |
    And Verify C-OFF Application Status in ESS date From= "1" To= "1"
      | Status  |
      | Applied |

  #################################C-Off Application End########################
  #################################C-Off Approval Starts########################
  @LMPart1_193
  Scenario: C-Off Application Approved by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | AV      | LM_AV_COff | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COff" with Pro-rata "False"
      | LeaveID |
      | AV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_COff | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    When Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AV         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 | true    |        | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify C-OFF Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Approved |

  @LMPart1_194
  Scenario: C-Off Application Rejected by RIC
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | LMUr1  |
      | LMUr2  |
      | LMUr3  |
      | LMRic1 |
    And Create Leave
      | LeaveID | LeaveName  | LeaveType        | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | LvEncash | Validation         |
      | AV      | LM_AV_COff | Compensatory Off |           0.0 |        99.0 | Single App     | True     | Saved Successfully |
    And Create Leave Group "LM_LeaveGrp_COff" with Pro-rata "False"
      | LeaveID |
      | AV      |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess |
      | LMRic1 | LMRic1 |               1 |         1 |               1 |                  1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1   | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | LM_ReportingGrp1 |        1 | LMRic1 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid | Active | ReportingGroup   | LeaveGroup       | AtdEnable | OtCoffEligibility | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | LMUr1  | True   | LM_ReportingGrp1 | LM_LeaveGrp_COff | True      | Both              | True      | True      | True      | True               | Saved Successfully |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | LMUr1  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | LMUr1  |
    And Manual Overtime/C-OFF Entry for UserID= "LMUr1" on AtdDate= "0"
      | Component | EntryType | Value | Validation         |
      | C-OFF     | Credit    | 16:00 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | LMUr1  |                          1 | admin        |    1 |
      | LMRic1 |                          1 | admin        |    1 |
    When Apply Leave Application via API
      | userid | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | LMUr1  |                  1 |          0 |        0 | AV         |                     1 | LMUr1     |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation     |
      | LMRic1   | admin    | Welcome LMRic1 |
    Then Approve Reject "C-OFF" Application from RIC Date from= "-2" To= "2"
      | User  | FromDate | ToDate | Approve | Reject | Validation         |
      | LMUr1 |        0 |      0 |         | true   | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | LMUr1    | admin    | Welcome LMUr1 |
    And Verify C-OFF Application Status in ESS date From= "0" To= "0"
      | Status   |
      | Rejected |

  #################################C-Off Approval End########################
 