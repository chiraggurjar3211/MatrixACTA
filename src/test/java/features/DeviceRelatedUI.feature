@tag
Feature: Title of your feature
  I want to use this template for my feature file

  @Items
  Scenario: Maximum Item in cafeteria - Note: Max 255 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum Items in cafeteria module
      | ItemCount | Image |
      |       255 | False |

  @Menus
  Scenario: Maximum Menu in cafeteria - Note: Max 999 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum Menus in cafeteria module
      | MenuCount |
      |       999 |

  @2-PersonGroup
  Scenario: Maximum 2-Person Group in Access Control - Note: Max 9999 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum Two person Group in Access Control module
      | GroupCount |
      |       9999 |

  @FirstINUser
  Scenario: Maximum First IN User Group in Access Control - Note: Max 99 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum First IN User Group in Access Control module
      | GroupCount |
      |         99 |
    And Assign Max 999 users in First IN User group "FInUsersGroup01"

  @TimeFrames
  Scenario: Maximum Time Frames in Device module - Note: Max 99 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum Time Frames in Device module
      | TimeFrameCount |
      |             99 |

  @AccessSchedules
  Scenario: Maximum Access Schedules in Device module - Note: Max 99 allowed
    Given Open Cosec Web
    And Login with user
      | username | password | Validation           |
      | sa       | admin    | Welcome System Admin |
    And Create Maximum Access Schedules in Device module
      | AccessScheduleCount |
      |                  99 |
      
      
       @StanalonePanel_SmartElevatorFloorGroup
  Scenario: Create Smart Elevator Floor Group in Stanalone Panel 
    Given Open Cosec Web
    And Open Device Login Page
    And Device login with user
      | username | password | Validation |
      | admin    | 1234     | Dashboard  |
	And Create Elevator in Smart Elevator Elevator Access Control
		|CreatedElevatorNO|ElevatorName|EleTermIPAddress|
		|32				 |Elevator        |192.168.27.129|
	And Create Smart Elevator Flooe Group in Smart Elevator Elevator Access Control
		|CreatedSmartElevatorNO   |GroupName       |
		|999				      |Group           |
