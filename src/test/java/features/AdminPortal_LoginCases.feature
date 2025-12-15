@tag
Feature: Title of your feature
  I want to use this template for my feature file
	##Story Id CSR_3712######################

  #CSR-6446 - Strengthening Admin Login Security on COSEC Admin Portal by providing Password Policy
 @CSR6446_1
  Scenario: Verify Password Reset Period (change Days) Scenario
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com | 6446    | Saved Successfully |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | True              | 1                  | 5               | Low         | True                 | 5              | 15           | 10              | 15             | False        |          |
    And Logout from Cosec Admin Portal
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CSR6446 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CSR6446  | admin    | Welcome CSR6446 |
    And Logout from Cosec Admin Portal
    When change system date from current date to "2".
    Then Open Cosec Admin Portal
    And Login with user
      | username | password | Validation   |
      | CSR6446  | admin    | Set Password |
    And Open Cosec Admin Portal
    And Set User password
      | User | NewPassword | ConfirmPassword | Validation |
      | sa   | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    | 5               | Low         | True                 | 5              | 15           | 10              | 15             | False        |          |
    And change system date from current date to "-2".

  @CSR6446_2
  Scenario: Verify Password Security Level "Medium" with Invalid values Scenario
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com |    6446 | Saved Successfully |
    When Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               6 | Medium      | True                 |              5 |           15 |              10 |             15 | False        |          |
    And Logout from Cosec Admin Portal
    Then Set User password and Refresh Page
      | User    | NewPassword | ConfirmPassword | Validation                                                  |
      | CSR6446 | admin       | admin           | New password must contain minimum 6 characters              |
      | CSR6446 | adminabc    | adminabc        | Mandatory characters are: 1 Lowercase (a-z), 1 Number (0-9) |
      | CSR6446 | admin1      | admin1          | LOGIN                                                       |
    And Login with user
      | username | password | Validation      |
      | CSR6446  | admin1   | Welcome CSR6446 |
    And Logout from Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |

  @CSR6446_3
  Scenario: Verify Password Security Level "High" with Invalid values Scenario
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com |    6446 | Saved Successfully |
    When Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               7 | High        | True                 |              5 |           15 |              10 |             15 | False        |          |
    And Logout from Cosec Admin Portal
    Then Set User password and Refresh Page
      | User    | NewPassword | ConfirmPassword | Validation                                                                                        |
      | CSR6446 | admin       | admin           | New password must contain minimum 7 characters                                                    |
      | CSR6446 | adminabc    | adminabc        | Mandatory characters are : 1 Uppercase (A-Z) 1 Lowercase (a-z) 1 Number (0-9) 1 Special Character |
      | CSR6446 | Admin@123   | Admin@123       | LOGIN                                                                                             |
    And Login with user
      | username | password  | Validation      |
      | CSR6446  | Admin@123 | Welcome CSR6446 |
    And Logout from Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |

  @CSR6446_4
  Scenario: Verify Lock Account for Invalid Attempts Scenario
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com |    6446 | Saved Successfully |
    When Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              3 |            1 |              10 |             15 | False        |          |
    And Logout from Cosec Admin Portal
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CSR6446 | admin       | admin           | LOGIN      |
    Then Login with user
      | username | password | Validation                                                   |
      | CSR6446  | admin12  | Incorrect Login ID or Password                               |
      | CSR6446  | admin12  | Incorrect Login ID or Password                               |
      | CSR6446  | admin12  | Maximum Invalid attempts reached. Please try after 1 minutes |
      | CSR6446  | admin12  | Account has been locked due to maximum Invalid attempts      |
    And Wait for "1" min
    Then Login with user
      | username | password | Validation      |
      | CSR6446  | admin    | Welcome CSR6446 |
    And Logout from Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |

  @CSR6446_5
  Scenario Outline: Verify Maximum OTP Generation Attempts and Resend OTP Timer Scenario
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
      And Set SMS Configuration in Admin Portal
      And Set Email Configuration in Admin Portal
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com |    6446 | Saved Successfully |
    When Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |               3 |              1 | False        |          |
    And Logout from Cosec Admin Portal
    When Enter "<Credential>" and click on OTP
    Then Click on Resend OTP "3" time
    And Validate "Maximum count reached to generate OTP. Please try after sometime."
    And Wait for "2" min
    Then Click on Resend OTP "1" time
    And Validate "OTP (valid for 3 mins) has been sent to your registered"
    And Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |

    Examples: 
      | Credential |
      | CSR6446    |
      
       #CSR-5120 - Supporting Security Q&A while Login page in Admin Portal
  # Forget Password - Send OTP not possible due to OTP fatch
  @CSR5120_1
  Scenario: Forget Password - Security Question Case1
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |
    
    And Reset Security Question Answer from Change Password page
      | SecurityQuestion | SecurityAnswer | ConfirmSecurityAnswer | CurrentPassword | Validation         |
      | Matrix           | Cosec          | Cosec                 | admin           | Saved Successfully |
    And Logout from Cosec Admin Portal
    When Enter "sa" and Click on Forget Password
    And Select "Security Question" option and Click on Send or Next button on Forget password screen
    Then Enter Security Answer and Click on Next and set password
      | SecurityAnswer | NewPassword | ConfirmPassword | Validation |
      | Cosec          | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |

  @CSR5120_2
  Scenario: Forget Password - Security Question Case2
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Reset Security Question Answer from Change Password page
      | SecurityQuestion | SecurityAnswer | ConfirmSecurityAnswer | CurrentPassword | Validation         |
      | Matrix           | Cosec          | Cosec                 | admin           | Saved Successfully |
    And Logout from Cosec Admin Portal
    When Enter "sa" and Click on Forget Password
    And Select "Security Question" option and Click on Send or Next button on Forget password screen
    Then Enter Security Answer and Click on Next and set password
      | SecurityAnswer | NewPassword | ConfirmPassword | Validation |
      | COSEC          | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |

  #CSR-5119 - Providing Security Q&A configurations in Admin Portal
  @CSR5119_1
  Scenario: Forget Password - Security Question Case1
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Reset Security Question Answer from Change Password page
      | SecurityQuestion                | SecurityAnswer                  | ConfirmSecurityAnswer           | CurrentPassword | Validation                    |
      | Company Name                    | Matrix                          | Cosec                           | admin           | Answer Mismatch               |
      | Company Name                    | Matrix                          | matrix                          | admin           | Answer Mismatch               |
      | M&();?M                         | Matrix                          | Matrix                          | admin           | Enter valid Security Question |
      | Company Name                    | M&();?M                         | M&();?M                         | admin           | Enter valid Security Answer   |
      | Matrix-_.,()*:@!$+/\\0123456789 | 0123456789-_.,()*:@!$+/\\Mayank | 0123456789-_.,()*:@!$+/\\Mayank | admin           | Saved Successfully            |
    And Logout from Cosec Admin Portal
    When Enter "sa" and Click on Forget Password
    And Select "Security Question" option and Click on Send or Next button on Forget password screen
    Then Enter Security Answer and Click on Next and set password
      | SecurityAnswer                  | NewPassword | ConfirmPassword | Validation |
      | 0123456789-_.,()*:@!$+/\\Mayank | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
      

  @CSR6446_6
  Scenario: Verify Deny Password Reuse
    Given Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin    | Welcome SA |
    And Delete System Account user of Admin Portal
      | UserID  |
      | CSR6446 |
    And Create System Account user of Admin Portal
      | UserID  | Name    | EmailID            | Contact | Validation         |
      | CSR6446 | CSR6446 | CSR6446@matrix.com |    6446 | Saved Successfully |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | True              |                  1 |               5 | Low         | True                 |              5 |           15 |              10 |             15 | True         |        1 |
    And Logout from Cosec Admin Portal
    And Set User password
      | User    | NewPassword | ConfirmPassword | Validation |
      | CSR6446 | admin       | admin           | LOGIN      |
    And Login with user
      | username | password | Validation      |
      | CSR6446  | admin    | Welcome CSR6446 |
    And Logout from Cosec Admin Portal
    When change system date from current date to "2".
    Then Open Cosec Admin Portal
    And Login with user
      | username | password | Validation   |
      | CSR6446  | admin    | Set Password |
      And Open Cosec Admin Portal
    And Set User password and Refresh Page
      | User    | NewPassword | ConfirmPassword | Validation                                               |
      | CSR6446 | admin       | admin           | New Password should not be same as last 1 old passwords. |
      | CSR6446 | admin1      | admin1          | LOGIN                                                    |
      | sa      | admin1      | admin1          | LOGIN                                                    |
    And Open Cosec Admin Portal
    And Login with user
      | username | password | Validation |
      | sa       | admin1   | Welcome SA |
    And Set Password Policy in system configuration page of Admin Portal
      | PwdSecurityPolicy | PwdResetPeriodDays | MinRequiredChar | SecurityLvl | LockAcForInVldAtmpts | MaxInVldAtmpts | AutoUnlcTime | MaxOTPgenAtmpts | ResendOTPafter | DenyPwdReuse | ReuseCnt |
      | False             |                    |               5 | Low         | True                 |              5 |           15 |              10 |             15 | False        |          |
    And change system date from current date to "-2".

 
  