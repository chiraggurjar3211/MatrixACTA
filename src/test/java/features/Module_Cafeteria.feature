@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @CMM1
  Scenario: Item - Discount Level
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
      | CMM3   |
      | CMM4   |
      | CMM5   |
      | CMM6   |
      | CMM7   |
      | CMM8   |
      | CMM9   |
      | CMM10  |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     80 |     70 |     60 |     50 |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 2 | Saved Successfully |                      |
      | CMM3   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 3 | Saved Successfully |                      |
      | CMM4   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 4 | Saved Successfully |                      |
      | CMM5   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None             | Saved Successfully |                      |
      | CMM6   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | Saved Successfully |                 1000 |
      | CMM7   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 2 | Saved Successfully |                 1000 |
      | CMM8   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 3 | Saved Successfully |                 1000 |
      | CMM9   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 4 | Saved Successfully |                 1000 |
      | CMM10  | True      | True      | True               | True      | True            | Post-Paid   |                   | None             | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id                                                 |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2,CMM3,CMM4,CMM5,CMM6,CMM7,CMM8,CMM9,CMM10 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
      | CMM2   | Recharge |           1000 | Recharge Successfully |
      | CMM3   | Recharge |           1000 | Recharge Successfully |
      | CMM4   | Recharge |           1000 | Recharge Successfully |
      | CMM5   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&11:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&10:55               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM3    | 0&10:50               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM4    | 0&10:45               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM5    | 0&10:40               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM1    | Yes     |                   |
      | CMM2    | Yes     |                   |
      | CMM3    | Yes     |                   |
      | CMM4    | Yes     |                   |
      | CMM5    | Yes     |                   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM6    | 0&10:35               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM7    | 0&10:30               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM8    | 0&10:25               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM9    | 0&10:20               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM10   | 0&10:15               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM6    | Yes     |                   |
      | CMM7    | Yes     |                   |
      | CMM8    | Yes     |                   |
      | CMM9    | Yes     |                   |
      | CMM10   | Yes     |                   |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       40 |        1 |   10.00 | 0&11:00              |
      | CMM2   | CMM_I1 |         50 |       35 |        1 |   15.00 | 0&10:55              |
      | CMM3   | CMM_I1 |         50 |       30 |        1 |   20.00 | 0&10:50              |
      | CMM4   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:45              |
      | CMM5   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:40              |
      | CMM6   | CMM_I1 |         50 |       40 |        1 |   10.00 | 0&10:35              |
      | CMM7   | CMM_I1 |         50 |       35 |        1 |   15.00 | 0&10:30              |
      | CMM8   | CMM_I1 |         50 |       30 |        1 |   20.00 | 0&10:25              |
      | CMM9   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:20              |
      | CMM10  | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:15              |

  @CMM2
  Scenario: Cafeteria Settings - Prepaid - Limit Recharge Amount
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Set value in Cafeteria Settings in CMM module
      | PreLimitRechargeAmount | PreMaxRechargeAmount | PostAlwdUsagePerMonth |
      | True                   |                 2000 |                  1000 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation                                                |
      | CMM1   | Recharge |           2001 | Please enter Recharge Value less than or equal to 2000.00 |
      | CMM1   | Recharge |           2000 | Recharge Successfully                                     |
    And Set value in Cafeteria Settings in CMM module
      | PreLimitRechargeAmount | PreMaxRechargeAmount | PostAlwdUsagePerMonth |
      | False                  |                      |                  1000 |

  @CMM3
  Scenario: Cafeteria Settings - Prepaid - Daily Limit Block
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
      | CMM3   |
      | CMM4   |
      | CMM5   |
      | CMM6   |
      | CMM7   |
      | CMM8   |
      | CMM9   |
      | CMM10  |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Set value in Cafeteria Settings in CMM module
      | PreMonthlyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerMonth | PreDailyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | False                              |                        | True                             |                  100 |                  1000 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device      | id   |
      | ARGO FACE  | CMM_Device1 | CMM1 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      | CMM1   |       0 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    Then Verify blocked user in CMM module
      | Userid | BlockedOrNot | BlockedFor | DaysConsumption | MaximumUsageLimitPerDay |
      | CMM1   | Yes          |          0 |          150.00 |                  100.00 |
    And Set value in Cafeteria Settings in CMM module
      | PreDailyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | False                            |                      |                  1000 |

  @CMM4
  Scenario: Cafeteria Settings - Prepaid - Monthly Limit Block
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Set value in Cafeteria Settings in CMM module
      | PreMonthlyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerMonth | PreDailyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | True                               |                    150 | False                            |                      |                  1000 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device      | id   |
      | ARGO FACE  | CMM_Device1 | CMM1 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      | CMM1   |       0 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
    Then Verify blocked user in CMM module
      | Userid | BlockedOrNot | MaximumUsageLimitPerMonth |
      | CMM1   | Yes          |                    150.00 |
    And Set value in Cafeteria Settings in CMM module
      | PreMonthlyBlockUserOnMaxUsageLimit | PreMaxUsageLmtPerMonth | PostAlwdUsagePerMonth |
      | False                              |                        |                  1000 |

  @CMM5
  Scenario: Cafeteria Settings - Postpaid - Daily Limit Block
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Set value in Cafeteria Settings in CMM module
      | PostMonthlyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerMonth | PostDailyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | False                               |                         | True                              |                   100 |                  1000 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Post-Paid   | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device      | id   |
      | ARGO FACE  | CMM_Device1 | CMM1 |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      | CMM1   |       0 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    Then Verify blocked user in CMM module
      | Userid | BlockedOrNot | BlockedFor | DaysConsumption | MaximumUsageLimitPerDay |
      | CMM1   | Yes          |          0 |          150.00 |                  100.00 |
    And Set value in Cafeteria Settings in CMM module
      | PostDailyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | False                             |                       |                  1000 |

  @CMM6
  Scenario: Cafeteria Settings - Postpaid - Monthly Limit Block
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Set value in Cafeteria Settings in CMM module
      | PostMonthlyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerMonth | PostDailyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerDay | PostAlwdUsagePerMonth |
      | True                                |                     150 | False                             |                       |                  1000 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Post-Paid   | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device      | id   |
      | ARGO FACE  | CMM_Device1 | CMM1 |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      | CMM1   |       0 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
    Then Verify blocked user in CMM module
      | Userid | BlockedOrNot | MaximumUsageLimitPerMonth |
      | CMM1   | Yes          |                    150.00 |
    And Set value in Cafeteria Settings in CMM module
      | PostMonthlyBlockUserOnMaxUsageLimit | PostMaxUsageLmtPerMonth | PostAlwdUsagePerMonth |
      | False                               |                         |                  1000 |

  @CMM7
  Scenario: Cafeteria Settings - Other Settings - Pre-Ordering
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Set value in Cafeteria Settings in CMM module
      | PreOrderingEnable | AllowedInAdvance | RestrictBeforeMenuStartDD | RestrictBeforeMenuStart | PostAlwdUsagePerMonth |
      | True              |                2 | Hours                     |                       1 |                  1000 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | None          | Saved Successfully |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CMM1   |                          1 | admin        |    1 |
      | CMM2   |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | CMM1     | admin    | Welcome CMM1 |
    And Pre Order Meals from ESS
      | Date | MenuName | ItemName | Quantity | Validation                              |
      |    1 | CMM_M1   | CMM_I1   |        1 | Saved Successfully                      |
      |    2 | CMM_M1   | CMM_I1   |        1 | Saved Successfully                      |
      |    3 | CMM_M1   | CMM_I1   |        1 | Pre-Ordering not open for this date yet |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | CMM2     | admin    | Welcome CMM2 |
    And Pre Order Meals from ESS
      | Date | MenuName | ItemName | Quantity | Validation                              |
      |    1 | CMM_M1   | CMM_I1   |        1 | Saved Successfully                      |
      |    2 | CMM_M1   | CMM_I1   |        1 | Saved Successfully                      |
      |    3 | CMM_M1   | CMM_I1   |        1 | Pre-Ordering not open for this date yet |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Verify Pre-ordered Meals from CMM module
      | Date | UserId | MenuName | ItemName | Quantity |
      |    1 | CMM1   | CMM_M1   | CMM_I1   |        1 |
      |    2 | CMM1   | CMM_M1   | CMM_I1   |        1 |
      |    1 | CMM2   | CMM_M1   | CMM_I1   |        1 |
      |    2 | CMM2   | CMM_M1   | CMM_I1   |        1 |

  @CMM8
  Scenario: Balance Management - Recharge
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Set value in Cafeteria Settings in CMM module
      | PreLimitRechargeAmount | PreMaxRechargeAmount | PostAlwdUsagePerMonth |
      | False                  |                      |                  1000 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |            200 | Recharge Successfully |
    And Verify User Transaction Summary "Recharge" in Cafeteria Module
      | UserID | OpeningBalance | RechargeAmount | ClosingBalance |
      | CMM1   |              0 |            200 |            200 |

  @CMM9
  Scenario: Balance Management - Reset - Reset The Account To Zero
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |
    And Set value in Cafeteria Settings in CMM module
      | PreLimitRechargeAmount | PreMaxRechargeAmount | PostAlwdUsagePerMonth |
      | False                  |                      |                  1000 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | ResetType                     | Validation            |
      | CMM1   | Recharge |            100 |                               | Recharge Successfully |
      | CMM1   | Reset    |                | Reset The Account To Zero (0) | Reset Successfully    |
    And Verify User Transaction Summary "Reset" in Cafeteria Module
      | UserID | OpeningBalance | ResetAmount | ClosingBalance |
      | CMM1   |            100 |         100 |              0 |

  @CMM10
  Scenario: Balance Management - Payment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | DiscountLevel | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Post-Paid   | None          | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id   |
      | ARGO FACE  | CMM_Device1 | CMM1 |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
    And Cafeteria Payment of user from CMM module
      | UserId | Amount | Remark      | Validation                                       |
      | CMM1   |    110 | PaymentDOne | Entered amount cannot be more than the Total Due |
      | CMM1   |    100 | PaymentDOne | Payment Successful                               |
    And Verify User Transaction Summary "Payment" in Cafeteria Module
      | UserID | Opening Balance | Amount Paid | Closing Balance | Remark      |
      | CMM1   |             100 |         100 |               0 | PaymentDOne |

  @CMM11
  Scenario: Balance Management - Manual Adjustment
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | None          | Saved Successfully |                 1000 |
    And Cafeteria Manual Adjustment of user from CMM module
      | UserId | Adjustment | Amount | Remark       | Validation                     |
      | CMM1   | Credit     |    100 | ManualCredit | Process Completed Successfully |
      | CMM1   | Debit      |     50 | ManualDebit  | Process Completed Successfully |
      | CMM2   | Credit     |    100 | ManualCredit | Process Completed Successfully |
      | CMM2   | Debit      |     50 | ManualDebit  | Process Completed Successfully |
    And Verify User Transaction Summary "Manual Credit/Debit" in Cafeteria Module
      | UserID | Adjustment Type | Opening Balance | Adjustment Amount | Closing Balance | Remark       |
      | CMM1   | Debit           |             100 |                50 |              50 | ManualDebit  |
      | CMM1   | Credit          |               0 |               100 |             100 | ManualCredit |
      | CMM2   | Debit           |            -100 |                50 |             -50 | ManualDebit  |
      | CMM2   | Credit          |               0 |               100 |            -100 | ManualCredit |

  @CMM12
  Scenario: Correction Approval - Approve Reject
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | False         |        |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | None          | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Set Password via API
      | Userid | user-verified-for-password | new-password | type |
      | CMM1   |                          1 | admin        |    1 |
      | CMM2   |                          1 | admin        |    1 |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | CMM1     | admin    | Welcome CMM1 |
    And Transaction Correction Application from ESS
      | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      |      -1 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation   |
      | CMM2     | admin    | Welcome CMM2 |
    And Transaction Correction Application from ESS
      | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           2 | Saved Successfully |
      |      -1 | 11:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    And Logout from Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Correction Approval from CMM module
      | TrnDate | UserId | Approval | Validation         |
      |       0 | CMM1   | Approve  | Saved Successfully |
      |      -1 | CMM1   | Reject   | Saved Successfully |
      |       0 | CMM2   | Approve  | Saved Successfully |
      |      -1 | CMM2   | Reject   | Saved Successfully |
    And Verify Transaction Correction Application status in Manual Correction from CMM module
      | UserId | TrnDateTime | Status   |
      | CMM1   | 0&10:00     | Approved |
      | CMM1   | -1&11:00    | Rejected |
      | CMM2   | 0&10:00     | Approved |
      | CMM2   | -1&11:00    | Rejected |

  @CMM13
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Restrict Quantity Per Item - Deny Transaction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1            |                    2 | Deny Transaction              |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&-1                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&-2                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                               |
      | CMM1    | Yes     |                                                                 |
      | CMM1    | Yes     |                                                                 |
      | CMM1    | No      | Daily maximum quantity allowed limit exceeded for selected Item |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&-1                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&-2                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                               |
      | CMM2    | Yes     |                                                                 |
      | CMM2    | Yes     |                                                                 |
      | CMM2    | No      | Daily maximum quantity allowed limit exceeded for selected Item |

  @CMM14
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Restrict Quantity Per Item - Allow Transaction Without Discount
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity      |
      | CMM_CUP1 | CMM_I1            |                    2 | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&09:55               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&09:50               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&09:55               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&09:50               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&09:55              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&09:50              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&09:55              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&09:50              |

  @CMM15
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Shift Restrictions - Deny Transaction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyShiftRestriction | DailyShiftRestrictionAction |
      | CMM_CUP1 | True                  | Deny Transaction            |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&15:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&08:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&19:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                  |
      | CMM1    | Yes     |                                                    |
      | CMM1    | Yes     |                                                    |
      | CMM1    | No      | Correction is not allowed for out of shift timings |
      | CMM1    | No      | Correction is not allowed for out of shift timings |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&15:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&08:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&19:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                  |
      | CMM2    | Yes     |                                                    |
      | CMM2    | Yes     |                                                    |
      | CMM2    | No      | Correction is not allowed for out of shift timings |
      | CMM2    | No      | Correction is not allowed for out of shift timings |

  @CMM16
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Shift Restrictions - Allow Transaction Without Discount
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyShiftRestriction | DailyShiftRestrictionAction        |
      | CMM_CUP1 | True                  | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&15:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&08:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&19:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&15:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&08:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&19:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&15:00              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&08:00              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&19:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&15:00              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&08:00              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&19:00              |

  @CMM17
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Day Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyDayRestrictions |
      | CMM_CUP1 | WO                   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
       And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Change Shift via API
      | userid | FromDt | ToDt | shift-id | week-off | public-holiday |
      | CMM1   |      0 |    0 |          |        0 |                |
      | CMM1   |     -1 |   -1 |          |        1 |                |
      | CMM2   |      0 |    0 |          |        0 |                |
      | CMM2   |     -1 |   -1 |          |        1 |                |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                           |
      | CMM1    | Yes     |                                             |
      | CMM1    | No      | Correction is not allowed on restricted day |
      | CMM2    | Yes     |                                             |
      | CMM2    | No      | Correction is not allowed on restricted day |

  @CMM18
  Scenario: Cafeteria Usage Policy - Monthly Restrictions - Restrict Quantity Per Item - Deny Transaction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1              |                      2 | Deny Transaction                |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | -2&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                                 |
      | CMM1    | Yes     |                                                                   |
      | CMM1    | Yes     |                                                                   |
      | CMM1    | No      | Monthly maximum quantity allowed limit exceeded for selected Item |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | -2&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                                 |
      | CMM2    | Yes     |                                                                   |
      | CMM2    | Yes     |                                                                   |
      | CMM2    | No      | Monthly maximum quantity allowed limit exceeded for selected Item |

  @CMM19
  Scenario: Cafeteria Usage Policy - Monthly Restrictions - Restrict Quantity Per Item - Allow Transaction Without Discount
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity    |
      | CMM_CUP1 | CMM_I1              |                      2 | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | -2&10:00              | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -1&10:00              | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
      | CMM1    | Yes     |                   |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | -2&10:00              | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -1&10:00              | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
      | CMM2    | Yes     |                   |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | -2&10:00             |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | -1&10:00             |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | -2&10:00             |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | -1&10:00             |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |

  @CMM20
  Scenario: Cafeteria Usage Policy - Weekly Restrictions
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | WeeklyRestriction | MaximumWeeklyLimit |
      | CMM_CUP1 | True              |                100 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | None          | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&11:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&12:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                     |
      | CMM2    | Yes     |                                       |
      | CMM2    | Yes     |                                       |
      | CMM2    | No      | Maximum Weekly Allowed Limit Exceeded |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | 0&10:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&11:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&12:00               | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                     |
      | CMM1    | Yes     |                                       |
      | CMM1    | Yes     |                                       |
      | CMM1    | No      | Maximum Weekly Allowed Limit Exceeded |

  @CMM21
  Scenario: Cafeteria Usage Policy - Daily/Monthly Restrictions Combination
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1            |                    1 | Deny Transaction              | CMM_I1              |                      3 | Deny Transaction                |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM1    | -3&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -3&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -2&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM1    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                                 |
      | CMM1    | Yes     |                                                                   |
      | CMM1    | No      | Daily maximum quantity allowed limit exceeded for selected Item   |
      | CMM1    | Yes     |                                                                   |
      | CMM1    | Yes     |                                                                   |
      | CMM1    | No      | Monthly maximum quantity allowed limit exceeded for selected Item |
    When Import Data "Purchase"
      | User ID | Transaction Date-Time | POS Device ID | Menu ID | Item ID | Quantity |
      | CMM2    | -3&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -3&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -2&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | -1&0                  | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
      | CMM2    | 0&0                   | CMM_Device1   | CMM_M1  | CMM_I1  |        1 |
    And Import "XLS" and check Imported Data for "Purchase"
      | User ID | Success | Error Description                                                 |
      | CMM2    | Yes     |                                                                   |
      | CMM2    | No      | Daily maximum quantity allowed limit exceeded for selected Item   |
      | CMM2    | Yes     |                                                                   |
      | CMM2    | Yes     |                                                                   |
      | CMM2    | No      | Monthly maximum quantity allowed limit exceeded for selected Item |

  @CMM22
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Restrict Quantity Per Item - Deny Transaction - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1            |                    2 | Deny Transaction              |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                                                      |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |       0 | 09:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Daily maximum quantity allowed limit exceeded for selected I... |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |       0 | 09:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Daily maximum quantity allowed limit exceeded for selected I... |

  @CMM23
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Restrict Quantity Per Item - Allow Transaction Without Discount - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity      |
      | CMM_CUP1 | CMM_I1            |                    2 | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 09:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 09:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&08:00              |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&09:00              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&08:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&09:00              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |

  @CMM24
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Shift Restrictions - Deny Transaction - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyShiftRestriction | DailyShiftRestrictionAction |
      | CMM_CUP1 | True                  | Deny Transaction            |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                                         |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                 |
      | CMM1   |       0 | 15:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                 |
      | CMM1   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed for out of shift timings |
      | CMM1   |       0 | 19:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed for out of shift timings |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                 |
      | CMM2   |       0 | 15:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                 |
      | CMM2   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed for out of shift timings |
      | CMM2   |       0 | 19:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed for out of shift timings |

  @CMM25
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Shift Restrictions - Allow Transaction Without Discount - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyShiftRestriction | DailyShiftRestrictionAction        |
      | CMM_CUP1 | True                  | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 15:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 19:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 15:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 08:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 19:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&15:00              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&08:00              |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&19:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | 0&15:00              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&08:00              |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&19:00              |

  @CMM26
  Scenario: Cafeteria Usage Policy - Daily Restrictions - Day Restrictions - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyDayRestrictions |
      | CMM_CUP1 | WO                   |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Run Shift Process for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "0" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
       And Run Shift Process for Month = "-1" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Run Monthly Attendance Process with Close Attendance Period = "False" for Month = "-1" and Year = "0"
      | UserID |
      | CMM1   |
      | CMM2   |
    And Change Shift via API
      | userid | FromDt | ToDt | shift-id | week-off | public-holiday |
      | CMM1   |      0 |    0 |          |        0 |                |
      | CMM1   |     -1 |   -1 |          |        1 |                |
      | CMM2   |      0 |    0 |          |        0 |                |
      | CMM2   |     -1 |   -1 |          |        1 |                |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                                  |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                          |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed on restricted day |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                          |
      | CMM2   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Correction is not allowed on restricted day |

  @CMM27
  Scenario: Cafeteria Usage Policy - Monthly Restrictions - Restrict Quantity Per Item - Deny Transaction - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1              |                      2 | Deny Transaction                |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                                                      |
      | CMM1   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Monthly maximum quantity allowed limit exceeded for selected... |
      | CMM2   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Monthly maximum quantity allowed limit exceeded for selected... |

  @CMM28
  Scenario: Cafeteria Usage Policy - Monthly Restrictions - Restrict Quantity Per Item - Allow Transaction Without Discount - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity    |
      | CMM_CUP1 | CMM_I1              |                      2 | Allow Transaction Without Discount |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation         |
      | CMM1   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully |
    And Verify User Transaction Summary "Purchase" in Cafeteria Module
      | UserID | Item   | Unit Price | Discount | Quantity | Payable | Transaction DateTime |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | -2&10:00             |
      | CMM1   | CMM_I1 |         50 |       25 |        1 |   25.00 | -1&10:00             |
      | CMM1   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | -2&10:00             |
      | CMM2   | CMM_I1 |         50 |       25 |        1 |   25.00 | -1&10:00             |
      | CMM2   | CMM_I1 |         50 |        0 |        1 |   50.00 | 0&10:00              |

  @CMM29
  Scenario: Cafeteria Usage Policy - Weekly Restrictions - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | WeeklyRestriction | MaximumWeeklyLimit |
      | CMM_CUP1 | True              |                100 |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | None          | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | None          | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                            |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                    |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                    |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Maximum Weekly Allowed Limit Exceeded |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                    |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                    |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Maximum Weekly Allowed Limit Exceeded |

  @CMM30
  Scenario: Cafeteria Usage Policy - Daily/Monthly Restrictions Combination - Using Manual Correction
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Delete user via API
      | UserID |
      | CMM1   |
      | CMM2   |
    And Delete Device from Device Configuration
      | DeviceName  |
      | CMM_Device1 |
    And Delete Cafeteria Usage Policy
      | Name     |
      | CMM_CUP1 |
    And Delete Menu from CMM module
      | Name   |
      | CMM_M1 |
    And Delete Item from CMM module
      | Name   |
      | CMM_I1 |
    And Add Device from device module
      | DeviceType | DeviceName  | MACAddress        | IPAddress | Application |
      | ARGO FACE  | CMM_Device1 | AA:AA:AA:11:11:11 |           | Cafeteria   |
    And Create Item from CMM module
      | Name   | Price | DiscountApply | Level1 | Level2 | Level3 | Level4 |
      | CMM_I1 |    50 | True          |     50 |        |        |        |
    And Create Menu from CMM module
      | Name   | Activate | ContainsDefaultItem | ItemList |
      | CMM_M1 | True     | True                | CMM_I1   |
    And POS Devices Configuration from CMM module for Device "CMM_Device1" and Menu names "CMM_M1"
      | Menu   | StartTime | EndTime | ScheduleDays |
      | CMM_M1 | 00:00     | 23:59   | Check All    |
    And Create Cafeteria Usage Policy from CMM module
      | Name     | DailyRestrictItem | DailyMaxItemQuantity | DailyItemExceedingMaxQuantity | MonthlyRestrictItem | MonthlyMaxItemQuantity | MonthlyItemExceedingMaxQuantity |
      | CMM_CUP1 | CMM_I1            |                    1 | Deny Transaction              | CMM_I1              |                      3 | Deny Transaction                |
    And Create user from user configuration
      | userid | ESSEnable | ESSDetail | PunchMarkingviaESS | AtdEnable | CafeteriaEnable | AccountType | BalanceManagement | DiscountLevel    | CafeUsagePolicy | Validation         | AllowedUsagePerMonth |
      | CMM1   | True      | True      | True               | True      | True            | Pre-Paid    | Server Based      | Discount Level 1 | CMM_CUP1        | Saved Successfully |                      |
      | CMM2   | True      | True      | True               | True      | True            | Post-Paid   |                   | Discount Level 1 | CMM_CUP1        | Saved Successfully |                 1000 |
    And Assign device to user via API
      | DeviceType | device      | id        |
      | ARGO FACE  | CMM_Device1 | CMM1,CMM2 |
    And Cafeteria Recharge of user from CMM module
      | UserId | Process  | RechargeAmount | Validation            |
      | CMM1   | Recharge |           1000 | Recharge Successfully |
    And Manual Correction from CMM module
      | UserId | TrnDate | TrnTime | DeviceName  | MenuName | ItemName | NewQuantity | Validation                                                      |
      | CMM1   |      -3 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |      -3 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Daily maximum quantity allowed limit exceeded for selected I... |
      | CMM1   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM1   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Monthly maximum quantity allowed limit exceeded for selected... |
      | CMM2   |      -3 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |      -3 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Daily maximum quantity allowed limit exceeded for selected I... |
      | CMM2   |      -2 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |      -1 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Saved Successfully                                              |
      | CMM2   |       0 | 10:00   | CMM_Device1 | CMM_M1   | CMM_I1   |           1 | Monthly maximum quantity allowed limit exceeded for selected... |
