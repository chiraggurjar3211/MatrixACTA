@tag
Feature: Alerts Group Wise
  I want to use this template for my feature file

  @AlertGrp_17
  Scenario: Alert Group Wise - T&A - Monthly Attendance
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | SA       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_41_u1 |
      | COS_41_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   4110000001 | cos411@gmail.com |
      |   4120000001 | cos412@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_41_u1 | COS_41_u1 |               1 |         1 |               1 |                  1 |    4110000001 | cos411@gmail.com |
      | COS_41_u2 | COS_41_u2 |               1 |         1 |               1 |                  1 |    4120000001 | cos412@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | COS_41_u1 | AlOrg1       | Saved Successfully |
      | COS_41_u2 | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Monthly Attendance"
    And Update Alert Configuration "Monthly Attendance"
      | ShowMonthlyLeaveBal |
      | True                |
    And Assign User in Alert "Monthly Attendance"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_41_u1 |
      | COS_41_u2 |
    When Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_41_u1 |
      | COS_41_u2 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_41_u1 |   4110000001 | cos411@gmail.com |        1 |          1 |             1 |
      | COS_41_u2 |   4120000001 | cos412@gmail.com |        0 |          0 |             0 |

  @AlertGrp_18
  Scenario: Alert Group Wise - T&A - Attendance Correction Application & Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_42_u1   |
      | COS_42_u2   |
      | COS_42_RIC1 |
      | COS_42_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   4210000001 | cos421@gmail.com    |
      |   4220000001 | cos422@gmail.com    |
      |   4210000011 | cos42ric1@gmail.com |
      |   4220000011 | cos42ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_42_u1   | COS_42_u1   |               1 |         1 |               1 |                  1 |    4210000001 | cos421@gmail.com    |
      | COS_42_u2   | COS_42_u2   |               1 |         1 |               1 |                  1 |    4220000001 | cos422@gmail.com    |
      | COS_42_RIC1 | COS_42_RIC1 |               1 |         1 |               1 |                  1 |    4210000011 | cos42ric1@gmail.com |
      | COS_42_RIC2 | COS_42_RIC2 |               1 |         1 |               1 |                  1 |    4220000011 | cos42ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_42_u1   |                          1 | admin        |    1 |
      | COS_42_u2   |                          1 | admin        |    1 |
      | COS_42_RIC1 |                          1 | admin        |    1 |
      | COS_42_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS42RICGrp1     |        1 | COS_42_RIC1 |      |      |      |      | Saved Successfully |
      | COS42RICGrp2     |        1 | COS_42_RIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | Organization | Validation         |
      | COS_42_u1   | COS42RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_42_u2   | COS42RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_42_RIC1 |                | AlOrg1       | Saved Successfully |
      | COS_42_RIC2 |                | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Attendance Correction Application"
    And Update Alert Configuration "Attendance Correction Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Attendance Correction Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Attendance Correction Approval/Rejection"
    And Assign User in Alert "Attendance Correction Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_42_u1 |
      | COS_42_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_42_u1 |
      | COS_42_u2 |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_42_u1 |            0 |            0900 |            1800 | GS    | COS_42_u1 |
      | COS_42_u2 |            0 |            0900 |            1800 | GS    | COS_42_u2 |
    And Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID       | process-date |
      | COS_42_u1 |       1 | AtdCorApproved | COS_42_RIC1 |            0 |
      | COS_42_u2 |       1 | AtdCorApproved | COS_42_RIC2 |            0 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_42_u1   |   4210000001 | cos421@gmail.com    |        1 |          1 |             1 |
      | COS_42_RIC1 |   4210000011 | cos42ric1@gmail.com |        1 |          1 |             1 |
      | COS_42_u2   |   4220000001 | cos422@gmail.com    |        0 |          0 |             0 |
      | COS_42_RIC2 |   4220000011 | cos42ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_19
  Scenario: Alert Group Wise - T&A - Attendance Correction Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_43_u1 |
      | COS_43_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   4310000001 | cos431@gmail.com |
      |   4320000001 | cos432@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_43_u1 | COS_43_u1 |               1 |         1 |               1 |                  1 |    4310000001 | cos431@gmail.com |
      | COS_43_u2 | COS_43_u2 |               1 |         1 |               1 |                  1 |    4320000001 | cos432@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_43_u1 |                          1 | admin        |    1 |
      | COS_43_u2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | COS_43_u1 | AlOrg1       | Saved Successfully |
      | COS_43_u2 | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Attendance Correction Approval/Rejection"
    And Assign User in Alert "Attendance Correction Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_43_u1 |
      | COS_43_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_43_u1 |
      | COS_43_u2 |
    And Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_43_u1 |            0 |            0900 |            1800 | GS    | COS_43_u1 |
      | COS_43_u2 |            0 |            0900 |            1800 | GS    | COS_43_u2 |
    When Approve Reject Attendance Correction Application via API
      | userid    | Verdict | remark         | ricID | process-date |
      | COS_43_u1 |       0 | AtdCorRejected | SA    |            0 |
      | COS_43_u2 |       0 | AtdCorRejected | SA    |            0 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_43_u1 |   4310000001 | cos431@gmail.com |        1 |          1 |             1 |
      | COS_43_u2 |   4320000001 | cos432@gmail.com |        0 |          0 |             0 |

  @AlertGrp_20
  Scenario: Alert Group Wise - T&A - Short Leave Application & Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_44_u1   |
      | COS_44_u2   |
      | COS_44_RIC1 |
      | COS_44_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   4410000001 | cos441@gmail.com    |
      |   4410000011 | cos44ric1@gmail.com |
      |   4420000001 | cos442@gmail.com    |
      |   4420000011 | cos44ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_44_u1   | COS_44_u1   |               1 |         1 |               1 |                  1 |    4410000001 | cos441@gmail.com    |
      | COS_44_RIC1 | COS_44_RIC1 |               1 |         1 |               1 |                  1 |    4410000011 | cos44ric1@gmail.com |
      | COS_44_u2   | COS_44_u2   |               1 |         1 |               1 |                  1 |    4420000001 | cos442@gmail.com    |
      | COS_44_RIC2 | COS_44_RIC2 |               1 |         1 |               1 |                  1 |    4420000011 | cos44ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_44_u1   |                          1 | admin        |    1 |
      | COS_44_RIC1 |                          1 | admin        |    1 |
      | COS_44_u2   |                          1 | admin        |    1 |
      | COS_44_RIC2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS44RICGrp1     |        1 | COS_44_RIC1 |      |      |      |      | Saved Successfully |
      | COS44RICGrp2     |        1 | COS_44_RIC2 |      |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp1 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create user from user configuration
      | userid      | AttendancePlc | ReportingGroup | Organization | Validation         |
      | COS_44_u1   | ShortApp1     | COS44RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_44_u2   | ShortApp1     | COS44RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_44_RIC1 |               |                | AlOrg1       | Saved Successfully |
      | COS_44_RIC2 |               |                | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Hours Application"
    And Update Alert Configuration "Short Leave/Official Hours Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Short Leave/Official Hours Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_44_u1 |
      | COS_44_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_44_u1 |
      | COS_44_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_44_u1 |          0 |     100000 |
      | COS_44_u1 |          0 |     180000 |
      | COS_44_u2 |          0 |     100000 |
      | COS_44_u2 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_44_u1 |               0 |      2 | p1short  | COS_44_u1 |
      | COS_44_u2 |               0 |      2 | p1short  | COS_44_u2 |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | Authorization-for | Verdict | remark        | ricID       |
      | COS_44_u1 |               0 |                 2 |       1 | ShortApproved | COS_44_RIC1 |
      | COS_44_u2 |               0 |                 2 |       1 | ShortApproved | COS_44_RIC2 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_44_u1   |   4410000001 | cos441@gmail.com    |        1 |          1 |             1 |
      | COS_44_RIC1 |   4410000011 | cos44ric1@gmail.com |        1 |          1 |             1 |
      | COS_44_u2   |   4420000001 | cos442@gmail.com    |        0 |          0 |             0 |
      | COS_44_RIC2 |   4420000011 | cos44ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_21
  Scenario: Alert Group Wise - T&A - Short Leave Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_45_u1 |
      | COS_45_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   4510000001 | cos451@gmail.com |
      |   4520000001 | cos452@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_45_u1 | COS_45_u1 |               1 |         1 |               1 |                  1 |    4510000001 | cos451@gmail.com |
      | COS_45_u2 | COS_45_u2 |               1 |         1 |               1 |                  1 |    4520000001 | cos452@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_45_u1 |                          1 | admin        |    1 |
      | COS_45_u2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | ShortApp2 |                2 | True          | True                 | False            | true               | false                 | false        | True                              | Saved Successfully |
    And Create user from user configuration
      | userid    | AttendancePlc | Organization | Validation         |
      | COS_45_u1 | ShortApp2     | AlOrg1       | Saved Successfully |
      | COS_45_u2 | ShortApp2     | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_45_u1 |
      | COS_45_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_45_u1 |
      | COS_45_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_45_u1 |          0 |     100000 |
      | COS_45_u1 |          0 |     180000 |
      | COS_45_u2 |          0 |     100000 |
      | COS_45_u2 |          0 |     180000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | spfid1 | reason-1 | appliedBy |
      | COS_45_u1 |               0 |      2 | p1short  | COS_45_u1 |
      | COS_45_u2 |               0 |      2 | p1short  | COS_45_u2 |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | Authorization-for | Verdict | remark        | ricID |
      | COS_45_u1 |               0 |                 2 |       2 | ShortRejected | SA    |
      | COS_45_u2 |               0 |                 2 |       2 | ShortRejected | SA    |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_45_u1 |   4510000001 | cos451@gmail.com |        1 |          1 |             1 |
      | COS_45_u2 |   4520000001 | cos452@gmail.com |        0 |          0 |             0 |

  @AlertGrp_22
  Scenario: Alert Group Wise - T&A - Official Hours Application & Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_46_u1   |
      | COS_46_RIC1 |
      | COS_46_u2   |
      | COS_46_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   4610000001 | cos461@gmail.com    |
      |   4610000011 | cos46ric1@gmail.com |
      |   4620000001 | cos462@gmail.com    |
      |   4620000011 | cos46ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_46_u1   | COS_46_u1   |               1 |         1 |               1 |                  1 |    4610000001 | cos461@gmail.com    |
      | COS_46_RIC1 | COS_46_RIC1 |               1 |         1 |               1 |                  1 |    4610000011 | cos46ric1@gmail.com |
      | COS_46_u2   | COS_46_u2   |               1 |         1 |               1 |                  1 |    4620000001 | cos462@gmail.com    |
      | COS_46_RIC2 | COS_46_RIC2 |               1 |         1 |               1 |                  1 |    4620000011 | cos46ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_46_u1   |                          1 | admin        |    1 |
      | COS_46_RIC1 |                          1 | admin        |    1 |
      | COS_46_u2   |                          1 | admin        |    1 |
      | COS_46_RIC2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS46RICGrp1     |        1 | COS_46_RIC1 |      |      |      |      | Saved Successfully |
      | COS46RICGrp2     |        1 | COS_46_RIC2 |      |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | OfficialApp1 |                2 | false         | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Create user from user configuration
      | userid      | AttendancePlc | ReportingGroup | Organization | Validation         |
      | COS_46_u1   | OfficialApp1  | COS46RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_46_u2   | OfficialApp1  | COS46RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_46_RIC1 |               |                | AlOrg1       | Saved Successfully |
      | COS_46_RIC2 |               |                | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Hours Application"
    And Update Alert Configuration "Short Leave/Official Hours Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Short Leave/Official Hours Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_46_u1 |
      | COS_46_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_46_u1 |
      | COS_46_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_46_u1 |          0 |     090000 |
      | COS_46_u1 |          0 |     170000 |
      | COS_46_u2 |          0 |     090000 |
      | COS_46_u2 |          0 |     170000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | spfid2 | reason-2   | appliedBy |
      | COS_46_u1 |               0 |      1 | p2official | COS_46_u1 |
      | COS_46_u2 |               0 |      1 | p2official | COS_46_u2 |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | Authorization-for | Verdict | remark           | ricID       |
      | COS_46_u1 |               0 |                 1 |       1 | OfficialApproved | COS_46_RIC1 |
      | COS_46_u2 |               0 |                 1 |       1 | OfficialApproved | COS_46_RIC2 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_46_u1   |   4610000001 | cos461@gmail.com    |        1 |          1 |             1 |
      | COS_46_RIC1 |   4610000011 | cos46ric1@gmail.com |        1 |          1 |             1 |
      | COS_46_u2   |   4620000001 | cos462@gmail.com    |        0 |          0 |             0 |
      | COS_46_RIC2 |   4620000011 | cos46ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_23
  Scenario: Alert Group Wise - T&A - Official Hours Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_47_u1 |
      | COS_47_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   4710000001 | cos471@gmail.com |
      |   4720000001 | cos472@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_47_u1 | COS_47_u1 |               1 |         1 |               1 |                  1 |    4710000001 | cos471@gmail.com |
      | COS_47_u2 | COS_47_u2 |               1 |         1 |               1 |                  1 |    4720000001 | cos472@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_47_u1 |                          1 | admin        |    1 |
      | COS_47_u2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Attendance Policy
      | PlcName      | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | AuthReqforatleastoneEventoftheday | validation         |
      | OfficialApp2 |                2 | false         | True                 | true             | true               | false                 | false        | True                              | Saved Successfully |
    And Create user from user configuration
      | userid    | AttendancePlc | Organization | Validation         |
      | COS_47_u1 | OfficialApp2  | AlOrg1       | Saved Successfully |
      | COS_47_u2 | OfficialApp2  | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Short Leave/Official Approval/Rejection"
    And Assign User in Alert "Short Leave/Official Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_47_u1 |
      | COS_47_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_47_u1 |
      | COS_47_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_47_u1 |          0 |     090000 |
      | COS_47_u1 |          0 |     170000 |
      | COS_47_u2 |          0 |     090000 |
      | COS_47_u2 |          0 |     170000 |
    When Generate ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | spfid2 | reason-2   | appliedBy |
      | COS_47_u1 |               0 |      1 | p2official | COS_47_u1 |
      | COS_47_u2 |               0 |      1 | p2official | COS_47_u2 |
    And Approve Reject ShortLeave OfficialInOut Application via API
      | Userid    | Attendance-date | Authorization-for | Verdict | remark           | ricID |
      | COS_47_u1 |               0 |                 1 |       2 | OfficialRejected | SA    |
      | COS_47_u2 |               0 |                 1 |       2 | OfficialRejected | SA    |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_47_u1 |   4710000001 | cos471@gmail.com |        1 |          1 |             1 |
      | COS_47_u2 |   4720000001 | cos472@gmail.com |        0 |          0 |             0 |

  @AlertGrp_24
  Scenario: Alert Group Wise - T&A - Overtime/C-OFF Authorization & Overtime Limit Exceeded - User & Overtime Limit Exceeded - Group Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_48_u1   |
      | COS_48_RIC1 |
      | COS_48_u2   |
      | COS_48_RIC2 |
      | COS_51_u1   |
      | COS_51_RIC1 |
      | COS_51_u2   |
      | COS_51_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   4810000001 | cos481@gmail.com    |
      |   4810000011 | cos48ric1@gmail.com |
      |   5110000001 | cos511@gmail.com    |
      |   5110000011 | cos51ric1@gmail.com |
      |   4820000001 | cos482@gmail.com    |
      |   4820000011 | cos48ric2@gmail.com |
      |   5120000001 | cos512@gmail.com    |
      |   5120000011 | cos51ric2@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name    |
      | AlertOT |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_48_u1   | COS_48_u1   |               1 |         1 |               1 |                  1 |    4810000001 | cos481@gmail.com    |
      | COS_48_RIC1 | COS_48_RIC1 |               1 |         1 |               1 |                  1 |    4810000011 | cos48ric1@gmail.com |
      | COS_51_u1   | COS_51_u1   |               1 |         1 |               1 |                  1 |    5110000001 | cos511@gmail.com    |
      | COS_51_RIC1 | COS_51_RIC1 |               1 |         1 |               1 |                  1 |    5110000011 | cos51ric1@gmail.com |
      | COS_48_u2   | COS_48_u2   |               1 |         1 |               1 |                  1 |    4820000001 | cos482@gmail.com    |
      | COS_48_RIC2 | COS_48_RIC2 |               1 |         1 |               1 |                  1 |    4820000011 | cos48ric2@gmail.com |
      | COS_51_u2   | COS_51_u2   |               1 |         1 |               1 |                  1 |    5120000001 | cos512@gmail.com    |
      | COS_51_RIC2 | COS_51_RIC2 |               1 |         1 |               1 |                  1 |    5120000011 | cos51ric2@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS48RICGrp1     |        1 | COS_48_RIC1 |      |      |      |      | Saved Successfully |
      | COS51RICGrp1     |        1 | COS_51_RIC1 |      |      |      |      | Saved Successfully |
      | COS48RICGrp2     |        1 | COS_48_RIC2 |      |      |      |      | Saved Successfully |
      | COS51RICGrp2     |        1 | COS_51_RIC2 |      |      |      |      | Saved Successfully |
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
      | userid      | OtCoffEligibility | OvertimePlc | ReportingGroup | Organization | Validation         |
      | COS_48_u1   | Both              | AlertOT     | COS48RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_51_u1   | Both              | AlertOT     | COS51RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_48_u2   | Both              | AlertOT     | COS48RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_51_u2   | Both              | AlertOT     | COS51RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_48_RIC1 | Both              |             |                | AlOrg1       | Saved Successfully |
      | COS_51_RIC1 | Both              |             |                | AlOrg1       | Saved Successfully |
      | COS_48_RIC2 | Both              |             |                | AlOrg2       | Saved Successfully |
      | COS_51_RIC2 | Both              |             |                | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_48_u1 |
      | COS_48_u2 |
      | COS_51_u1 |
      | COS_51_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_48_u1 |
      | COS_48_u2 |
      | COS_51_u1 |
      | COS_51_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_48_u1 |          0 |     070000 |
      | COS_48_u1 |          0 |     180000 |
      | COS_51_u1 |          0 |     070000 |
      | COS_51_u1 |          0 |     200000 |
      | COS_48_u2 |          0 |     070000 |
      | COS_48_u2 |          0 |     180000 |
      | COS_51_u2 |          0 |     070000 |
      | COS_51_u2 |          0 |     200000 |
    And Set Alert Configuration "Overtime/C-OFF Authorization"
    And Update Alert Configuration "Overtime/C-OFF Authorization"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime/C-OFF Authorization"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Overtime Limit Exceeded - User"
    And Update Alert Configuration "Overtime Limit Exceeded - User"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime Limit Exceeded - User"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Overtime Limit Exceeded - Group Incharge"
    And Update Alert Configuration "Overtime Limit Exceeded - Group Incharge"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Overtime Limit Exceeded - Group Incharge"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_48_RIC1 |   4810000011 | cos48ric1@gmail.com |        1 |          1 |             1 |
      | COS_51_u1   |   5110000001 | cos511@gmail.com    |        1 |          1 |             1 |
      | COS_51_RIC1 |   5110000011 | cos51ric1@gmail.com |        2 |          2 |             2 |
      | COS_48_RIC2 |   4820000011 | cos48ric2@gmail.com |        0 |          0 |             0 |
      | COS_51_u2   |   5120000001 | cos512@gmail.com    |        0 |          0 |             0 |
      | COS_51_RIC2 |   5120000011 | cos51ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_25
  Scenario: Alert Group Wise - T&A - Shift Change & Shift Change Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_49_u1   |
      | COS_49_u2   |
      | COS_49_RIC1 |
      | COS_49_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   4910000001 | cos491@gmail.com    |
      |   4920000001 | cos492@gmail.com    |
      |   4910000011 | cos49ric1@gmail.com |
      |   4920000011 | cos49ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_49_u1   | COS_49_u1   |               1 |         1 |               1 |                  1 |    4910000001 | cos491@gmail.com    |
      | COS_49_u2   | COS_49_u2   |               1 |         1 |               1 |                  1 |    4920000001 | cos492@gmail.com    |
      | COS_49_RIC1 | COS_49_RIC1 |               1 |         1 |               1 |                  1 |    4910000011 | cos49ric1@gmail.com |
      | COS_49_RIC2 | COS_49_RIC2 |               1 |         1 |               1 |                  1 |    4920000011 | cos49ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_49_u1   |                          1 | admin        |    1 |
      | COS_49_u2   |                          1 | admin        |    1 |
      | COS_49_RIC1 |                          1 | admin        |    1 |
      | COS_49_RIC2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
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
      | COS49RICGrp2     |        1 | COS_49_RIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ShiftSchedule | ReportingGroup | Organization | Validation         |
      | COS_49_u1   | ShiftChng     | COS49RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_49_u2   | ShiftChng     | COS49RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_49_RIC1 |               |                | AlOrg1       | Saved Successfully |
      | COS_49_RIC2 |               |                | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_49_u1 |
      | COS_49_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_49_u1 |
      | COS_49_u2 |
    And Set Alert Configuration "Shift Change"
    And Update Alert Configuration "Shift Change"
      | AlertForNormalShift | AlertForFBShift | AlertForRDShift |
      | True                | True            | True            |
    And Assign User in Alert "Shift Change"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Shift Change Application"
    And Update Alert Configuration "Shift Change Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Shift Change Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Get Shift and Change Shift via API for Alert
      | userid    | date-range | shift-id1 | shift-id2 | appliedBy |
      | COS_49_u1 |          0 | S1        | S2        | COS_49_u1 |
      | COS_49_u2 |          0 | S1        | S2        | COS_49_u2 |
    And Shift change approval via API
      | userid    | date-range | approved | remark         | ricID       |
      | COS_49_u1 |          0 |        1 | approvedBtAuto | COS_49_RIC1 |
      | COS_49_u2 |          0 |        1 | approvedBtAuto | COS_49_RIC2 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_49_u1   |   4910000001 | cos491@gmail.com    |        1 |          1 |             1 |
      | COS_49_u2   |   4920000001 | cos492@gmail.com    |        0 |          0 |             0 |
      | COS_49_RIC1 |   4910000011 | cos49ric1@gmail.com |        1 |          1 |             1 |
      | COS_49_RIC2 |   4920000011 | cos49ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_26
  Scenario: Alert Group Wise - T&A - Event Authorization
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_50_u1   |
      | COS_50_RIC1 |
      | COS_50_u2   |
      | COS_50_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   5100000001 | cos501@gmail.com    |
      |   5100000011 | cos50ric1@gmail.com |
      |   5200000001 | cos502@gmail.com    |
      |   5200000011 | cos50ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_50_u1   | COS_50_u1   |               1 |         1 |               1 |                  1 |    5100000001 | cos501@gmail.com    |
      | COS_50_RIC1 | COS_50_RIC1 |               1 |         1 |               1 |                  1 |    5100000011 | cos50ric1@gmail.com |
      | COS_50_u2   | COS_50_u2   |               1 |         1 |               1 |                  1 |    5200000001 | cos502@gmail.com    |
      | COS_50_RIC2 | COS_50_RIC2 |               1 |         1 |               1 |                  1 |    5200000011 | cos50ric2@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS50RICGrp1     |        1 | COS_50_RIC1 |      |      |      |      | Saved Successfully |
      | COS50RICGrp2     |        1 | COS_50_RIC2 |      |      |      |      | Saved Successfully |
    And Create Attendance Policy
      | PlcName   | MaxPunchesToCons | ShrtLvAuthReq | AddShrtLvHrsInWrkHrs | OffiInOutAuthReq | AddOffiHrsInWrkHrs | ClubShrtLvOffiWithBrk | EventAuthReq | EventSource | AuthReqforatleastoneEventoftheday | validation         |
      | EventAuth |                2 | false         | True                 | False            | true               | false                 | true         | All         | True                              | Saved Successfully |
    And Create user from user configuration
      | userid      | AttendancePlc | ReportingGroup | Organization | Validation         |
      | COS_50_u1   | EventAuth     | COS50RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_50_u2   | EventAuth     | COS50RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_50_RIC1 |               |                | AlOrg1       | Saved Successfully |
      | COS_50_RIC2 |               |                | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_50_u1 |
      | COS_50_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_50_u1 |
      | COS_50_u2 |
    And Set Alert Configuration "Event Authorization"
    And Update Alert Configuration "Event Authorization"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Event Authorization"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_50_u1 |          0 |     090000 |
      | COS_50_u2 |          0 |     090000 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_50_RIC1 |   5100000011 | cos50ric1@gmail.com |        1 |          1 |             1 |
      | COS_50_RIC2 |   5200000011 | cos50ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_27
  Scenario: Alert Group Wise - T&A - Advance Overtime Application & Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_52_u1   |
      | COS_52_RIC1 |
      | COS_52_u2   |
      | COS_52_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   5210000001 | cos521@gmail.com    |
      |   5210000011 | cos52ric1@gmail.com |
      |   5220000001 | cos522@gmail.com    |
      |   5220000011 | cos52ric2@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name      |
      | AdvOTApp1 |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_52_u1   | COS_52_u1   |               1 |         1 |               1 |                  1 |    5210000001 | cos521@gmail.com    |
      | COS_52_RIC1 | COS_52_RIC1 |               1 |         1 |               1 |                  1 |    5210000011 | cos52ric1@gmail.com |
      | COS_52_u2   | COS_52_u2   |               1 |         1 |               1 |                  1 |    5220000001 | cos522@gmail.com    |
      | COS_52_RIC2 | COS_52_RIC2 |               1 |         1 |               1 |                  1 |    5220000011 | cos52ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_52_u1   |                          1 | admin        |    1 |
      | COS_52_RIC1 |                          1 | admin        |    1 |
      | COS_52_u2   |                          1 | admin        |    1 |
      | COS_52_RIC2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS52RICGrp1     |        1 | COS_52_RIC1 |      |      |      |      | Saved Successfully |
      | COS52RICGrp2     |        1 | COS_52_RIC2 |      |      |      |      | Saved Successfully |
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
      | userid      | OtCoffEligibility | OvertimePlc | ReportingGroup | Organization | Validation         |
      | COS_52_u1   | Both              | AdvOTApp1   | COS52RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_52_u2   | Both              | AdvOTApp1   | COS52RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_52_RIC1 | Both              |             |                | AlOrg1       | Saved Successfully |
      | COS_52_RIC2 | Both              |             |                | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_52_u1 |
      | COS_52_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_52_u1 |
      | COS_52_u2 |
    And Set Alert Configuration "Advance Overtime Application"
    And Update Alert Configuration "Advance Overtime Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Advance Overtime Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Advance Overtime Approval/Rejection"
    And Assign User in Alert "Advance Overtime Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate Advance Overtime Application via API
      | userid    | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | COS_52_u1 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52_u1 |
      | COS_52_u2 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_52_u2 |
    And Approve Reject Advance Overtime Application via API
      | approved | ot-hours | remark        | ricID       | userid    | OT-date |
      |        1 |     0200 | AdvOTApproved | COS_52_RIC1 | COS_52_u1 |       1 |
      |        1 |     0200 | AdvOTApproved | COS_52_RIC2 | COS_52_u2 |       1 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_52_u1   |   5210000001 | cos521@gmail.com    |        1 |          1 |             1 |
      | COS_52_RIC1 |   5210000011 | cos52ric1@gmail.com |        1 |          1 |             1 |
      | COS_52_u2   |   5220000001 | cos522@gmail.com    |        0 |          0 |             0 |
      | COS_52_RIC2 |   5220000011 | cos52ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_28
  Scenario: Alert Group Wise - T&A - Advance Overtime Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_53_u1 |
      | COS_53_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   5310000001 | cos531@gmail.com |
      |   5320000001 | cos532@gmail.com |
    And Delete Overtime Policy from TnA module
      | Name      |
      | AdvOTApp2 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_53_u1 | COS_53_u1 |               1 |         1 |               1 |                  1 |    5310000001 | cos531@gmail.com |
      | COS_53_u2 | COS_53_u2 |               1 |         1 |               1 |                  1 |    5320000001 | cos532@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_53_u1 |                          1 | admin        |    1 |
      | COS_53_u2 |                          1 | admin        |    1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create NetWork Hours Policy "AlertNW2"
      | WorkComponent           | RangeFrom | RangeTo | ConsiderAs | MinDurReq | Factor | ApplicableDays |
      | Work Hours Within Shift |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Early-IN                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
      | Overstay                |      0000 |    0800 | Work       |      0000 |    1.0 | Check All      |
    And Create Overtime Policy
      | PlcName   | NetWorkPlcName | EnblOTCal | DailyOT | DailyOTCal | DailyAutoAuthOT | DailyAuthReqForLateIN | validation         |
      | AdvOTApp2 | AlertNW2       | True      | ALL     | Daily 1    | false           | true                  | Saved Successfully |
    And Overtime Calculation Daily1 Work Component Configuration In Overtime Policy "AdvOTApp2"
      | WorkComponent | RangeFrom | RangeTo | MinDurReq | ConsiderAs | Factor | ApplicableDays |
      | Early-IN      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
      | Overstay      |      0000 |    0800 |      0000 | OT1        |   1.00 | Check All      |
    And Create user from user configuration
      | userid    | OtCoffEligibility | OvertimePlc | Organization | Validation         |
      | COS_53_u1 | Both              | AdvOTApp2   | AlOrg1       | Saved Successfully |
      | COS_53_u2 | Both              | AdvOTApp2   | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_53_u1 |
      | COS_53_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_53_u1 |
      | COS_53_u2 |
    And Set Alert Configuration "Advance Overtime Approval/Rejection"
    And Assign User in Alert "Advance Overtime Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate Advance Overtime Application via API
      | userid    | OT-date | ot-hours | reason        | Address  | contact       | appliedBy |
      | COS_53_u1 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_53_u1 |
      | COS_53_u2 |       1 |     0200 | OTApplication | Junagadh | +919687295144 | COS_53_u2 |
    And Approve Reject Advance Overtime Application via API
      | approved | ot-hours | remark        | ricID | userid    | OT-date |
      |        1 |     0200 | AdvOTRejected | SA    | COS_53_u1 |       1 |
      |        1 |     0200 | AdvOTRejected | SA    | COS_53_u2 |       1 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_53_u1 |   5310000001 | cos531@gmail.com |        1 |          1 |             1 |
      | COS_53_u2 |   5320000001 | cos532@gmail.com |        0 |          0 |             0 |

  @AlertGrp_40
  Scenario: Alert Group Wise - T&A - Attendance Exception
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_54_u1   |
      | COS_54_u2   |
      | COS_54_RIC1 |
      | COS_54_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   5410000001 | cos541@gmail.com    |
      |   5420000001 | cos542@gmail.com    |
      |   5410000011 | cos54ric1@gmail.com |
      |   5420000011 | cos54ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_54_u1   | COS_54_u1   |               1 |         1 |               1 |                  1 |    5410000001 | cos541@gmail.com    |
      | COS_54_u2   | COS_54_u2   |               1 |         1 |               1 |                  1 |    5420000001 | cos542@gmail.com    |
      | COS_54_RIC1 | COS_54_RIC1 |               1 |         1 |               1 |                  1 |    5410000011 | cos54ric1@gmail.com |
      | COS_54_RIC2 | COS_54_RIC2 |               1 |         1 |               1 |                  1 |    5420000011 | cos54ric2@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS54RICGrp1     |        1 | COS_54_RIC1 |      |      |      |      | Saved Successfully |
      | COS54RICGrp2     |        1 | COS_54_RIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | Organization | Validation         |
      | COS_54_u1 | COS54RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_54_u2 | COS54RICGrp2   | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
      | COS_54_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_54_u1 |
      | COS_54_u2 |
    And Update Alert Configuration "Attendance Exception"
      | SendAlertAsPer      | ScheduleTime |
      | Daily-Schedule Time |            2 |
    And Set Alert Configuration "Attendance Exception"
    And Set Send Alert to parameters for "Attendance Exception" Alert
    And Assign User in Alert "Attendance Exception"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_54_u1   |   5410000001 | cos541@gmail.com    |        1 |          1 |             1 |
      | COS_54_u2   |   5420000001 | cos542@gmail.com    |        0 |          0 |             0 |
      | COS_54_RIC1 |   5410000011 | cos54ric1@gmail.com |        1 |          1 |             1 |
      | COS_54_RIC2 |   5420000011 | cos54ric2@gmail.com |        0 |          0 |             0 |

  @VMMGrp16
  Scenario: Visitor Pre-registration Approval/Rejection - Group Wise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_86_u1   |
      | COS_86_u2   |
      | COS_86_RIC1 |
      | COS_86_RIC2 |
    And Delete visitor via API
      | mobilenumber |
      |   8610000011 |
      |   8620000011 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   8610000021 | cos86ric1@gmail.com |
      |   8620000021 | cos86ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email      |
      | COS_86_u1   | COS_86_u1   |               1 |         1 |               1 |                  1 |                    1 |    8610000001 | cos861@gmail.com    |
      | COS_86_u2   | COS_86_u2   |               1 |         1 |               1 |                  1 |                    1 |    8620000001 | cos862@gmail.com    |
      | COS_86_RIC1 | COS_86_RIC1 |               1 |         1 |               1 |                  1 |                    1 |    8610000021 | cos86ric1@gmail.com |
      | COS_86_RIC2 | COS_86_RIC2 |               1 |         1 |               1 |                  1 |                    1 |    8620000021 | cos86ric2@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS86RICGrp1     |        1 | COS_86_RIC1 |      |      |      |      | Saved Successfully |
      | COS86RICGrp2     |        1 | COS_86_RIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | Organization | Validation         |
      | COS_86_u1   | COS86RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_86_u2   | COS86RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_86_RIC1 |                | AlOrg1       | Saved Successfully |
      | COS_86_RIC2 |                | AlOrg2       | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration |
      | Always                        |
    And Set Alert Configuration "Visitor Pre-registration Approval/Rejection"
    And Update Alert Configuration "Visitor Pre-registration Approval/Rejection"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Visitor Pre-registration Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_86_u1 |                          1 | admin        |    1 |
      | COS_86_u2 |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                | host-id   | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |             10 | VIS_861      | Matrix            | 8610000011 | visitor861@gmail.com | COS_86_u1 | COS_86_u1 | Default Location   |
      |         0 |          0 |                0 |                1 |             10 | VIS_862      | Matrix            | 8620000011 | visitor862@gmail.com | COS_86_u2 | COS_86_u2 | Default Location   |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_86_RIC1 |   8610000021 | cos86ric1@gmail.com |        1 |          1 |             1 |
      | COS_86_RIC2 |   8620000021 | cos86ric2@gmail.com |        0 |          0 |             0 |
    And Reset "Visitor Management" page to default

  @VMMGrp11
  Scenario: Visitor Arrival - Group Wise
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_81_u1 |
      | COS_81_u2 |
    And Delete visitor via API
      | mobilenumber |
      |   8110000011 |
      |   8120000011 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   8110000001 | cos811@gmail.com |
      |   8120000001 | cos812@gmail.com |
    And create visitor profile via API
      | id        | name      | active |
      | COS_811V1 | COS_811V1 |      1 |
      | COS_812V1 | COS_812V1 |      1 |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user | personal-cell | personal-email   |
      | COS_81_u1 | COS_81_u1 |               1 |         1 |               1 |                  1 |                    1 |    8110000001 | cos811@gmail.com |
      | COS_81_u2 | COS_81_u2 |               1 |         1 |               1 |                  1 |                    1 |    8120000001 | cos812@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | COS_81_u1 | AlOrg1       | Saved Successfully |
      | COS_81_u2 | AlOrg2       | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no  | email                | host-id   | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | VIS_811      | Matrix            | 8110000011 | visitor811@gmail.com | COS_81_u1 | SA        |Default Location   |
      |         0 |          0 |                0 |                1 |              5 | VIS_812      | Matrix            | 8120000011 | visitor812@gmail.com | COS_81_u2 | SA        |Default Location   |
    And Set Alert Configuration "Visitor Arrival"
    And Assign User in Alert "Visitor Arrival"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID    |
      |         0 |            0 | SA        |         0 |       0 | COS_81_u1 |
      |         0 |            0 | SA        |         0 |       0 | COS_81_u2 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_81_u1 |   8110000001 | cos811@gmail.com |        1 |          1 |             1 |
      | COS_81_u2 |   8120000001 | cos812@gmail.com |        0 |          0 |             0 |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID    |
      |         0 |            5 | SA        |         0 |       0 | COS_81_u1 |
      |         0 |            5 | SA        |         0 |       0 | COS_81_u2 |

  @AlertGrp_15
  Scenario: Alert Group Wise - System - APTA Auto Sign-In Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID     |
      | COS_27_u1  |
      | COS_27_u2  |
      | COS_271_u1 |
      | COS_271_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email             |
      |   2701000001 | cos271@gmail.com  |
      |   2702000001 | cos272@gmail.com  |
      |   2711000001 | cos2711@gmail.com |
      |   2712000001 | cos2712@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_27_u1 | COS_27_u1 |               1 |         1 |               1 |                  1 |    2701000001 | cos271@gmail.com |
      | COS_27_u2 | COS_27_u2 |               1 |         1 |               1 |                  1 |    2702000001 | cos272@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | COS_27_u1 | AlOrg1       | Saved Successfully |
      | COS_27_u2 | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "APTA Auto Sign-In Configuration"
    When Send Alert APTA Auto Sign-In Configuration from Alert Configuration
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Create User via api
      | Id         | name       | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email    |
      | COS_271_u1 | COS_271_u1 |               1 |         1 |               1 |                  1 |    2711000001 | cos2711@gmail.com |
      | COS_271_u2 | COS_271_u2 |               1 |         1 |               1 |                  1 |    2712000001 | cos2712@gmail.com |
    Then Validate SMS and Email Alert for Users
      | userid     | mobilenumber | Email             | SMSCount | EmailCount | WhatsappCount |
      | COS_27_u1  |   2701000001 | cos271@gmail.com  |        1 |          1 |             1 |
      | COS_271_u1 |   2711000001 | cos2711@gmail.com |        1 |          1 |             1 |
      | COS_27_u2  |   2702000001 | cos272@gmail.com  |        0 |          0 |             0 |
      | COS_271_u2 |   2712000001 | cos2712@gmail.com |        1 |          1 |             1 |

  @AlertGrp_13
  Scenario: Alert Group Wise - System - Pending Applications For Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_25_u1   |
      | COS_25_u2   |
      | COS_25_RIC1 |
      | COS_25_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   2510000001 | cos251@gmail.com    |
      |   2520000001 | cos252@gmail.com    |
      |   2510000011 | cos25ric1@gmail.com |
      |   2520000011 | cos25ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_25_u1   | COS_25_u1   |               1 |         1 |               1 |                  1 |    2510000001 | cos251@gmail.com    |
      | COS_25_u2   | COS_25_u2   |               1 |         1 |               1 |                  1 |    2520000001 | cos252@gmail.com    |
      | COS_25_RIC1 | COS_25_RIC1 |               1 |         1 |               1 |                  1 |    2510000011 | cos25ric1@gmail.com |
      | COS_25_RIC2 | COS_25_RIC2 |               1 |         1 |               1 |                  1 |    2520000011 | cos25ric2@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS25RICGrp1     |        1 | COS_25_RIC1 |      |      |      |      | Saved Successfully |
      | COS25RICGrp2     |        1 | COS_25_RIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | Organization | Validation         |
      | COS_25_u1   | COS25RICGrp1   | AlOrg1       | Saved Successfully |
      | COS_25_u2   | COS25RICGrp2   | AlOrg2       | Saved Successfully |
      | COS_25_RIC1 |                | AlOrg1       | Saved Successfully |
      | COS_25_RIC2 |                | AlOrg2       | Saved Successfully |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_25_u1 |                          1 | admin        |    1 |
      | COS_25_u2 |                          1 | admin        |    1 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_25_u1 |
      | COS_25_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_25_u1 |
      | COS_25_u2 |
    And Set Alert Configuration "Pending Applications For Approval"
    And Update Alert Configuration "Pending Applications For Approval"
      | SetReminder | ReminderTime |
      | Daily       |            2 |
    And Assign User in Alert "Pending Applications For Approval"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate Attendance Correction Application via API
      | userid    | process-date | punch1-datetime | punch2-datetime | Shift | appliedBy |
      | COS_25_u1 |            0 |            0900 |            1800 | GS    | COS_25_u1 |
      | COS_25_u2 |            0 |            0900 |            1800 | GS    | COS_25_u2 |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   2510000001 | cos251@gmail.com    |
      |   2520000001 | cos252@gmail.com    |
      |   2510000011 | cos25ric1@gmail.com |
      |   2520000011 | cos25ric2@gmail.com |
    And Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_25_RIC1 |   2510000011 | cos25ric1@gmail.com |        1 |          1 |             1 |
      | COS_25_RIC2 |   2520000011 | cos25ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_9
  Scenario: Alert Group Wise - System - Database Backup
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_21_u1 |
      | COS_21_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   2110000001 | cos211@gmail.com |
      |   2120000001 | cos212@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_21_u1 | COS_21_u1 |               1 |         1 |               1 |                  1 |    2110000001 | cos211@gmail.com |
      | COS_21_u2 | COS_21_u2 |               1 |         1 |               1 |                  1 |    2120000001 | cos212@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | Organization | Validation         |
      | COS_21_u1 | AlOrg1       | Saved Successfully |
      | COS_21_u2 | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Database Backup"
    And Assign User in Alert "Database Backup"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Create Task scheduler "Database Backup"
      | SchedulerName | RunSchedule | EveryDayOfTheMonth | ScheduleRunTime |
      | DBBackup      | Monthly     |                  0 |               0 |
    And Wait for "1" min
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_21_u1 |   2110000001 | cos211@gmail.com |        1 |          1 |             1 |
      | COS_21_u2 |   2120000001 | cos212@gmail.com |        0 |          0 |             0 |
    And Delete Task Scheduler
      | SchedulerName |
      | DBBackup      |

  #############Leave Started###########
  @AlertGrp_32
  Scenario: Alert Group Wise - Leave - Leave Application & Leave Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_32_u1   |
      | COS_32_u2   |
      | COS_32_RIC1 |
      | COS_32_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   3210000001 | cos321@gmail.com    |
      |   3220000001 | cos322@gmail.com    |
      |   3210000011 | cos32ric1@gmail.com |
      |   3220000011 | cos32ric2@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | COS_32_u1   | COS_32_u1   |               1 |         1 |               1 |                  1 |    3210000001 | cos321@gmail.com    |
      | COS_32_u2   | COS_32_u2   |               1 |         1 |               1 |                  1 |    3220000001 | cos322@gmail.com    |
      | COS_32_RIC1 | COS_32_RIC1 |               1 |         1 |               1 |                  1 |    3210000011 | cos32ric1@gmail.com |
      | COS_32_RIC2 | COS_32_RIC2 |               1 |         1 |               1 |                  1 |    3220000011 | cos32ric2@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_32_u1   |                          1 | admin        |    1 |
      | COS_32_u2   |                          1 | admin        |    1 |
      | COS_32_RIC1 |                          1 | admin        |    1 |
      | COS_32_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS32RICGrp1     | AnyOne     | COS_32_RIC1 |      |      |      |      | Saved Successfully |
      | COS32RICGrp2     | AnyOne     | COS_32_RIC2 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_32_u1   | COS32RICGrp1   | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_32_u2   | COS32RICGrp2   | AlertLeaveGrp | AlOrg2       | Saved Successfully |
      | COS_32_RIC1 |                |               | AlOrg1       | Saved Successfully |
      | COS_32_RIC2 |                |               | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_32_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_32_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Application"
    And Update Alert Configuration "Leave Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Leave Approval"
    And Assign User in Alert "Leave Approval"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_32_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_32_u1 |
      | COS_32_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_32_u2 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | COS_32_RIC1 | COS_32_u1 |          0 |        0 |
      |        1 | ApprovedRequest | COS_32_RIC2 | COS_32_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | COS_32_u1   |   3210000001 | cos321@gmail.com    |        1 |          1 |             1 |
      | COS_32_RIC1 |   3210000011 | cos32ric1@gmail.com |        1 |          1 |             1 |
      | COS_32_u2   |   3220000001 | cos322@gmail.com    |        0 |          0 |             0 |
      | COS_32_RIC2 |   3220000011 | cos32ric2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_33
  Scenario: Alert Group Wise - Leave - Leave Credit/Debit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_31_u1 |
      | COS_31_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   3110000001 | cos311@gmail.com |
      |   3120000001 | cos312@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_31_u1 | COS_31_u1 |               1 |         1 |               1 |                  1 |    3110000001 | cos311@gmail.com |
      | COS_31_u2 | COS_31_u2 |               1 |         1 |               1 |                  1 |    3120000001 | cos312@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_31_u1 |                          1 | admin        |    1 |
      | COS_31_u2 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_31_u1 |                | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_31_u2 |                | AlertLeaveGrp | AlOrg2       | Saved Successfully |
    And Set Alert Configuration "Leave Credit/Debit"
    And Update Alert Configuration "Leave Credit/Debit"
      | AlertReportingInCharge |
      | True                   |
    And Assign User in Alert "Leave Credit/Debit"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_31_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_31_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_31_u1 |   3110000001 | cos311@gmail.com |        1 |          1 |             1 |
      | COS_31_u2 |   3120000001 | cos312@gmail.com |        0 |          0 |             0 |

  @AlertGrp_34
  Scenario: Alert Group Wise - Leave - Leave Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_33_u1 |
      | COS_33_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   3310000001 | cos331@gmail.com |
      |   3320000001 | cos332@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_33_u1 | COS_33_u1 |               1 |         1 |               1 |                  1 |    3310000001 | cos331@gmail.com |
      | COS_33_u2 | COS_33_u2 |               1 |         1 |               1 |                  1 |    3320000001 | cos332@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_33_u1 |                          1 | admin        |    1 |
      | COS_33_u2 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_33_u1 |                | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_33_u2 |                | AlertLeaveGrp | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_33_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_33_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Rejection"
    And Assign User in Alert "Leave Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_33_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_33_u1 |
      | COS_33_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_33_u2 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid    | Start-date | end-date |
      |        2 | RejectedRequest | SA    | COS_33_u1 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_33_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_33_u1 |   3310000001 | cos331@gmail.com |        1 |          1 |             1 |
      | COS_33_u1 |   3320000001 | cos332@gmail.com |        0 |          0 |             0 |

  @AlertGrp_35
  Scenario: Alert Group Wise - Leave - Leave Modification Application & Leave Modification Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_34_u1   |
      | COS_34_u2   |
      | COS_34_RIC1 |
      | COS_34_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   3410000001 | cos341@gmail.com     |
      |   3420000001 | cos342@gmail.com     |
      |   3410000011 | cos34ric11@gmail.com |
      |   3420000011 | cos34ric12@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      | COS_34_u1   | COS_34_u1   |               1 |         1 |               1 |                  1 |    3410000001 | cos341@gmail.com     |
      | COS_34_u2   | COS_34_u2   |               1 |         1 |               1 |                  1 |    3420000001 | cos342@gmail.com     |
      | COS_34_RIC1 | COS_34_RIC1 |               1 |         1 |               1 |                  1 |    3410000011 | cos34ric11@gmail.com |
      | COS_34_RIC2 | COS_34_RIC2 |               1 |         1 |               1 |                  1 |    3420000011 | cos34ric12@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_34_u1   |                          1 | admin        |    1 |
      | COS_34_u2   |                          1 | admin        |    1 |
      | COS_34_RIC1 |                          1 | admin        |    1 |
      | COS_34_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS34RICGrp1     | AnyOne     | COS_34_RIC1 |      |      |      |      | Saved Successfully |
      | COS34RICGrp2     | AnyOne     | COS_34_RIC2 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_34_u1   | COS34RICGrp1   | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_34_u2   | COS34RICGrp2   | AlertLeaveGrp | AlOrg2       | Saved Successfully |
      | COS_34_RIC1 |                |               | AlOrg1       | Saved Successfully |
      | COS_34_RIC2 |                |               | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_34_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_34_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Modification Application"
    And Update Alert Configuration "Leave Modification Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Modification Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_34_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_34_u1 |
      | COS_34_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_34_u2 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | COS_34_RIC1 | COS_34_u1 |          0 |        0 |
      |        1 | ApprovedRequest | COS_34_RIC2 | COS_34_u2 |          0 |        0 |
    When Apply Leave "Modification" Application via API
      | userid    | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_34_u1 |            1 |                  1 |         -1 |       -1 | COS_34_u1 |            0 |          0 |
      | COS_34_u2 |            1 |                  1 |         -1 |       -1 | COS_34_u2 |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark           | ricID       | userid    | Start-date | end-date |
      |        1 | ApprovedModified | COS_34_RIC1 | COS_34_u1 |          0 |        0 |
      |        1 | ApprovedModified | COS_34_RIC2 | COS_34_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_34_u1   |   3410000001 | cos341@gmail.com     |        1 |          1 |             1 |
      | COS_34_RIC1 |   3410000011 | cos34ric11@gmail.com |        1 |          1 |             1 |
      | COS_34_u2   |   3420000001 | cos342@gmail.com     |        0 |          0 |             0 |
      | COS_34_RIC2 |   3420000011 | cos34ric12@gmail.com |        0 |          0 |             0 |

  @AlertGrp_36
  Scenario: Alert Group Wise - Leave - Leave Modification Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_35_u1 |
      | COS_35_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   3510000001 | cos351@gmail.com |
      |   3520000001 | cos352@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_35_u1 | COS_35_u1 |               1 |         1 |               1 |                  1 |    3510000001 | cos351@gmail.com |
      | COS_35_u2 | COS_35_u2 |               1 |         1 |               1 |                  1 |    3520000001 | cos352@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_35_u1 |                          1 | admin        |    1 |
      | COS_35_u2 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_35_u1 |                | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_35_u2 |                | AlertLeaveGrp | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_35_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_35_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Modification Approval/Rejection"
    And Assign User in Alert "Leave Modification Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_35_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_35_u1 |
      | COS_35_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_35_u2 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_35_u1 |          0 |        0 |
      |        1 | ApprovedRequest | SA    | COS_35_u2 |          0 |        0 |
    And Apply Leave "Modification" Application via API
      | userid    | request-type | half-consideration | Start-date | end-date | appliedBy | OldStartdate | OldEnddate |
      | COS_35_u1 |            1 |                  1 |         -1 |       -1 | COS_35_u1 |            0 |          0 |
      | COS_35_u2 |            1 |                  1 |         -1 |       -1 | COS_35_u2 |            0 |          0 |
    When Approve Reject Leave Application via API
      | approved | remark           | ricID | userid    | Start-date | end-date |
      |        2 | RejectedModified | SA    | COS_35_u1 |          0 |        0 |
      |        2 | RejectedModified | SA    | COS_35_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_35_u1 |   3510000001 | cos351@gmail.com |        1 |          1 |             1 |
      | COS_35_u2 |   3520000001 | cos352@gmail.com |        0 |          0 |             0 |

  @AlertGrp_37
  Scenario: Alert Group Wise - Leave - Leave Cancellation Application & Leave Cancellation Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_36_u1   |
      | COS_36_u2   |
      | COS_36_RIC1 |
      | COS_36_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   3610000001 | cos361@gmail.com     |
      |   3620000001 | cos362@gmail.com     |
      |   3610000011 | cos36ric11@gmail.com |
      |   3620000011 | cos36ric12@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      | COS_36_u1   | COS_36_u1   |               1 |         1 |               1 |                  1 |    3610000001 | cos361@gmail.com     |
      | COS_36_u2   | COS_36_u1   |               1 |         1 |               1 |                  1 |    3620000001 | cos362@gmail.com     |
      | COS_36_RIC1 | COS_36_RIC1 |               1 |         1 |               1 |                  1 |    3610000011 | cos36ric11@gmail.com |
      | COS_36_RIC2 | COS_36_RIC2 |               1 |         1 |               1 |                  1 |    3620000011 | cos36ric12@gmail.com |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_36_u1   |                          1 | admin        |    1 |
      | COS_36_u2   |                          1 | admin        |    1 |
      | COS_36_RIC1 |                          1 | admin        |    1 |
      | COS_36_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS36RICGrp1     | AnyOne     | COS_36_RIC1 |      |      |      |      | Saved Successfully |
      | COS36RICGrp2     | AnyOne     | COS_36_RIC2 |      |      |      |      | Saved Successfully |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_36_u1   | COS36RICGrp1   | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_36_u2   | COS36RICGrp2   | AlertLeaveGrp | AlOrg2       | Saved Successfully |
      | COS_36_RIC1 |                |               | AlOrg1       | Saved Successfully |
      | COS_36_RIC2 |                |               | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_36_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_36_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Cancellation Application"
    And Update Alert Configuration "Leave Cancellation Application"
      | ApprovalLinks | ApprovalAcknowledgment | IncludeAttachment |
      | True          | True                   | True              |
    And Assign User in Alert "Leave Cancellation Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_36_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_36_u1 |
      | COS_36_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_36_u2 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID       | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | COS_36_RIC1 | COS_36_u1 |          0 |        0 |
      |        1 | ApprovedRequest | COS_36_RIC2 | COS_36_u2 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid    | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_36_u1 |            2 | COS_36_u1 |            0 |          0 |
      | COS_36_u2 |            2 | COS_36_u2 |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID       | userid    | Start-date | end-date |
      |        1 | ApprovedCancelled | COS_36_RIC1 | COS_36_u1 |          0 |        0 |
      |        1 | ApprovedCancelled | COS_36_RIC2 | COS_36_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_36_u1   |   3610000001 | cos361@gmail.com     |        1 |          1 |             1 |
      | COS_36_RIC1 |   3610000011 | cos36ric11@gmail.com |        1 |          1 |             1 |
      | COS_36_u2   |   3620000001 | cos362@gmail.com     |        0 |          0 |             0 |
      | COS_36_RIC2 |   3620000011 | cos36ric12@gmail.com |        0 |          0 |             0 |

  @AlertGrp_38
  Scenario: Alert Group Wise - Leave - Leave Cancellation Rejection
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_37_u1 |
      | COS_37_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   3710000001 | cos371@gmail.com |
      |   3720000001 | cos372@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_37_u1 | COS_37_u1 |               1 |         1 |               1 |                  1 |    3710000001 | cos371@gmail.com |
      | COS_37_u2 | COS_37_u2 |               1 |         1 |               1 |                  1 |    3720000001 | cos372@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_37_u1 |                          1 | admin        |    1 |
      | COS_37_u2 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_37_u1 |                | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_37_u2 |                | AlertLeaveGrp | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_37_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_37_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Cancellation Approval/Rejection"
    And Assign User in Alert "Leave Cancellation Approval/Rejection"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_37_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_37_u1 |
      | COS_37_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_37_u2 |
    And Approve Reject Leave Application via API
      | approved | remark          | ricID | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_37_u1 |          0 |        0 |
      |        1 | ApprovedRequest | SA    | COS_37_u2 |          0 |        0 |
    When Apply Leave "Cancellation" Application via API
      | userid    | request-type | appliedBy | OldStartdate | OldEnddate |
      | COS_37_u1 |            2 | COS_37_u1 |            0 |          0 |
      | COS_37_u2 |            2 | COS_37_u2 |            0 |          0 |
    And Approve Reject Leave Application via API
      | approved | remark            | ricID | userid    | Start-date | end-date |
      |        2 | RejectedCancelled | SA    | COS_37_u1 |          0 |        0 |
      |        2 | RejectedCancelled | SA    | COS_37_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_37_u1 |   3710000001 | cos371@gmail.com |        1 |          1 |             1 |
      | COS_37_u2 |   3720000001 | cos372@gmail.com |        0 |          0 |             0 |

  @AlertGrp_39
  Scenario: Alert Group Wise - Leave - Leave Status Update
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_38_u1 |
      | COS_38_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   3810000001 | cos381@gmail.com |
      |   3820000001 | cos382@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_38_u1 | COS_38_u1 |               1 |         1 |               1 |                  1 |    3810000001 | cos381@gmail.com |
      | COS_38_u2 | COS_38_u2 |               1 |         1 |               1 |                  1 |    3820000001 | cos382@gmail.com |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_38_u1 |                          1 | admin        |    1 |
      | COS_38_u2 |                          1 | admin        |    1 |
    And Create Leave
      | LeaveID | LeaveName | LeaveType  | MinAlwAtATime | MaxAlwLimit | MaxAllLimitFor | MinAlwDur | MaxAlwDurPerApp | MaxAlwDurPerDay | Validation         |
      | MV      | Alert     | Paid Leave |           0.0 |        99.0 | Single App     |           |                 |                 | Saved Successfully |
    And Create Leave Group "AlertLeaveGrp" with Pro-rata "False"
      | LeaveID |
      | MV      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup    | Organization | Validation         |
      | COS_38_u1 |                | AlertLeaveGrp | AlOrg1       | Saved Successfully |
      | COS_38_u2 |                | AlertLeaveGrp | AlOrg2       | Saved Successfully |
    And Credit_Debit_Encash Leave via API
      | userid    | entry-type | credit-mode | encashment-type | encashment-mode | days | c-offhrs     | accrual-policy | leave-code | period | month | year | pro-rata | remark | hours  |
      | COS_38_u1 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
      | COS_38_u2 |          0 |           0 |                 |                 |   10 | 140720230200 |              1 | MV         |        |       |      |          | credit | 002:00 |
    And Set Alert Configuration "Leave Status Update"
    And Assign User in Alert "Leave Status Update"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Apply Leave Application via API
      | userid    | half-consideration | Start-date | end-date | leave-code | return-transaction-id | appliedBy |
      | COS_38_u1 |                  1 |          0 |        0 | MV         |                     1 | COS_38_u1 |
      | COS_38_u2 |                  1 |          0 |        0 | MV         |                     1 | COS_38_u2 |
    When Approve Reject Leave Application via API
      | approved | remark          | ricID | userid    | Start-date | end-date |
      |        1 | ApprovedRequest | SA    | COS_38_u1 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_38_u1 |          0 |        0 |
      |        1 | ApprovedRequest | SA    | COS_38_u2 |          0 |        0 |
      |        2 | RejectedRequest | SA    | COS_38_u2 |          0 |        0 |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_38_u1 |   3810000001 | cos381@gmail.com |        1 |          1 |             1 |
      | COS_38_u2 |   3820000001 | cos382@gmail.com |        0 |          0 |             0 |

  #########User Started################
  #Issue
  @AlertGrp_40
  Scenario: Alert Group Wise - User - User Events - Event Selection = First
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID   |
      | COS_1_u1 |
      | COS_1_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   1100000001 | cos11@gmail.com |
      |   1200000001 | cos12@gmail.com |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_1_u1 | COS_1_u1 |               1 |         1 |               1 |                  1 |    1100000001 | cos11@gmail.com |
      | COS_1_u2 | COS_1_u2 |               1 |         1 |               1 |                  1 |    1200000001 | cos12@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid   | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_1_u1 |                |            | AlOrg1       | Saved Successfully |
      | COS_1_u2 |                |            | AlOrg2       | Saved Successfully |
    And Assign users to device from API
      | Userid   |
      | COS_1_u1 |
      | COS_1_u2 |
    And Set Alert Configuration "User Events"
    And Update Alert Configuration "User Events"
      | EventSelection |
      | First          |
    And Assign User in Alert "User Events"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate User Event "2" times for User via API
      | UserID   |
      | COS_1_u1 |
      | COS_1_u2 |
    Then Validate SMS and Email Alert for Users
      | userid   | mobilenumber | Email           | SMSCount | EmailCount | WhatsappCount |
      | COS_1_u1 |   1100000001 | cos11@gmail.com |        1 |          1 |             1 |
      | COS_1_u2 |   1200000001 | cos12@gmail.com |        0 |          0 |             0 |

  @AlertGrp_41
  Scenario: Alert Group Wise - User - User Events - Event Selection = All
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID   |
      | COS_2_u1 |
      | COS_2_u2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email           |
      |   2100000001 | cos21@gmail.com |
      |   2200000001 | cos22@gmail.com |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email  |
      | COS_2_u1 | COS_2_u1 |               1 |         1 |               1 |                  1 |    2100000001 | cos21@gmail.com |
      | COS_2_u2 | COS_2_u2 |               1 |         1 |               1 |                  1 |    2200000001 | cos22@gmail.com |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid   | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_2_u1 |                |            | AlOrg1       | Saved Successfully |
      | COS_2_u2 |                |            | AlOrg2       | Saved Successfully |
    And Assign users to device from API
      | Userid   |
      | COS_2_u1 |
      | COS_2_u2 |
    And Set Alert Configuration "User Events"
    And Update Alert Configuration "User Events"
      | EventSelection |
      | All            |
    And Assign User in Alert "User Events"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate User Event "2" times for User via API
      | UserID   |
      | COS_2_u1 |
      | COS_2_u2 |
    Then Validate SMS and Email Alert for Users
      | userid   | mobilenumber | Email           | SMSCount | EmailCount | WhatsappCount |
      | COS_2_u1 |   2100000001 | cos21@gmail.com |        2 |          2 |             2 |
      | COS_2_u2 |   2200000001 | cos22@gmail.com |        0 |          0 |             0 |

  #Issue
  @AlertGrp_42
  Scenario: Alert Group Wise - User - User Allowed - Alert Sent on within given time period
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID       |
      | COS_7_u1     |
      | COS_7_Alert1 |
      | COS_7_u2     |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   7100000011 | cos7Alert1@gmail.com |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      | COS_7_u1     | COS_7_u1     |               1 |         1 |               1 |                  1 |    7100000001 | cos71@gmail.com      |
      | COS_7_Alert1 | COS_7_Alert1 |               1 |         1 |               1 |                  1 |    7100000011 | cos7Alert1@gmail.com |
      | COS_7_u2     | COS_7_u2     |               1 |         1 |               1 |                  1 |    7200000001 | cos72@gmail.com      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid   | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_7_u1 |                |            | AlOrg1       | Saved Successfully |
      | COS_7_u2 |                |            | AlOrg2       | Saved Successfully |
    And Assign users to device from API
      | Userid   |
      | COS_7_u1 |
      | COS_7_u2 |
    And Update Alert Configuration "User Allowed"
      | StartTime | EndTime | SendAlertToUser |
      |        -2 |       2 | COS_7_Alert1    |
    And Set Alert Configuration "User Allowed"
    And Assign User in Alert "User Allowed"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate User Event "1" times for User via API
      | UserID   |
      | COS_7_u1 |
      | COS_7_u2 |
    Then Validate SMS and Email Alert for Users
      | userid       | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_7_Alert1 |   7100000011 | cos7Alert1@gmail.com |        1 |          1 |             1 |

  @AlertGrp_43
  Scenario: Alert Group Wise - User - User Allowed - Alert is not Sent on Outside given time period
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID       |
      | COS_8_u1     |
      | COS_8_Alert1 |
      | COS_8_u2     |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   8100000011 | cos8Alert1@gmail.com |
    And Create User via api
      | Id           | name         | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      | COS_8_u1     | COS_8_u1     |               1 |         1 |               1 |                  1 |    8100000001 | cos81@gmail.com      |
      | COS_8_Alert1 | COS_8_Alert1 |               1 |         1 |               1 |                  1 |    8100000011 | cos8Alert1@gmail.com |
      | COS_8_u2     | COS_8_u2     |               1 |         1 |               1 |                  1 |    8200000001 | cos82@gmail.com      |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid   | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_8_u1 |                |            | AlOrg1       | Saved Successfully |
      | COS_8_u2 |                |            | AlOrg2       | Saved Successfully |
    And Assign users to device from API
      | Userid   |
      | COS_8_u1 |
      | COS_8_u2 |
    And Update Alert Configuration "User Allowed"
      | StartTime | EndTime | SendAlertToUser |
      |        -5 |      -3 | COS_8_Alert1    |
    And Set Alert Configuration "User Allowed"
    And Assign User in Alert "User Allowed"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate User Event "1" times for User via API
      | UserID   |
      | COS_8_u1 |
      | COS_8_u2 |
    Then Validate SMS and Email Alert for Users
      | userid       | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_8_Alert1 |   8100000011 | cos8Alert1@gmail.com |        0 |          0 |             0 |

  #Issue
  @AlertGrp_44
  Scenario: Alert Group Wise - User - Exceeding Health Declaration Parameters
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID          |
      | COS_17_u1       |
      | COS_17_RIC1     |
      | COS_17_LinkESS1 |
      | COS_17_u2       |
      | COS_17_RIC2     |
    And Delete SMS and Mail log
      | mobilenumber | Email                   |
      |   1710000011 | cos17ric11@gmail.com    |
      |   1710000021 | cos17LinkESS1@gmail.com |
      |   1720000011 | cos17ric12@gmail.com    |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | official-cell | official-email          |
      | COS_17_u1       | COS_17_u1       |               1 |         1 |               1 |                  1 |    1710000001 | cos171@gmail.com        |
      | COS_17_RIC1     | COS_17_RIC1     |               1 |         1 |               1 |                  1 |    1710000011 | cos17ric11@gmail.com    |
      | COS_17_LinkESS1 | COS_17_LinkESS1 |               1 |         1 |               1 |                  1 |    1710000021 | cos17LinkESS1@gmail.com |
      | COS_17_u2       | COS_17_u2       |               1 |         1 |               1 |                  1 |    1720000001 | cos172@gmail.com        |
      | COS_17_RIC2     | COS_17_RIC2     |               1 |         1 |               1 |                  1 |    1720000011 | cos17ric12@gmail.com    |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create New System Account User
      | SAUser     | ESSUSer         | ValidationMessage  |
      | SA1_COS_17 | COS_17_LinkESS1 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS17RICGrp1     | AnyOne     | COS_17_RIC1 |      |      |      |      | Saved Successfully |
      | COS17RICGrp2     | AnyOne     | COS_17_RIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_17_u1   | COS17RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_17_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_17_u2   | COS17RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_17_RIC2 |                |            | AlOrg2       | Saved Successfully |
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
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Password via API
      | Userid    | user-verified-for-password | new-password | type |
      | COS_17_u1 |                          1 | admin        |    1 |
      | COS_17_u2 |                          1 | admin        |    1 |
    And Declare Temperature and Symptoms for Self Declaration of ESSUser from API
      | UserID    | Temperature | Symptoms | declaration-date |
      | COS_17_u1 |        99.0 |        1 |                0 |
      | COS_17_u2 |        99.0 |        1 |                0 |
    Then Validate SMS and Email Alert for Users
      | userid          | mobilenumber | Email                   | SMSCount | EmailCount | WhatsappCount |
      | COS_17_RIC1     |   1710000011 | cos17ric11@gmail.com    |        1 |          1 |             1 |
      | COS_17_LinkESS1 |   1710000021 | cos17LinkESS1@gmail.com |        2 |          2 |             2 |
      | COS_17_RIC2     |   1720000011 | cos17ric12@gmail.com    |        0 |          0 |             0 |

  @AlertGrp_45
  Scenario: Alert Group Wise - User - Validity/Expiry Date
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_12_u1   |
      | COS_12_RIC1 |
      | COS_12_u2   |
      | COS_12_RIC2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   1210000001 | cos121@gmail.com     |
      |   1210000011 | cos12ric11@gmail.com |
      |   1220000001 | cos122@gmail.com     |
      |   1220000011 | cos12ric12@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       |
      | COS_12_u1   | COS_12_u1   |               1 |         1 |               1 |                  1 |    1210000001 | cos121@gmail.com     |
      | COS_12_RIC1 | COS_12_RIC1 |               1 |         1 |               1 |                  1 |    1210000011 | cos12ric11@gmail.com |
      | COS_12_u2   | COS_12_u2   |               1 |         1 |               1 |                  1 |    1220000001 | cos122@gmail.com     |
      | COS_12_RIC2 | COS_12_RIC2 |               1 |         1 |               1 |                  1 |    1220000011 | cos12ric12@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS12RICGrp1     | AnyOne     | COS_12_RIC1 |      |      |      |      | Saved Successfully |
      | COS12RICGrp2     | AnyOne     | COS_12_RIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_12_u1   | COS12RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_12_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_12_u2   | COS12RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_12_RIC2 |                |            | AlOrg2       | Saved Successfully |
    And Create User via api
      | Id        | name      | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_12_u1 | COS_12_u1 |              |               |   12111 |           2 |           12121 |                      2 |       12131 |               1 |
      | COS_12_u2 | COS_12_u2 |              |               |   12112 |           2 |           12122 |                      2 |       12132 |               1 |
    And Set Alert Configuration "Validity/Expiry Date"
    And Set Send Alert to parameters for "Validity/Expiry Date" Alert
    And Update Alert Configuration "Validity/Expiry Date"
      | SendAlertFor | Document        | DaysBeforeExpiry | ReminderTime | RepeatReminder | RepeatIntervalInDays |
      | True         | Visa            |                2 |            2 | False          |                    1 |
      | True         | Driving License |                2 |            2 | False          |                    1 |
      | True         | Passport        |                2 |            2 | True           |                    1 |
    And Assign User in Alert "Validity/Expiry Date"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_12_u1   |   1210000001 | cos121@gmail.com     |        3 |          3 |             3 |
      | COS_12_RIC1 |   1210000011 | cos12ric11@gmail.com |        3 |          3 |             3 |
      | COS_12_u2   |   1220000001 | cos122@gmail.com     |        0 |          0 |             0 |
      | COS_12_RIC2 |   1220000011 | cos12ric12@gmail.com |        0 |          0 |             0 |

  #Mayank Will check
   @AlertGrp_46
  Scenario: Alert Group Wise - User - Missing InOut User and Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID   |
      | INUSER1  |
      | OUTUSER1 |
      | INUSER2  |
      | OUTUSER2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete "IOSchedule" shift schedule
    And Delete "IO" shift
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   9898911231 | INUSER1@gmail.com   |
      |   9898911232 | OUTUSER1@gmail.com  |
      |   9898911233 | InOutRIC1@gmail.com |
      |   9898921231 | INUSER2@gmail.com   |
      |   9898921232 | OUTUSER2@gmail.com  |
      |   9898921233 | InOutRIC2@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | INUSER1   | INUSER1   |               1 |         1 |               1 |                  1 |    9898911231 | INUSER1@gmail.com   |
      | OUTUSER1  | OUTUSER1  |               1 |         1 |               1 |                  1 |    9898911232 | OUTUSER1@gmail.com  |
      | InOutRIC1 | InOutRIC1 |               1 |         1 |               1 |                  1 |    9898911233 | InOutRIC1@gmail.com |
      | INUSER2   | INUSER2   |               1 |         1 |               1 |                  1 |    9898921231 | INUSER2@gmail.com   |
      | OUTUSER2  | OUTUSER2  |               1 |         1 |               1 |                  1 |    9898921232 | OUTUSER2@gmail.com  |
      | InOutRIC2 | InOutRIC2 |               1 |         1 |               1 |                  1 |    9898921233 | InOutRIC2@gmail.com |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1      | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | InOutReporting1  | AnyOne     | InOutRIC1 |      |      |      |      | Saved Successfully |
      | InOutReporting2  | AnyOne     | InOutRIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create shift in Shift Configuration
      | ShiftID | StartTime | EndTime | HalfDay | FullDay | Validation         |
      | IO      |        -8 |       0 | 04:00   | 08:00   | Saved Successfully |
    And Create Shift Schedule "IOSchedule" with Start Date "01/01/2010"
      | ShiftID | RepeatShiftDays |
      | IO      |               7 |
    And Create user from user configuration
      | userid    | ReportingGroup  | ShiftSchedule | Organization | Validation         |
      | INUSER1   | InOutReporting1 | IOSchedule    | AlOrg1       | Saved Successfully |
      | OUTUSER1  | InOutReporting1 | IOSchedule    | AlOrg1       | Saved Successfully |
      | InOutRIC1 |                 |               | AlOrg1       | Saved Successfully |
      | INUSER2   | InOutReporting2 | IOSchedule    | AlOrg2       | Saved Successfully |
      | OUTUSER2  | InOutReporting2 | IOSchedule    | AlOrg2       | Saved Successfully |
      | InOutRIC2 |                 |               | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | INUSER1   |
      | OUTUSER1  |
      | InOutRIC1 |
      | INUSER2   |
      | OUTUSER2  |
      | InOutRIC2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | INUSER1   |
      | OUTUSER1  |
      | InOutRIC1 |
      | INUSER2   |
      | OUTUSER2  |
      | InOutRIC2 |
    And Set Alert Configuration "Missing In Punch - Users"
    And Update Alert Configuration "Missing In Punch - Users"
      | PostShiftStart |
      |            493 |
    And Assign User in Alert "Missing In Punch - Users"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Missing In Punch - Group Incharge"
    And Update Alert Configuration "Missing In Punch - Group Incharge"
      | PostShiftStart |
      |            493 |
    And Assign User in Alert "Missing In Punch - Group Incharge"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Missing Out Punch - Users"
    And Update Alert Configuration "Missing Out Punch - Users"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            14 |
    And Assign User in Alert "Missing Out Punch - Users"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Missing Out Punch - Group Incharge"
    And Update Alert Configuration "Missing Out Punch - Group Incharge"
      | PreShiftEnd | PostShiftEnd |
      |           3 |            14 |
    And Assign User in Alert "Missing Out Punch - Group Incharge"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Start Stop Service from Command Propmt
      | Service      | Status |
      | AlertService | stop   |
      | AlertService | start  |
    When Wait for "10" min
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | INUSER1   |   9898911231 | INUSER1@gmail.com   |        2 |          2 |             2 |
      | OUTUSER1  |   9898911232 | OUTUSER1@gmail.com  |        2 |          2 |             2 |
      | InOutRIC1 |   9898911233 | InOutRIC1@gmail.com |        2 |          2 |             2 |
      | INUSER2   |   9898921231 | INUSER2@gmail.com   |        0 |          0 |             0 |
      | OUTUSER2  |   9898921232 | OUTUSER2@gmail.com  |        0 |          0 |             0 |
      | InOutRIC2 |   9898921233 | InOutRIC2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_47
  Scenario: Alert Group Wise - User - 11New Joining - Confirmation & 14Birthday Greetings
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID        |
      | COS_11_u1     |
      | COS_11_Alert1 |
      | COS_14_u1     |
      | COS_14_RIC1   |
      | COS_11_u2     |
      | COS_14_u2     |
      | COS_14_RIC2   |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                 |
      |   1110000011 | cos11Alert1@gmail.com |
      |   1410000001 | cos141@gmail.com      |
      |   1410000011 | cos14ric11@gmail.com  |
      |   1120000011 | cos11Alert2@gmail.com |
      |   1420000001 | cos142@gmail.com      |
      |   1420000011 | cos14ric12@gmail.com  |
    And Create User via api
      | Id            | name          | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | official-cell | official-email        |
      | COS_11_u1     | COS_11_u1     |               1 |         1 |               1 |                  1 |    1110000001 | cos111@gmail.com      |
      | COS_11_Alert1 | COS_11_Alert1 |               1 |         1 |               1 |                  1 |    1110000011 | cos11Alert1@gmail.com |
      | COS_14_u1     | COS_14_u1     |               1 |         1 |               1 |                  1 |    1410000001 | cos141@gmail.com      |
      | COS_14_RIC1   | COS_14_RIC1   |               1 |         1 |               1 |                  1 |    1410000011 | cos14ric11@gmail.com  |
      | COS_11_u2     | COS_11_u2     |               1 |         1 |               1 |                  1 |    1120000001 | cos112@gmail.com      |
      | COS_14_u2     | COS_14_u2     |               1 |         1 |               1 |                  1 |    1420000001 | cos142@gmail.com      |
      | COS_14_RIC2   | COS_14_RIC2   |               1 |         1 |               1 |                  1 |    1420000011 | cos14ric12@gmail.com  |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS14RICGrp1     | AnyOne     | COS_14_RIC1 |      |      |      |      | Saved Successfully |
      | COS14RICGrp2     | AnyOne     | COS_14_RIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_14_u1   | COS14RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_14_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_14_u2   | COS14RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_14_RIC2 |                |            | AlOrg2       | Saved Successfully |
    And Create User via api
      | Id        | name      | joining-date | date-of-birth | visa-no | visa-expiry | driving-license | driving-license-expiry | passport-no | passport-expiry |
      | COS_11_u1 | COS_11_u1 |           -3 |               |         |             |                 |                        |             |                 |
      | COS_14_u1 | COS_14_u1 |              |             0 |         |             |                 |                        |             |                 |
      | COS_11_u2 | COS_11_u2 |           -3 |               |         |             |                 |                        |             |                 |
      | COS_14_u2 | COS_14_u2 |              |             0 |         |             |                 |                        |             |                 |
    And Update Alert Configuration "New Joining - Confirmation"
      | Confirmation | SetReminderDaysbeforeConfirmation | ReminderTime | UserID        |
      |            5 |                                 2 |            4 | COS_11_Alert1 |
    And Set Alert Configuration "New Joining - Confirmation"
    And Set Alert Configuration "Birthday Greetings"
    And Set Send Alert to parameters for "Birthday Greetings" Alert
    And Update Alert Configuration "Birthday Greetings"
      | AdditionalRecipients | ScheduleTime |
      | mayank@matrix.com    |            4 |
    And Assign User in Alert "Birthday Greetings"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "5" min
    Then Validate SMS and Email Alert for Users
      | userid        | mobilenumber | Email                 | SMSCount | EmailCount | WhatsappCount |
      | COS_11_Alert1 |   1110000011 | cos11Alert1@gmail.com |        1 |          1 |             1 |
      | COS_14_u1     |   1410000001 | cos141@gmail.com      |        1 |          1 |             1 |
      | COS_14_u2     |   1420000001 | cos142@gmail.com      |        0 |          0 |             0 |

  @AlertGrp_48
  Scenario: Alert Group Wise - User - 1516Health Declaration Pending
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID          |
      | COS_15_u1       |
      | COS_15_RIC1     |
      | COS_15_LinkESS1 |
      | COS_16_u1       |
      | COS_16_RIC1     |
      | COS_16_LinkESS1 |
      | COS_15_u2       |
      | COS_15_RIC2     |
      | COS_15_LinkESS2 |
      | COS_16_u2       |
      | COS_16_RIC2     |
      | COS_16_LinkESS2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete SMS and Mail log
      | mobilenumber | Email                   |
      |   1510000001 | cos151@gmail.com        |
      |   1510000011 | cos15ric11@gmail.com    |
      |   1510000021 | cos15LinkESS1@gmail.com |
      |   1610000001 | cos161@gmail.com        |
      |   1610000011 | cos16ric11@gmail.com    |
      |   1610000021 | cos16LinkESS1@gmail.com |
      |   1520000001 | cos152@gmail.com        |
      |   1520000011 | cos15ric12@gmail.com    |
      |   1620000001 | cos162@gmail.com        |
      |   1620000011 | cos16ric12@gmail.com    |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id              | name            | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | official-cell | official-email          |
      | COS_15_u1       | COS_15_u1       |               1 |         1 |               1 |                  1 |    1510000001 | cos151@gmail.com        |
      | COS_15_RIC1     | COS_15_RIC1     |               1 |         1 |               1 |                  1 |    1510000011 | cos15ric11@gmail.com    |
      | COS_15_LinkESS1 | COS_15_LinkESS1 |               1 |         1 |               1 |                  1 |    1510000021 | cos15LinkESS1@gmail.com |
      | COS_16_u1       | COS_16_u1       |               1 |         1 |               1 |                  1 |    1610000001 | cos161@gmail.com        |
      | COS_16_RIC1     | COS_16_RIC1     |               1 |         1 |               1 |                  1 |    1610000011 | cos16ric11@gmail.com    |
      | COS_16_LinkESS1 | COS_16_LinkESS1 |               1 |         1 |               1 |                  1 |    1610000021 | cos16LinkESS1@gmail.com |
      | COS_15_u2       | COS_15_u2       |               1 |         1 |               1 |                  1 |    1520000001 | cos152@gmail.com        |
      | COS_15_RIC2     | COS_15_RIC2     |               1 |         1 |               1 |                  1 |    1520000011 | cos15ric12@gmail.com    |
      | COS_16_u2       | COS_16_u2       |               1 |         1 |               1 |                  1 |    1620000001 | cos162@gmail.com        |
      | COS_16_RIC2     | COS_16_RIC2     |               1 |         1 |               1 |                  1 |    1620000011 | cos16ric12@gmail.com    |
    And Create New System Account User
      | SAUser     | ESSUSer         | ValidationMessage  |
      | SA1_COS_15 | COS_15_LinkESS1 | Saved Successfully |
      | SA1_COS_16 | COS_16_LinkESS1 | Saved Successfully |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS15RICGrp1     | AnyOne     | COS_15_RIC1 |      |      |      |      | Saved Successfully |
      | COS16RICGrp1     | AnyOne     | COS_16_RIC1 |      |      |      |      | Saved Successfully |
      | COS15RICGrp2     | AnyOne     | COS_15_RIC2 |      |      |      |      | Saved Successfully |
      | COS16RICGrp2     | AnyOne     | COS_16_RIC2 |      |      |      |      | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_15_u1   | COS15RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_16_u1   | COS16RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_15_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_16_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_15_u2   | COS15RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_16_u2   | COS16RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_15_RIC2 |                |            | AlOrg2       | Saved Successfully |
      | COS_16_RIC2 |                |            | AlOrg2       | Saved Successfully |
    And Set Temperature and Symptoms Configuration in GP
      | TempConfig | TempUnit        | TempThreshold | SymptomsConfig | SymptomsThreshold | Validation         |
      | True       | Fahrenheit (°F) |          97.5 | True           | Any one           | Saved Successfully |
    And ESS Roles and Rights set from User Module
      | PageRights       | value |
      | Health Records   | True  |
      | Self Declaration | True  |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_15_u1 |
      | COS_16_u1 |
      | COS_15_u2 |
      | COS_16_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_15_u1 |
      | COS_16_u1 |
      | COS_15_u2 |
      | COS_16_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_15_u1 |          0 |     090000 |
      | COS_15_u2 |          0 |     090000 |
    And Update Alert Configuration "Health Declaration Pending"
      | SendAlertAsPer | ScheduleTime |
      | Schedule Time  |            2 |
    And Set Alert Configuration "Health Declaration Pending"
    And Set Send Alert to parameters for "Health Declaration Pending" Alert
    And Assign User in Alert "Health Declaration Pending"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "5" min
    Then Validate SMS and Email Alert for Users
      | userid          | mobilenumber | Email                   | SMSCount | EmailCount | WhatsappCount |
      | COS_15_u1       |   1510000001 | cos151@gmail.com        |        1 |          1 |             1 |
      | COS_15_RIC1     |   1510000011 | cos15ric11@gmail.com    |        1 |          1 |             1 |
      | COS_15_LinkESS1 |   1510000021 | cos15LinkESS1@gmail.com |        1 |          1 |             1 |
      | COS_16_u1       |   1610000001 | cos161@gmail.com        |        0 |          0 |             0 |
      | COS_16_RIC1     |   1610000011 | cos16ric11@gmail.com    |        0 |          0 |             0 |
      | COS_16_LinkESS1 |   1610000021 | cos16LinkESS1@gmail.com |        1 |          1 |             1 |
      | COS_15_u2       |   1520000001 | cos152@gmail.com        |        0 |          0 |             0 |
      | COS_15_RIC2     |   1520000011 | cos15ric12@gmail.com    |        0 |          0 |             0 |
      | COS_16_u2       |   1620000001 | cos162@gmail.com        |        0 |          0 |             0 |
      | COS_16_RIC2     |   1620000011 | cos16ric12@gmail.com    |        0 |          0 |             0 |
    And Delete user via API
      | UserID    |
      | COS_15_u1 |
      | COS_16_u1 |
      | COS_15_u2 |
      | COS_16_u2 |

  ####################JPC Started#################
  @AlertGrp_49
  Scenario: Alert Group Wise - JPC - Award/Penalty Application
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_56_u1   |
      | COS_56_RIC1 |
      | COS_56_RIC2 |
      | COS_56_u2   |
      | COS_56_RIC3 |
      | COS_56_RIC4 |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   5610000021 | cos56ric21@gmail.com |
      |   5620000021 | cos56ric22@gmail.com |
    And Delete Project from Job Processing and Costing
      | ProjectName |
      | AlrProject  |
    And Delete Phase from Job Processing and Costing
      | PhaseName |
      | Phase1    |
    And Delete Job from Job Processing and Costing
      | JobCode |
      | COS_J1  |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       | job-assignment-type |
      | COS_56_u1   | COS_56_u1   |               1 |         1 |               1 |                  1 |    5610000001 | cos561@gmail.com     |                   1 |
      | COS_56_RIC1 | COS_56_RIC1 |               1 |         1 |               1 |                  1 |    5610000011 | cos56ric11@gmail.com |                     |
      | COS_56_RIC2 | COS_56_RIC2 |               1 |         1 |               1 |                  1 |    5610000021 | cos56ric21@gmail.com |                     |
      | COS_56_u2   | COS_56_u2   |               1 |         1 |               1 |                  1 |    5620000001 | cos562@gmail.com     |                   1 |
      | COS_56_RIC3 | COS_56_RIC4 |               1 |         1 |               1 |                  1 |    5620000011 | cos56ric12@gmail.com |                     |
      | COS_56_RIC4 | COS_56_RIC3 |               1 |         1 |               1 |                  1 |    5620000021 | cos56ric22@gmail.com |                     |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_56_u1   |                          1 | admin        |    1 |
      | COS_56_RIC1 |                          1 | admin        |    1 |
      | COS_56_RIC2 |                          1 | admin        |    1 |
      | COS_56_u2   |                          1 | admin        |    1 |
      | COS_56_RIC3 |                          1 | admin        |    1 |
      | COS_56_RIC4 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS56RIC1Grp1    | AnyOne     | COS_56_RIC1 |      |      |      |      | Saved Successfully |
      | COS56RIC2Grp2    | AnyOne     | COS_56_RIC2 |      |      |      |      | Saved Successfully |
      | COS56RIC1Grp3    | AnyOne     | COS_56_RIC3 |      |      |      |      | Saved Successfully |
      | COS56RIC2Grp4    | AnyOne     | COS_56_RIC4 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_56_u1   | COS56RIC1Grp1  |            | AlOrg1       | Saved Successfully |
      | COS_56_RIC1 | COS56RIC2Grp2  |            | AlOrg1       | Saved Successfully |
      | COS_56_RIC2 |                |            | AlOrg1       | Saved Successfully |
      | COS_56_u2   | COS56RIC1Grp3  |            | AlOrg2       | Saved Successfully |
      | COS_56_RIC3 | COS56RIC2Grp4  |            | AlOrg2       | Saved Successfully |
      | COS_56_RIC4 |                |            | AlOrg2       | Saved Successfully |
    And Create Job from Job Processing and Costing
      | Code   | Name   | JobStartDate | JobEndDate | EstimatedHours | Validation         |
      | COS_J1 | COS_J1 |            0 |          0 |        0002400 | Saved Successfully |
    And Create Phase from Job Processing and Costing
      | Name   | Description   | Validation         |
      | Phase1 | JPCAutomation | Saved Successfully |
    And Create Project "AlrProject" with StartDate "0" and EndDate "0" from Job Processing and Costing
      | CodeOfPhaseConfig | Phase  | StartDate | EndDate |
      | Alert             | Phase1 |         0 |       0 |
    And Set Job Configuration in Phase "Phase1" of Project "AlrProject" from Job Processing and Costing
      | JobCode | StartDate | EndDate |
      | COS_J1  |         0 |       0 |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_56_u1 |
      | COS_56_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_56_u1 |
      | COS_56_u2 |
    And Set event via Event Set API
      | Userid    | event-date | event-time |
      | COS_56_u1 |          0 |     090000 |
      | COS_56_u1 |          0 |     120000 |
      | COS_56_u2 |          0 |     090000 |
      | COS_56_u2 |          0 |     120000 |
    And Apply Timesheet Correction Application via API
      | userid    | attendance-date | correction-type | job-code | job-count | reason           | appliedBy |
      | COS_56_u1 |               0 |               0 | COS_J1   |         1 | TimesheetApplied | SA        |
      | COS_56_u2 |               0 |               0 | COS_J1   |         1 | TimesheetApplied | SA        |
    And Set Alert Configuration "Award/Penalty Application"
    And Update Alert Configuration "Award/Penalty Application"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Award/Penalty Application"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | COS_56_RIC1 | admin    | Welcome COS_56_RIC1 |
    When Assign Award Penalty Hours from RIC ESS login
      | Userid    | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | COS_56_u1 |    0 | Award          |  0200 | AwardGranted | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username    | password | Validation          |
      | COS_56_RIC3 | admin    | Welcome COS_56_RIC3 |
    When Assign Award Penalty Hours from RIC ESS login
      | Userid    | Date | AdjustmentType | Hours | Remark       | Reason    | Validation         |
      | COS_56_u2 |    0 | Award          |  0200 | AwardGranted | GreatWork | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_56_RIC2 |   5610000021 | cos56ric21@gmail.com |        1 |          1 |             1 |
      | COS_56_RIC3 |   5620000021 | cos56ric22@gmail.com |        0 |          0 |             0 |
    And Delete user via API
      | UserID      |
      | COS_56_u1   |
      | COS_56_RIC1 |
      | COS_56_RIC2 |
      | COS_56_u2   |
      | COS_56_RIC3 |
      | COS_56_RIC4 |

  ############################
  ###########FVM Started###########
  #Issue
  @AlertGrp_50
  Scenario: Alert Group Wise - FVM - Schedule Unavailable - Users & Incharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID      |
      | COS_57_u1   |
      | COS_57_RIC1 |
      | COS_57_u2   |
      | COS_57_RIC2 |
    And Delete SMS and Mail log
      | mobilenumber | Email                |
      |   5710000001 | cos571@gmail.com     |
      |   5710000011 | cos57ric11@gmail.com |
      |   5720000001 | cos572@gmail.com     |
      |   5720000011 | cos57ric12@gmail.com |
    And Create User via api
      | Id          | name        | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email       | FVM-enable |
      | COS_57_u1   | COS_57_u1   |               1 |         1 |               1 |                  1 |    5710000001 | cos571@gmail.com     |          1 |
      | COS_57_RIC1 | COS_57_RIC1 |               1 |         1 |               1 |                  1 |    5710000011 | cos57ric11@gmail.com |            |
      | COS_57_u2   | COS_57_u2   |               1 |         1 |               1 |                  1 |    5720000001 | cos572@gmail.com     |          1 |
      | COS_57_RIC2 | COS_57_RIC2 |               1 |         1 |               1 |                  1 |    5720000011 | cos57ric12@gmail.com |            |
    And Set Password via API
      | Userid      | user-verified-for-password | new-password | type |
      | COS_57_u1   |                          1 | admin        |    1 |
      | COS_57_RIC1 |                          1 | admin        |    1 |
      | COS_57_u2   |                          1 | admin        |    1 |
      | COS_57_RIC2 |                          1 | admin        |    1 |
    And Create Reporting Group
      | ReportingGroupId | PolicyName | RIC1        | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | COS57RICGrp1     | AnyOne     | COS_57_RIC1 |      |      |      |      | Saved Successfully |
      | COS57RICGrp2     | AnyOne     | COS_57_RIC2 |      |      |      |      | Saved Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid      | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_57_u1   | COS57RICGrp1   |            | AlOrg1       | Saved Successfully |
      | COS_57_RIC1 |                |            | AlOrg1       | Saved Successfully |
      | COS_57_u2   | COS57RICGrp2   |            | AlOrg2       | Saved Successfully |
      | COS_57_RIC2 |                |            | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_57_u1 |
      | COS_57_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_57_u1 |
      | COS_57_u2 |
    And Set Alert Configuration "Schedule Unavailable - Users"
    And Update Alert Configuration "Schedule Unavailable - Users"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Everyday    |            2 |                       1 |
    And Assign User in Alert "Schedule Unavailable - Users"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Set Alert Configuration "Schedule Unavailable - Group Incharge"
    And Update Alert Configuration "Schedule Unavailable - Group Incharge"
      | SetReminder | ReminderTime | RemPeriodDaysBefSchDate |
      | Everyday    |            2 |                       1 |
    And Assign User in Alert "Schedule Unavailable - Group Incharge"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email                | SMSCount | EmailCount | WhatsappCount |
      | COS_57_u1   |   5710000001 | cos571@gmail.com     |        1 |          1 |             1 |
      | COS_57_RIC1 |   5710000011 | cos57ric11@gmail.com |        1 |          1 |             1 |
      | COS_57_u2   |   5720000001 | cos572@gmail.com     |        0 |          0 |             0 |
      | COS_57_RIC2 |   5720000011 | cos57ric12@gmail.com |        0 |          0 |             0 |

  @AlertGrp_51
  Scenario: Alert Group Wise - FVM - FVM - Schedule Modified
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete user via API
      | UserID    |
      | COS_58_u1 |
      | COS_58_u2 |
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   5810000001 | cos581@gmail.com |
      |   5820000001 | cos582@gmail.com |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   | FVM-enable |
      | COS_58_u1 | COS_58_u1 |               1 |         1 |               1 |                  1 |    5810000001 | cos581@gmail.com |          1 |
      | COS_58_u2 | COS_58_u2 |               1 |         1 |               1 |                  1 |    5820000001 | cos582@gmail.com |          1 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create user from user configuration
      | userid    | ReportingGroup | LeaveGroup | Organization | Validation         |
      | COS_58_u1 |                |            | AlOrg1       | Saved Successfully |
      | COS_58_u2 |                |            | AlOrg2       | Saved Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID    |
      | COS_58_u1 |
      | COS_58_u2 |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID    |
      | COS_58_u1 |
      | COS_58_u2 |
    And Create Location from Location master
      | Code  | Name  | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | Alert | Alert | Wi-Fi |         |         |          |           |                      | 00:00:00:02:02:02 | RnD2    | Saved Successfully |
    And Create Task from Field Visit Management
      | TaskName | Description              | Validation         |
      | Alert1   | FVM Automation By Mayank | Saved Successfully |
    And Create Field Visit Schedule for User "COS_58_u1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              0900 |               0 |            1000 | Alert1   | Alert    | Schedule By Mayank |
    And Create Field Visit Schedule for User "COS_58_u2" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              0900 |               0 |            1000 | Alert1   | Alert    | Schedule By Mayank |
    And Set Alert Configuration "Schedule Modified"
    And Assign User in Alert "Schedule Modified"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Create Field Visit Schedule for User "COS_58_u1" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              1001 |               0 |            1100 | Alert1   | Alert    | Schedule By Mayank |
    And Create Field Visit Schedule for User "COS_58_u2" and date "0" from Field Visit Management
      | ScheduleStartDate | ScheduleStartTime | ScheduleEndDate | ScheduleEndTime | TaskName | Location | Remark             |
      |                 0 |              1001 |               0 |            1100 | Alert1   | Alert    | Schedule By Mayank |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_58_u1 |   5810000001 | cos581@gmail.com |        1 |          1 |             1 |
      | COS_58_u2 |   5820000001 | cos582@gmail.com |        0 |          0 |             0 |

  ############################
  ##################CWM Started##################
  @AlertGrp_52
  Scenario: Alert Group Wise - CWM - 62Contractor Validity & 63Work Order Expiry
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   6210000001 | cos621@gmail.com |
      |   6210000011 | con621@gmail.com |
      |   6310000011 | con631@gmail.com |
      |   6220000001 | cos622@gmail.com |
    And Delete user via API
      | UserID    |
      | COS_62_u1 |
      | COS_62_u2 |
    And Delete WorkOrder via API
      | id    | contractorID | workerName |
      | WO_63 | CON_63       | Worker_63  |
    And Delete Contractor via API
      | id     |
      | CON_62 |
      | CON_63 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_62_u1 | COS_62_u1 |               1 |         1 |               1 |                  1 |    6210000001 | cos621@gmail.com |
      | COS_62_u2 | COS_62_u2 |               1 |         1 |               1 |                  1 |    6220000001 | cos622@gmail.com |
    And Create user from user configuration
      | userid    | ReportingGroup | ShiftSchedule | Organization | Validation         |
      | COS_62_u1 |                |               | AlOrg1       | Saved Successfully |
      | COS_62_u2 |                |               | AlOrg2       | Saved Successfully |
    And Create Contractor from CWM module
      | Id     | name   | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON_62 | CON_62 |               1 | CON_62         |     6210000011 | con621@gmail.com |     62001 | Lic1        | True          | True             | Saved Successfully |
      | CON_63 | CON_63 |              10 | CON_63         |     6310000011 | con631@gmail.com |     63001 | Lic2        | True          | True             | Saved Successfully |
    And Create WorkOrder from CWM module
      | Id    | Name  | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO_63 | WO_63 |             0 |           1 | CON_63                   | Approval Stage-1  |              5 | Saved Successfully |
    And Set Alert Configuration "Contractor Validity"
    And Set Send Alert to parameters for "Contractor Validity" Alert
    And Update Alert Configuration "Contractor Validity"
      | DaysBeforeValEndDate | ReminderTime | RepeatReminder | RepeatIntervalDays | SelectUsers | SelectGroup  | GroupName | ContractorID |
      |                    1 |            2 | False          |                  1 | Group Wise  | Organization | AlOrg1    | CON_62       |
    And Set Alert Configuration "Work Order Expiry"
    And Update Alert Configuration "Work Order Expiry"
      | SendReminder | SetRemDaysBeforeValEnd | ReminderTime |
      | Everyday     |                      1 |            2 |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_62_u1 |   6210000001 | cos621@gmail.com |        1 |          1 |             1 |
      | CON_62    |   6210000011 | con621@gmail.com |        1 |          1 |             1 |
      | CON_63    |   6310000011 | con631@gmail.com |        1 |          1 |             1 |
      | COS_62_u2 |   6220000001 | cos622@gmail.com |        0 |          0 |             0 |

  @AlertGrp_53
  Scenario: Alert Group Wise - CWM - Worker Assignment & Worker Induction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email            |
      |   6410000001 | cos641@gmail.com |
      |   6420000001 | cos642@gmail.com |
    And Delete user via API
      | UserID    |
      | COS_64_u1 |
      | COS_64_u2 |
    And Delete Worker from CWM module
      | WorkerName |
      | Worker1_64 |
    And Delete WorkOrder via API
      | id     | contractorID | workerName |
      | WO1_64 | CON1_64      | Worker1_64 |
    And Delete Approval Stages from CWM module
      | ApprovalStagesName |
      | AlertAS1           |
    And Delete Contractor via API
      | id      |
      | CON1_64 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id        | name      | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email   |
      | COS_64_u1 | COS_64_u1 |               1 |         1 |               1 |                  1 |    6410000001 | cos641@gmail.com |
      | COS_64_u2 | COS_64_u2 |               1 |         1 |               1 |                  1 |    6420000001 | cos642@gmail.com |
    And Create user from user configuration
      | userid    | ReportingGroup | ShiftSchedule | Organization | Validation         |
      | COS_64_u1 |                |               | AlOrg1       | Saved Successfully |
      | COS_64_u2 |                |               | AlOrg2       | Saved Successfully |
    And Create Contractor from CWM module
      | Id      | name    | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1    | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      | CON1_64 | CON1_64 |              10 | CON1_64        |     6410000011 | con641@gmail.com |     64001 | lic1        | True          | True             | Saved Successfully |
    And Create Induction Level from CWM module
      | Name            | Description          | Validation         |
      | AlertInduction1 | Automation By Mayank | Saved Successfully |
      | AlertInduction2 | Automation By Mayank | Saved Successfully |
    And Create Approval Stage "AlertAS1" from CWM module
      | InductionLevelName | ApprovingInChargeID |
      | AlertInduction1    | COS_64_u1           |
      | AlertInduction2    | COS_64_u2           |
    And Create WorkOrder from CWM module
      | Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      | WO1_64 | WO1_64 |             0 |          10 | CON1_64                  | AlertAS1          |              5 | Saved Successfully |
    And Set CWM Parameters in GP
      | WorkerAssignmentFromCSS | AssignmentApproval | ApprovalScheme | ApprovalRequiredForExistingWorkers |
      | True                    | Approval Stage     | Parallel       | False                              |
    And Set Alert Configuration "Worker Induction"
    And Update Alert Configuration "Worker Induction"
      | ApprovalLinks | ApprovalAcknowledgment |
      | True          | True                   |
    And Assign User in Alert "Worker Induction"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CON1_64 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CON1_64  | admin    | Welcome CON1_64 |
    And Create Worker from worker profile in CSS login
      | WorkerName | SkillID | WorkOrderID | AssignStartDt | AssignEndDt | Validation         |
      | Worker1_64 |       1 | WO1_64      |             0 |          10 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Alert Configuration "Worker Assignment"
    And Update Alert Configuration "Worker Assignment"
      | ScheduleTime | ProcessingPeriod |
      |            2 | Current          |
    And Assign User in Alert "Worker Assignment"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email            | SMSCount | EmailCount | WhatsappCount |
      | COS_64_u1 |   6410000001 | cos641@gmail.com |        2 |          2 |             2 |
      | COS_64_u2 |   6420000001 | cos642@gmail.com |        0 |          0 |             0 |

  ########################
  ################New Alert#########
  @AlertGrp_54
  Scenario: Alert Group Wise - User - Invite User
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email             |
      |   9910000012 | invtusr@gmail.com |
    And Delete Link from Invite User page
      | Name        |
      | InvtUsrLink |
    And Set Alert Configuration "Invite User"
    And Update Alert Configuration "Invite User"
      | DaysBeforeLinkExpiry | ReminderTime |
      |                    0 | 00:00        |
    When Send link from Invite user tab
      | Name        | MobileNo   | EmailID           |
      | InvtUsrLink | 9910000012 | invtusr@gmail.com |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email             | SMSCount | EmailCount | WhatsappCount |
      | InvtUsrLink |   9910000012 | invtusr@gmail.com |        1 |          1 |             1 |

  @AlertGrp_55
  Scenario: Alert Group Wise - User - User Onboarding - On Submit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                   |
      |   9991000001 | invusr1@gmail.com       |
      |   9822100013 | invituserlnk1@gmail.com |
      |   9822200013 | invtuserlnk2@gmail.com  |
    And Delete user via API
      | UserID      |
      | InviteUser1 |
      | InviteUser2 |
    And Delete Link from Invite User page
      | Name          |
      | InvtUserLink1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email    |
      | InviteUser1 | InviteUser1 | AlOrg1            |               1 |         1 |               1 |                  1 |    9991000001 | invusr1@gmail.com |
      | InviteUser2 | InviteUser2 | AlOrg2            |               1 |         1 |               1 |                  1 |    9992000001 | invusr2@gmail.com |
    And Set Alert Configuration "User Onboarding - On Submit"
    And Assign User in Alert "User Onboarding - On Submit"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    And Send link from Invite user tab
      | Name          | MobileNo   | EmailID                 |
      | InvtUserLink1 | 9822100013 | invituserlnk1@gmail.com |
      | InvtUserLink2 | 9822200013 | invtuserlnk2@gmail.com  |
    And "Copy link" and open in new browser tab
      | Name          |
      | InvtUserLink1 |
    And Go to previous Tab
    And Get OTP from Alert view for "9822100013"
    And Go to next Tab
    When click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    And Enter details in employees onbording portal
      | Name         |
      | InvtUsrLink1 |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email             | SMSCount | EmailCount | WhatsappCount |
      | InviteUser1 |   9991000001 | invusr1@gmail.com |        1 |          1 |             1 |
      | InviteUser2 |   9992000001 | invusr2@gmail.com |        0 |          0 |             0 |

  #Mayank Will Verify
  @AlertGrp_56
  Scenario: Alert Group Wise - User - User Onboarding - Schedule Time
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email                 |
      |  98210000013 | invtusrlnk1@gmail.com |
      |   9991000001 | invusr1@gmail.com     |
      |   9992000001 | invusr2@gmail.com     |
    And Delete user via API
      | UserID      |
      | InviteUser1 |
      | InviteUser2 |
    And Delete Link from Invite User page
      | Name         |
      | InvtUsrLink1 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id          | name        | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email    |
      | InviteUser1 | InviteUser1 | AlOrg1            |               1 |         1 |               1 |                  1 |    9991000001 | invusr1@gmail.com |
      | InviteUser2 | InviteUser2 | AlOrg2            |               1 |         1 |               1 |                  1 |    9992000001 | invusr2@gmail.com |
    And Send link from Invite user tab
      | Name         | MobileNo    | EmailID               |
      | InvtUsrLink1 | 98210000013 | invtusrlnk1@gmail.com |
    And "Copy link" and open in new browser tab
      | Name         |
      | InvtUsrLink1 |
    And Go to previous Tab
    And Get OTP from Alert view for "98210000013"
    And Go to next Tab
    When click on Login after entering OTP in COSEC Onboarding Portal
      | Validation              |
      | COSEC Onboarding Portal |
    And Enter details in employees onbording portal
      | Name         |
      | InvtUsrLink1 |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Update Alert Configuration "User Onboarding - Schedule Time"
      | ScheduleTime |
      |            2 |
    And Set Alert Configuration "User Onboarding - Schedule Time"
    And Assign User in Alert "User Onboarding - Schedule Time"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Wait for "4" min
    Then Validate SMS and Email Alert for Users
      | userid      | mobilenumber | Email             | SMSCount | EmailCount | WhatsappCount |
      | InviteUser1 |   9991000001 | invusr1@gmail.com |        1 |          1 |             1 |
      | InviteUser2 |   9992000001 | invusr2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_57
  Scenario: Alert Group Wise - System - Temporary User/Worker Added
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email               |
      |   9090100011 | tempuser1@gmail.com |
      |   9090200011 | tempuser2@gmail.com |
    And Delete user via API
      | UserID    |
      | TempUser1 |
      | TempUser2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Delete Device from Device Configuration
      | DeviceName    |
      | TempUserArgo1 |
    And Add Device from device module
      | DeviceType | PanelName | PanelDoorType | DeviceName    | MACAddress        | TempAddOfUnknownUser | IDFormat     | NumericValueLength | NameFormat   |
      | ARGO       |           |               | TempUserArgo1 | 19:20:19:20:19:21 | As Temporary User    | AUTO*NUMVAL* |                  2 | AUTO*NUMVAL* |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id        | name      | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email      |
      | TempUser1 | TempUser1 | AlOrg1            |               1 |         1 |               1 |                  1 |    9090100011 | tempuser1@gmail.com |
      | TempUser2 | TempUser2 | AlOrg2            |               1 |         1 |               1 |                  1 |    9090200011 | tempuser2@gmail.com |
    And Set Alert Configuration "Temporary User/Worker Added"
    And Assign User in Alert "Temporary User/Worker Added"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Add Temporary User via API
      | temporary-addition-of-unknown-user | device-type | DeviceName    | credential-type |
      |                                  1 |          20 | TempUserArgo1 | card            |
    Then Validate SMS and Email Alert for Users
      | userid    | mobilenumber | Email               | SMSCount | EmailCount | WhatsappCount |
      | TempUser1 |   9090100011 | tempuser1@gmail.com |        1 |          1 |             1 |
      | TempUser2 |   9090200011 | tempuser2@gmail.com |        0 |          0 |             0 |

  @AlertGrp_58
  Scenario: Alert Group Wise - Users - User Access - QR Credential
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete SMS and Mail log
      | mobilenumber | Email             |
      |   9090100001 | qruser1@gmail.com |
      |   9090200001 | qruser2@gmail.com |
    And Delete user via API
      | UserID  |
      | ORUser1 |
      | ORUser2 |
    And Delete Enterprise group from Enterprise module
      | Group        | Name   | Validation           |
      | Organization | AlOrg1 | Deleted Successfully |
      | Organization | AlOrg2 | Deleted Successfully |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | AlOrg1 | AlOrg1 | Saved Successfully |
      | Organization | AlOrg2 | AlOrg2 | Saved Successfully |
    And Create User via api
      | Id      | name    | Organization_code | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | personal-cell | personal-email    |
      | ORUser1 | ORUser1 | AlOrg1            |               1 |         1 |               1 |                  1 |    9090100001 | qruser1@gmail.com |
      | ORUser2 | ORUser2 | AlOrg2            |               1 |         1 |               1 |                  1 |    9090200001 | qruser2@gmail.com |
    And Set Alert Configuration "User Access - QR Credential"
    And Assign User in Alert "User Access - QR Credential"
      | SelectUsers | SelectGroup  | GroupName |
      | Group Wise  | Organization | AlOrg1    |
    When Generate QR Credential from User Configuration
      | UserId  |
      | ORUser1 |
      | ORUser2 |
    Then Validate SMS and Email Alert for Users
      | userid  | mobilenumber | Email             | SMSCount | EmailCount | WhatsappCount |
      | ORUser1 |   9090100001 | qruser1@gmail.com |        1 |          1 |             1 |
      | ORUser2 |   9090200001 | qruser2@gmail.com |        0 |          0 |             0 |
