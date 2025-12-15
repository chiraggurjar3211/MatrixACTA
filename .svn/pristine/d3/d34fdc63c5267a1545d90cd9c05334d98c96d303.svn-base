 @API_RG
 Feature: Overtime Feature
   I want to use this template for my feature file

  
# @TS_CPA_1
  # Scenario: Event Auth
    # And Bulk Event generate of users
    # | useridFrom | useridTo | FirstEvtDate | FirstEvtTime | LastEvtDate | LastEvtTime |
    # |          2 |      5000 |           -1 | 080000       |    -1        |   190000     |
       
       # @TS_CPA_1
  # Scenario: Daily Auth
     # And Bulk User create via api
       # | IdFrom   | IdTo    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | attendance-policy |
       # |     251    |     1000 |               1 |         1 |               1 |                  1 |                 3 |

      # And Bulk Event generate of users
       # | useridFrom | useridTo | FirstEvtDate | FirstEvtTime | LastEvtDate | LastEvtTime |
       # |          251 |      1000 |           -1 | 090000       |  -1         |180000        |
      
       # @TS_CPA_1
   # Scenario: ADVANCE OVERTIME
# And Bulk User create via api
       # | IdFrom   | IdTo    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | overtime-policy | Organization_code |
       # |     10001    |     15000 |               1 |         1 |               1 |                  1 |                 2 | ORG2 |
     # And Bulk Set Password via API
       # | IdFrom | IdTo  | user-verified-for-password | new-password | type |
       # | 14001      |  15000  |                          1 | admin        |    1 |
      # And Bulk Advance OT Application generate
       # | useridFrom  | useridTo   | OT-date      | ot-hours | reason        | 
       # |          1 |      5000 |           1 | 0200     |  xyz         |

 @TS_CPA_1
  Scenario: LEAVE APPLICATION
      And Bulk Leave Application generate
       | useridFrom   | useridTo   | half-consideration | Start-date | end-date | leave-code |
       |          5001 |      8000 |           1         | -1         |  -1      |  Q1        |

 
       # @TS_CPA_1
  # Scenario: TOUR APPLICATION
      # And Bulk Leave Application generate
       # | useridFrom   | useridTo   | half-consideration | Start-date | end-date | leave-code |
       # |          1 |      5000 |           1         | -1         |  -1      |  Q2        |


       # @TS_CPA_1
  # Scenario: COFF APPLICAITON
      # And Bulk Leave Application generate
       # | useridFrom   | useridTo   | half-consideration | Start-date | end-date | leave-code |
       # |          1 |      5000 |           1         | 0         |  0      |  Q3        |
       
       # @TS_CPA_1
   # Scenario: Timesheet correction Application
      # And Bulk User create via api
        # | IdFrom   | IdTo    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | job-assignment-type |
        # |     1    |     250 |               1 |         1 |               1 |                  1 |                1 |
     # And Bulk Set Password via API
        # | IdFrom | IdTo  | user-verified-for-password | new-password | type |
        # | 1      |  250  |                          1 | admin        |    1 |
      # And Bulk Event generate of users
        # | useridFrom | useridTo | FirstEvtDate | FirstEvtTime | LastEvtDate | LastEvtTime |
        # |          1 |      250 |           -1 | 090000       |  -1         |130000        |
       # And Bulk Timesheet correction Application generate
        # | useridFrom   | useridTo   | attendance-date | correction-type | job-code | job-count | reason           |
        # |          1 |      250 |           -1     | 0               |  M1      |  1        | XYZ |
              
       # @TS_CPA_1
    # Scenario: FIELD  VISIT CORRECTION Application   #Only shift process needed
      # And Bulk User create via api
        # | IdFrom   | IdTo    | Attendance-calc | ess-login | Ess-detail-edit | Attendance-via-ess | job-assignment-type |
        # |     1    |     250 |               1 |         1 |               1 |                  1 |                1 |
     # And Bulk Set Password via API
        # | IdFrom | IdTo  | user-verified-for-password | new-password | type |
        # | 1      |  250  |                          1 | admin        |    1 |
       # And Bulk field visit correction Application generate
        # | useridFrom   | useridTo   | attendance-date | punch-time | iotype | 
        # |          1 |      5000     |           -1     | 090000        |  0      | 

# @TS_CPA_1
   # Scenario: Visitor Login Authorization
   # And Open Cosec Visitor Portal in new tab
      # | StationLocation  | UserId | Password | validation     |
      # | Default Location | sa     | admin    | Visitor Portal |
      # And Bulk Visitor Login authorization generate
      # | mobileFrom   | mobileTo   |
      # | 1            | 5000        |
   
  # @TS_CPA_1
   # Scenario: AWARD/ PENALTY APPLICATION
    # Given Open Cosec Web
    # And Login with user
      # | username | password | Validation           |
      # | RIC1       | admin    | Welcome RIC1 |

    # And Bulk Event generate of users
       # | useridFrom | useridTo | FirstEvtDate | FirstEvtTime | LastEvtDate | LastEvtTime |
       # |          1 |      2000 |           0 | 090000       |  0         |130000        |
    # And Bulk Timesheet correction Application generate
        # | useridFrom   | useridTo   | attendance-date | correction-type | job-code | job-count | reason           |
        # |          1 |      2000 |           0     | 0               |  J1      |  1        | XYZ |
    # When Bulk Assign Award Penalty Hours from RIC ESS login
      # | UseridFrom | useridTo | AdjustmentType | Hours | Validation         |
      # | 1          | 250      | Award          |  0200 | Saved Successfully |
   
  
 
      
      
      
      
      
        
       