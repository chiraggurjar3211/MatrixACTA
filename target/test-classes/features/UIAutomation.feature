@WeeklyOT
Feature: Ui Automation Script

  #@ARGOFACE300Basic
  #Scenario: Argo Face 300 Basic Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Basic"

  #@ARGOFACE300Reader
  #Scenario: Argo Face 300 Readers Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Reader"
    
  #@ARGOFACE300Reader
  #Scenario: Argo Face 300 General Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300General"
    
  #@ARGOFACE300Reader
  #Scenario: Argo Face 300 Access Settings Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300AccessSettings"
    
     #@ARGOFACE300Enrollment
  #Scenario: Argo Face 300 General Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Create Contractor from CWM module
      #| Id    | name  | ValidityEndDate | ContactPerson1 | ContactMobile1 | ContactEmail1   | LicenseNo | Description | EnableAccount | EditBasicDetails | Validation         |
      #| CON_1 | CON_1 | 10              | CON_1          | 111111         | CON_1@gmail.com | 9000      | CON1        | True          | True             | Saved Successfully |
    #And Create WorkOrder from CWM module
      #| Id     | Name   | ValidityStart | ValidityEnd | AssociatedContractorName | ApprovalStageName | MaxWorkerLimit | Validation         |
      #| WO_1 | WO_1 |             0 |          10 | CON_1                  | Approval Stage-1           |              5 | Saved Successfully |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Enrollment"
    
    #@ARGOFACE300Reader
  #Scenario: Argo Face 300 Voice Guidance Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #And Upload Audio File in Manage Voice Guidance Audio Page
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300VoiceGuidance"
    
    
  #@ARGOFACE300Advanced_Settings
  #Scenario: Argo Face 300 Advanced Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Advanced_Settings"

  #@ARGOFACE300Advanced_Alarms
  #Scenario: Argo Face 300 Alarms Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Advanced_Alarms"
    
  #@ARGOFACE300Advanced_Timers
  #Scenario: Argo Face 300 Timers Tab UI Control And Validation Checked
    #Given Open Cosec Web
    #And Login with user
      #| username | password | Validation           |
      #| sa       | admin    | Welcome System Admin |
    #When the UI controls are verified as per the Excel sheet "ARGOFACE300Advanced_Timers"
    
  @ARGOFACE300Advanced_Wiegand
  Scenario: Argo Face 300 Wiegand Tab UI Control And Validation Checked
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    When the UI controls are verified as per the Excel sheet "ARGOFACE300Advanced_Wiegand"