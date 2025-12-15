@tag
Feature: Visitor Management
  I want to use this template for my feature file

  @VM_1
  Scenario: Invite visitor from SA - New invite visitor link & Copy link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set SMS Configuration
    And Set Email Configuration
    And Set Whatsapp Configuration
    And Delete invite visitor
      | VName    |
      | Visitor1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_1 | VM_1 |               1 |         1 |               1 |                  1 |                    1 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor1 | 9999901 | visitor1@vms.com | matrix        | VM_1       |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    Then Copy Link from Invite Visitor page
      | VName    | VMobile | Validation  |
      | Visitor1 | 9999901 | Link Copied |

  @VM_2
  Scenario: Invite visitor from SA -  Security Approval For Visitor E-Pass = Disable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_2   |
    And Delete visitor via API
      | mobilenumber |
      |      9999902 |
    And Delete invite visitor
      | VName    |
      | Visitor2 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_2 | VM_2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor2 | 9999902 | visitor2@vms.com | matrix        | VM_2       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor2 | 9999902 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999902"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_2   | Scheduled Visits | Accepted |

  @VM_3
  Scenario: Invite visitor from SA -  Security Approval For Visitor E-Pass = Enable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_3   |
    And Delete visitor via API
      | mobilenumber |
      |      9999903 |
    And Delete invite visitor
      | VName    |
      | Visitor3 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_3 | VM_3 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor3 | 9999903 | visitor3@vms.com | matrix        | VM_3       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor3 | 9999903 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999903"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_3   | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @VM_4
  Scenario: Invite visitor from SA -  Security Approval For Visitor E-Pass = Disable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_4   |
    And Delete visitor via API
      | mobilenumber |
      |      9999904 |
    And Delete invite visitor
      | VName    |
      | Visitor4 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_4 | VM_4 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor4 | 9999904 | visitor4@vms.com | matrix        | VM_4       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor4 | 9999904 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999904"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_4   | Scheduled Visits | Pending |

  @VM_5
  Scenario: Invite visitor from SA -  Security Approval For Visitor E-Pass = Enable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_5   |
    And Delete visitor via API
      | mobilenumber |
      |      9999905 |
    And Delete invite visitor
      | VName    |
      | Visitor5 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_5 | VM_5 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor5 | 9999905 | visitor5@vms.com | matrix        | VM_5       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor5 | 9999905 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999905"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_5   | Scheduled Visits | Pending |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @VM_6
  Scenario: Invite visitor from SA - Repeat daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_6   |
    And Delete visitor via API
      | mobilenumber |
      |      9999906 |
    And Delete invite visitor
      | VName    |
      | Visitor6 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_6 | VM_6 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | VisitStation     | Purpose        | AddVisitors | Validation             |
      | Visitor6 | 9999906 | visitor6@vms.com | matrix        | VM_6       |         0 |      10 | Daily           |                 |         5 |      65 | Default Location | Invite Visitor |           0 | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor6 | 9999906 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999906"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_6   | Scheduled Visits | Accepted |

  @VM_7
  Scenario: Invite visitor from SA - Repeat Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_7   |
    And Delete visitor via API
      | mobilenumber |
      |      9999907 |
    And Delete invite visitor
      | VName    |
      | Visitor7 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_7 | VM_7 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor7 | 9999907 | visitor7@vms.com | matrix        | VM_7       |         0 |      20 | Weekly          | Sun,Tue,Thu,Sat |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor7 | 9999907 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999907"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_7   | Scheduled Visits | Accepted |

  @VM_8
  Scenario: Invite visitor from SA -  Link Status = Accessed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_8   |
    And Delete visitor via API
      | mobilenumber |
      |      9999908 |
    And Delete invite visitor
      | VName    |
      | Visitor8 |
    And create visitor profile via API
      | id  | name | active |
      | VP8 | VP8  |      1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_8 | VM_8 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor8 | 9999908 | visitor8@vms.com | matrix        | VM_8       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor8 | 9999908 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999908"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    When "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_8   | Checked-In |
    Then Go to previous Tab
    And verify invite visitor link status from invite visitor page
      | VName    | Status   |
      | Visitor8 | Accessed |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | VM_8   |

  @VM_9
  Scenario: Invite visitor from SA - Link Status = Link Expired
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_9   |
    And Delete visitor via API
      | mobilenumber |
      |      9999909 |
    And Delete invite visitor
      | VName    |
      | Visitor9 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_9 | VM_9 |               1 |         1 |               1 |                  1 |                    1 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor9 | 9999909 | visitor9@vms.com | matrix        | VM_9       |         0 |       0 |         2 |       3 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Wait for "4" min
    And verify invite visitor link status from invite visitor page
      | VName    | Status       |
      | Visitor9 | Link Expired |

  @VM_10
  Scenario: Invite visitor from ESS - New invite visitor link & Copy link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_10  |
    And Delete visitor via API
      | mobilenumber |
      |       999910 |
    And Delete invite visitor
      | VName     |
      | Visitor10 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_10 | VM_10 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_10  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_10    | admin    | Welcome VM_10 |
    When Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor10 |  999910 | visitor10@vms.com | matrix        | VM_10      |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    Then Copy Link from Invite Visitor page in ESS
      | VName     | VMobile | Validation  |
      | Visitor10 |  999910 | Link Copied |

  @VM_11
  Scenario: Invite visitor from ESS -  Security Approval For Visitor E-Pass = Disable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_11  |
    And Delete visitor via API
      | mobilenumber |
      |       999911 |
    And Delete invite visitor
      | VName     |
      | Visitor11 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_11 | VM_11 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_11  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_11    | admin    | Welcome VM_11 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor11 |  999911 | visitor11@vms.com | matrix        | VM_11      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor11 |  999911 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999911"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_11  | Scheduled Visits | Accepted |

  @VM_12
  Scenario: Invite visitor from ESS -  Security Approval For Visitor E-Pass = Enable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_12  |
    And Delete visitor via API
      | mobilenumber |
      |       999912 |
    And Delete invite visitor
      | VName     |
      | Visitor12 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_12 | VM_12 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_12  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_12    | admin    | Welcome VM_12 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor12 |  999912 | visitor12@vms.com | matrix        | VM_12      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor12 |  999912 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999912"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_12  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @VM_13
  Scenario: Invite visitor from ESS -  Security Approval For Visitor E-Pass = Disable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_13  |
    And Delete visitor via API
      | mobilenumber |
      |       999913 |
    And Delete invite visitor
      | VName     |
      | Visitor13 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_13 | VM_13 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_13  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_13    | admin    | Welcome VM_13 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor13 |  999913 | visitor13@vms.com | matrix        | VM_13      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor13 |  999913 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999913"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_13  | Scheduled Visits | Pending |

  @VM_14
  Scenario: Invite visitor from ESS -  Security Approval For Visitor E-Pass = Enable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_14  |
    And Delete visitor via API
      | mobilenumber |
      |       999914 |
    And Delete invite visitor
      | VName     |
      | Visitor14 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_14 | VM_14 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_14  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_14    | admin    | Welcome VM_14 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor14 |  999914 | visitor14@vms.com | matrix        | VM_14      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor14 |  999914 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999914"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_14  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @VM_15
  Scenario: Invite visitor from ESS - Repeat daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_15  |
    And Delete visitor via API
      | mobilenumber |
      |       999915 |
    And Delete invite visitor
      | VName     |
      | Visitor15 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_15 | VM_15 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_15  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_15    | admin    | Welcome VM_15 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor15 |  999915 | visitor15@vms.com | matrix        | VM_15      |         0 |      20 | Daily           |                 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor15 |  999915 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999915"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_15  | Scheduled Visits | Accepted |

  @VM_16
  Scenario: Invite visitor from ESS - Repeat Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_16  |
    And Delete visitor via API
      | mobilenumber |
      |       999916 |
    And Delete invite visitor
      | VName     |
      | Visitor16 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_16 | VM_16 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_16  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_16    | admin    | Welcome VM_16 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor16 |  999916 | visitor16@vms.com | matrix        | VM_16      |         0 |      20 | Weekly          | Sun,Tue,Thu,Sat |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor16 |  999916 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999916"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_16  | Scheduled Visits | Accepted |

  @VM_17
  Scenario: Invite visitor from ESS - Visit Creation Restriction Minimum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_17  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_17 | VM_17 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_17  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_17  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_17    | admin    | Welcome VM_17 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation                                                      |
      | Visitor17 |  999917 | visitor17@vms.com | matrix        | VM_17      |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Visit Start Date should not be lesser than 2 days from Curre... |

  @VM_18
  Scenario: Invite visitor from ESS - Visit Creation Restriction Maximum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_18  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_18 | VM_18 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_18  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_18  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_18    | admin    | Welcome VM_18 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation                                                      |
      | Visitor18 |  999918 | visitor18@vms.com | matrix        | VM_18      |         7 |       7 |         5 |      65 | Invite Visitor |           0 | Default Location | Visit Start Date should not be greater than 5 days from Curr... |

  @VM_19
  Scenario: Invite visitor from ESS - Visit Creation Restriction within Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_19  |
    And Delete visitor via API
      | mobilenumber |
      |       999919 |
    And Delete invite visitor
      | VName     |
      | Visitor19 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_19 | VM_19 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_19  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_19  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_19    | admin    | Welcome VM_19 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor19 |  999919 | visitor19@vms.com | matrix        | VM_19      |         3 |       3 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |

  @VM_20
  Scenario: Visitor Pre Registration from SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_20  |
    And Delete visitor via API
      | mobilenumber |
      |       999920 |
    And create visitor profile via API
      | id   | name | active |
      | VP20 | VP20 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_20 | VM_20 |               1 |         1 |               1 |                  1 |                    1 |
    And Set default Visitor Pre-Registration Template
    When Visitor Preregistration from VMS module
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | VM_20    | Visitor20 |  999920 | visitor20@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999920 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999920"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_20  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_20  | Checked-Out successfully. |

  @VM_21
  Scenario: Visitor Pre Registration from ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_21  |
    And Delete visitor via API
      | mobilenumber |
      |       999921 |
    And create visitor profile via API
      | id   | name | active |
      | VP21 | VP21 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_21 | VM_21 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_21  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_21    | admin    | Welcome VM_21 |
    When Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_21    | Visitor21 |  999921 | visitor21@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999921 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999921"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_21  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_21  | Checked-Out successfully. |

  @VM_22
  Scenario: Visitor Pre Registration from ESS - Visit Creation Restriction Minimum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_22  |
    And Delete visitor via API
      | mobilenumber |
      |       999922 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_22 | VM_22 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_22  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_22  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_22    | admin    | Welcome VM_22 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation                                                      |
      | VM_22    | Visitor22 |  999922 | visitor22@vms.com | Matrix        |         1 |       1 |         2 |      62 | PreregistrationFromESS | Default Location | Visit Start Date should not be lesser than 2 days from Curre... |

  @VM_23
  Scenario: Visitor Pre Registration from ESS - Visit Creation Restriction Maximum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_23  |
    And Delete visitor via API
      | mobilenumber |
      |       999923 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_23 | VM_23 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_23  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_23  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_23    | admin    | Welcome VM_23 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation                                                      |
      | VM_23    | Visitor23 |  999923 | visitor23@vms.com | Matrix        |         7 |       7 |         2 |      62 | PreregistrationFromESS | Default Location | Visit Start Date should not be greater than 5 days from Curr... |

  @VM_24
  Scenario: Visitor Pre Registration from ESS - Visit Creation Restriction Within Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_24  |
    And Delete visitor via API
      | mobilenumber |
      |       999924 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_24 | VM_24 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_24  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_24  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_24    | admin    | Welcome VM_24 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_24    | Visitor24 |  999924 | visitor24@vms.com | Matrix        |         3 |       3 |         2 |      62 | PreregistrationFromESS | Default Location | Saved Successfully |

  @VM_25
  Scenario: Visitor Pre Registration from Visitor Portal
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_25  |
    And Delete visitor via API
      | mobilenumber |
      |       999925 |
    And create visitor profile via API
      | id   | name | active |
      | VP25 | VP25 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_25 | VM_25 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_25  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999925 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999925"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor25 | Matrix       | visitor25@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor25@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_25  |         0 |         0 |         2 |      62 | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_25    | admin    | Welcome VM_25 |
    And Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        0 |      0 | Visitor25 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_25  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_25  | Checked-Out successfully. |

  @VM_26
  Scenario: Visit Request Handling - Auto Transfer
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_261 |
      | VM_262 |
    And Delete visitor via API
      | mobilenumber |
      |       999926 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_261 | VM_261 |               1 |         1 |               1 |                  1 |                    1 |
      | VM_262 | VM_262 |               1 |         1 |               1 |                  1 |                    1 |
    When Set parameters of Visit Request Handling
      | HostId | EnableAutoTransferVisit | TransfertoUser |
      | VM_261 | True                    | VM_262         |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999926 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999926"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor26 | Matrix       | visitor26@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor26@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_261 |         0 |         0 |         2 |      62 | automation | Visit Created |
    Then verify hostuser of created visit
      | HostId |
      | VM_262 |

  @VM_27
  Scenario: Visit Request Handling - Auto Approval
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_27  |
    And Delete visitor via API
      | mobilenumber |
      |       999927 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_27 | VM_27 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    When Set parameters of Visit Request Handling
      | HostId | EnableVisitAutoApprovalRejection | WorkingDays                 | WorkingStartTime | WorkingEndTime | BreakStartTime | BreakEndTime | AllowedOverlappingDuration |
      | VM_27  | True                             | Mon,Tue,Wed,Thu,Fri,Sat,Sun | 09:00            | 18:00          | 13:00          | 13:05        |                          0 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999927 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999927"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor27 | Matrix       | visitor27@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor27@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_27  |         1 |         1 | 10:00     | 11:00   | automation | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_27  | Scheduled Visits | Accepted |

  @VM_28
  Scenario: Visit Request Handling - Auto Rejection NonWorking Hours
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_28  |
    And Delete visitor via API
      | mobilenumber |
      |       999928 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_28 | VM_28 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    When Set parameters of Visit Request Handling
      | HostId | EnableVisitAutoApprovalRejection | WorkingDays                 | WorkingStartTime | WorkingEndTime | BreakStartTime | BreakEndTime | AllowedOverlappingDuration |
      | VM_28  | True                             | Mon,Tue,Wed,Thu,Fri,Sat,Sun | 09:00            | 18:00          | 13:00          | 13:05        |                          0 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999928 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999928"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor28 | Matrix       | visitor28@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor28@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_28  |         1 |         1 | 07:00     | 08:00   | automation | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status              |
      | VM_28  | Visit History | Cancelled (by Host) |

  @VM_29
  Scenario: Visit Request Handling - Auto Rejection Break Hours
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_29  |
    And Delete visitor via API
      | mobilenumber |
      |       999929 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_29 | VM_29 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    When Set parameters of Visit Request Handling
      | HostId | EnableVisitAutoApprovalRejection | WorkingDays                 | WorkingStartTime | WorkingEndTime | BreakStartTime | BreakEndTime | AllowedOverlappingDuration |
      | VM_29  | True                             | Mon,Tue,Wed,Thu,Fri,Sat,Sun | 09:00            | 18:00          | 13:00          | 15:00        |                          0 |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999929 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999929"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor29 | Matrix       | visitor29@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor29@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_29  |         1 |         1 | 14:00     | 14:30   | automation | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status              |
      | VM_29  | Visit History | Cancelled (by Host) |

  @VM_30
  Scenario: Visit Request Handling - Unavailability Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_30  |
    And Delete visitor via API
      | mobilenumber |
      |       999930 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_30 | VM_30 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    When Set parameters of Visit Request Handling
      | HostId | EnableVisitAutoApprovalRejection | WorkingDays                 | WorkingStartTime | WorkingEndTime | BreakStartTime | BreakEndTime | AllowedOverlappingDuration |
      | VM_30  | True                             | Mon,Tue,Wed,Thu,Fri,Sat,Sun | 09:00            | 18:00          | 13:00          | 15:00        |                          5 |
    And Set parameters of Visit Request Handling Unavailability Days for HostId "VM_30"
      | Date | Reason  |
      |    1 | Meeting |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999930 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999930"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor30 | Matrix       | visitor30@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor30@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_30  |         1 |         1 | 10:00     | 11:00   | automation | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status              |
      | VM_30  | Visit History | Cancelled (by Host) |

  @VM_31
  Scenario Outline: Import Visitor and Visit - Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999931 |
    And Set default Visitor Pre-Registration Template
    When Import Data "Visitor and Visit"
      | MobileNo | VisitorName | Organization | EmailID           | Address | City     | State   | Country | PINCode | Gender | DOB        | Nationality | IDProof1 | IDProof2 |
      |   999931 | Visitor31   | Matrix       | visitor31@vms.com | Girnar  | Junagadh | Gujarat | India   |  362640 |      1 | 16/07/1999 | Indian      |      111 |      222 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description       |
      | Visitor Only |  999931 | Success | New Visitor added |
    And Verify visitor in frequent visitor page
      | VMobile | VisitorName |
      |  999931 | Visitor31   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @VM_32
  Scenario Outline: Import Visitor and Visit - Visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_32  |
    And Delete visitor via API
      | mobilenumber |
      |       999932 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_32 | VM_32 |               1 |         1 |               1 |                  1 |                    1 |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile |
      | Visitor32   | Matrix       |  999932 |
    And Set default Visitor Pre-Registration Template
    When Import Data "Visitor and Visit"
      | MobileNo | VisitStartDate | VisitEndDate | VisitStartTime | VisitEndTime | HostUserID | VisitStationID |
      |   999932 |              1 |            1 | 09:00          | 10:00        | VM_32      |              1 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description     |
      | Visit Only   |  999932 | Success | New Visit Added |
    And Verify visit in Visitor Preregistration page
      | VMobile | VisitorName |
      |  999932 | Visitor32   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @VM_33
  Scenario Outline: Import Visitor and Visit - Both
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_33  |
    And Delete visitor via API
      | mobilenumber |
      |       999933 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_33 | VM_33 |               1 |         1 |               1 |                  1 |                    1 |
    And Set default Visitor Pre-Registration Template
    When Import Data "Visitor and Visit"
      | MobileNo | VisitorName | Organization | EmailID           | VisitStartDate | VisitEndDate | VisitStartTime | VisitEndTime | HostUserID | VisitStationID |
      |   999933 | Visitor33   | Matrix       | visitor33@vms.com |              1 |            1 | 09:00          | 10:00        | VM_33      |              1 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description                 |
      | Both         |  999933 | Success | New Visitor and Visit Added |
    And Verify visitor in frequent visitor page
      | VMobile | VisitorName |
      |  999933 | Visitor33   |
    And Verify visit in Visitor Preregistration page
      | VMobile | VisitorName |
      |  999933 | Visitor33   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @VM_34
  Scenario: Visit Components - Visitor Type
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete "Visitor Type" from Visit Components
      | Name             |
      | SoftWareEngineer |
    When Create "Visitor Type" from Visit Components
      | Name             | ColorCode | Default |
      | SoftWareEngineer |    000000 | False   |
    Then Verify "Visitor Type" in Visit template
      | Name             |
      | SoftWareEngineer |

  @VM_35
  Scenario: Visit Components - Visit Type
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete "Visit Type" from Visit Components
      | Name      |
      | ITSupport |
    When Create "Visit Type" from Visit Components
      | Name      | Default |
      | ITSupport | False   |
    Then Verify "Visit Type" in Visit template
      | Name      |
      | ITSupport |

  @VM_36
  Scenario: Visit Components - Vehicle Type
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete "Vehicle Type" from Visit Components
      | Name  |
      | Truck |
    When Create "Vehicle Type" from Visit Components
      | Name  | Default |
      | Truck | False   |
    Then Verify "Vehicle Type" in Visit template
      | Name  |
      | Truck |

  @VM_37
  Scenario: Visit Components - Reader Configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete "Reader Configuration" from Visit Components
      | ResponseTag |
      | VNAME       |
    When Create "Reader Configuration" from Visit Components
      | VMSFieldName | ResponseTag |
      | Visitor Name | VNAME       |

  @VM_38
  Scenario: Station Location - Auto Authorize Visitor Login Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999938 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS38 |
    When Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | VMS38 | Site-1   | False                     | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS38           | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999938 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                                  |
      | Visitor38 | Matrix       | visitor38@vms.com | Request submitted successfully.Try to login after some time |
    And Go to previous Tab
    Then Visitor Login Authorization from VMS module
      | FromDate | ToDate | VMobile | Approval |
      |        0 |      0 |  999938 | Reject   |
    And Go to next Tab
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation                                                                                        |
      |      999938 | Previous Request was rejected and New Request submitted successfully.Try to login after some time |
    And Go to previous Tab
    Then Visitor Login Authorization from VMS module
      | FromDate | ToDate | VMobile | Approval |
      |        0 |      0 |  999938 | Approve  |
    And Go to next Tab
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999938 | Create Visit |

  @VM_39
  Scenario: Station Location - Auto Authorize Visitor Login Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999939 |
    And Delete Station Location from VMS module
      | Name      |
      | Station39 |
    When Create station location from visitor module
      | Name      | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | Station39 | Site-1   | True                      | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | Station39       | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999939 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation   |
      | Visitor38 | Matrix       | visitor38@vms.com | Create Visit |

  @VM_40
  Scenario: Station Location - Visitor Template
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete Station Location from VMS module
      | Name      |
      | Station40 |
    And Delete Visitor Template
      | Name          |
      | VisitorTemp40 |
    And Create Visitor Template "VisitorTemp40"
      | Panel | FieldName     | Type | Mandatory | Active |
      | Basic | Visitor Photo |      | True      | True   |
      | Basic | Email ID      |      | True      | True   |
      | Basic | Organization  |      | True      | True   |
    When Create station location from visitor module
      | Name      | SiteName | AutoAuthorizeVisitorLogin | VisitorTemplate | Validation         |
      | Station40 | Site-1   | True                      | VisitorTemp40   | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | Station40       | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999940 | Profile    |
    Then Verify Visitor profile fields
      | FieldName     | Mandatory | Active |
      | Visitor Photo | True      | True   |
      | Email ID      | True      | True   |
      | Organization  | True      | True   |

  @VM_41
  Scenario: Station Location - Visit Template
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999941 |
    And Delete Station Location from VMS module
      | Name      |
      | Station41 |
    And Delete Visitor Template
      | Name          |
      | VisitorTemp41 |
    And Delete Visit Template
      | Name        |
      | VisitTemp41 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_41 | VM_41 |               1 |         1 |               1 |                  1 |                    1 |
    And Create Visitor Template "VisitorTemp41"
      | Panel | FieldName     | Type | Mandatory | Active |
      | Basic | Visitor Photo |      | False     | True   |
      | Basic | Email ID      |      | False     | True   |
    And Create Visit Template "VisitTemp41"
      | Panel | FieldName     | Type | Mandatory | Active |
      | Visit | Visit Purpose |      | True      | True   |
    When Create station location from visitor module
      | Name      | SiteName | AutoAuthorizeVisitorLogin | VisitorTemplate | VisitTemplate | Validation         |
      | Station41 | Site-1   | True                      | VisitorTemp41   | VisitTemp41   | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | Station41       | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999941 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | validation   |
      | Visitor41 | Matrix       | Create Visit |
    Then Verify Visit fields
      | FieldName     | Mandatory |
      | Host ID       | True      |
      | Start Date    | True      |
      | End Date      | True      |
      | Start Time    | True      |
      | End Time      | True      |
      | Visit Purpose | True      |

  @VM_42
  Scenario: Station Location - Visit Creation on Current Date Disable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_42  |
    And Delete visitor via API
      | mobilenumber |
      |       999942 |
    And Delete Station Location from VMS module
      | Name      |
      | Station42 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_42 | VM_42 |               1 |         1 |               1 |                  1 |                    1 |
    When Create station location from visitor module
      | Name      | SiteName | AutoAuthorizeVisitorLogin | VisitCreationonCurrentDate | Validation         |
      | Station42 | Site-1   | True                      | False                      | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | Station42       | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999942 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation   |
      | Visitor42 | Matrix       | visitor42@vms.com | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation                                  |
      | VM_42  |         0 |         0 |        60 |     120 | automation | Visit Start Date should not be Current Date |

  @VM_43
  Scenario: Station Location - Visit Creation on Current Date Enable
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_43  |
    And Delete visitor via API
      | mobilenumber |
      |       999943 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_43 | VM_43 |               1 |         1 |               1 |                  1 |                    1 |
    When Create station location from visitor module
      | Name      | SiteName | AutoAuthorizeVisitorLogin | VisitCreationonCurrentDate | Validation         |
      | Station43 | Site-1   | True                      | True                       | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | Station43       | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999943 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation   |
      | Visitor43 | Matrix       | visitor43@vms.com | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_43  |         0 |         0 |        60 |     120 | automation | Visit Created |

  @VM_44
  Scenario: Visitor Events
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_44  |
    And Delete visitor via API
      | mobilenumber |
      |       999944 |
    And create visitor profile via API
      | id   | name | active |
      | VP44 | VP44 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_44 | VM_44 |               1 |         1 |               1 |                  1 |                    1 |
    And Create station location from visitor module
      | Name             | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | Default Location | Site-1   | True                      | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | Visitor44    | Matrix            |    999944 | visitor44@vms.com | VM_44   | SA        | Default Location   |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999944 | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_44  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_44  | Checked-Out successfully. |
    And Go to previous Tab
    Then Verify Visitor events from VMS module
      | FromDate | ToDate | VMobile | EventCount |
      |        0 |      0 |  999944 |          2 |

  @VM_45
  Scenario: Watchlist - Add to watchlist and create visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_45  |
    And Delete visitor via API
      | mobilenumber |
      |       999945 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_45 | VM_45 |               1 |         1 |               1 |                  1 |                    1 |
    And Create station location from visitor module
      | Name             | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | Default Location | Site-1   | True                      | Saved Successfully |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile | VEmail            |
      | Visitor45   | Matrix       |  999945 | visitor45@vms.com |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |          999945 | Watchlist | Saved Successfully |
    Then Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999945 | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_45  |         0 |         0 |        60 |     120 | automation | Visit Created |

  @VM_46
  Scenario: Watchlist - Add to watchlist and remove from watchlist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_46  |
    And Delete visitor via API
      | mobilenumber |
      |       999946 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_46 | VM_46 |               1 |         1 |               1 |                  1 |                    1 |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile |
      | Visitor46   | Matrix       |  999946 |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |          999946 | Watchlist | Saved Successfully |
    And Restore Visitor from Watchlist or Blacklist
      | VMobile |
      |  999946 |

  @VM_47
  Scenario: Blacklist - Add to Blacklist and create visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_47  |
    And Delete visitor via API
      | mobilenumber |
      |       999947 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_47 | VM_47 |               1 |         1 |               1 |                  1 |                    1 |
    And Create station location from visitor module
      | Name             | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | Default Location | Site-1   | True                      | Saved Successfully |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile | VEmail            |
      | Visitor47   | Matrix       |  999947 | visitor47@vms.com |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |          999947 | Blacklist | Saved Successfully |
    Then Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999947 | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation                                       |
      | VM_47  |         0 |         0 |        60 |     120 | automation | Visit not allowed. Please contact administrator. |

  @VM_48
  Scenario: Blacklist - Add to Blacklist and remove from Blacklist
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_48  |
    And Delete visitor via API
      | mobilenumber |
      |       999948 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_48 | VM_48 |               1 |         1 |               1 |                  1 |                    1 |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile |
      | Visitor48   | Matrix       |  999948 |
    When Add Visitor in Watchlist or Blacklist from Visitor module
      | VisitorMobileNo | AddIn     | Validation         |
      |          999948 | Blacklist | Saved Successfully |
    And Restore Visitor from Watchlist or Blacklist
      | VMobile |
      |  999948 |

  @VM_49
  Scenario: Visitor History
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_49  |
    And Delete visitor via API
      | mobilenumber |
      |       999949 |
    And create visitor profile via API
      | id   | name | active |
      | VP49 | VP49 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_49 | VM_49 |               1 |         1 |               1 |                  1 |                    1 |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | Visitor49    | Matrix            |    999949 | visitor49@vms.com | VM_49   | SA        | Default Location   |
    When Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            0 | SA        |         0 |       0 | VM_49  |
      |         0 |            5 | SA        |         0 |       0 | VM_49  |
    Then Verify Visitor history from VMS module
      | VName     | VMobile | VStartDate | VEndDate | HostId |
      | Visitor49 |  999949 |          0 |        0 | VM_49  |

  @VM_50
  Scenario: Authorized Host Users from User configuration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_501 |
      | VM_502 |
      | VM_503 |
    When Create user from user configuration
      | userid | Active | AtdEnable | AuthorizedHostUser | Validation         |
      | VM_501 | True   | True      | True               | Saved Successfully |
      | VM_502 | True   | True      | True               | Saved Successfully |
      | VM_503 | True   | True      | True               | Saved Successfully |
    Then Verify host users from VMS module
      | userid |
      | VM_501 |
      | VM_502 |
      | VM_503 |

  @VM_51
  Scenario: Authorize Host Users from Authorized Host Users
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_511 |
      | VM_512 |
      | VM_513 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_511 | VM_511 |               1 |         1 |               1 |                  1 |                    0 |
      | VM_512 | VM_512 |               1 |         1 |               1 |                  1 |                    0 |
      | VM_513 | VM_513 |               1 |         1 |               1 |                  1 |                    0 |
    When Add users in Authorized Host Users from VMS module
      | SelectUsers | UserIDs              |
      | User Wise   | VM_511,VM_512,VM_513 |
    Then Verify User in User Configuration Page
      | UserID | AuthorizedHostUser |
      | VM_511 | True               |
      | VM_512 | True               |
      | VM_513 | True               |

  @VM_52
  Scenario: Delete Frequent Visitors
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile |
      | Visitor521  | Matrix       | 9999521 |
      | Visitor522  | Matrix       | 9999522 |
      | Visitor523  | Matrix       | 9999523 |
    And Delete visitor from Delete Frequent Visitors page
      | VMobile |
      | 9999521 |
      | 9999522 |
      | 9999523 |

  @VM_53
  Scenario: Auto Profile Assignment  - 2 Organizations
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_531 |
      | VM_532 |
    And Delete visitor via API
      | mobilenumber |
      |      9999531 |
      |      9999532 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_531 | VM_531 |               1 |         1 |               1 |                  1 |                    1 |
      | VM_532 | VM_532 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AutoProfileAssignment | MatchingLevel | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                  | Organization  | Not Required                  | Not Required                 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | OVM531 | OVM531 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | VM_531 | OVM531       |        |            |         |          |       |             |                |                |                | Saved Successfully |
      | VM_532 | OVM531       |        |            |         |          |       |             |                |                |                | Saved Successfully |
    And Create Visitor Profile from VMS module
      | ID    | Active | Validation         |
      | VP531 | True   | Saved Successfully |
    And Assign groups to Visitor profile from VMS module
      | ProfileID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | VP531     | OVM531       |        |            |         |          |       |             |                |                |                | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email              | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | Visitor531   | Matrix            |   9999531 | visitor531@vms.com | VM_531  | SA        | Default Location   |
      |         0 |          0 |                0 |                1 |              5 | Visitor532   | Matrix            |   9999532 | visitor532@vms.com | VM_532  | SA        | Default Location   |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |     9999531 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999531"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_531 | Checked-In |
    And Exit from Visitor login
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |     9999532 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999532"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation                                            |
      | VM_532 | Host group matching criteria failed. Cannot Check-in. |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | AutoProfileAssignment |
      | False                 |

  @VM_54
  Scenario: Auto Profile Assignment  - 2 Organizations & Branch
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_541 |
    And Delete visitor via API
      | mobilenumber |
      |      9999541 |
    And create visitor profile via API
      | id    | name  | active |
      | VP541 | VP541 |      1 |
    And Create User via api
      | Id     | name   | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_541 | VM_541 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AutoProfileAssignment | MatchingLevel       | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                  | Organization,Branch | Not Required                  | Not Required                 |
    And Create Enterprise group from Enterprise module
      | Group        | Name   | Code   | Validation         |
      | Organization | OVM541 | OVM541 | Saved Successfully |
      | Branch       | BVM541 | BVM541 | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | VM_541 | OVM541       | BVM541 |            |         |          |       |             |                |                |                | Saved Successfully |
    And Create Visitor Profile from VMS module
      | ID    | Name  | Active | Validation         |
      | VP541 | VP541 | True   | Saved Successfully |
    And Assign groups to Visitor profile from VMS module
      | ProfileID | Organization | Branch | Department | Section | Category | Grade | Designation | Custom Group 1 | Custom Group 2 | Custom Group 3 | Validation         |
      | VP541     | OVM541       |        |            |         |          |       |             |                |                |                | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email              | host-id | appliedBy | visit-station-name |
      |         0 |          0 |                0 |                1 |              5 | Visitor541   | Matrix            |   9999541 | visitor541@vms.com | VM_541  | SA        | Default Location   |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |     9999541 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999541"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation                                            |
      | VM_541 | Host group matching criteria failed. Cannot Check-in. |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | AutoProfileAssignment |
      | False                 |

  @VM_55
  Scenario: Approvals - Host Initiated, Security Disable, Always - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_55    |
      | VMRIC_55 |
    And Delete visitor via API
      | mobilenumber |
      |       999955 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_55    | VM_55    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_55 | VMRIC_55 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS55RICGrp      |        1 | VMRIC_55 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_55  | VMS55RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_55    |                          1 | admin        |    1 |
      | VMRIC_55 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_55    | admin    | Welcome VM_55 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_55    | Visitor55 |  999955 | visitor55@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_55 | admin    | Welcome VMRIC_55 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_55  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor55 |  999955 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_56
  Scenario: Approvals - Host Initiated, Security Disable, Always - RIC Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_56    |
      | VMRIC_56 |
    And Delete visitor via API
      | mobilenumber |
      |       999956 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_56    | VM_56    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_56 | VMRIC_56 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS56RICGrp      |        1 | VMRIC_56 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_56  | VMS56RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_56    |                          1 | admin        |    1 |
      | VMRIC_56 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | False                           |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_56    | admin    | Welcome VM_56 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_56    | Visitor56 |  999956 | visitor56@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_56 | admin    | Welcome VMRIC_56 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_56  | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor56 |  999956 | Rejected    | Rejected          |                         |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_57
  Scenario: Approvals - Host Initiated, Security Disable, Visit Outside The Shift  - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_57    |
      | VMRIC_57 |
    And Delete visitor via API
      | mobilenumber |
      |       999957 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_57    | VM_57    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_57 | VMRIC_57 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS57RICGrp      |        1 | VMRIC_57 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_57  | VMS57RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_57    |                          1 | admin        |    1 |
      | VMRIC_57 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_57  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_57  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_57  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_57  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_57    | admin    | Welcome VM_57 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_57    | Visitor57 |  999957 | visitor57@vms.com | Matrix        |         1 |       1 | 06:00     | 07:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_57 | admin    | Welcome VMRIC_57 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_57  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor57 |  999957 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_58
  Scenario: Approvals - Host Initiated, Security Disable, Visit within Shift  - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_58    |
      | VMRIC_58 |
    And Delete visitor via API
      | mobilenumber |
      |       999958 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_58    | VM_58    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_58 | VMRIC_58 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS58RICGrp      |        1 | VMRIC_58 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_58  | VMS58RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_58    |                          1 | admin        |    1 |
      | VMRIC_58 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_58  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_58  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_58  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_58  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_58    | admin    | Welcome VM_58 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_58    | Visitor58 |  999958 | visitor58@vms.com | Matrix        |         1 |       1 | 10:00     | 11:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor58 |  999958 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_59
  Scenario: Approvals - Host Initiated, Security Disable, Visit Outside The Shift  - RIC Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_59    |
      | VMRIC_59 |
    And Delete visitor via API
      | mobilenumber |
      |       999959 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_59    | VM_59    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_59 | VMRIC_59 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS59RICGrp      |        1 | VMRIC_59 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_59  | VMS59RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_59    |                          1 | admin        |    1 |
      | VMRIC_59 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_59  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_59  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_59  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_59  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_59    | admin    | Welcome VM_59 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_59    | Visitor59 |  999959 | visitor59@vms.com | Matrix        |         1 |       1 | 06:00     | 07:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_59 | admin    | Welcome VMRIC_59 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_59  | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor59 |  999959 | Rejected    | Rejected          |                         |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_60
  Scenario: Approvals - Host Initiated, Security Disable, Not Required
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_60    |
      | VMRIC_60 |
    And Delete visitor via API
      | mobilenumber |
      |       999960 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_60    | VM_60    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_60 | VMRIC_60 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS60RICGrp      |        1 | VMRIC_60 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_60  | VMS60RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_60    |                          1 | admin        |    1 |
      | VMRIC_60 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_60    | admin    | Welcome VM_60 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_60    | Visitor60 |  999960 | visitor60@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor60 |  999960 | Approved    | Approved          | Approved                |

  @VM_61
  Scenario: Approvals - Host Initiated, Security Enable, Always - RIC Approve - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_61" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_61    |
      | VMRIC_61 |
    And Delete visitor via API
      | mobilenumber |
      |       999961 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_61    | VM_61    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_61 | VMRIC_61 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS61RICGrp      |        1 | VMRIC_61 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_61  | VMS61RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_61 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_61    |                          1 | admin        |    1 |
      | VMRIC_61 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | True                            |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_61    | admin    | Welcome VM_61 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_61    | Visitor61 |  999961 | visitor61@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_61 | admin    | Welcome VMRIC_61 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_61  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor61 |  999961 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_61 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_61 | admin    | Welcome SA_VM_61 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_61  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor61 |  999961 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_62
  Scenario: Approvals - Host Initiated, Security Enable, Always - RIC Approve - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_62" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_62    |
      | VMRIC_62 |
    And Delete visitor via API
      | mobilenumber |
      |       999962 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_62    | VM_62    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_62 | VMRIC_62 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS62RICGrp      |        1 | VMRIC_62 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_62  | VMS62RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_62 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_62    |                          1 | admin        |    1 |
      | VMRIC_62 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Always                        | True                            |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_62    | admin    | Welcome VM_62 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_62    | Visitor62 |  999962 | visitor62@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_62 | admin    | Welcome VMRIC_62 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_62  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor62 |  999962 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_62 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_62 | admin    | Welcome SA_VM_62 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_62  | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor62 |  999962 | Rejected    | Approved          | Rejected                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_63
  Scenario: Approvals - Host Initiated, Security Enable, Visit Outside The Shift  - RIC Approve -  Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_63" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_63    |
      | VMRIC_63 |
    And Delete visitor via API
      | mobilenumber |
      |       999963 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_63    | VM_63    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_63 | VMRIC_63 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS63RICGrp      |        1 | VMRIC_63 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_63  | VMS63RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_63 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_63    |                          1 | admin        |    1 |
      | VMRIC_63 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | True                            |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_63  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_63  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_63  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_63  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_63    | admin    | Welcome VM_63 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_63    | Visitor63 |  999963 | visitor63@vms.com | Matrix        |         1 |       1 | 06:00     | 07:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_63 | admin    | Welcome VMRIC_63 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_63  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor63 |  999963 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_63 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_63 | admin    | Welcome SA_VM_63 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_63  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor63 |  999963 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_64
  Scenario: Approvals - Host Initiated, Security Enable, Visit within Shift  - RIC Approve - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_64" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_64    |
      | VMRIC_64 |
    And Delete visitor via API
      | mobilenumber |
      |       999964 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_64    | VM_64    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_64 | VMRIC_64 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS64RICGrp      |        1 | VMRIC_64 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_64  | VMS64RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_64 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_64    |                          1 | admin        |    1 |
      | VMRIC_64 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | True                            |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_64  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_64  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_64  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_64  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_64    | admin    | Welcome VM_64 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_64    | Visitor64 |  999964 | visitor64@vms.com | Matrix        |         1 |       1 | 10:00     | 11:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor64 |  999964 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_64 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_64 | admin    | Welcome SA_VM_64 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_64  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor64 |  999964 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_65
  Scenario: Approvals - Host Initiated, Security Enable, Visit Outside The Shift  - RIC Approve - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_65" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_65    |
      | VMRIC_65 |
    And Delete visitor via API
      | mobilenumber |
      |       999965 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_65    | VM_65    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_65 | VMRIC_65 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS65RICGrp      |        1 | VMRIC_65 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_65  | VMS65RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_65 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_65    |                          1 | admin        |    1 |
      | VMRIC_65 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift       | True                            |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_65  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_65  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_65  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_65  |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_65    | admin    | Welcome VM_65 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_65    | Visitor65 |  999965 | visitor65@vms.com | Matrix        |         1 |       1 | 06:00     | 07:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_65 | admin    | Welcome VMRIC_65 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_65  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor65 |  999965 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_65 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_65 | admin    | Welcome SA_VM_65 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_65  | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor65 |  999965 | Rejected    | Approved          | Rejected                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_66
  Scenario: Approvals - Host Initiated, Security Enable, Not Required - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_66" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_66    |
      | VMRIC_66 |
    And Delete visitor via API
      | mobilenumber |
      |       999966 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_66    | VM_66    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_66 | VMRIC_66 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS66RICGrp      |        1 | VMRIC_66 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_66  | VMS66RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_66 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_66    |                          1 | admin        |    1 |
      | VMRIC_66 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | True                            |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_66    | admin    | Welcome VM_66 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_66    | Visitor66 |  999966 | visitor66@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor66 |  999966 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_66 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_66 | admin    | Welcome SA_VM_66 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_66  | Approve  |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor66 |  999966 | Approved    | Approved          | Approved                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_67
  Scenario: Approvals - Host Initiated, Security Enable, Not Required - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_67" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_67    |
      | VMRIC_67 |
    And Delete visitor via API
      | mobilenumber |
      |       999967 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_67    | VM_67    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_67 | VMRIC_67 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS67RICGrp      |        1 | VMRIC_67 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_67  | VMS67RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_67 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_67    |                          1 | admin        |    1 |
      | VMRIC_67 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | True                            |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_67    | admin    | Welcome VM_67 |
    And Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_67    | Visitor67 |  999967 | visitor67@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor67 |  999967 | Applied     | Approved          |                         |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_67 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_67 | admin    | Welcome SA_VM_67 |
    And Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_67  | Reject   |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify visit status from visitor preregistration page
      | VName     | VMobile | VisitStatus | RICApprovalStatus | SecurityClearanceStatus |
      | Visitor67 |  999967 | Rejected    | Approved          | Rejected                |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |

  @VM_68
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_68  |
    And Delete visitor via API
      | mobilenumber |
      |       999968 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_68 | VM_68 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_68  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999968 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999968"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor68 | Matrix       | visitor68@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor68@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_68  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_68    | admin    | Welcome VM_68 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor68 | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status              |
      | VM_68  | Visit History | Cancelled (by Host) |

  @VM_69
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Always - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_69    |
      | VMRIC_69 |
    And Delete visitor via API
      | mobilenumber |
      |       999969 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_69    | VM_69    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_69 | VMRIC_69 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS69RICGrp      |        1 | VMRIC_69 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_69  | VMS69RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_69    |                          1 | admin        |    1 |
      | VMRIC_69 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Always                       | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999969 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999969"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor69 | Matrix       | visitor69@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor69@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_69  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_69    | admin    | Welcome VM_69 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor69 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_68  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_69 | admin    | Welcome VMRIC_69 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_69  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_69  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_70
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Always - RIC Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_70    |
      | VMRIC_70 |
    And Delete visitor via API
      | mobilenumber |
      |       999970 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_70    | VM_70    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_70 | VMRIC_70 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS70RICGrp      |        1 | VMRIC_70 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_70  | VMS70RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_70    |                          1 | admin        |    1 |
      | VMRIC_70 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Always                       | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999970 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999970"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor70 | Matrix       | visitor70@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor70@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_70  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_70    | admin    | Welcome VM_70 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor70 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_70  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_70 | admin    | Welcome VMRIC_70 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_70  | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status                          |
      | VM_70  | Visit History | Cancelled (by Host's Authority) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_71
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Visit Outside The Shift - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_71    |
      | VMRIC_71 |
    And Delete visitor via API
      | mobilenumber |
      |       999971 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_71    | VM_71    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_71 | VMRIC_71 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS71RICGrp      |        1 | VMRIC_71 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_71  | VMS71RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_71    |                          1 | admin        |    1 |
      | VMRIC_71 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift      | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_71  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_71  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_71  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_71  |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999971 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999971"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor71 | Matrix       | visitor71@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor71@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_71  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_71    | admin    | Welcome VM_71 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor71 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_71  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_71 | admin    | Welcome VMRIC_71 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_71  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_71  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_72
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Visit within Shift - RIC Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_72    |
      | VMRIC_72 |
    And Delete visitor via API
      | mobilenumber |
      |       999972 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_72    | VM_72    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_72 | VMRIC_72 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS72RICGrp      |        1 | VMRIC_72 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_72  | VMS72RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_72    |                          1 | admin        |    1 |
      | VMRIC_72 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift      | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_72  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_72  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_72  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_72  |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999972 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999972"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor72 | Matrix       | visitor72@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor72@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_72  |         1 |         1 | 10:00     | 11:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_72    | admin    | Welcome VM_72 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor72 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_72  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_73
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Visit Outside The Shift - RIC Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_73    |
      | VMRIC_73 |
    And Delete visitor via API
      | mobilenumber |
      |       999973 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_73    | VM_73    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_73 | VMRIC_73 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS73RICGrp      |        1 | VMRIC_73 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_73  | VMS73RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_73    |                          1 | admin        |    1 |
      | VMRIC_73 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift      | False                           |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_73  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_73  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_73  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_73  |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999973 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999973"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor73 | Matrix       | visitor73@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor73@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_73  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_73    | admin    | Welcome VM_73 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor73 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_73  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_73 | admin    | Welcome VMRIC_73 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_73  | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status                          |
      | VM_73  | Visit History | Cancelled (by Host's Authority) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_74
  Scenario: Approvals - Visitor Initiated, Security Disable, Host Approve - Not Required
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID   |
      | VM_74    |
      | VMRIC_74 |
    And Delete visitor via API
      | mobilenumber |
      |       999974 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_74    | VM_74    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_74 | VMRIC_74 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS74RICGrp      |        1 | VMRIC_74 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_74  | VMS74RICGrp    |                |            |              | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_74    |                          1 | admin        |    1 |
      | VMRIC_74 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999974 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999974"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor74 | Matrix       | visitor74@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor74@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_74  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_74    | admin    | Welcome VM_74 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor74 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_74  | Scheduled Visits | Accepted |

  @VM_75
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Always - RIC Approve - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_75" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_75    |
      | VMRIC_75 |
    And Delete visitor via API
      | mobilenumber |
      |       999975 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_75    | VM_75    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_75 | VMRIC_75 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS75RICGrp      |        1 | VMRIC_75 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_75  | VMS75RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_75 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_75    |                          1 | admin        |    1 |
      | VMRIC_75 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Always                       | True                            |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999975 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999975"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor75 | Matrix       | visitor75@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor75@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_75  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_75    | admin    | Welcome VM_75 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor75 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_75  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_75 | admin    | Welcome VMRIC_75 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_75  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_75  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_75 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_75 | admin    | Welcome SA_VM_75 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_75  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_75  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_76
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Always - RIC Approve - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_76" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_76    |
      | VMRIC_76 |
    And Delete visitor via API
      | mobilenumber |
      |       999976 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_76    | VM_76    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_76 | VMRIC_76 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS76RICGrp      |        1 | VMRIC_76 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_76  | VMS76RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_76 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_76    |                          1 | admin        |    1 |
      | VMRIC_76 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Always                       | True                            |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999976 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999976"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor76 | Matrix       | visitor76@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor76@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_76  |         1 |         1 | 06:00     | 21:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_76    | admin    | Welcome VM_76 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor76 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_76  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_76 | admin    | Welcome VMRIC_76 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_76  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_76  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_76 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_76 | admin    | Welcome SA_VM_76 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_76  | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status                  |
      | VM_76  | Visit History | Cancelled (by Security) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_77
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Visit Outside The Shift - RIC Approve - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_77" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_77    |
      | VMRIC_77 |
    And Delete visitor via API
      | mobilenumber |
      |       999977 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_77    | VM_77    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_77 | VMRIC_77 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS77RICGrp      |        1 | VMRIC_77 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_77  | VMS77RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_77 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_77    |                          1 | admin        |    1 |
      | VMRIC_77 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift      | True                            |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_77  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_77  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_77  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_77  |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999977 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999977"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor77 | Matrix       | visitor77@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor77@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_77  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_77    | admin    | Welcome VM_77 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor77 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_77  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_77 | admin    | Welcome VMRIC_77 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_77  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_77  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_77 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_77 | admin    | Welcome SA_VM_77 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_77  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_77  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_78
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Visit Outside The Shift - RIC Approve - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_78" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_78    |
      | VMRIC_78 |
    And Delete visitor via API
      | mobilenumber |
      |       999978 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_78    | VM_78    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_78 | VMRIC_78 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS78RICGrp      |        1 | VMRIC_78 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_78  | VMS78RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_78 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_78    |                          1 | admin        |    1 |
      | VMRIC_78 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Visit Outside The Shift      | True                            |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | VM_78  |
    And Run Shift Process for Month = "1" and Year = "0"
      | UserID |
      | VM_78  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | VM_78  |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "1" and Year = "0"
      | UserID |
      | VM_78  |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999978 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999978"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor78 | Matrix       | visitor78@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor78@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_78  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_78    | admin    | Welcome VM_78 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor78 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_78  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation       |
      | VMRIC_78 | admin    | Welcome VMRIC_78 |
    When Approval of RIC from Visit Registration Approval page in ESS
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_78  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_78  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_78 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_78 | admin    | Welcome SA_VM_78 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_78  | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status                  |
      | VM_78  | Visit History | Cancelled (by Security) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_79
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Not Required - Security Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_79" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_79    |
      | VMRIC_79 |
    And Delete visitor via API
      | mobilenumber |
      |       999979 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_79    | VM_79    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_79 | VMRIC_79 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS79RICGrp      |        1 | VMRIC_79 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_79  | VMS79RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_79 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_79    |                          1 | admin        |    1 |
      | VMRIC_79 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | True                            |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999979 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999979"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor79 | Matrix       | visitor79@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor79@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_79  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_79    | admin    | Welcome VM_79 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor79 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_79  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_79 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_79 | admin    | Welcome SA_VM_79 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_79  | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_79  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_80
  Scenario: Approvals - Visitor Initiated, Security Enable, Host Approve - Not Required - Security Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_VM_80" from System Accounts page
    And Delete user via API
      | UserID   |
      | VM_80    |
      | VMRIC_80 |
    And Delete visitor via API
      | mobilenumber |
      |       999980 |
    And Create User via api
      | Id       | name     | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_80    | VM_80    |               1 |         1 |               1 |                  1 |                    1 |
      | VMRIC_80 | VMRIC_80 |               1 |         1 |               1 |                  1 |                    0 |
    And Create Reporting Group
      | ReportingGroupId | PolicyId | RIC1     | RIC2 | RIC3 | RIC4 | RIC5 | Validation         |
      | VMS80RICGrp      |        1 | VMRIC_80 |      |      |      |      | Saved Successfully |
    And Assign groups to user from user configuration
      | UserID | ReportingGroup | ApprovalPolicy | LeaveGroup | WeekOffGroup | Validation         |
      | VM_80  | VMS80RICGrp    |                |            |              | Saved Successfully |
    And Create New System Account User
      | SAUser   | ValidationMessage  |
      | SA_VM_80 | Saved Successfully |
    And Set Password via API
      | Userid   | user-verified-for-password | new-password | type |
      | VM_80    |                          1 | admin        |    1 |
      | VMRIC_80 |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | True                            |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999980 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999980"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor80 | Matrix       | visitor80@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor80@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_80  |         1 |         1 | 06:00     | 07:00   | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_80    | admin    | Welcome VM_80 |
    When Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        1 |      1 | Visitor80 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_80  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_VM_80 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation       |
      | SA_VM_80 | admin    | Welcome SA_VM_80 |
    When Approval of Security from Security Approval page in VMS module
      | FromDate | ToDate | HostID | Approval |
      |        1 |      1 | VM_80  | Reject   |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status                  |
      | VM_80  | Visit History | Cancelled (by Security) |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass |
      | Not Required                 | False                           |

  @VM_81
  Scenario: Approvals - Required Visitor Acceptance Enable - Visitor Approve
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_81  |
    And Delete visitor via API
      | mobilenumber |
      |       999981 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_81 | VM_81 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_81  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | True                      |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_81    | admin    | Welcome VM_81 |
    When Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_81    | Visitor81 |  999981 | visitor81@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999981 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999981"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_81  | Scheduled Visits | Pending (Initiated by Host) |
    When Approval of Visitor from visitor portal
      | HostID | Approval |
      | VM_81  | Approve  |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_81  | Scheduled Visits | Accepted |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |

  @VM_82
  Scenario: Approvals - Required Visitor Acceptance Enable - Visitor Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_82  |
    And Delete visitor via API
      | mobilenumber |
      |       999982 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_82 | VM_82 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_82  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | True                      |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_82    | admin    | Welcome VM_82 |
    When Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_82    | Visitor82 |  999982 | visitor82@vms.com | Matrix        |         1 |       1 | 06:00     | 21:00   | PreregistrationFromESS | Default Location | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999982 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999982"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_82  | Scheduled Visits | Pending (Initiated by Host) |
    When Approval of Visitor from visitor portal
      | HostID | Approval |
      | VM_82  | Reject   |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel    | Status             |
      | VM_82  | Visit History | Cancelled (by You) |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |

  @VM_83
  Scenario: Forms - Login Visitor - Failed form execution
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_83  |
    And Delete visitor via API
      | mobilenumber |
      |       999983 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS83 |
    And Delete Visitor Form "VMForm83" from Database
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_83 | VM_83 |               1 |         1 |               1 |                  1 |                    1 |
    And create visitor profile via API
      | id  | name | active |
      | v83 | v83  |      1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_83 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm83 | VM_AG_83  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | LoginFormName | LoginExecutionOn | LoginValidity | LoginValDuration | Validation         |
      | VMS83 | Site-1   | True                      | VMForm83      | All Logins       |               |                  | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor83    | Matrix            |    999983 | visitor83@vms.com | VM_83   | VMS83              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS83           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999983 | Visitor Form |
    And Submit visitor form
      | Answer1  | validation                        |
      | Option 2 | Eligibility criteria not achieved |
    Then verify visitor login successfully or not
      | Login |
      | No    |

  @VM_84
  Scenario: Forms - Login Visitor - Pass form execution and All login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_84  |
    And Delete visitor via API
      | mobilenumber |
      |       999984 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS84 |
    And Delete Visitor Form "VMForm84" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP84 | VP84 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_84 | VM_84 |               1 |         1 |               1 |                  1 |                    1 |
    And create visitor profile via API
      | id  | name | active |
      | v85 | v85  |      1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_84 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm84 | VM_AG_84  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | LoginFormName | LoginExecutionOn | LoginValidity | LoginValDuration | Validation         |
      | VMS84 | Site-1   | True                      | VMForm84      | All Logins       |               |                  | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor84    | Matrix            |    999984 | visitor84@vms.com | VM_84   | VMS84              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS84           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999984 | Visitor Form |
    And Submit visitor form
      | Answer1  | validation                    |
      | Option 1 | Eligibility criteria achieved |
    Then verify visitor login successfully or not
      | Login |
      | Yes   |
    And Exit from Visitor login
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999984 | Visitor Form |
    And Submit visitor form
      | Answer1  | validation                    |
      | Option 1 | Eligibility criteria achieved |
    Then verify visitor login successfully or not
      | Login |
      | Yes   |

  @VM_85
  Scenario: Forms - Login Visitor - Pass form execution and First Login
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_85  |
    And Delete visitor via API
      | mobilenumber |
      |       999985 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS85 |
    And Delete Visitor Form "VMForm85" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP85 | VP85 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_85 | VM_85 |               1 |         1 |               1 |                  1 |                    1 |
    And create visitor profile via API
      | id  | name | active |
      | v85 | v85  |      1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_85 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm85 | VM_AG_85  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | LoginFormName | LoginExecutionOn | LoginValidity | LoginValDuration | Validation         |
      | VMS85 | Site-1   | True                      | VMForm85      | First Login      |             2 | Day(s)           | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor85    | Matrix            |    999985 | visitor85@vms.com | VM_85   | VMS85              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS85           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999985 | Visitor Form |
    And Submit visitor form
      | Answer1  | validation                    |
      | Option 1 | Eligibility criteria achieved |
    Then verify visitor login successfully or not
      | Login |
      | Yes   |
    And Exit from Visitor login
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999985 | Create Visit |

  @VM_86
  Scenario: Forms - CheckIn Visit - Failed form execution
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_86  |
    And Delete visitor via API
      | mobilenumber |
      |       999986 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS86 |
    And Delete Visitor Form "VMForm86" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP86 | VP86 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_86 | VM_86 |               1 |         1 |               1 |                  1 |                    1 |
    And create visitor profile via API
      | id  | name | active |
      | v86 | v86  |      1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_86 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm86 | VM_AG_86  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      | VMS86 | Site-1   | True                      | VMForm86        | All Visits         |                 |                    | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor86    | Matrix            |    999986 | visitor86@vms.com | VM_86   | VMS86              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS86           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999986 | Create Visit |
    And CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                        |
      | VM_86  | Option 2 | Eligibility criteria not achieved |
    Then verify visit CheckIn successfully or not
      | HostId | CheckIn |
      | VM_86  | No      |

  @VM_87
  Scenario: Forms - CheckIn Visit - Pass form execution and All visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_87  |
    And Delete visitor via API
      | mobilenumber |
      |       999987 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS87 |
    And Delete Visitor Form "VMForm87" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP87 | VP87 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_87 | VM_87 |               1 |         1 |               1 |                  1 |                    1 |
    And create visitor profile via API
      | id  | name | active |
      | v87 | v87  |      1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_87 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm87 | VM_AG_87  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      | VMS87 | Site-1   | True                      | VMForm87        | All Visits         |                 |                    | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor87    | Matrix            |    999987 | visitor87@vms.com | VM_87   | VMS87              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS87           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999987 | Create Visit |
    And CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_87  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckIn successfully or not
      | HostId | CheckIn |
      | VM_87  | Yes     |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_87  | Checked-Out successfully. |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor87    | Matrix            |    999987 | visitor87@vms.com | VM_87   | VMS87              | SA        |
    And CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_87  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckIn successfully or not
      | HostId | CheckIn |
      | VM_87  | Yes     |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_87  | Checked-Out successfully. |

  @VM_88
  Scenario: Forms - CheckIn Visit - Pass form execution and First visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_88  |
    And Delete visitor via API
      | mobilenumber |
      |       999988 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS88 |
    And Delete Visitor Form "VMForm88" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP88 | VP88 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_88 | VM_88 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_88 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm88 | VM_AG_88  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | Validation         |
      | VMS88 | Site-1   | True                      | VMForm88        | First Visit        |               2 | Day(s)             | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor88    | Matrix            |    999988 | visitor88@vms.com | VM_88   | VMS88              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS88           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999988 | Create Visit |
    And CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_88  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckIn successfully or not
      | HostId | CheckIn |
      | VM_88  | Yes     |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_88  | Checked-Out successfully. |
    When Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor88    | Matrix            |    999988 | visitor88@vms.com | VM_88   | VMS88              | SA        |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_88  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_88  | Checked-Out successfully. |

  @VM_89
  Scenario: Forms - CheckOut Visit - Failed form execution
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_89  |
    And Delete visitor via API
      | mobilenumber |
      |       999989 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS89 |
    And Delete Visitor Form "VMForm89" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP89 | VP89 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_89 | VM_89 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_89 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm89 | VM_AG_89  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckOutFormName | CheckOutExecutionOn | CheckOutValidity | CheckOutValDuration | Validation         |
      | VMS89 | Site-1   | True                      | VMForm89         | All Visits          |                  |                     | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor89    | Matrix            |    999989 | visitor89@vms.com | VM_89   | VMS89              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS89           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999989 | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_89  | Checked-In |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                        |
      | VM_89  | Option 2 | Eligibility criteria not achieved |
    Then verify visit CheckOut successfully or not
      | HostId | CheckOut |
      | VM_89  | No       |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_89  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckOut successfully or not
      | HostId | CheckOut |
      | VM_89  | Yes      |

  @VM_90
  Scenario: Forms - CheckOut Visit - Pass form execution and All visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_90  |
    And Delete visitor via API
      | mobilenumber |
      |      9999990 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS90 |
    And Delete Visitor Form "VMForm90" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP90 | VP90 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_90 | VM_90 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_90 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm90 | VM_AG_90  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckOutFormName | CheckOutExecutionOn | CheckOutValidity | CheckOutValDuration | Validation         |
      | VMS90 | Site-1   | True                      | VMForm90         | All Visits          |                  |                     | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor90    | Matrix            |   9999990 | visitor90@vms.com | VM_90   | VMS90              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS90           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |     9999990 | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_90  | Checked-In |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_90  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckOut successfully or not
      | HostId | CheckOut |
      | VM_90  | Yes      |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor90    | Matrix            |   9999990 | visitor90@vms.com | VM_90   | VMS90              | SA        |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_90  | Checked-In |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_90  | Option 1 | Eligibility criteria achieved |

  @VM_91
  Scenario: Forms - CheckOut Visit - Pass form execution and First visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_91  |
    And Delete visitor via API
      | mobilenumber |
      |      9999991 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS91 |
    And Delete Visitor Form "VMForm91" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP91 | VP91 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_91 | VM_91 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_91 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm91 | VM_AG_91  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | CheckOutFormName | CheckOutExecutionOn | CheckOutValidity | CheckOutValDuration | Validation         |
      | VMS91 | Site-1   | True                      | VMForm91         | First Visit         |                2 | Day(s)              | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor91    | Matrix            |   9999991 | visitor91@vms.com | VM_91   | VMS91              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS91           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |     9999991 | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_91  | Checked-In |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_91  | Option 1 | Eligibility criteria achieved |
    Then verify visit CheckOut successfully or not
      | HostId | CheckOut |
      | VM_91  | Yes      |
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor91    | Matrix            |   9999991 | visitor91@vms.com | VM_91   | VMS91              | SA        |
    And "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_91  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_91  | Checked-Out successfully. |

  @VM_92
  Scenario: Form Summary
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_92  |
    And Delete visitor via API
      | mobilenumber |
      |      9999992 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS92 |
    And Delete Visitor Form "VMForm92" from Database
    And create visitor profile via API
      | id   | name | active |
      | VP92 | VP92 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_92 | VM_92 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance |
      | Not Required                 | False                           | False                     |
    And Create Agreement Builder from admin module
      | Name     | Header       | Content                               | Footer | EnableSignature | ConfirmationStyle |
      | VM_AG_92 | Dear Visitor | Our premises is under CCTV. Be Aware. | Thanks | False           | Agree Checkbox    |
    And Create Visitor Form from admin module
      | Name     | Agreement | PositionAt | ApproveOn   | DisplayScoreToUser | SingleChoiceQuestion | Option1 | Option2 | Answer   | Validation         |
      | VMForm92 | VM_AG_92  | Starting   | All Correct | False              | Are You Visitor?     | Yes     | No      | Option 1 | Saved Successfully |
    And Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | LoginFormName | LoginExecutionOn | LoginValidity | LoginValDuration | CheckInFormName | CheckInExecutionOn | CheckInValidity | CheckInValDuration | CheckOutFormName | CheckOutExecutionOn | CheckOutValidity | CheckOutValDuration | Validation         |
      | VMS92 | Site-1   | True                      | VMForm92      | All Logins       |               |                  | VMForm92        | All Visits         |                 | VMForm92           | VMForm92         | All Visits          |                  |                     | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |                1 |             10 | Visitor92    | Matrix            |   9999992 | visitor92@vms.com | VM_92   | VMS92              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS92           | sa     | admin    | Visitor Portal |
    When SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |     9999992 | Visitor Form |
    And Submit visitor form
      | Answer1  | validation                    |
      | Option 1 | Eligibility criteria achieved |
    And CheckIn Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_92  | Option 1 | Eligibility criteria achieved |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                        |
      | VM_92  | Option 2 | Eligibility criteria not achieved |
    And CheckOut Visit from visitor portal and submit form
      | HostID | Answer1  | validation                    |
      | VM_92  | Option 1 | Eligibility criteria achieved |
    And Go to previous Tab
    And verify Form summary from VMS module
      | StationLocation | VMobile | FormType  | FromDt | ToDt | Count |
      | VMS92           | 9999992 | Login     |      0 |    0 |     1 |
      | VMS92           | 9999992 | Check-In  |      0 |    0 |     1 |
      | VMS92           | 9999992 | Check-Out |      0 |    0 |     2 |

  @VM_93
  Scenario: Visit Creation Restriction - Visitor Initiated
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_93  |
    And Delete visitor via API
      | mobilenumber |
      |      9999993 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS93 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_93 | VM_93 |               1 |         1 |               1 |                  1 |                    1 |
    When Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | VisitCreationonCurrentDate | Validation         |
      | VMS93 | Site-1   | True                      | False                      | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance | VisitCreationRestrictionApplyOn |
      | Not Required                 | False                           | False                     | Both                            |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_93  |                          2 |                          5 | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS93           | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |     9999993 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation   |
      | Visitor93 | Matrix       | visitor93@vms.com | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation                                                           |
      | VM_93  |         1 |         1 |        60 |     120 | automation | Visit Start Date should not be lesser than 2 days from Current Date  |
      | VM_93  |         7 |         7 |        60 |     120 | automation | Visit Start Date should not be greater than 5 days from Current Date |
      | VM_93  |         3 |         3 |        60 |     120 | automation | Visit Created                                                        |

  @VM_94
  Scenario: Allow E-Pass Generation Before Duration
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_94  |
    And Delete visitor via API
      | mobilenumber |
      |      9999994 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS94 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_94 | VM_94 |               1 |         1 |               1 |                  1 |                    1 |
    When Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | VisitCreationonCurrentDate | Validation         |
      | VMS94 | Site-1   | True                      | True                       | Saved Successfully |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance | AllowEPassGenerationBeforeDuration |
      | Not Required                 | False                           | False                     |                                 15 |
    And Set default Visitor Pre-Registration Template
    And Visitor Preregistration via API
      | user-type | visit-date | visit-until-date | visit-start-time | visit-end-time | visitor-name | organization-name | mobile-no | email             | host-id | visit-station-name | appliedBy |
      |         0 |          0 |                0 |               20 |             22 | Visitor94    | Matrix            |   9999994 | visitor94@vms.com | VM_94   | VMS94              | SA        |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS94           | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |     9999994 | Create Visit |
    And "CheckIn" Visit from visitor portal
      | HostId | validation                                                     |
      | VM_94  | You cannot Check-In before 15 mins from your Visit Start Time. |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorInitiatedVisit | SecurityApprovalForVisitorEPass | RequiredVisitorAcceptance | AllowEPassGenerationBeforeDuration |
      | Not Required                 | False                           | False                     |                                    |

  ############# V20R09_CSR-45 #############
  @CSR4509_1
  Scenario: V20R09 Invite visitor from SA - New invite visitor link & Copy link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete invite visitor
      | VName    |
      | Visitor1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_1 | VM_1 |               1 |         1 |               1 |                  1 |                    1 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor1 | 9999901 | visitor1@vms.com | matrix        | VM_1       |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    Then Copy Link from Invite Visitor page
      | VName    | VMobile | Validation  |
      | Visitor1 | 9999901 | Link Copied |

  @CSR4509_2
  Scenario: V20R09 Invite visitor from SA -  Security Approval For Visitor E-Pass = Disable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_2   |
    And Delete visitor via API
      | mobilenumber |
      |      9999902 |
    And Delete invite visitor
      | VName    |
      | Visitor2 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_2 | VM_2 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor2 | 9999902 | visitor2@vms.com | matrix        | VM_2       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor2 | 9999902 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999902"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_2   | Scheduled Visits | Accepted |

  @CSR4509_3
  Scenario: V20R09 Invite visitor from SA -  Security Approval For Visitor E-Pass = Enable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_3   |
    And Delete visitor via API
      | mobilenumber |
      |      9999903 |
    And Delete invite visitor
      | VName    |
      | Visitor3 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_3 | VM_3 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor3 | 9999903 | visitor3@vms.com | matrix        | VM_3       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor3 | 9999903 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999903"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_3   | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @CSR4509_4
  Scenario: V20R09 Invite visitor from SA -  Security Approval For Visitor E-Pass = Disable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_4   |
    And Delete visitor via API
      | mobilenumber |
      |      9999904 |
    And Delete invite visitor
      | VName    |
      | Visitor4 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_4 | VM_4 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor4 | 9999904 | visitor4@vms.com | matrix        | VM_4       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor4 | 9999904 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999904"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_4   | Scheduled Visits | Pending |

  @CSR4509_5
  Scenario: V20R09 Invite visitor from SA -  Security Approval For Visitor E-Pass = Enable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_5   |
    And Delete visitor via API
      | mobilenumber |
      |      9999905 |
    And Delete invite visitor
      | VName    |
      | Visitor5 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_5 | VM_5 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor5 | 9999905 | visitor5@vms.com | matrix        | VM_5       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor5 | 9999905 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999905"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_5   | Scheduled Visits | Pending |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @CSR4509_6
  Scenario: V20R09 Invite visitor from SA - Repeat daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_6   |
    And Delete visitor via API
      | mobilenumber |
      |      9999906 |
    And Delete invite visitor
      | VName    |
      | Visitor6 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_6 | VM_6 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | VisitStation     | Purpose        | AddVisitors | Validation             |
      | Visitor6 | 9999906 | visitor6@vms.com | matrix        | VM_6       |         0 |      10 | Daily           |                 |         5 |      65 | Default Location | Invite Visitor |           0 | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor6 | 9999906 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999906"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_6   | Scheduled Visits | Accepted |

  @CSR4509_7
  Scenario: V20R09 Invite visitor from SA - Repeat Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_7   |
    And Delete visitor via API
      | mobilenumber |
      |      9999907 |
    And Delete invite visitor
      | VName    |
      | Visitor7 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_7 | VM_7 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor7 | 9999907 | visitor7@vms.com | matrix        | VM_7       |         0 |      20 | Weekly          | Sun,Tue,Thu,Sat |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor7 | 9999907 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999907"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_7   | Scheduled Visits | Accepted |

  @CSR4509_8
  Scenario: V20R09 Invite visitor from SA -  Link Status = Accessed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_8   |
    And Delete visitor via API
      | mobilenumber |
      |      9999908 |
    And Delete invite visitor
      | VName    |
      | Visitor8 |
    And create visitor profile via API
      | id  | name | active |
      | VP8 | VP8  |      1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_8 | VM_8 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor8 | 9999908 | visitor8@vms.com | matrix        | VM_8       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor8 | 9999908 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999908"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    When "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_8   | Checked-In |
    Then Go to previous Tab
    And verify invite visitor link status from invite visitor page
      | VName    | Status   |
      | Visitor8 | Accessed |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | VM_8   |

  @CSR4509_9
  Scenario: V20R09 Invite visitor from SA - Link Status = Link Expired
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_9   |
    And Delete visitor via API
      | mobilenumber |
      |      9999909 |
    And Delete invite visitor
      | VName    |
      | Visitor9 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_9 | VM_9 |               1 |         1 |               1 |                  1 |                    1 |
    When Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor9 | 9999909 | visitor9@vms.com | matrix        | VM_9       |         0 |       0 |         2 |       3 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Wait for "4" min
    And verify invite visitor link status from invite visitor page
      | VName    | Status       |
      | Visitor9 | Link Expired |

  @CSR4509_10
  Scenario: V20R09 Invite visitor from ESS - New invite visitor link & Copy link
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_10  |
    And Delete visitor via API
      | mobilenumber |
      |       999910 |
    And Delete invite visitor
      | VName     |
      | Visitor10 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_10 | VM_10 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_10  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_10    | admin    | Welcome VM_10 |
    When Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor10 |  999910 | visitor10@vms.com | matrix        | VM_10      |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    Then Copy Link from Invite Visitor page in ESS
      | VName     | VMobile | Validation  |
      | Visitor10 |  999910 | Link Copied |

  @CSR4509_11
  Scenario: V20R09 Invite visitor from ESS -  Security Approval For Visitor E-Pass = Disable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_11  |
    And Delete visitor via API
      | mobilenumber |
      |       999911 |
    And Delete invite visitor
      | VName     |
      | Visitor11 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_11 | VM_11 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_11  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_11    | admin    | Welcome VM_11 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor11 |  999911 | visitor11@vms.com | matrix        | VM_11      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor11 |  999911 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999911"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_11  | Scheduled Visits | Accepted |

  @CSR4509_12
  Scenario: V20R09 Invite visitor from ESS -  Security Approval For Visitor E-Pass = Enable & No changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_12  |
    And Delete visitor via API
      | mobilenumber |
      |       999912 |
    And Delete invite visitor
      | VName     |
      | Visitor12 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_12 | VM_12 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_12  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_12    | admin    | Welcome VM_12 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor12 |  999912 | visitor12@vms.com | matrix        | VM_12      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor12 |  999912 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999912"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status                      |
      | VM_12  | Scheduled Visits | Pending (Security Approval) |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @CSR4509_13
  Scenario: V20R09 Invite visitor from ESS -  Security Approval For Visitor E-Pass = Disable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_13  |
    And Delete visitor via API
      | mobilenumber |
      |       999913 |
    And Delete invite visitor
      | VName     |
      | Visitor13 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_13 | VM_13 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_13  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_13    | admin    | Welcome VM_13 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor13 |  999913 | visitor13@vms.com | matrix        | VM_13      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor13 |  999913 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999913"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_13  | Scheduled Visits | Pending |

  @CSR4509_14
  Scenario: V20R09 Invite visitor from ESS -  Security Approval For Visitor E-Pass = Enable & changes in details
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_14  |
    And Delete visitor via API
      | mobilenumber |
      |       999914 |
    And Delete invite visitor
      | VName     |
      | Visitor14 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | True                            | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_14 | VM_14 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_14  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_14    | admin    | Welcome VM_14 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor14 |  999914 | visitor14@vms.com | matrix        | VM_14      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor14 |  999914 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999914"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |         1 |         1 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status  |
      | VM_14  | Scheduled Visits | Pending |
    And Go to previous Tab
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass |
      | False                           |

  @CSR4509_15
  Scenario: V20R09 Invite visitor from ESS - Repeat daily
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_15  |
    And Delete visitor via API
      | mobilenumber |
      |       999915 |
    And Delete invite visitor
      | VName     |
      | Visitor15 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_15 | VM_15 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_15  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_15    | admin    | Welcome VM_15 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor15 |  999915 | visitor15@vms.com | matrix        | VM_15      |         0 |      20 | Daily           |                 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor15 |  999915 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999915"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_15  | Scheduled Visits | Accepted |

  @CSR4509_16
  Scenario: V20R09 Invite visitor from ESS - Repeat Weekly
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_16  |
    And Delete visitor via API
      | mobilenumber |
      |       999916 |
    And Delete invite visitor
      | VName     |
      | Visitor16 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_16 | VM_16 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_16  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_16    | admin    | Welcome VM_16 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor16 |  999916 | visitor16@vms.com | matrix        | VM_16      |         0 |      20 | Weekly          | Sun,Tue,Thu,Sat |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link in ESS and Open link in new tab
      | VName     | VMobile | Validation     |
      | Visitor16 |  999916 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "999916"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | RepeatVisitMode | RepeatVisitDays | StartTime | EndTime | Purpose | validation    |
      |        |           |           |                 |                 |           |         |         | Visit Created |
    Then Verify visit status in visitor portal
      | HostId | VisitPanel       | Status   |
      | VM_16  | Scheduled Visits | Accepted |

  @CSR4509_17
  Scenario: V20R09 Invite visitor from ESS - Visit Creation Restriction Minimum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_17  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_17 | VM_17 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_17  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_17  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_17    | admin    | Welcome VM_17 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation                                                      |
      | Visitor17 |  999917 | visitor17@vms.com | matrix        | VM_17      |         1 |       1 |         5 |      65 | Invite Visitor |           0 | Default Location | Visit Start Date should not be lesser than 2 days from Curre... |

  @CSR4509_18
  Scenario: V20R09 Invite visitor from ESS - Visit Creation Restriction Maximum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_18  |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_18 | VM_18 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_18  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_18  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_18    | admin    | Welcome VM_18 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation                                                      |
      | Visitor18 |  999918 | visitor18@vms.com | matrix        | VM_18      |         7 |       7 |         5 |      65 | Invite Visitor |           0 | Default Location | Visit Start Date should not be greater than 5 days from Curr... |

  @CSR4509_19
  Scenario: V20R09 Invite visitor from ESS - Visit Creation Restriction within Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_19  |
    And Delete visitor via API
      | mobilenumber |
      |       999919 |
    And Delete invite visitor
      | VName     |
      | Visitor19 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_19 | VM_19 |               1 |         1 |               1 |                  1 |                    1 |
    And Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_19  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_19  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_19    | admin    | Welcome VM_19 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor19 |  999919 | visitor19@vms.com | matrix        | VM_19      |         3 |       3 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |

  @CSR4509_20
  Scenario: V20R09 Visitor Pre Registration from SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_20  |
    And Delete visitor via API
      | mobilenumber |
      |       999920 |
    And create visitor profile via API
      | id   | name | active |
      | VP20 | VP20 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_20 | VM_20 |               1 |         1 |               1 |                  1 |                    1 |
    And Set default Visitor Pre-Registration Template
    When Visitor Preregistration from VMS module
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | Validation         |
      | VM_20    | Visitor20 |  999920 | visitor20@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999920 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999920"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_20  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_20  | Checked-Out successfully. |

  @CSR4509_21
  Scenario: V20R09 Visitor Pre Registration from ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_21  |
    And Delete visitor via API
      | mobilenumber |
      |       999921 |
    And create visitor profile via API
      | id   | name | active |
      | VP21 | VP21 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_21 | VM_21 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_21  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_21    | admin    | Welcome VM_21 |
    When Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_21    | Visitor21 |  999921 | visitor21@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromESS | Default Location | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999921 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999921"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_21  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_21  | Checked-Out successfully. |

  @CSR4509_22
  Scenario: V20R09 Visitor Pre Registration from ESS - Visit Creation Restriction Minimum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_22  |
    And Delete visitor via API
      | mobilenumber |
      |       999922 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_22 | VM_22 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_22  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_22  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_22    | admin    | Welcome VM_22 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation                                                      |
      | VM_22    | Visitor22 |  999922 | visitor22@vms.com | Matrix        |         1 |       1 |         2 |      62 | PreregistrationFromESS | Default Location | Visit Start Date should not be lesser than 2 days from Curre... |

  @CSR4509_23
  Scenario: V20R09 Visitor Pre Registration from ESS - Visit Creation Restriction Maximum Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_23  |
    And Delete visitor via API
      | mobilenumber |
      |       999923 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_23 | VM_23 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_23  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_23  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_23    | admin    | Welcome VM_23 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation                                                      |
      | VM_23    | Visitor23 |  999923 | visitor23@vms.com | Matrix        |         7 |       7 |         2 |      62 | PreregistrationFromESS | Default Location | Visit Start Date should not be greater than 5 days from Curr... |

  @CSR4509_24
  Scenario: V20R09 Visitor Pre Registration from ESS - Visit Creation Restriction Within Days
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_24  |
    And Delete visitor via API
      | mobilenumber |
      |       999924 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_24 | VM_24 |               1 |         1 |               1 |                  1 |                    1 |
    When Create user from user configuration
      | userid | MinDaysBeforeAllowingVisit | MaxDaysBeforeAllowingVisit | Validation         |
      | VM_24  |                          2 |                          5 | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_24  |                          1 | admin        |    1 |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_24    | admin    | Welcome VM_24 |
    Then Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | Validation         |
      | VM_24    | Visitor24 |  999924 | visitor24@vms.com | Matrix        |         3 |       3 |         2 |      62 | PreregistrationFromESS | Default Location | Saved Successfully |

  @CSR4509_25
  Scenario: V20R09 Visitor Pre Registration from Visitor Portal
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_25  |
    And Delete visitor via API
      | mobilenumber |
      |       999925 |
    And create visitor profile via API
      | id   | name | active |
      | VP25 | VP25 |      1 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_25 | VM_25 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_25  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Open Cosec Visitor Portal in new tab
      | StationLocation  | UserId | Password | validation     |
      | Default Location | sa     | admin    | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |      999925 | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "999925"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                   |
      | Visitor25 | Matrix       | visitor25@vms.com | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor25@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    When Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose    | validation    |
      | VM_25  |         0 |         0 |         2 |      62 | automation | Visit Created |
    And Go to previous Tab
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_25    | admin    | Welcome VM_25 |
    And Approval of host from Visit Approval page in ESS
      | FromDate | ToDate | VName     | Approval |
      |        0 |      0 | Visitor25 | Approve  |
    And Go to next Tab
    And Refresh visit page of visitor portal
    Then "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_25  | Checked-In |
    And "CheckOut" Visit from visitor portal
      | HostId | validation                |
      | VM_25  | Checked-Out successfully. |

  @CSR4509_31
  Scenario Outline: Import Visitor and Visit - Visitor
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999931 |
    When Import Data "Visitor and Visit"
      | MobileNo | VisitorName | Organization | EmailID           | Address | City     | State   | Country | PINCode | Gender | DOB        | Nationality | IDProof1 | IDProof2 |
      |   999931 | Visitor31   | Matrix       | visitor31@vms.com | Girnar  | Junagadh | Gujarat | India   |  362640 |      1 | 16/07/1999 | Indian      |      111 |      222 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description       |
      | Visitor Only |  999931 | Success | New Visitor added |
    And Verify visitor in frequent visitor page
      | VMobile | VisitorName |
      |  999931 | Visitor31   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @CSR4509_32
  Scenario Outline: Import Visitor and Visit - Visit
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_32  |
    And Delete visitor via API
      | mobilenumber |
      |       999932 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_32 | VM_32 |               1 |         1 |               1 |                  1 |                    1 |
    And Create visitor from Frequent visitor page
      | VisitorName | Organization | VMobile |
      | Visitor32   | Matrix       |  999932 |
    When Import Data "Visitor and Visit"
      | MobileNo | VisitStartDate | VisitEndDate | VisitStartTime | VisitEndTime | HostUserID | VisitStationID |
      |   999932 |              1 |            1 | 09:00          | 10:00        | VM_32      |              1 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description     |
      | Visit Only   |  999932 | Success | New Visit Added |
    And Verify visit in Visitor Preregistration page
      | VMobile | VisitorName |
      |  999932 | Visitor32   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @CSR4509_33
  Scenario Outline: Import Visitor and Visit - Both
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_33  |
    And Delete visitor via API
      | mobilenumber |
      |       999933 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_33 | VM_33 |               1 |         1 |               1 |                  1 |                    1 |
    When Import Data "Visitor and Visit"
      | MobileNo | VisitorName | Organization | EmailID           | VisitStartDate | VisitEndDate | VisitStartTime | VisitEndTime | HostUserID | VisitStationID |
      |   999933 | Visitor33   | Matrix       | visitor33@vms.com |              1 |            1 | 09:00          | 10:00        | VM_33      |              1 |
    Then Import "<File Format>" and check Imported Data for "Visitor and Visit"
      | ImportDataOf | VMobile | Result  | Description                 |
      | Both         |  999933 | Success | New Visitor and Visit Added |
    And Verify visitor in frequent visitor page
      | VMobile | VisitorName |
      |  999933 | Visitor33   |
    And Verify visit in Visitor Preregistration page
      | VMobile | VisitorName |
      |  999933 | Visitor33   |

    Examples: 
      | File Format |
      | XLS         |
      | CSV         |

  @CSR4509_95
  Scenario: V20R09 Invite visitor from SA -  Visit Location
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_95  |
    And Delete visitor via API
      | mobilenumber |
      |      9999995 |
    And Delete invite visitor
      | VName     |
      | Visitor95 |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_95 | VM_95 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | VM95 | VM95 | Wi-Fi |         |         |          |           |                      | 00:00:02:02:02:02 | VM95    | Saved Successfully |
    And Send link from Invite Visitor page
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | VisitLocation       | LocationName | Validation             |
      | Visitor95 | 9999995 | visitor95@vms.com | matrix        | VM_95      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Configured Location | VM95         | Send Link Successfully |

  @CSR4509_96
  Scenario: V20R09 Invite visitor from ESS -  Visit Location
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_96  |
    And Delete visitor via API
      | mobilenumber |
      |      9999996 |
    And Delete invite visitor
      | VName     |
      | Visitor96 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | VM95 | VM95 | Wi-Fi |         |         |          |           |                      | 00:00:02:02:02:02 | VM95    | Saved Successfully |
    And Create User via api
      | Id    | name  | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_96 | VM_96 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_96  |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_96    | admin    | Welcome VM_96 |
    And Send link from Invite Visitor page in ESS
      | VName     | VMobile | VEmail            | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | VisitLocation       | LocationName | Validation             |
      | Visitor96 | 9999996 | visitor96@vms.com | matrix        | VM_96      |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Configured Location | VM95         | Send Link Successfully |

  @CSR4509_97
  Scenario: V20R09 Visitor Pre Registration from SA
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_97  |
    And Delete visitor via API
      | mobilenumber |
      |      9999997 |
    And create visitor profile via API
      | id   | name | active |
      | VP97 | VP97 |      1 |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AuthorizedHostUser | Validation         |
      | VM_97  | True   | True      | True      | True      | True      | True               | True               | Saved Successfully |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | VM95 | VM95 | Wi-Fi |         |         |          |           |                      | 00:00:02:02:02:02 | VM95    | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    When Visitor Preregistration from VMS module
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose               | VisitStation     | VisitLocation       | LocationName | Validation         |
      | VM_97    | Visitor97 | 9999997 | visitor97@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromSA | Default Location | Configured Location | VM95         | Saved Successfully |

  @CSR4509_98
  Scenario: V20R09 Visitor Pre Registration from ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_98  |
    And Delete visitor via API
      | mobilenumber |
      |      9999998 |
    And create visitor profile via API
      | id   | name | active |
      | VP98 | VP98 |      1 |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | AuthorizedHostUser | Validation         |
      | VM_98  | True   | True      | True      | True      | True      | True               | True               | Saved Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | VM_98  |                          1 | admin        |    1 |
    And Set Visitor Management tab parameteres in GP
      | AuthForVisitorPreRegistration | SecurityApprovalForVisitorEPass |
      | Not Required                  | False                           |
    And Create Location from Location master
      | Code | Name | Type  | BLECode | BLEName | Latitude | Longitude | LocationRadiusMeters | WiFiMAC           | Address | validation         |
      | VM95 | VM95 | Wi-Fi |         |         |          |           |                      | 00:00:02:02:02:02 | VM95    | Saved Successfully |
    And Set default Visitor Pre-Registration Template
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation    |
      | VM_98    | admin    | Welcome VM_98 |
    When Visitor Preregistration from ESS
      | HostUser | VName     | VMobile | VEmail            | VOrganization | StartDate | EndDate | StartTime | EndTime | Purpose                | VisitStation     | VisitLocation       | LocationName | Validation         |
      | VM_98    | Visitor98 | 9999998 | visitor98@vms.com | Matrix        |         0 |       0 |         2 |      62 | PreregistrationFromESS | Default Location | Configured Location | VM95         | Saved Successfully |

       @VM_99
  Scenario: Invite visitor from SA -  FIT -  Inviting visitors only by Mobile.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_99   |
    And Delete visitor via API
      | mobilenumber |
      |      9999999 |
    And Delete invite visitor
      | VName    |
      | Visitor99 |
    And create visitor profile via API
      | id  | name | active |
      | VP99 | VP99  |      1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_99 | VM_99 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor99 | 9999999 |  | matrix        | VM_8       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor8 | 9999999 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999999"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              |       | Create Visit |
    And Create Visit from visitor portal
      | HostId | VisitDate | UntilDate | StartTime | EndTime | Purpose | validation    |
      |        |           |           |           |         |         | Visit Created |
    When "CheckIn" Visit from visitor portal
      | HostId | validation |
      | VM_99   | Checked-In |
    Then Go to previous Tab
    And verify invite visitor link status from invite visitor page
      | VName    | Status   |
      | Visitor8 | Accessed |
    And Visit State Change via API
      | user-type | state-change | appliedBy | StartDate | EndDate | HostID |
      |         0 |            5 | SA        |         0 |       0 | VM_99   |

      @VM_99
  Scenario: Invite visitor from SA -  FIT -  Inviting visitors only by Mobile.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | VM_99   |
    And Delete visitor via API
      | mobilenumber |
      |      9999999 |
    And Delete invite visitor
      | VName    |
      | Visitor99 |
    And create visitor profile via API
      | id  | name | active |
      | VP99 | VP99  |      1 |
    And Create User via api
      | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
      | VM_99 | VM_99 |               1 |         1 |               1 |                  1 |                    1 |
    And Set Visitor Management tab parameteres in GP
      | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
      | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
      | Visitor99 | 9999999 |  | matrix        | VM_99       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | Validation     |
      | Visitor99 | 9999999 | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "9999999"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Email | validation   |
      |      |              | visitor99@vms.com       | OTP (valid for 3 mins) has been sent to your |
      And Go to previous Tab
    And Get OTP from Alert view for "visitor99@vms.com"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    

    @VM_100
  Scenario: Invite visitor from SA -  FIT -  Inviting visitors only by Mobile.
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
     And Delete user via API
       | UserID |
       | VM_100   |
     And Delete visitor via API
       | mobilenumber |
       |      9999100 |
     And Delete invite visitor
       | VName    |
       | Visitor100 |
     And create visitor profile via API
       | id  | name | active |
       | VP100 | VP100  |      1 |
    And Create User via api
       | Id   | name | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | authorized-host-user |
       | VM_100 | VM_100 |               1 |         1 |               1 |                  1 |                    1 |
     And Set Visitor Management tab parameteres in GP
       | SecurityApprovalForVisitorEPass | AuthForVisitorPreRegistration | AuthForVisitorInitiatedVisit |
      | False                           | Not Required                  | Not Required                 |
    And Send link from Invite Visitor page
       | VName    | VMobile | VEmail           | VOrganization | HostUserID | StartDate | EndDate | StartTime | EndTime | Purpose        | AddVisitors | VisitStation     | Validation             |
       | Visitor100 |  |visitor100@vms.com  | matrix        | VM_100       |         0 |       0 |         5 |      65 | Invite Visitor |           0 | Default Location | Send Link Successfully |
    And Copy invite visitor link and Open link in new tab
      | VName    | VMobile | VEMail| Validation     |
      | Visitor100 | |visitor100@vms.com | Visitor Portal |
    And Login with Visitor in Visitor Portal
      | MobileEmail | Validation                                   |
      |             | OTP (valid for 3 mins) has been sent to your |
    And Go to previous Tab
    And Get OTP from Alert view for "visitor100@vms.com"
    And Go to next Tab
    And click on Login after entering OTP in Visitor Portal
      | Validation |
      | Profile    |
    And Enter visitor details in visitor portal
      | Name | Organization | Mobile | validation   |
      |      |              | 9999100       | OTP (valid for 3 mins) has been sent to your |
      And Go to previous Tab
    And Get OTP from Alert view for "9999100"
    And Go to next Tab
    And click on Verify after entering Email OTP in Visitor Portal
      | Validation   |
      | Create Visit |
    
 @VM_101
  Scenario: Visitor registers using mobile from the Visitor Portal by clicking “Skip to Login”
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999101 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS101 |
    When Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | VMS101 | Site-1   | False                     | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS101           | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      999101 | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Email             | validation                                                  |
      | Visitor101 | Matrix       | visitor101@vms.com | Request submitted successfully.Try to login after some time |
    And Go to previous Tab
    Then Visitor Login Authorization from VMS module
      | FromDate | ToDate | VMobile | Approval |
      |        0 |      0 |  999101 | Approve   |
    And Go to next Tab
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      visitor101@vms.com | Create Visit |

@VM_102
  Scenario: Visitor registers using email from the Visitor Portal by clicking “Skip to Login”
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete visitor via API
      | mobilenumber |
      |       999102 |
    And Delete Station Location from VMS module
      | Name  |
      | VMS102 |
    When Create station location from visitor module
      | Name  | SiteName | AutoAuthorizeVisitorLogin | Validation         |
      | VMS102 | Site-1   | False                     | Saved Successfully |
    And Open Cosec Visitor Portal in new tab
      | StationLocation | UserId | Password | validation     |
      | VMS102           | sa     | admin    | Visitor Portal |
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation |
      |      visitor102@vms.com | Profile    |
    And Enter visitor details in visitor portal
      | Name      | Organization | Mobile             | validation                                                  |
      | Visitor102 | Matrix       | 999102 | Request submitted successfully.Try to login after some time |
    And Go to previous Tab
    Then Visitor Login Authorization from VMS module
      | FromDate | ToDate | VMobile | Approval |
      |        0 |      0 |  999102 | Approve   |
    And Go to next Tab
    And SKIP TO LOGIN with Visitor in Visitor Portal
      | MobileEmail | Validation   |
      |      999102 | Create Visit |


    