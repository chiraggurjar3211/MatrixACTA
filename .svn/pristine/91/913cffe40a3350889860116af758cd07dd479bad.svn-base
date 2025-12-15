@SystemAccount_OnBehalf
Feature: System Account OnBehalf Applications
  I want to use this template for my feature file


         @FIT7073
  Scenario: UI Attendance Correction Restrictions - FIT7073
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Attendance Policy
      | PlcName    | MaxPunchesToCons | AtdCorrSLvOffRestApplyTo | AtdCorrSLvOffRestMinDays | AtdCorrSLvOffRestMaxDays | AtdCorrSLvOffRestSpecPeriod | AtdCorrSLvOffRestType           | AtdCorrSLvOffRestPeriod | AtdCorrSLvOffRestPeriodCnt | validation         |
      | FIT7073_1  |                2 | Attendance Correction    |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_2  |                2 | Attendance Correction    |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_3  |                2 | Attendance Correction    |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_4  |                2 | Attendance Correction    |                          |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_5  |                2 |  Short Leave/Official In-Out     |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_6  |                2 |  Short Leave/Official In-Out     |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_7  |                2 |  Short Leave/Official In-Out     |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_8  |                2 |  Short Leave/Official In-Out     |                          |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_9  |                2 |  Short Leave/Official In-Out     |                        2 |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_10 |                2 |   Both      |                          |                        5 | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_11 |                2 |   Both      |                        2 |                          | False                       |                                 |                         |                            | Saved Successfully |
      | FIT7073_12 |                2 |   Both      |                          |                          | False                       |                                 |                         |                            | Saved Successfully |
