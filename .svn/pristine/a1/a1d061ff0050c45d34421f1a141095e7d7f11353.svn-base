@LoginCases
Feature: Default

  Background: 
    Given Open Cosec Web
    And Check all pre-Coditions for automation

  @CS-1
  Scenario: Invalid set password Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_1   |
    And Delete System Account User "SA_CS_1" from System Accounts page
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_1   | True   | True      | True      | True      | True      | True               |     1000000000 | cs1@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Create New System Account User
      | SAUser  | ESSUSer | ValidationMessage  |
      | SA_CS_1 | CS_1    | Saved Successfully |
    And Logout from Cosec Web
    Then Set User password and Refresh Page
      | User    | NewPassword | ConfirmPassword | Validation        |
      | SA_CS_1 | admin       | ADMIN           | Password Mismatch |
      | SA_CS_1 | admin       |             123 | Password Mismatch |

  @CS-2
  Scenario: Valid  Set Password Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_2   |
    And Delete System Account User "SA_CS_2" from System Accounts page
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_2   | True   | True      | True      | True      | True      | True               |     2000000000 | cs2@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Create New System Account User
      | SAUser  | ESSUSer | ValidationMessage  |
      | SA_CS_2 | CS_2    | Saved Successfully |
    And Logout from Cosec Web
    Then Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_2 | admin       | admin           | LOGIN      |

  @CS-3
  Scenario: InValid  Login  Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_3   |
    And Delete System Account User "SA_CS_3" from System Accounts page
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_3   | True   | True      | True      | True      | True      | True               |     3000000000 | cs3@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Create New System Account User
      | SAUser  | ESSUSer | ValidationMessage  |
      | SA_CS_3 | CS_3    | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_3 | admin       | admin           | LOGIN      |
    Then Login with user
      | username | password | Validation                     |
      | SA_CS_3  | admin1   | Incorrect Login ID or Password |

  @CS-4
  Scenario: Valid  Login  Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_4   |
    And Delete System Account User "SA_CS_4" from System Accounts page
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_4   | True   | True      | True      | True      | True      | True               |     4000000000 | cs4@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Create New System Account User
      | SAUser  | ESSUSer | ValidationMessage  |
      | SA_CS_4 | CS_4    | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | SA_CS_4 | admin       | admin           | LOGIN      |
    Then Login with user
      | username | password | Validation      |
      | SA_CS_4  | admin    | Welcome SA_CS_4 |

  @CS-5
  Scenario: Login Authentication Mode = Password Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Login Authentication Mode set "Password" in GP
    When Logout from Cosec Web
    Then Verify Password or OTP toggle displayed "False"

  @CS-6
  Scenario: Login Authentication Mode = Password or OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Login Authentication Mode set "Password OR OTP" in GP
    When Logout from Cosec Web
    Then Verify Password or OTP toggle displayed "True"

  @CS-7
  Scenario: Login Authentication Mode = Password or OTP and login with invalid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_7   |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_7   | True   | True      | True      | True      | True      | True               |     7000000000 | cs7@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    When Logout from Cosec Web
    Then Refresh Page, Enter credentials, click on OTP, Enter OTP and Click on Login
      | credentials   | OTP    | Validation                       |
      | CS_7          | 111111 | Incorrect OTP. Please Try Again. |
      |    7000000000 | 111111 | Incorrect OTP. Please Try Again. |
      | cs7@gmail.com | 111111 | Incorrect OTP. Please Try Again. |

  @CS-8
  Scenario Outline: Login Authentication Mode = Password or OTP and login with valid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_8   |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_8   | True   | True      | True      | True      | True      | True               |     8000000000 | cs8@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    When Logout from Cosec Web
    And Enter "<Credential>" and click on OTP
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "<Credential>"
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation   |
      | Welcome CS_8 |

    Examples: 
      | Credential    |
      | cs8@gmail.com |

  @CS-9
  Scenario: Login Authentication Mode = Password then OTP and login with invalid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_9   |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail | Validation         |
      | CS_9   | True   | True      | True      | True      | True      | True               |     9000000000 | cs9@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password Then OTP" in GP
    When Logout from Cosec Web
    And Set User password and Refresh Page
      | User | NewPassword | ConfirmPassword | Validation |
      | CS_9 | admin       | admin           | NEXT       |
    Then Enter "CS_9" and "admin" and click on Next
    And Enter OTP and click on Login
      | OTP    | Validation                       |
      | 111111 | Incorrect OTP. Please Try Again. |

  @CS-10
  Scenario: Login Authentication Mode = Password then OTP and login with valid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_10  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_10  | True   | True      | True      | True      | True      | True               |     1010000000 | cs10@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password Then OTP" in GP
    When Logout from Cosec Web
    And Set User password and Refresh Page
      | User  | NewPassword | ConfirmPassword | Validation |
      | CS_10 | admin       | admin           | NEXT       |
    And Enter "CS_10" and "admin" and click on Next
    Then Get OTP from Database for "CS_10" and click on Login after entering OTP
      | Validation    |
      | Welcome CS_10 |

  @CS-11
  Scenario: Verify Password Reset Period (change Days) Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_11  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CS_11  | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    And Set Password Security Policy "True" and Password Reset Period days "1" in GP
    And Logout from Cosec Web
    And Set User password
      | User  | NewPassword | ConfirmPassword | Validation |
      | CS_11 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation    |
      | CS_11    | admin    | Welcome CS_11 |
    And Logout from Cosec Web
    When Update Last Password Change Date to "-2" for user "CS_11" in database
    Then Login with user
      | username | password | Validation   |
      | CS_11    | admin    | Set Password |
    And Reset "Password Policy" page to default

  @CS-12
  Scenario: Verify Password Security Level "High" with Invalid values Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_12  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CS_12  | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    And Set Minimum Required Characters "6" and Security Level "High" in GP for ESS
    And Logout from Cosec Web
    And Set User password and Refresh Page
      | User  | NewPassword | ConfirmPassword | Validation                                                                                        |
      | CS_12 | admin       | admin           | New password must contain minimum 6 characters                                                    |
      | CS_12 |      123456 |          123456 | Mandatory characters are : 1 Uppercase (A-Z) 1 Lowercase (a-z) 1 Number (0-9) 1 Special Character |
    And Reset "Password Policy" page to default

  @CS-13
  Scenario: Verify Password Security Level "High" with valid values Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_13  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CS_13  | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    And Set Minimum Required Characters "6" and Security Level "High" in GP for ESS
    And Logout from Cosec Web
    And Set User password
      | User  | NewPassword | ConfirmPassword | Validation |
      | CS_13 | Matrix_1    | Matrix_1        | LOGIN      |
    And Reset "Password Policy" page to default

  @CS-14
  Scenario: Verify Lock Account for Invalid Attempts Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_14  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CS_14  | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Set Lock Account for Invalid Attempts "True" and Maximum Invalid Attempts "3" and Auto Unlock Timer (Min)"1" in GP
    And Logout from Cosec Web
    And Set User password
      | User  | NewPassword | ConfirmPassword | Validation |
      | CS_14 | admin       | admin           | LOGIN      |
    Then Login with user
      | username | password | Validation                                                   |
      | CS_14    | admin12  | Incorrect Login ID or Password                               |
      | CS_14    | admin12  | Incorrect Login ID or Password                               |
      | CS_14    | admin12  | Maximum Invalid attempts reached. Please try after 1 minutes |
      | CS_14    | admin12  | Account has been locked due to maximum Invalid attempts      |
    And Reset "Password Policy" page to default

  @CS-15
  Scenario: Verify Valid Login Attempts After Unlock timer Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_15  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CS_15  | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Login Authentication Mode set "Password" in GP
    When Set Lock Account for Invalid Attempts "True" and Maximum Invalid Attempts "3" and Auto Unlock Timer (Min)"1" in GP
    And Logout from Cosec Web
    And Set User password
      | User  | NewPassword | ConfirmPassword | Validation |
      | CS_15 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation                                                   |
      | CS_15    | admin12  | Incorrect Login ID or Password                               |
      | CS_15    | admin12  | Incorrect Login ID or Password                               |
      | CS_15    | admin12  | Maximum Invalid attempts reached. Please try after 1 minutes |
      | CS_15    | admin12  | Account has been locked due to maximum Invalid attempts      |
    And Wait for "1" min
    Then Login with user
      | username | password | Validation    |
      | CS_15    | admin    | Welcome CS_15 |
    And Reset "Password Policy" page to default

  @CS-16
  Scenario Outline: Verify Maximum OTP Generation Attempts Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_16  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_16  | True   | True      | True      | True      | True      | True               |     1600000000 | cs16@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set Maximum OTP Generation Attempts "3" and Resend OTP After (Min) "1" in GP
    And Logout from Cosec Web
    When Enter "<Credential>" and click on OTP
    Then Click on Resend OTP "3" time
    And Validate "Maximum count reached to generate OTP. Please try after sometime."
    And Reset "Password Policy" page to default

    Examples: 
      | Credential |
      | CS_16      |

  @CS-17
  Scenario Outline: Verify Resend OTP after Resend OTP timer Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_17  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_17  | True   | True      | True      | True      | True      | True               |     1700000000 | cs17@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "03" in GP
    And Set Maximum OTP Generation Attempts "3" and Resend OTP After (Min) "1" in GP
    When Logout from Cosec Web
    And Enter "<Credential>" and click on OTP
    And Click on Resend OTP "3" time
    And Wait for "1" min
    Then Click on Resend OTP "1" time
    And OTP validity period is set to timing "3" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Reset "Password Policy" page to default

    Examples: 
      | Credential |
      | CS_17      |

  @CS-18
  Scenario: Verify Deny Password Reuse for System Account User Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_18" from System Accounts page
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set Deny Password Reuse "True" and Reuse Count For System Account Users "1" in GP
    And Create New System Account User
      | SAUser   | ESSUSer | ValidationMessage  |
      | SA_CS_18 |         | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_18 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Reset Password for System Account User "SA_CS_18"
    And Logout from Cosec Web
    Then Set User password
      | User     | NewPassword | ConfirmPassword | Validation                                               |
      | SA_CS_18 | admin       | admin           | New Password should not be same as last 1 old passwords. |
    And Reset "Password Policy" page to default

  @CS-19
  Scenario: Verify Deny Password Reuse for System Account User with Unused Password  Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete System Account User "SA_CS_19" from System Accounts page
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set Deny Password Reuse "True" and Reuse Count For System Account Users "1" in GP
    And Create New System Account User
      | SAUser   | ESSUSer | ValidationMessage  |
      | SA_CS_19 |         | Saved Successfully |
    And Logout from Cosec Web
    And Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_19 | admin       | admin           | LOGIN      |
    When Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Reset Password for System Account User "SA_CS_19"
    And Logout from Cosec Web
    Then Set User password
      | User     | NewPassword | ConfirmPassword | Validation |
      | SA_CS_19 | admin123    | admin123        | LOGIN      |
    And Reset "Password Policy" page to default

  @CS-20
  Scenario: Verify OTP Authentication For Setting Password for ESS User with InValid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_20  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_20  | True   | True      | True      | True      | True      | True               |     2010000000 | cs20@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP Authentication For Setting Password "True" in GP
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation                                                                                     |
      | CS_20    |          | A 6-digit OTP will be sent to your registered Mobile number and Email Id for setting password. |
    And Click on Send Button
    Then Enter OTP and click Verify
      | OTP    | Validation                       |
      | 123456 | Incorrect OTP. Please Try Again. |
    And Reset "Password Policy" page to default

  @CS-21
  Scenario: Verify OTP Authentication For Setting Password for ESS User with Valid OTP Scenario
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_21  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_21  | True   | True      | True      | True      | True      | True               |     2100000000 | cs21@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP Authentication For Setting Password "True" in GP
    And Logout from Cosec Web
    When Login with user
      | username | password | Validation                                                                                     |
      | CS_21    |          | A 6-digit OTP will be sent to your registered Mobile number and Email Id for setting password. |
    And Click on Send Button
    And Get OTP from Database for "CS_21" and click on verify after entering OTP
    Then Enter New password and Confirm Password
      | NewPassword | ConfirmPassword | Validation |
      | admin123    | admin123        | LOGIN      |
    And Reset "Password Policy" page to default

    
  @CSR-10224_1
  Scenario: validate otp timer & otp expired case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "01" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "1" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Wait for "1" min
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Get OTP from Alert view for "cs45@gmail.com"
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation          |
      | Entered OTP Expired |


  @CSR-10224_2
  Scenario: otp period increase case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "01" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "1" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "10" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    Then Go to previous Tab
    And Wait for "2" min
    And click on Login after entering OTP
      | Validation    |
      | Welcome CS_45 |

  @CSR-10224_3
  Scenario: otp period decrease case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "09" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "9" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "07" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    Then Go to previous Tab
    And Wait for "2" min
    And click on Login after entering OTP
      | Validation    |
      | Welcome CS_45 |

  @CSR-10224_4
  Scenario: otp period increase & check validation case & Resend case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "1" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "1" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "09" in GP
    Then Go to previous Tab
    And Click on Resend OTP "1" time
    And OTP validity period is set to timing "9" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.

  @CSR-10224_5
  Scenario: otp period decrease & check validation case & Resend case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "09" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "9" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "1" in GP
    Then Go to previous Tab
    And Click on Resend OTP "1" time
    And OTP validity period is set to timing "1" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.

     
@CSR-10224_6
  Scenario: otp period increase & check opt expire case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "01" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "1" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "9" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    And Wait for "9" min
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation          |
      | Entered OTP Expired |

  @CSR-10224_7
  Scenario: otp period decrease & check opt expire case
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "9" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "9" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "05" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    And Wait for "5" min
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation          |
      | Entered OTP Expired |

  @CSR-10224_8
  Scenario: otp period decrease & login successfully
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "9" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "9" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "05" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    And Wait for "1" min
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation    |
      | Welcome CS_45 |

  @CSR-10224_9
  Scenario: otp period increase & login successfully
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CS_45  |
    And Create user from user configuration
      | userid | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | PersonalMobile | PersonalEmail  | Validation         |
      | CS_45  | True   | True      | True      | True      | True      | True               |     7000000000 | cs45@gmail.com | Saved Successfully |
    And Login Authentication Mode set "Password OR OTP" in GP
    And Set OTP timer "02" in GP
    When Logout from Cosec Web
    And Enter "cs45@gmail.com" and click on OTP
    And OTP validity period is set to timing "2" minute then the message "OTP (valid for timing mins) has been sent to your registered" should be displayed.
    And Open Cosec Web in new tab
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Set OTP timer "05" in GP
    And Get OTP from Alert view for "cs45@gmail.com"
    And Wait for "2" min
    Then Go to previous Tab
    And click on Login after entering OTP
      | Validation    |
      | Welcome CS_45 |
    
    #CSR-3713 - Adding parameters 'Minimum Required Characters' & 'Security Level' for System Account Users & ESS Users separately on COSEC Web
  @CSR3713_1
  Scenario: Verify Password Security Level "Medium" for SA and "Low" for ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | CSR3713ESS |
    And Delete System Account User "CSR3713SA" from System Accounts page
    And Create New System Account User
      | SAUser    | ValidationMessage  |
      | CSR3713SA | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CSR3713ESS | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Minimum Required Characters "6" and Security Level "Medium" in GP for SA
    And Set Minimum Required Characters "5" and Security Level "Low" in GP for ESS
    And Logout from Cosec Web
    And Set User password and Refresh Page
      | User       | NewPassword | ConfirmPassword | Validation                                                  |
      | CSR3713SA  | admin       | admin           | New password must contain minimum 6 characters              |
      | CSR3713SA  |      123456 |          123456 | Mandatory characters are: 1 Lowercase (a-z), 1 Number (0-9) |
      | CSR3713SA  | Admin123    | Admin123        | LOGIN                                                       |
      | CSR3713ESS | admi        | admi            | New password must contain minimum 5 characters              |
      | CSR3713ESS | admin       | admin           | LOGIN                                                       |
    And Reset "Password Policy" page to default

  @CSR3713_2
  Scenario: Verify Password Security Level "High" for SA and "Medium" for ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | CSR3713ESS |
    And Delete System Account User "CSR3713SA" from System Accounts page
    And Create New System Account User
      | SAUser    | ValidationMessage  |
      | CSR3713SA | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CSR3713ESS | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Minimum Required Characters "7" and Security Level "High" in GP for SA
    And Set Minimum Required Characters "6" and Security Level "Medium" in GP for ESS
    And Logout from Cosec Web
    And Set User password and Refresh Page
      | User       | NewPassword | ConfirmPassword | Validation                                                                                        |  
      | CSR3713SA  | admin1      | admin1          | New password must contain minimum 7 characters                                                    |  
      | CSR3713SA  |     1234567 |         1234567 | Mandatory characters are : 1 Uppercase (A-Z) 1 Lowercase (a-z) 1 Number (0-9) 1 Special Character |  
      | CSR3713SA  | Admin@123   | Admin@123       | LOGIN                                                                                             |  
      | CSR3713ESS | admin       | admin           | New password must contain minimum 6 characters                                                    |  
      | CSR3713ESS | adminn      | adminn          | Mandatory characters are: 1 Lowercase (a-z), 1 Number (0-9)                                       |  
      | CSR3713ESS | Admin123    | Admin123        | LOGIN                                                                                             |  
    And Reset "Password Policy" page to default

  @CSR3713_3
  Scenario: Verify Password Security Level "High" for SA and "Low" for ESS
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID     |
      | CSR3713ESS |
    And Delete System Account User "CSR3713SA" from System Accounts page
    And Create New System Account User
      | SAUser    | ValidationMessage  |
      | CSR3713SA | Saved Successfully |
    And Create user from user configuration
      | userid     | Active | AtdEnable | ACSEnable | ESSEnable | ESSDetail | PunchMarkingviaESS | Validation         |
      | CSR3713ESS | True   | True      | True      | True      | True      | True               | Saved Successfully |
    And Set Minimum Required Characters "7" and Security Level "High" in GP for SA
    And Set Minimum Required Characters "5" and Security Level "Low" in GP for ESS
    And Logout from Cosec Web
    And Set User password and Refresh Page
      | User       | NewPassword | ConfirmPassword | Validation                                                                                        |  
      | CSR3713SA  | admin1      | admin1          | New password must contain minimum 7 characters                                                    |  
      | CSR3713SA  |     1234567 |         1234567 | Mandatory characters are : 1 Uppercase (A-Z) 1 Lowercase (a-z) 1 Number (0-9) 1 Special Character |  
      | CSR3713SA  | Admin@123   | Admin@123       | LOGIN                                                                                             |  
      | CSR3713ESS | admi        | admi            | New password must contain minimum 5 characters                                                    |  
      | CSR3713ESS | admin       | admin           | LOGIN                                                                                             |  
    And Reset "Password Policy" page to default

    