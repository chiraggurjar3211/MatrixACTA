package stepDefinations;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.Dashboard.DashboardPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.path.json.JsonPath;

public class DashboardSD {
	TestContextObject testContextObject;
	public static Properties prop;
	private static Logger logger = LogManager.getLogger(CustomAlertSD.class);

	public DashboardSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Then("the existing {string} data for {string} date should be displayed correctly in the {string}")
	public void the_existing_data_for_date_should_be_displayed_correctly_in_the(String string, String string2,
			String string3) throws InterruptedException {
		String additionalParameterforQ = null;
		if (DashboardPO.additionalDataForDB == null) {
			additionalParameterforQ = "";
		} else {
			additionalParameterforQ = DashboardPO.additionalDataForDB;
		}
		// Fetching Done
		String chartName = string;
		String chart = string3;
		String date = string2;
		Map<String, String> expectedDataValue = new HashMap<String, String>();
		Map<String, String> expectedDataColour = new HashMap<String, String>();
		String fromDate = AbstractMethod.staticDateOrPlusMinusFromCurrentDate(date);
		if (chartName.equalsIgnoreCase("User Statistics")) {
			// Write code here that turns the phrase above into concrete actions
			// Expected Data Fetching

			List<String> result = this.testContextObject.baseTest
					.getMultipleDataFromSameRowforDashboard("WITH DataRows AS (\r\n"
							+ "    SELECT DISTINCT(ub.userid), 1 AS BlockedFlag\r\n"
							+ "    FROM Mx_UserBlockTrn ub WITH (NOLOCK)\r\n"
							+ "    INNER JOIN Mx_VEW_ControllerList mc WITH (NOLOCK)\r\n"
							+ "        ON mc.mid = ub.mid AND mc.type = ub.type\r\n"
							+ "    WHERE ub.status = 0\r\n"
							+ ")\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Active Users' AS Label,\r\n"
							+ "    'ActiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    '' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "WHERE UserIDEnbl = 1 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Regular Users' AS Label,\r\n"
							+ "    'RegularActiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    'ActiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "LEFT JOIN DataRows blockedUsers\r\n"
							+ "    ON blockedUsers.userid = Mx_UserMst.userid\r\n"
							+ "WHERE \r\n"
							+ "    UserIDEnbl = 1\r\n"
							+ "    AND blockedUsers.UserID IS NULL\r\n"
							+ "    AND (\r\n"
							+ "        JoinDT <> CONVERT(datetime, '"+fromDate+"', 103)\r\n"
							+ "        OR JoinDT IS NULL\r\n"
							+ "    ) "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'New Joined Users' AS Label,\r\n"
							+ "    'NewJoinedActiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    'ActiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "WHERE \r\n"
							+ "    JoinDT = CONVERT(datetime, '"+fromDate+"', 103)\r\n"
							+ "    AND UserIDEnbl = 1 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Blocked Users' AS Label,\r\n"
							+ "    'BlockedActiveUsers' AS argument,\r\n"
							+ "    COUNT(DISTINCT ub.UserID) AS Count,\r\n"
							+ "    'ActiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserBlockTrn ub WITH (NOLOCK)\r\n"
							+ "INNER JOIN Mx_UserMst WITH (NOLOCK)\r\n"
							+ "    ON Mx_UserMst.UserID = ub.UserID\r\n"
							+ "LEFT JOIN Mx_VEW_ControllerList m WITH (NOLOCK)\r\n"
							+ "    ON ub.MID = m.MID AND ub.Type = m.Type\r\n"
							+ "WHERE \r\n"
							+ "    Mx_UserMst.UserIDEnbl = 1\r\n"
							+ "    AND m.MID IS NOT NULL\r\n"
							+ "    AND ub.Status = 0 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Inactive Users' AS Label,\r\n"
							+ "    'InactiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    '' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "WHERE UserIDEnbl = 0 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Regular Users' AS Label,\r\n"
							+ "    'RegularInactiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    'InactiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "LEFT JOIN DataRows blockedUsers\r\n"
							+ "    ON blockedUsers.userid = Mx_UserMst.userid\r\n"
							+ "WHERE \r\n"
							+ "    UserIDEnbl = 0\r\n"
							+ "    AND blockedUsers.UserID IS NULL\r\n"
							+ "    AND (BlacklistFlag = 0 OR BlacklistFlag IS NULL)\r\n"
							+ "    AND (\r\n"
							+ "        JoinDT <> CONVERT(datetime, '"+fromDate+"', 103)\r\n"
							+ "        OR JoinDT IS NULL\r\n"
							+ "    ) "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'New Joined Users' AS Label,\r\n"
							+ "    'NewJoinedInactiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    'InactiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "WHERE \r\n"
							+ "    JoinDT = CONVERT(datetime, '"+fromDate+"', 103)\r\n"
							+ "    AND UserIDEnbl = 0 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Blocked Users' AS Label,\r\n"
							+ "    'BlockedInactiveUsers' AS argument,\r\n"
							+ "    COUNT(DISTINCT ub.UserID) AS Count,\r\n"
							+ "    'InactiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserBlockTrn ub WITH (NOLOCK)\r\n"
							+ "INNER JOIN Mx_UserMst WITH (NOLOCK)\r\n"
							+ "    ON Mx_UserMst.UserID = ub.UserID\r\n"
							+ "LEFT JOIN Mx_VEW_ControllerList m WITH (NOLOCK)\r\n"
							+ "    ON ub.MID = m.MID AND ub.Type = m.Type\r\n"
							+ "WHERE \r\n"
							+ "    Mx_UserMst.UserIDEnbl = 0\r\n"
							+ "    AND m.MID IS NOT NULL\r\n"
							+ "    AND ub.Status = 0 "+additionalParameterforQ+"\r\n"
							+ "\r\n"
							+ "UNION ALL\r\n"
							+ "\r\n"
							+ "SELECT \r\n"
							+ "    'Blacklisted Users' AS Label,\r\n"
							+ "    'BlacklistedInactiveUsers' AS argument,\r\n"
							+ "    COUNT(1) AS Count,\r\n"
							+ "    'InactiveUsers' AS mainArgRef\r\n"
							+ "FROM Mx_UserMst WITH (NOLOCK)\r\n"
							+ "WHERE \r\n"
							+ "    UserIDEnbl = 0\r\n"
							+ "    AND BlacklistFlag = 1 "+additionalParameterforQ+"\r\n"
							+ "",chartName);
			expectedDataValue.put("Active Users", result.get(0));
			expectedDataValue.put("Regular Users", result.get(1));
			expectedDataValue.put("New Joined Users", result.get(2));
			expectedDataValue.put("Blocked Users", result.get(3));
			expectedDataValue.put("Inactive Users", result.get(4));
			expectedDataValue.put("Inactive Regular Users", result.get(5));
			expectedDataValue.put("Inactive New Joined Users", result.get(6));
			expectedDataValue.put("Inactive Blocked Users", result.get(7));
			expectedDataValue.put("Blacklisted Users", result.get(8));
			System.out.println("Data is : "+expectedDataValue);
			expectedDataColour.put("Active Users", "rgba(121, 183, 100, 0.75)");
			expectedDataColour.put("Inactive Users", "rgba(242, 85, 85, 0.75)");
			expectedDataColour.put("Blacklisted Users", "rgba(235, 175, 20, 0.75)");
			expectedDataColour.put("Blocked Users", "rgba(255, 168, 158, 1)");
			expectedDataColour.put("New Joined Users", "rgba(76, 114, 246, 0.75)");
			expectedDataColour.put("Regular Users", "rgba(0, 169, 183, 0.75)");
			expectedDataColour.put("Inactive Blocked Users", "rgba(131, 96, 90, 0.75)");
			expectedDataColour.put("Inactive Regular Users", "rgba(140, 206, 118, 1)");
			expectedDataColour.put("Inactive New Joined Users", "rgba(157, 93, 153, 0.75)");
		} else if (chartName.equalsIgnoreCase("Device Summary")) {
			List<String> result = this.testContextObject.baseTest.getMultipleDataFromSameRowforDashboard(
					" WITH datarows AS (SELECT *  FROM (SELECT Count(CASE WHEN MIDEnbl = 1 AND CurrentStatus = 1 THEN 1 END)OnlineDoorDevices, Count(CASE WHEN MIDEnbl = 1 AND CurrentStatus = 0 THEN 1 END) OfflineDoorDevices,Count(CASE WHEN MIDEnbl = 1 AND (CurrentStatus IS null OR CurrentStatus = 4) THEN 1 END) UnknownDoorDevices FROM Mx_SDCCfg WITH (NOLOCK) WHERE DLTDFlg <> 1) A,(SELECT Count(CASE WHEN MIDEnbl = 1 AND CurrentStatus = 1 THEN 1 END) OnlinePanelDevices, Count(CASE WHEN MIDEnbl = 1 AND CurrentStatus = 0 THEN 1 END) OfflinePanelDevices,Count(CASE WHEN MIDEnbl = 1 AND (CurrentStatus IS null OR CurrentStatus = 4) THEN 1 END) UnknownPanelDevices FROM Mx_MasterControllerBasicCfg WITH (NOLOCK) WHERE DLTDFlg <> 1	) B)  SELECT ( OnlineDoorDevices + OnlinePanelDevices ) N'Online Devices', ( OfflineDoorDevices + OfflinePanelDevices ) N'Offline Devices',         ( UnknownDoorDevices + UnknownPanelDevices ) N'Unknown Devices'   FROM   datarows  ",
					chartName);
			expectedDataValue.put("Online Devices", result.get(0));
			expectedDataValue.put("Offline Devices", result.get(1));
			expectedDataValue.put("Unknown Devices", result.get(2));
			expectedDataColour.put("Online Devices", "rgba(121, 183, 100, 0.75)");
			expectedDataColour.put("Offline Devices", "rgba(242, 85, 85, 0.75)");
			expectedDataColour.put("Unknown Devices", "rgba(235, 175, 20, 0.75)");
		} else if (chartName.equalsIgnoreCase("Attendance Summary")) {
			List<String> leaveType = this.testContextObject.baseTest.getMultipleDataFromSameRowforDashboard(
					"select case when LeaveType='T' then 'T' \r\n"
							+ "when LeaveType!='T' then 'L' end as leavetype, leaveid\r\n" + "from Mx_LeaveMst",
					"Leave");
			String leaveid = null;
			String tourID = null;
			for (int i = 0; i < leaveType.size(); i++) {
				String[] leaveTypesplit=leaveType.get(i).split("@");
				String key=leaveTypesplit[0];
				String val=leaveTypesplit[1];
				if (key.equalsIgnoreCase("T")) {
					if (tourID == null) {
						tourID = "'"+val+"'";
					} else {
						tourID = tourID + "," + "'"+val+"'";
					}
				} else {
					if (leaveid == null) {
						leaveid =  "'"+val+"'";
					} else {
						leaveid = leaveid + "," + "'"+ val+ "'";
					}
				}
			}
			System.out.println("**************************Leave id: " + leaveid);
			System.out.println("**************************Tour id: " + tourID);

			List<String> result = this.testContextObject.baseTest
					.getMultipleDataFromSameRowforDashboard("SELECT ISNULL(SUM(CASE \r\n"
							+ "				WHEN da.WrkSFT IS NOT NULL\r\n" + "					AND (\r\n"
							+ "						(\r\n" + "							da.Punch1 IS NOT NULL\r\n"
							+ "							AND LEN(da.Punch1) > 0\r\n" + "							)\r\n"
							+ "						OR (\r\n" + "							da.Punch2 IS NOT NULL\r\n"
							+ "							AND LEN(da.Punch2) > 0\r\n" + "							)\r\n"
							+ "						)\r\n" + "					AND (\r\n"
							+ "						da.RHalf1 IS NOT NULL\r\n"
							+ "						OR da.RHalf2 IS NOT NULL\r\n" + "						)\r\n"
							+ "					AND (\r\n" + "						ISNULL(da.RHalf1, '') NOT IN ("+leaveid+","+tourID+")\r\n"
							+ "						OR da.RHalf1 IS NULL\r\n"
							+ "						OR da.RHalf2 IS NULL\r\n"
							+ "						OR ISNULL(da.RHalf2, '') NOT IN ("+leaveid+","+tourID+")\r\n"
							+ "						)\r\n" + "					THEN 1\r\n" + "				ELSE 0\r\n"
							+ "				END), 0) AS 'Reported'\r\n" + "	,(\r\n" + "		SELECT COUNT(*)\r\n"
							+ "		FROM (\r\n" + "			SELECT da.UserID\r\n"
							+ "				,mx_usermst.Name\r\n" + "				,da.WrkSFT\r\n"
							+ "				,da.RHalf1\r\n" + "				,da.RHalf2\r\n"
							+ "				,da.Punch1 AS InPunch\r\n" + "				,da.OutPunch AS OutPunch\r\n"
							+ "				,da.HourlyPaidLvHrs\r\n" + "				,da.HourlyUnPaidLvHrs\r\n"
							+ "			FROM Mx_DATDTrn da WITH (NOLOCK)\r\n"
							+ "			INNER JOIN Mx_UserMst mx_usermst WITH (NOLOCK) ON da.UserID = mx_usermst.UserID\r\n"
							+ "			WHERE mx_usermst.UserIDEnbl = 1\r\n"
							+ "				AND da.WrkSFT IS NOT NULL\r\n"
							+ "				AND da.PDate = CONVERT(DATETIME, N'" + fromDate + "', 103)\r\n"
							+ "				AND da.Punch1 IS NULL\r\n" + "				AND da.Punch2 IS NULL\r\n"
							+ "				AND (\r\n" + "					da.RHalf1 IS NOT NULL\r\n"
							+ "					OR da.RHalf2 IS NOT NULL\r\n"
							+ "					OR da.SchSTAT IS NULL\r\n"
							+ "					OR ISNULL(da.SchSTAT, N'') NOT IN (\r\n"
							+ "						N'WO'\r\n" + "						,N'PH'\r\n"
							+ "						)\r\n" + "					)\r\n" + "				AND (\r\n"
							+ "					ISNULL(da.RHalf1, N'') NOT IN (\r\n"
							+ "						N'WO'\r\n" + "						,N'PH'\r\n"
							+ "						)\r\n" + "					OR da.RHalf1 IS NULL\r\n"
							+ "					OR ISNULL(da.RHalf2, N'') NOT IN (\r\n"
							+ "						N'WO'\r\n" + "						,N'PH'\r\n"
							+ "						)\r\n" + "					OR da.RHalf2 IS NULL\r\n"
							+ "					)\r\n" + "				AND da.OutPunch IS NULL\r\n"
							+ "				AND (\r\n" + "					ISNULL(da.RHalf1, N'') NOT IN ("+leaveid+","+tourID+")\r\n"
							+ "					OR da.RHalf1 IS NULL\r\n"
							+ "					OR ISNULL(da.RHalf2, N'') NOT IN ("+leaveid+","+tourID+")\r\n"
							+ "					OR da.RHalf2 IS NULL\r\n" + "					) "
							+ additionalParameterforQ + "\r\n" + "			) AS a\r\n" + "		) AS 'Not Reported'\r\n"
							+ "	,ISNULL(SUM(CASE \r\n" + "				WHEN da.WrkSFT IS NOT NULL\r\n"
							+ "					AND (\r\n" + "						(\r\n"
							+ "							ISNULL(da.RHalf1, '') IN ("+leaveid+")\r\n"
							+ "							AND ISNULL(da.RHalf2, '') IN ("+leaveid+","+tourID+")\r\n" + "	"
							+ "				OR (\r\n"
							+ "							ISNULL(da.RHalf1, '') IN ("+leaveid+","+tourID+")\r\n"
							+ "							AND ISNULL(da.RHalf2, '') IN ("+leaveid+"))\r\n" + "							)\r\n"
							+ "						)\r\n" + "					THEN 1\r\n" + "				ELSE 0\r\n"
							+ "				END), 0) AS 'On Leave'\r\n" + "	,ISNULL(SUM(CASE \r\n"
							+ "				WHEN da.WrkSFT IS NOT NULL\r\n" + "					AND (\r\n"
							+ "						ISNULL(da.RHalf1, '') IN ("+tourID+")\r\n"
							+ "						AND ISNULL(da.RHalf2, '') IN ("+tourID+")\r\n"
							+ "						)\r\n" + "					THEN 1\r\n" + "				ELSE 0\r\n"
							+ "				END), 0) AS 'On Tour'\r\n" + "	,ISNULL(SUM(CASE \r\n"
							+ "				WHEN da.WrkSFT IS NOT NULL\r\n" + "					AND (\r\n"
							+ "						(\r\n" + "							da.RHalf1 IS NULL\r\n"
							+ "							AND da.RHalf2 IS NULL\r\n"
							+ "							AND ISNULL(da.SchSTAT, '') IN ('WO')\r\n"
							+ "							)\r\n" + "						OR (\r\n"
							+ "							ISNULL(da.RHalf1, '') IN ('WO')\r\n"
							+ "							AND ISNULL(da.RHalf2, '') IN ('WO')\r\n"
							+ "							)\r\n" + "						)\r\n"
							+ "					THEN 1\r\n" + "				ELSE 0\r\n"
							+ "				END), 0) AS 'On Week Off'\r\n" + "	,ISNULL(SUM(CASE \r\n"
							+ "				WHEN da.WrkSFT IS NOT NULL\r\n" + "					AND (\r\n"
							+ "						(\r\n" + "							da.RHalf1 IS NULL\r\n"
							+ "							AND da.RHalf2 IS NULL\r\n"
							+ "							AND ISNULL(da.SchSTAT, '') IN ('PH')\r\n"
							+ "							)\r\n" + "						OR (\r\n"
							+ "							ISNULL(da.RHalf1, '') IN ('PH')\r\n"
							+ "							AND ISNULL(da.RHalf2, '') IN ('PH')\r\n"
							+ "							)\r\n" + "						)\r\n"
							+ "					THEN 1\r\n" + "				ELSE 0\r\n"
							+ "				END), 0) AS 'On Holiday'\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
							+ "	,mx_usermst mx_usermst WITH (NOLOCK)\r\n" + "WHERE mx_usermst.userid = da.userid\r\n"
							+ "	AND mx_usermst.useridenbl = 1\r\n" + "	AND da.pdate = CONVERT(DATETIME, '" + fromDate
							+ "', 103) " + additionalParameterforQ, chartName);
			expectedDataValue.put("Reported", result.get(0));
			expectedDataValue.put("Not Reported", result.get(1));
			expectedDataValue.put("On Leave", result.get(2));
			expectedDataValue.put("On Tour", result.get(3));
			expectedDataValue.put("On Week Off", result.get(4));
			expectedDataValue.put("On Holiday", result.get(5));
			expectedDataColour.put("Reported", "rgba(121, 183, 100, 0.75)");
			expectedDataColour.put("Not Reported", "rgba(242, 85, 85, 0.75)");
			expectedDataColour.put("On Leave", "rgba(235, 175, 20, 0.75)");
			expectedDataColour.put("On Tour", "rgba(76, 114, 246, 0.75)");
			expectedDataColour.put("On Week Off", "rgba(0, 169, 183, 0.75)");
			expectedDataColour.put("On Holiday", "rgba(27, 132, 255, 0.75)");

		} else if (chartName.equalsIgnoreCase("User Enrollment")) {
			// Write code here that turns the phrase above into concrete actions
			// Expected Data Fetching
			List<String> result = this.testContextObject.baseTest.getMultipleDataFromSameRowforDashboard("SELECT (\r\n"
					+ "		SELECT COUNT(1)\r\n" + "		FROM Mx_UserMst WITH (NOLOCK)\r\n"
					+ "		WHERE UserIDEnbl = 1 " + additionalParameterforQ + "\r\n" + "		) AS a\r\n" + "	,(\r\n"
					+ "		SELECT COUNT(*)\r\n" + "		FROM Mx_UserMst\r\n"
					+ "		LEFT OUTER JOIN Mx_UserFPTemplate ON Mx_UserFPTemplate.UserID = Mx_UserMst.UserID\r\n"
					+ "		LEFT OUTER JOIN Mx_UserFaceTemplate ON Mx_UserFaceTemplate.UserID = Mx_UserMst.UserID\r\n"
					+ "		LEFT OUTER JOIN Mx_UserPalmTemplate ON Mx_UserPalmTemplate.UserID = Mx_UserMst.UserID\r\n"
					+ "		WHERE Mx_UserFPTemplate.UserID IS NULL\r\n"
					+ "			AND Mx_UserFaceTemplate.UserID IS NULL\r\n"
					+ "			AND Mx_UserPalmTemplate.UserID IS NULL\r\n" + "			AND (\r\n"
					+ "				Mx_UserMst.Card1 IS NULL\r\n" + "				OR Mx_UserMst.Card1 = N'0'\r\n"
					+ "				)\r\n" + "			AND (\r\n" + "				Mx_UserMst.Card2 IS NULL\r\n"
					+ "				OR Mx_UserMst.Card2 = N'0'\r\n" + "				)\r\n"
					+ "			AND (Mx_UserMst.UserPIN IS NULL)\r\n" + "			AND Mx_UserMst.UserIDEnbl = 1 "
					+ additionalParameterforQ + "\r\n" + "		) AS b", chartName);
			expectedDataValue.put("Enrolled Users",
					String.valueOf(Integer.parseInt(result.get(0)) - Integer.parseInt(result.get(1))));
			expectedDataValue.put("Pending Users", result.get(1));
			expectedDataColour.put("Enrolled Users", "rgba(121, 183, 100, 0.75)");
			expectedDataColour.put("Pending Users", "rgba(242, 85, 85, 0.75)");
		} else if (chartName.equalsIgnoreCase("Attendance Exception")) {
			String atdExc = "WITH ExceptionDt AS (\r\n" + "    SELECT  \r\n" + "        CASE  \r\n"
					+ "            WHEN ErrorID = 10 THEN 'No Punches Available'  \r\n"
					+ "            WHEN ErrorID = 12 THEN 'Shift Not Available'  \r\n"
					+ "            WHEN ErrorID IN (13,18,59,63,65) THEN 'Late-In'  \r\n"
					+ "            WHEN ErrorID IN (14,19,60,64,66) THEN 'Early Out'  \r\n"
					+ "            WHEN ErrorID IN (11,61,70,73) THEN '1st Half AB'  \r\n"
					+ "            WHEN ErrorID IN (21,62,71,74) THEN '2nd Half AB'  \r\n"
					+ "            WHEN ErrorID IN (20,72,75,77,76,51,52,55,56,53,54,57,58,17,15,16) THEN 'Full Day AB'  \r\n"
					+ "        END AS Label  \r\n" + "    FROM Mx_DATDTrn WITH (NOLOCK)  \r\n"
					+ "    INNER JOIN Mx_UserMst Mx_UserMst WITH (NOLOCK) ON Mx_DATDTrn.UserID = Mx_UserMst.UserID  \r\n"
					+ "    WHERE \r\n" + "        Mx_DATDTrn.Pdate = CONVERT(datetime,'" + fromDate + "',103)  \r\n"
					+ "        AND Mx_UserMst.AtdCalcEnbl = 1 \r\n" + "        AND Mx_UserMst.UserType = 'U' \r\n"
					+ "        AND Mx_UserMst.UserIDEnbl = 1  \r\n" + "        AND ErrorID IN (\r\n"
					+ "            10,12,11,59,61,66,70,73,21,60,62,65,71,74,\r\n"
					+ "            13,14,20,63,64,72,75,77,76,51,52,55,56,53,\r\n"
					+ "            54,57,58,17,15,16,18,19\r\n" + "        ) " + additionalParameterforQ + " \r\n"
					+ "),\r\n" + "LabelList AS (\r\n" + "    SELECT 'No Punches Available' AS Label UNION ALL\r\n"
					+ "    SELECT 'Shift Not Available' UNION ALL\r\n" + "    SELECT 'Late-In' UNION ALL\r\n"
					+ "    SELECT 'Early Out' UNION ALL\r\n" + "    SELECT '1st Half AB' UNION ALL\r\n"
					+ "    SELECT '2nd Half AB' UNION ALL\r\n" + "    SELECT 'Full Day AB'\r\n" + ")\r\n"
					+ "SELECT \r\n" + "    l.Label, \r\n" + "    ISNULL(COUNT(e.Label), 0) AS Count\r\n" + "FROM \r\n"
					+ "    LabelList l\r\n" + "LEFT JOIN \r\n" + "    ExceptionDt e ON l.Label = e.Label \r\n"
					+ "GROUP BY \r\n" + "    l.Label\r\n" + "ORDER BY \r\n" + "    l.Label;\r\n" + "";
			expectedDataValue = this.testContextObject.baseTest.getMultipleDataFromDatabaseforDashboard(atdExc);
			expectedDataColour.put("No Punches Available", "rgba(121, 183, 100, 0.75)");
			expectedDataColour.put("Shift Not Available", "rgba(242, 85, 85, 0.75)");
			expectedDataColour.put("Late-In", "rgba(235, 175, 20, 0.75)");
			expectedDataColour.put("Early Out", "rgba(76, 114, 246, 0.75)");
			expectedDataColour.put("1st Half AB", "rgba(0, 169, 183, 0.75)");
			expectedDataColour.put("2nd Half AB", "rgba(27, 132, 255, 0.75)");
			expectedDataColour.put("Full Day AB", "rgba(234, 138, 122, 0.75)");
		} else if (chartName.equalsIgnoreCase("Attendance Authorization")) {
			String fromDateS = AbstractMethod.staticDateOrPlusMinusFromCurrentDate("-15");
			String toDateE = AbstractMethod.staticDateOrPlusMinusFromCurrentDate("16");
			String atdExc = "SELECT COUNT(1) AS Count\r\n" + "	,'Short Leave / Official In-Out' AS AppType\r\n"
					+ "	,'0' AS STATUS\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		3\r\n"
					+ "		,4\r\n" + "		)\r\n" + "	AND (\r\n" + "		SLTrn.AuthFlg IS NULL\r\n"
					+ "		OR SLTrn.AuthFlg = 0\r\n" + "		)\r\n" + "	AND atd_p.PERSAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103) " + additionalParameterforQ + "\r\n"
					+ "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT COUNT(1) AS Count\r\n"
					+ "	,'Short Leave / Official In-Out' AS AppType\r\n" + "	,'0' AS STATUS\r\n"
					+ "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		1\r\n"
					+ "		,2\r\n" + "		)\r\n" + "	AND atd_p.OFCLAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		SLTrn.AuthFlg IS NULL\r\n" + "		OR SLTrn.AuthFlg = 0\r\n" + ") "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Short Leave / Official In-Out' AS AppType\r\n"
					+ "	,'1' AS STATUS\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		3\r\n"
					+ "		,4\r\n" + "		)\r\n" + "	AND atd_p.PERSAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND SLTrn.AuthFlg = 1 "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Short Leave / Official In-Out' AS AppType\r\n"
					+ "	,'1' AS STATUS\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		1\r\n"
					+ "		,2\r\n" + "		)\r\n" + "	AND atd_p.OFCLAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND SLTrn.AuthFlg = 1 "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Short Leave / Official In-Out' AS AppType\r\n"
					+ "	,'2' AS STATUS\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		3\r\n"
					+ "		,4\r\n" + "		)\r\n" + "	AND atd_p.PERSAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND SLTrn.AuthFlg = 2 "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Short Leave / Official In-Out' AS AppType\r\n"
					+ "	,'2' AS STATUS\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = da.userid\r\n"
					+ "	AND SLTrn.PDate = da.PDate\r\n"
					+ "INNER JOIN mx_usermst WITH (NOLOCK) ON mx_usermst.userid = da.userid\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_p WITH (NOLOCK) ON mx_usermst.ATDPLCID = atd_p.ATDPLCID\r\n"
					+ "WHERE mx_usermst.useridenbl = 1\r\n" + "	AND SLTrn.SPFType IN (\r\n" + "		1\r\n"
					+ "		,2\r\n" + "		)\r\n" + "	AND atd_p.OFCLAUTHFLG = 1\r\n"
					+ "	AND da.PDate >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND da.PDate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND SLTrn.AuthFlg = 2 "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Overtime / C-OFF' AS AppType\r\n" + "	,'0' AS STATUS\r\n"
					+ "FROM mx_datddettrn Det WITH (NOLOCK)\r\n"
					+ "JOIN Mx_UserMst WITH (NOLOCK) ON Det.UserID = mx_usermst.UserID\r\n"
					+ "JOIN Mx_DATDTrn mst WITH (NOLOCK) ON mst.UserID = Det.UserID\r\n"
					+ "	AND mst.PDate = det.PDate\r\n" + "WHERE Det.PDATE >= convert(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "	AND Det.PDATE < convert(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "	AND mx_usermst.OTCOAUTH <> 'N'\r\n" + "	AND mx_usermst.dltdflg <> 1\r\n"
					+ "	AND mx_usermst.UserIDEnbl = 1\r\n" + "	AND mx_usermst.UserType = 'U'\r\n"
					+ "	AND mst.Overtime IS NOT NULL\r\n" + "	AND mst.Overtime > 0\r\n" + "	AND (\r\n"
					+ "		(\r\n" + "			Det.AuthOT IS NULL\r\n" + "			AND Det.AUTHCOFF IS NULL\r\n"
					+ "			)\r\n" + "		OR (\r\n" + "			Det.AUTHOT < 1\r\n"
					+ "			AND Det.AuthOTDate IS NULL\r\n" + "			AND Det.AUTHCOFF < 1\r\n"
					+ "			AND Det.AUTHCOFFDate IS NULL\r\n" + "			)\r\n" + "		) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Overtime / C-OFF' AS AppType\r\n" + "	,'1' AS STATUS\r\n"
					+ "FROM mx_datddettrn Det WITH (NOLOCK)\r\n"
					+ "JOIN Mx_UserMst WITH (NOLOCK) ON Det.UserID = mx_usermst.UserID\r\n"
					+ "JOIN Mx_DATDTrn mst WITH (NOLOCK) ON mst.UserID = Det.UserID\r\n"
					+ "	AND mst.PDate = det.PDate\r\n" + "WHERE Det.PDATE >= convert(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "	AND Det.PDATE < convert(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "	AND mx_usermst.OTCOAUTH <> 'N'\r\n" + "	AND mx_usermst.dltdflg <> 1\r\n"
					+ "	AND mx_usermst.UserIDEnbl = 1\r\n" + "	AND mx_usermst.UserType = 'U'\r\n"
					+ "	AND mst.Overtime IS NOT NULL\r\n" + "	AND mst.Overtime > 0\r\n" + "	AND (\r\n"
					+ "		(\r\n" + "			Det.AUTHOT > 0\r\n" + "			OR Det.AuthCoFF > 0\r\n"
					+ "			)\r\n" + "		OR (\r\n" + "			Det.AUTHOT = 0\r\n"
					+ "			AND Det.AUTHOTDate IS NOT NULL\r\n" + "			)\r\n" + "		OR (\r\n"
					+ "			Det.AUTHCOFF = 0\r\n" + "			AND Det.AUTHCOFFDate IS NOT NULL\r\n"
					+ "			)\r\n" + "		) " + additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n"
					+ "\r\n" + "SELECT COUNT(1) AS Count\r\n" + "	,'Daily Attendance' AS AppType\r\n"
					+ "	,'0' AS STATUS\r\n" + "FROM Mx_DAtdTrn mst WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON mst.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_P WITH (NOLOCK) ON atd_P.ATDPLCID = mx_usermst.ATDPLCID\r\n"
					+ "WHERE mst.Pdate > = convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND mst.Pdate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		Punch1 IS NOT NULL\r\n" + "		OR Punch2 IS NOT NULL\r\n"
					+ "		OR Punch3 IS NOT NULL\r\n" + "		OR Punch4 IS NOT NULL\r\n"
					+ "		OR Punch5 IS NOT NULL\r\n" + "		OR Punch6 IS NOT NULL\r\n" + "		)\r\n"
					+ "	AND atd_P.ATDAuthFlg = 1\r\n" + "	AND (\r\n" + "		mx_usermst.dltdflg <> 1\r\n"
					+ "		OR mx_usermst.dltdflg IS NULL\r\n" + "		)\r\n" + "	AND mx_usermst.UserIDEnbl = 1\r\n"
					+ "	AND (\r\n" + "		mst.ATDAuthFlg = 0\r\n" + "		OR mst.ATDAuthFlg IS NULL\r\n" + "		) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Daily Attendance' AS AppType\r\n" + "	,'1' AS STATUS\r\n"
					+ "FROM Mx_DAtdTrn mst WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON mst.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atd_P WITH (NOLOCK) ON atd_P.ATDPLCID = mx_usermst.ATDPLCID\r\n"
					+ "WHERE mst.Pdate > = convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND mst.Pdate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		Punch1 IS NOT NULL\r\n" + "		OR Punch2 IS NOT NULL\r\n"
					+ "		OR Punch3 IS NOT NULL\r\n" + "		OR Punch4 IS NOT NULL\r\n"
					+ "		OR Punch5 IS NOT NULL\r\n" + "		OR Punch6 IS NOT NULL\r\n" + "		)\r\n"
					+ "	AND atd_P.ATDAuthFlg = 1\r\n" + "	AND (\r\n" + "		mx_usermst.dltdflg <> 1\r\n"
					+ "		OR mx_usermst.dltdflg IS NULL\r\n" + "		)\r\n" + "	AND mx_usermst.UserIDEnbl = 1\r\n"
					+ "	AND mst.ATDAuthFlg = 1 " + additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Attendance Correction' AS AppType\r\n"
					+ "	,'0' AS STATUS\r\n" + "FROM Mx_AtdCorrection A WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON A.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN mx_datdtrn D WITH (NOLOCK) ON a.userid = d.userid\r\n"
					+ "	AND a.pdate = d.pdate\r\n" + "WHERE AppStatus = 0\r\n" + "	AND mx_usermst.useridenbl = 1\r\n"
					+ "	AND mx_usermst.usertype = 'U'\r\n" + "	AND A.appdate > = convert(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "	AND A.appdate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		mx_usermst.dltdflg <> 1\r\n" + "		OR mx_usermst.dltdflg IS NULL\r\n" + "		) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Attendance Correction' AS AppType\r\n"
					+ "	,'1' AS STATUS\r\n" + "FROM Mx_AtdCorrection A WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON A.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN mx_datdtrn D WITH (NOLOCK) ON a.userid = d.userid\r\n"
					+ "	AND a.pdate = d.pdate\r\n" + "WHERE AppStatus = 1\r\n" + "	AND mx_usermst.useridenbl = 1\r\n"
					+ "	AND mx_usermst.usertype = 'U'\r\n" + "	AND A.appdate > = convert(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "	AND A.appdate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		mx_usermst.dltdflg <> 1\r\n" + "		OR mx_usermst.dltdflg IS NULL\r\n" + "		) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Attendance Correction' AS AppType\r\n"
					+ "	,'2' AS STATUS\r\n" + "FROM Mx_AtdCorrection A WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON A.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN mx_datdtrn D WITH (NOLOCK) ON a.userid = d.userid\r\n"
					+ "	AND a.pdate = d.pdate\r\n" + "WHERE AppStatus = 2\r\n" + "	AND mx_usermst.useridenbl = 1\r\n"
					+ "	AND mx_usermst.usertype = 'U'\r\n" + "	AND A.appdate >= convert(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "	AND A.appdate < convert(DATETIME, '" + toDateE + "', 103)\r\n" + "	AND (\r\n"
					+ "		mx_usermst.dltdflg <> 1\r\n" + "		OR mx_usermst.dltdflg IS NULL\r\n" + "		) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Event Authorization' AS AppType\r\n"
					+ "	,'0' AS STATUS\r\n" + "FROM Mx_AtdEventTrn AtdEvt WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON AtdEvt.UserID = mx_usermst.UserID\r\n"
					+ "WHERE AtdEvt.EDateTime >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND AtdEvt.EDateTime < convert(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "	AND EventID <= 150\r\n" + "	AND AuthStatus = 0\r\n" + "	AND mx_usermst.UserType = 'U'\r\n"
					+ "	AND (\r\n" + "		dltdflg = 0\r\n" + "		OR dltdflg IS NULL\r\n" + "		)\r\n"
					+ "	AND UserIDEnbl = 1 " + additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT COUNT(1) AS Count\r\n" + "	,'Event Authorization' AS AppType\r\n"
					+ "	,'1' AS STATUS\r\n" + "FROM Mx_AtdEventTrn AtdEvt WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON AtdEvt.UserID = mx_usermst.UserID\r\n"
					+ "INNER JOIN Mx_AttendancePolicyMst atdplc WITH (NOLOCK) ON atdplc.ATDPLCID = mx_usermst.ATDPLCID\r\n"
					+ "WHERE AtdEvt.EDateTime >= convert(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "	AND AtdEvt.EDateTime < convert(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "	AND EventID <= 150\r\n" + "	AND AuthStatus = 1\r\n" + "	AND mx_usermst.UserType = 'U'\r\n"
					+ "	AND (\r\n" + "		dltdflg = 0\r\n" + "		OR dltdflg IS NULL\r\n" + "		)\r\n"
					+ "	AND UserIDEnbl = 1\r\n" + "	AND atdplc.EventAuthReq = 1 " + additionalParameterforQ + "\r\n"
					+ "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT COUNT(1) AS Count\r\n"
					+ "	,'Advance OT Approval' AS AppType\r\n" + "	,'0' AS STATUS\r\n"
					+ "FROM Mx_OTAdvance OTAdv WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.UserID = OTAdv.Userid\r\n" + "WHERE (\r\n"
					+ "		Mx_UserMst.dltdflg = 0\r\n" + "		OR Mx_UserMst.dltdflg IS NULL\r\n" + "		)\r\n"
					+ "	AND mx_usermst.UserIDEnbl = 1\r\n" + "	AND Mx_UserMst.UserType = 'U'\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) >= convert(DATETIME, '"
					+ fromDateS + "', 103)\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) < convert(DATETIME, '"
					+ toDateE + "', 103)\r\n" + "	AND OTAdv.ApprovalStatus IN (0) " + additionalParameterforQ + "\r\n"
					+ "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT COUNT(1) AS Count\r\n"
					+ "	,'Advance OT Approval' AS AppType\r\n" + "	,'1' AS STATUS\r\n"
					+ "FROM Mx_OTAdvance OTAdv WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.UserID = OTAdv.Userid\r\n" + "WHERE (\r\n"
					+ "		Mx_UserMst.dltdflg = 0\r\n" + "		OR Mx_UserMst.dltdflg IS NULL\r\n" + "		)\r\n"
					+ "	AND Mx_UserMst.UserIDEnbl = 1\r\n" + "	AND Mx_UserMst.UserType = 'U'\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) >= convert(DATETIME, '"
					+ fromDateS + "', 103)\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) < convert(DATETIME, '"
					+ toDateE + "', 103)\r\n" + "	AND OTAdv.ApprovalStatus IN (1) " + additionalParameterforQ + "\r\n"
					+ "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT COUNT(1) AS Count\r\n"
					+ "	,'Advance OT Approval' AS AppType\r\n" + "	,'2' AS STATUS\r\n"
					+ "FROM Mx_OTAdvance OTAdv WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.UserID = OTAdv.Userid\r\n" + "WHERE (\r\n"
					+ "		Mx_UserMst.dltdflg = 0\r\n" + "		OR Mx_UserMst.dltdflg IS NULL\r\n" + "		)\r\n"
					+ "	AND Mx_UserMst.UserIDEnbl = 1\r\n" + "	AND Mx_UserMst.UserType = 'U'\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) >= convert(DATETIME, '"
					+ fromDateS + "', 103)\r\n"
					+ "	AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) < convert(DATETIME, '"
					+ toDateE + "', 103)\r\n" + "	AND OTAdv.ApprovalStatus IN (2)" + additionalParameterforQ;
			List<String> result = this.testContextObject.baseTest.getMultipleDataFromSameRowforDashboard(atdExc,
					chartName);
//			System.out.println(result);
			int value = 0;
			int counts = 0;
			for (int i = 0; i < result.size(); i++) {
				String[] resultSplit = result.get(i).split("@");
				int count = Integer.parseInt(resultSplit[0]);
				String appType = resultSplit[1];
				String status = resultSplit[2];
				if (status.equalsIgnoreCase("0")) {
					if (appType.equalsIgnoreCase("Short Leave / Official In-Out")) {
						if (counts == 0) {
							value = count;
							counts++;
						} else {
							count = value + count;
							counts = 0;
							expectedDataValue.put(appType + " Pending", String.valueOf(count));
						}
					} else {
						expectedDataValue.put(appType + " Pending", String.valueOf(count));
					}
				} else if (status.equalsIgnoreCase("1")) {
					if (appType.equalsIgnoreCase("Short Leave / Official In-Out")) {
						if (counts == 0) {
							value = count;
							counts++;
						} else {
							count = value + count;
							counts = 0;
							expectedDataValue.put(appType + " Approved", String.valueOf(count));
						}
					} else {
						expectedDataValue.put(appType + " Approved", String.valueOf(count));
					}
				} else {
					if (appType.equalsIgnoreCase("Short Leave / Official In-Out")) {
						if (counts == 0) {
							value = count;
							counts++;
						} else {
							count = value + count;
							counts = 0;
							expectedDataValue.put(appType + " Rejected", String.valueOf(count));
						}
					} else {
						expectedDataValue.put(appType + " Rejected", String.valueOf(count));
					}
				}
			}
			expectedDataColour.put("Rejected", "rgba(242, 85, 85, 0.75)");
			expectedDataColour.put("Pending", "rgba(235, 175, 20, 0.75)");
			expectedDataColour.put("Approved", "rgba(121, 183, 100, 0.75)");

		}

		this.testContextObject.pom.homePO().goToDashboard();
		this.testContextObject.pom.dashboard().dashboardVerify(chartName, chart, expectedDataValue, expectedDataColour);
		this.testContextObject.pom.dashboard().homeButtonClick();
	}

	@When("the {string} chart is filtered by the Date filter set to {string} and the data is filtered by {string}")
	public void the_chart_is_filtered_by_the_date_filter_set_to_and_the_data_is_filtered_by(String string,
			String string2, String string3) throws InterruptedException {
		// Write code here that turns the phrase above into concrete actions
		String fromDate = AbstractMethod.staticDateOrPlusMinusFromCurrentDate(string2);
		String additionalParameterforQ = null;
		List<String> expectedResult = new ArrayList<String>();
		if (string.equalsIgnoreCase("User Statistics")) {
			if (DashboardPO.additionalDataForDB == null) {
				additionalParameterforQ = "";
			} else {
				additionalParameterforQ = " where " + DashboardPO.additionalDataForDB.replaceFirst("AND", "");
			}
			String qd = null;
			if (string3.equalsIgnoreCase("Select All")) {
				qd = "UserStatus LIKE '%%'";
			} else if (string3.equalsIgnoreCase("Active Users")) {
				qd = "UserStatus LIKE 'Active%'";
			} else if (string3.equalsIgnoreCase("New Joined Users")) {
				qd = "JoinDT='" + fromDate + "'";
			} else {
				String[] splitwithS = string3.split(" ");
				qd = "UserStatus LIKE '%" + splitwithS[0] + "%'";
			}
			expectedResult = this.testContextObject.baseTest.getDashboardFilterD("WITH UserStatusCTE AS (\r\n"
					+ "  SELECT \r\n" + "      Mx_UserMst.UserID,\r\n" + "      Mx_UserMst.Name,\r\n"
					+ "      Mx_UserMst.UserIDEnbl,\r\n" + "      Mx_UserMst.BlacklistFlag,\r\n"
					+ "      CONVERT(varchar(10), Mx_UserMst.JoinDT, 103) AS JoinDT,\r\n" + "      CASE \r\n"
					+ "          WHEN JoinDT = CONVERT(datetime, '" + fromDate + "', 103) THEN 1 \r\n"
					+ "          ELSE 0 \r\n" + "      END AS NewJoinedUserFlg,\r\n" + "      CASE \r\n"
					+ "          WHEN ub.UserID IS NOT NULL AND ub.Status = 0 THEN 1 \r\n" + "          ELSE 0 \r\n"
					+ "      END AS BlockedFlag,\r\n" + "      CASE \r\n"
					+ "          WHEN ub.UserID IS NOT NULL AND ub.Status = 0 THEN \r\n" + "              CASE \r\n"
					+ "                  WHEN Mx_UserMst.BlacklistFlag = 1 AND Mx_UserMst.UserIDEnbl = 0 THEN 'Inactive (Blocked & Blacklisted)'\r\n"
					+ "                  WHEN Mx_UserMst.BlacklistFlag = 1 AND Mx_UserMst.UserIDEnbl = 1 THEN 'Active (Blocked & Blacklisted)'\r\n"
					+ "                  WHEN Mx_UserMst.UserIDEnbl = 1 THEN 'Active (Blocked)'\r\n"
					+ "                  ELSE 'Inactive (Blocked)'\r\n" + "              END\r\n"
					+ "          ELSE \r\n" + "              CASE \r\n"
					+ "                  WHEN Mx_UserMst.BlacklistFlag = 1 AND Mx_UserMst.UserIDEnbl = 0 THEN 'Inactive (Blacklisted)'\r\n"
					+ "                  WHEN Mx_UserMst.BlacklistFlag = 1 AND Mx_UserMst.UserIDEnbl = 1 THEN 'Active (Blacklisted)'\r\n"
					+ "                  WHEN Mx_UserMst.UserIDEnbl = 1 THEN 'Active'\r\n"
					+ "                  ELSE 'Inactive'\r\n" + "              END\r\n" + "      END AS UserStatus\r\n"
					+ "  FROM \r\n" + "      Mx_UserMst WITH (NOLOCK)\r\n"
					+ "      LEFT JOIN Mx_UserBlockTrn ub WITH (NOLOCK) \r\n"
					+ "          ON ub.UserID = Mx_UserMst.UserID AND ub.Status = 0\r\n"
					+ "      LEFT JOIN Mx_MasterControllerBasicCfg mc WITH (NOLOCK) \r\n"
					+ "          ON mc.MID = ub.MID AND mc.DLTDFlg <> 1\r\n"
					+ "      LEFT JOIN Mx_SDCCfg sd WITH (NOLOCK) \r\n"
					+ "          ON sd.MID = ub.MID AND sd.DLTDFlg <> 1 " + additionalParameterforQ + "\r\n" + ")\r\n"
					+ "SELECT *\r\n" + "FROM UserStatusCTE\r\n" + "WHERE " + qd + "\r\n" + "ORDER BY UserID;\r\n" + "",
					string);
		} else if (string.equalsIgnoreCase("Device Summary")) {
			String[] splitwithS = string3.split(" ");
			String filter = splitwithS[0];
			if (filter.equalsIgnoreCase("Select")) {
				filter = "";
			}
			expectedResult = this.testContextObject.baseTest.getDashboardFilterD("WITH datarows AS (\r\n"
					+ "    SELECT \r\n" + "        mc.MID,\r\n" + "        mc.Type,\r\n" + "        CASE mc.Type\r\n"
					+ "            WHEN 0 THEN 'Panel'\r\n" + "            WHEN 1 THEN 'Door V1'\r\n"
					+ "            WHEN 2 THEN 'Panel Lite'\r\n" + "            WHEN 3 THEN 'Door V2'\r\n"
					+ "            WHEN 4 THEN 'NGT Direct Door'\r\n" + "            WHEN 5 THEN 'Wireless Door'\r\n"
					+ "            WHEN 6 THEN 'Path Controller'\r\n" + "            WHEN 7 THEN 'PVR Door'\r\n"
					+ "            WHEN 8 THEN 'Panel200'\r\n" + "            WHEN 9 THEN 'Vega Controller'\r\n"
					+ "            WHEN 11 THEN 'ARC DC 100'\r\n" + "            WHEN 12 THEN 'Door V3'\r\n"
					+ "            WHEN 14 THEN 'ARC IO 800'\r\n" + "            WHEN 15 THEN 'Door FMX'\r\n"
					+ "            WHEN 16 THEN 'Path V2'\r\n" + "            WHEN 17 THEN 'ARC DC 200'\r\n"
					+ "            WHEN 18 THEN 'MODE'\r\n" + "            WHEN 19 THEN 'Door V4'\r\n"
					+ "            WHEN 20 THEN 'ARGO'\r\n" + "            WHEN 21 THEN 'ARGO FACE'\r\n"
					+ "            WHEN 22 THEN 'ARGO FACE300'\r\n" + "            WHEN 23 THEN 'ARC DC400'\r\n"
					+ "            WHEN 24 THEN 'ARC DC600'\r\n" + "            WHEN 25 THEN 'ARC DC800'\r\n"
					+ "            ELSE 'Unknown'\r\n" + "        END AS DType,\r\n" + "        mc.Name,\r\n"
					+ "        mc.MIDEnbl,\r\n" + "        mn.IPAddress,\r\n" + "        mn.MACAddress,\r\n"
					+ "        CASE mc.CurrentStatus\r\n" + "            WHEN 1 THEN 'Online'\r\n"
					+ "            WHEN 0 THEN 'Offline'\r\n" + "            ELSE 'Unknown'\r\n"
					+ "        END AS CurrentStatus,\r\n" + "        N'' AS DeviceStatus,\r\n"
					+ "        0 AS SiteID,\r\n" + "        N'' AS SiteName\r\n"
					+ "    FROM Mx_MasterControllerBasicCfg mc WITH (NOLOCK)\r\n"
					+ "    JOIN Mx_MasterControllerNwkCfg mn WITH (NOLOCK) ON mc.mid = mn.mid\r\n"
					+ "    WHERE mc.DLTDFLG <> 1 AND mc.MIDEnbl = 1\r\n" + "\r\n" + "    UNION ALL\r\n" + "\r\n"
					+ "    SELECT \r\n" + "        dd.MID,\r\n" + "        dd.Type,\r\n" + "        CASE dd.Type\r\n"
					+ "            WHEN 0 THEN 'Panel'\r\n" + "            WHEN 1 THEN 'Door V1'\r\n"
					+ "            WHEN 2 THEN 'Panel Lite'\r\n" + "            WHEN 3 THEN 'Door V2'\r\n"
					+ "            WHEN 4 THEN 'NGT Direct Door'\r\n" + "            WHEN 5 THEN 'Wireless Door'\r\n"
					+ "            WHEN 6 THEN 'Path Controller'\r\n" + "            WHEN 7 THEN 'PVR Door'\r\n"
					+ "            WHEN 8 THEN 'Panel200'\r\n" + "            WHEN 9 THEN 'Vega Controller'\r\n"
					+ "            WHEN 11 THEN 'ARC DC 100'\r\n" + "            WHEN 12 THEN 'Door V3'\r\n"
					+ "            WHEN 14 THEN 'ARC IO 800'\r\n" + "            WHEN 15 THEN 'Door FMX'\r\n"
					+ "            WHEN 16 THEN 'Path V2'\r\n" + "            WHEN 17 THEN 'ARC DC 200'\r\n"
					+ "            WHEN 18 THEN 'MODE'\r\n" + "            WHEN 19 THEN 'Door V4'\r\n"
					+ "            WHEN 20 THEN 'ARGO'\r\n" + "            WHEN 21 THEN 'ARGO FACE'\r\n"
					+ "            WHEN 22 THEN 'ARGO FACE300'\r\n" + "            WHEN 23 THEN 'ARC DC400'\r\n"
					+ "            WHEN 24 THEN 'ARC DC600'\r\n" + "            WHEN 25 THEN 'ARC DC800'\r\n"
					+ "            ELSE 'Unknown'\r\n" + "        END AS DType,\r\n" + "        dd.Name,\r\n"
					+ "        dd.MIDEnbl,\r\n" + "        dd.IPAddress,\r\n" + "        dd.MACAddress,\r\n"
					+ "        CASE dd.CurrentStatus\r\n" + "            WHEN 1 THEN 'Online'\r\n"
					+ "            WHEN 0 THEN 'Offline'\r\n" + "            ELSE 'Unknown'\r\n"
					+ "        END AS CurrentStatus,\r\n" + "        N'' AS DeviceStatus,\r\n"
					+ "        dd.SiteID,\r\n" + "        sm.Name AS SiteName\r\n"
					+ "    FROM Mx_SDCCfg dd WITH (NOLOCK)\r\n"
					+ "    LEFT JOIN Mx_SiteMst sm WITH (NOLOCK) ON sm.SiteID = dd.SiteID\r\n"
					+ "    WHERE dd.DLTDFLG = 0 AND dd.MIDEnbl = 1\r\n" + ")\r\n" + "\r\n" + "SELECT DISTINCT * \r\n"
					+ "FROM datarows where CurrentStatus like ('%" + filter + "%')\r\n" + "ORDER BY MID, Name;\r\n"
					+ "", string);
		} else if (string.equalsIgnoreCase("Attendance Summary")) {
			if (DashboardPO.additionalDataForDB == null) {
				additionalParameterforQ = "";
			} else {
				additionalParameterforQ = DashboardPO.additionalDataForDB;
			}
			String qd = null;
			if (string3.equalsIgnoreCase("Select All")) {
				qd = "Type LIKE '%%'";
			} else {
				qd = "Type='" + string3 + "'";
			}
			List<String> leaveType = this.testContextObject.baseTest.getMultipleDataFromSameRowforDashboard(
					"select case when LeaveType='T' then 'T' \r\n"
							+ "when LeaveType!='T' then 'L' end as leavetype, leaveid\r\n" + "from Mx_LeaveMst",
					"Leave");
			String leaveid = null;
			String tourID = null;
			for (int i = 0; i < leaveType.size(); i++) {
				String[] leaveTypesplit=leaveType.get(i).split("@");
				String key=leaveTypesplit[0];
				String val=leaveTypesplit[1];
				if (key.equalsIgnoreCase("T")) {
					if (tourID == null) {
						tourID = "'"+val+"'";
					} else {
						tourID = tourID + "," + "'"+val+"'";
					}
				} else {
					if (leaveid == null) {
						leaveid =  "'"+val+"'";
					} else {
						leaveid = leaveid + "," + "'"+ val+ "'";
					}
				}
			}
			System.out.println("**************************Leave id: " + leaveid);
			System.out.println("**************************Tour id: " + tourID);
			
			expectedResult = this.testContextObject.baseTest.getDashboardFilterD(" select datas.userid, \r\n"
					+ "    datas.name, \r\n" + "    datas.WrkSFT, \r\n" + "    datas.RHalf1, \r\n"
					+ "    datas.RHalf2, \r\n" + "    datas.InPunch, \r\n" + "    datas.OutPunch, \r\n"
					+ "    datas.HourlyPaidLvHrs, \r\n" + "    datas.HourlyUnPaidLvHrs, \r\n" + "    datas.Type\r\n"
					+ "	from(\r\n" + "SELECT \r\n" + "    Mx_UserMst.userid, \r\n" + "    Mx_UserMst.name, \r\n"
					+ "    da.WrkSFT, \r\n" + "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n"
					+ "    LEFT(CONVERT(VARCHAR(8), da.Punch1, 108), 5) AS InPunch, \r\n"
					+ "	LEFT(CONVERT(VARCHAR(8), da.OutPunch, 108), 5) AS OutPunch,\r\n"
					+ "    NULL AS HourlyPaidLvHrs, \r\n" + "    NULL AS HourlyUnPaidLvHrs, \r\n"
					+ "    'Reported' AS Type\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN mx_usermst Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.userid = da.userid\r\n"
					+ "WHERE Mx_UserMst.useridenbl = 1 \r\n" + "  AND da.pdate = CONVERT(datetime, '" + fromDate
					+ "', 103)\r\n" + "  AND da.WrkSFT IS NOT NULL\r\n" + "  AND (\r\n"
					+ "        (da.Punch1 IS NOT NULL AND LEN(da.Punch1) > 0) \r\n"
					+ "        OR (da.Punch2 IS NOT NULL AND LEN(da.Punch2) > 0)\r\n" + "      )\r\n"
					+ "  AND (da.RHalf1 IS NOT NULL OR da.RHalf2 IS NOT NULL)\r\n" + "  AND (\r\n"
					+ "        ISNULL(da.RHalf1, '') NOT IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK)) \r\n"
					+ "        OR ISNULL(da.RHalf2, '') NOT IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK))\r\n"
					+ "      ) " + additionalParameterforQ + " \r\n" + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "SELECT \r\n" + "    Mx_UserMst.userid, \r\n" + "    Mx_UserMst.name, \r\n"
					+ "    da.WrkSFT, \r\n" + "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n"
					+ "    LEFT(CONVERT(VARCHAR(8), da.Punch1, 108), 5) AS InPunch, \r\n"
					+ "	LEFT(CONVERT(VARCHAR(8), da.OutPunch, 108), 5) AS OutPunch,\r\n"
					+ "	NULL AS HourlyPaidLvHrs, \r\n" + "    NULL AS HourlyUnPaidLvHrs, \r\n"
					+ "    'On Leave' AS Type\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN mx_usermst Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.userid = da.userid\r\n"
					+ "WHERE Mx_UserMst.useridenbl = 1 \r\n" + "  AND da.pdate = CONVERT(datetime, '" + fromDate
					+ "', 103)\r\n" + "  AND da.WrkSFT IS NOT NULL\r\n" + "  AND (\r\n" + "        (\r\n"
					+ "          ISNULL(da.RHalf1,'') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK) WHERE LeaveType != 'T')\r\n"
					+ "          AND ISNULL(da.RHalf2,'') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK))\r\n"
					+ "        )\r\n" + "        OR\r\n" + "        (\r\n"
					+ "          ISNULL(da.RHalf1,'') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK))\r\n"
					+ "          AND ISNULL(da.RHalf2,'') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK) WHERE LeaveType != 'T')\r\n"
					+ "        )\r\n" + "      ) " + additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n"
					+ "\r\n" + "SELECT \r\n" + "    Mx_UserMst.userid, \r\n" + "    Mx_UserMst.name, \r\n"
					+ "    da.WrkSFT, \r\n" + "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n"
					+ "    LEFT(CONVERT(VARCHAR(8), da.Punch1, 108), 5) AS InPunch, \r\n"
					+ " 	LEFT(CONVERT(VARCHAR(8), da.OutPunch, 108), 5) AS OutPunch, \r\n"
					+ "    NULL AS HourlyPaidLvHrs, \r\n" + "    NULL AS HourlyUnPaidLvHrs, \r\n"
					+ "    'On Tour' AS Type\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN mx_usermst Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.userid = da.userid\r\n"
					+ "WHERE Mx_UserMst.useridenbl = 1 \r\n" + "  AND da.pdate = CONVERT(datetime, '" + fromDate
					+ "', 103)\r\n" + "  AND da.WrkSFT IS NOT NULL\r\n"
					+ "  AND ISNULL(da.RHalf1, '') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK) WHERE LeaveType = 'T')\r\n"
					+ "  AND ISNULL(da.RHalf2, '') IN (SELECT LeaveID FROM Mx_LeaveMst WITH (NOLOCK) WHERE LeaveType = 'T') "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.userid, \r\n" + "    Mx_UserMst.name, \r\n" + "    da.WrkSFT, \r\n"
					+ "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n"
					+ "    LEFT(CONVERT(VARCHAR(8), da.Punch1, 108), 5) AS InPunch, \r\n"
					+ "    	LEFT(CONVERT(VARCHAR(8), da.OutPunch, 108), 5) AS OutPunch, \r\n"
					+ "    NULL AS HourlyPaidLvHrs, \r\n" + "    NULL AS HourlyUnPaidLvHrs, \r\n"
					+ "    'On Week Off' AS Type\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN mx_usermst Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.userid = da.userid\r\n"
					+ "WHERE Mx_UserMst.useridenbl = 1 \r\n" + "  AND da.pdate = CONVERT(datetime, '" + fromDate
					+ "', 103)\r\n" + "  AND da.WrkSFT IS NOT NULL\r\n" + "  AND (\r\n"
					+ "        (da.RHalf1 IS NULL AND da.RHalf2 IS NULL AND ISNULL(da.SchSTAT,'') = 'WO') \r\n"
					+ "        OR (ISNULL(da.RHalf1,'') = 'WO' AND ISNULL(da.RHalf2,'') = 'WO')\r\n" + "      ) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.userid, \r\n" + "    Mx_UserMst.name, \r\n" + "    da.WrkSFT, \r\n"
					+ "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n"
					+ "    LEFT(CONVERT(VARCHAR(8), da.Punch1, 108), 5) AS InPunch, \r\n"
					+ "    	LEFT(CONVERT(VARCHAR(8), da.OutPunch, 108), 5) AS OutPunch, \r\n"
					+ "    NULL AS HourlyPaidLvHrs, \r\n" + "    NULL AS HourlyUnPaidLvHrs, \r\n"
					+ "    'On Public Holiday' AS Type\r\n" + "FROM Mx_DAtdTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN mx_usermst Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.userid = da.userid\r\n"
					+ "WHERE Mx_UserMst.useridenbl = 1 \r\n" + "  AND da.pdate = CONVERT(datetime, '" + fromDate
					+ "', 103)\r\n" + "  AND da.WrkSFT IS NOT NULL\r\n" + "  AND (\r\n"
					+ "        (da.RHalf1 IS NULL AND da.RHalf2 IS NULL AND ISNULL(da.SchSTAT,'') = 'PH') \r\n"
					+ "        OR (ISNULL(da.RHalf1,'') = 'PH' AND ISNULL(da.RHalf2,'') = 'PH')\r\n" + "      ) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n"
					+ "-- No punch, no leave, not a weekend/holiday — fallback attendance type\r\n" + "SELECT \r\n"
					+ "    da.userid, \r\n" + "    Mx_UserMst.name, \r\n" + "    da.WrkSFT, \r\n"
					+ "    da.RHalf1, \r\n" + "    da.RHalf2, \r\n" + "    NULL AS InPunch, \r\n"
					+ "    NULL AS OutPunch, \r\n" + "    da.HourlyPaidLvHrs, \r\n" + "    da.HourlyUnPaidLvHrs, \r\n"
					+ "    'Not Reported' AS Type\r\n" + "FROM Mx_DATDTrn da WITH (NOLOCK)\r\n"
					+ "INNER JOIN Mx_UserMst Mx_UserMst WITH (NOLOCK) ON da.UserID = Mx_UserMst.UserID\r\n"
					+ "WHERE Mx_UserMst.UserIDEnbl = 1 \r\n" + "  AND da.WrkSFT IS NOT NULL \r\n"
					+ "  AND da.PDate = CONVERT(datetime, N'" + fromDate + "', 103)\r\n"
					+ "  AND da.Punch1 IS NULL \r\n" + "  AND da.Punch2 IS NULL \r\n" + "  AND da.OutPunch IS NULL\r\n"
					+ "  AND (\r\n" + "        da.RHalf1 IS NOT NULL OR da.RHalf2 IS NOT NULL \r\n"
					+ "        OR da.SchSTAT IS NULL \r\n"
					+ "        OR ISNULL(da.SchSTAT, N'') NOT IN (N'WO', N'PH')\r\n" + "      )\r\n" + "  AND (\r\n"
					+ "        ISNULL(da.RHalf1, N'') NOT IN (N'WO', N'PH') \r\n" + "        OR da.RHalf1 IS NULL \r\n"
					+ "        OR ISNULL(da.RHalf2, N'') NOT IN (N'WO', N'PH') \r\n"
					+ "        OR da.RHalf2 IS NULL\r\n" + "      )\r\n" + "  AND (\r\n"
					+ "        ISNULL(da.RHalf1, N'') NOT IN ("+leaveid+","+tourID+") \r\n"
					+ "        OR da.RHalf1 IS NULL \r\n"
					+ "        OR ISNULL(da.RHalf2, N'') NOT IN ("+leaveid+","+tourID+") \r\n"
					+ "        OR da.RHalf2 IS NULL\r\n" + "      ) " + additionalParameterforQ + ") as datas where "
					+ qd, string);
		} else if (string.equalsIgnoreCase("User Enrollment")) {
			if (DashboardPO.additionalDataForDB == null) {
				additionalParameterforQ = "";
			} else {
				additionalParameterforQ = DashboardPO.additionalDataForDB;
			}
			String qd = null;
			if (string3.equalsIgnoreCase("Select All")) {
				qd = "";
			} else if (string3.equalsIgnoreCase("Pending Users")) {
				qd = " where CardStatus='Not Enrolled' and FaceCnt=0 and PalmCnt=0 and FPSuprimaPorpCnt=0 and FPSuprimaISOCnt=0 and UserPINStatus='Not Enrolled'";
			} else {
				qd = " where CardStatus!='Not Enrolled' or FaceCnt>0 or PalmCnt>0 or FPSuprimaPorpCnt>0 or FPSuprimaISOCnt>0 or UserPINStatus!='Not Enrolled'";
			}
			expectedResult = this.testContextObject.baseTest
					.getDashboardFilterD("select * from (SELECT Mx_UserMst.UserID, Mx_UserMst.Name,\r\n" + "CASE\r\n"
							+ "WHEN (Card1 IS NOT NULL AND Card1 != '0') AND (Card2 IS NOT NULL AND Card2 != '0') THEN 'Card1 & Card2'\r\n"
							+ "WHEN (Card1 IS NOT NULL AND Card1 != '0') AND (Card2 IS NULL OR Card2 = '0') THEN 'Card1'\r\n"
							+ "WHEN (Card2 IS NOT NULL AND Card2 != '0') AND (Card1 IS NULL OR Card1 = '0') THEN 'Card2'\r\n"
							+ "ELSE 'Not Enrolled'\r\n" + "END AS CardStatus,\r\n"
							+ "(SELECT COUNT(*) FROM Mx_UserFaceTemplate WHERE Mx_UserFaceTemplate.UserID = Mx_UserMst.UserID) AS FaceCnt,\r\n"
							+ "(SELECT COUNT(*) FROM Mx_UserPalmTemplate WHERE PalmLocation NOT IN (10) AND Mx_UserPalmTemplate.UserID = Mx_UserMst.UserID) AS PalmCnt,\r\n"
							+ "(SELECT COUNT(*) FROM Mx_UserFPTemplate WHERE Mx_UserFPTemplate.UserID = Mx_UserMst.UserID AND Mx_UserFPTemplate.FPTemplateType = 0) AS FPSuprimaPorpCnt,\r\n"
							+ "(SELECT COUNT(*) FROM Mx_UserFPTemplate WHERE Mx_UserFPTemplate.UserID = Mx_UserMst.UserID AND Mx_UserFPTemplate.FPTemplateType = 1) AS FPSuprimaISOCnt,\r\n"
							+ "CASE\r\n" + "WHEN UserPIN IS NOT NULL AND UserPIN != '0' THEN 'Enrolled'\r\n"
							+ "ELSE 'Not Enrolled'\r\n" + "END AS UserPINStatus\r\n" + "FROM Mx_UserMst\r\n"
							+ " WHERE  Mx_UserMst.UserIDEnbl = 1 " + additionalParameterforQ + ")as a" + qd, string);
		} else if (string.equalsIgnoreCase("Attendance Exception")) {
			if (DashboardPO.additionalDataForDB == null) {
				additionalParameterforQ = "";
			} else {
				additionalParameterforQ = DashboardPO.additionalDataForDB;
			}
			String qd = null;
			Map<String, Integer> filterBycreate = new HashMap<String, Integer>();
			filterBycreate.put("No Punches Available", 1);
			filterBycreate.put("Shift Not Available", 2);
			filterBycreate.put("Late-In", 3);
			filterBycreate.put("Early Out", 4);
			filterBycreate.put("1st Half AB", 5);
			filterBycreate.put("2nd Half AB", 6);
			filterBycreate.put("Full Day AB", 7);
			if (string3.equalsIgnoreCase("Select All")) {
				qd = "";
			} else {
				int errgroup = filterBycreate.get(string3);
				qd = " where ErrGroup=" + errgroup + " ";
			}
			expectedResult = this.testContextObject.baseTest.getDashboardFilterD(
					" select * from (SELECT Mx_DATDTrn.UserID, Mx_UserMst.Name, Mx_DATDTrn.WrkSFT, e.ErrDescr, \r\n"
							+ "CASE  WHEN ErrorID = 10 THEN 1  \r\n" + "WHEN ErrorID = 12 THEN 2  \r\n"
							+ "WHEN ErrorID in (13, 18, 59, 63, 65) THEN 3  \r\n"
							+ "WHEN ErrorID in (14, 19, 60, 64, 66) THEN 4  \r\n"
							+ "WHEN ErrorID in (11, 61, 70, 73) THEN 5  \r\n"
							+ "WHEN ErrorID in (21, 62, 71, 74) THEN 6  \r\n"
							+ "WHEN ErrorID in (20, 72, 75, 77, 76, 51, 52, 55, 56, 53, 54, 57, 58, 17, 15, 16) THEN 7  \r\n"
							+ "END AS ErrGroup  \r\n" + "FROM Mx_DATDTrn WITH (NOLOCK)  \r\n"
							+ "INNER JOIN Mx_UserMst Mx_UserMst WITH (NOLOCK)  ON Mx_DATDTrn.UserID = Mx_UserMst.UserID  \r\n"
							+ "INNER JOIN Mx_ErrorMst e WITH (NOLOCK)  ON Mx_DATDTrn.ErrorID = e.ErrID  \r\n"
							+ "WHERE Mx_DATDTrn.Pdate = convert(datetime,'" + fromDate
							+ "',103)  AND Mx_UserMst.atdcalcenbl = 1 and Mx_UserMst.usertype = 'U' \r\n"
							+ "and Mx_UserMst.UserIDEnbl = 1  \r\n"
							+ "AND ErrorID in (10,12,11,59,61,66,70,73,21,60,62,65,71,74,13,14,20,63,64,72,75,77,76,51,52,55,56,53,54,57,58,17,15,16,18,19) "
							+ additionalParameterforQ + ") as a \r\n" + "" + qd + " order by UserID",
					string);
		} else if (string.equalsIgnoreCase("Attendance Authorization")) {
			if (DashboardPO.additionalDataForDB == null) {
				additionalParameterforQ = "";
			} else {
				additionalParameterforQ = DashboardPO.additionalDataForDB;
			}
			String qd = null;
			String fromDateS = AbstractMethod.staticDateOrPlusMinusFromCurrentDate("-15");
			String toDateE = AbstractMethod.staticDateOrPlusMinusFromCurrentDate("16");
			if (string3.equalsIgnoreCase("Select All")) {
				qd = "";
			} else {
				qd = " where Status='" + string3 + "'";
			}
			expectedResult = this.testContextObject.baseTest.getDashboardFilterD("select * from (SELECT \r\n"
					+ "    A.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "    FORMAT(A.AppDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Attendance Correction' AS AuthType,\r\n" + "    A.AppStatus,\r\n" + "    CASE \r\n"
					+ "        WHEN A.AppStatus = 0 THEN 'Pending'\r\n"
					+ "        WHEN A.AppStatus = 1 THEN 'Approved'\r\n"
					+ "        WHEN A.AppStatus = 2 THEN 'Rejected'\r\n" + "    END AS Status\r\n" + "FROM \r\n"
					+ "    mx_atdcorrection A WITH (NOLOCK)\r\n"
					+ "    INNER JOIN mx_usermst WITH (NOLOCK) ON A.UserID = Mx_UserMst.UserID\r\n"
					+ "    INNER JOIN mx_datdtrn D WITH (NOLOCK) ON A.UserID = D.UserID AND A.PDate = D.PDate\r\n"
					+ "WHERE \r\n" + "    A.AppDate >= CONVERT(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "    AND A.AppDate < CONVERT(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "    AND (Mx_UserMst.dltdflg <> 1 OR Mx_UserMst.dltdflg IS NULL)\r\n"
					+ "    AND Mx_UserMst.useridenbl = 1\r\n" + "    AND Mx_UserMst.usertype = 'U' "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(SLTrn.AppDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Short Leave/Official In-Out' AS AuthType,\r\n" + "    SLTrn.AuthFlg,\r\n" + "    CASE \r\n"
					+ "        WHEN SLTrn.AuthFlg IS NULL OR SLTrn.AuthFlg = 0 THEN 'Pending'\r\n"
					+ "        WHEN SLTrn.AuthFlg = 1 THEN 'Approved'\r\n"
					+ "        WHEN SLTrn.AuthFlg = 2 THEN 'Rejected'\r\n" + "    END AS Status\r\n" + "FROM \r\n"
					+ "    Mx_DAtdTrn DA WITH (NOLOCK)\r\n"
					+ "    INNER JOIN mx_usermst WITH (NOLOCK) ON Mx_UserMst.UserID = DA.UserID\r\n"
					+ "    INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = DA.UserID AND SLTrn.PDate = DA.PDate\r\n"
					+ "    INNER JOIN Mx_AttendancePolicyMst ATD_P WITH (NOLOCK) ON Mx_UserMst.ATDPLCID = ATD_P.ATDPLCID\r\n"
					+ "WHERE \r\n" + "    Mx_UserMst.useridenbl = 1\r\n" + "    AND SLTrn.SPFType IN (3, 4)\r\n"
					+ "    AND ATD_P.PERSAUTHFLG = 1\r\n" + "    AND DA.PDate >= CONVERT(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "    AND DA.PDate < CONVERT(DATETIME, '" + toDateE + "', 103) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(SLTrn.AppDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Short Leave/Official In-Out' AS AuthType,\r\n" + "    SLTrn.AuthFlg AS AppStatus,\r\n"
					+ "    CASE \r\n" + "        WHEN SLTrn.AuthFlg IS NULL OR SLTrn.AuthFlg = 0 THEN 'Pending'\r\n"
					+ "        WHEN SLTrn.AuthFlg = 1 THEN 'Approved'\r\n"
					+ "        WHEN SLTrn.AuthFlg = 2 THEN 'Rejected'\r\n" + "    END AS Status\r\n" + "FROM \r\n"
					+ "    Mx_DAtdTrn DA WITH (NOLOCK)\r\n"
					+ "    INNER JOIN mx_usermst WITH (NOLOCK) ON Mx_UserMst.UserID = DA.UserID\r\n"
					+ "    INNER JOIN Mx_DATDShrtLVOfclTrn SLTrn WITH (NOLOCK) ON SLTrn.UserID = DA.UserID AND SLTrn.PDate = DA.PDate\r\n"
					+ "    INNER JOIN Mx_AttendancePolicyMst ATD_P WITH (NOLOCK) ON Mx_UserMst.ATDPLCID = ATD_P.ATDPLCID\r\n"
					+ "WHERE \r\n" + "    Mx_UserMst.useridenbl = 1\r\n" + "    AND SLTrn.SPFType IN (1, 2)\r\n"
					+ "    AND ATD_P.OFCLAUTHFLG = 1\r\n" + "    AND DA.PDate >= CONVERT(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "    AND DA.PDate < CONVERT(DATETIME, '" + toDateE + "', 103) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Det.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(Det.PDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Overtime/C-OFF' AS AuthType,\r\n" + "    Det.AUTHOT AS AppStatus,\r\n" + "    CASE \r\n"
					+ "        WHEN ((Det.AuthOT IS NULL AND Det.AUTHCOFF IS NULL)\r\n"
					+ "           OR (Det.AUTHOT < 1 AND Det.AuthOTDate IS NULL AND Det.AUTHCOFF < 1 AND Det.AUTHCOFFDate IS NULL)) THEN 'Pending'\r\n"
					+ "        WHEN ((Det.AUTHOT > 0 OR Det.AuthCoFF > 0)\r\n"
					+ "           OR (Det.AUTHOT = 0 AND Det.AUTHOTDate IS NOT NULL)\r\n"
					+ "           OR (Det.AUTHCOFF = 0 AND Det.AUTHCOFFDate IS NOT NULL)) THEN 'Approved'\r\n"
					+ "    END AS Status\r\n" + "FROM \r\n" + "    mx_datddettrn Det WITH (NOLOCK)\r\n"
					+ "    JOIN Mx_UserMst WITH (NOLOCK) ON Det.UserID = Mx_UserMst.UserID\r\n"
					+ "    JOIN Mx_DATDTrn MST WITH (NOLOCK) ON MST.UserID = Det.UserID AND MST.PDate = Det.PDate\r\n"
					+ "WHERE \r\n" + "    Mx_UserMst.OTCOAUTH <> 'N'\r\n" + "    AND Mx_UserMst.dltdflg <> 1\r\n"
					+ "    AND Mx_UserMst.UserIDEnbl = 1\r\n" + "    AND Mx_UserMst.UserType = 'U'\r\n"
					+ "    AND MST.Overtime > 0\r\n" + "    AND Det.PDATE >= CONVERT(DATETIME, '" + fromDateS
					+ "', 103)\r\n" + "    AND Det.PDate < CONVERT(DATETIME, '" + toDateE + "', 103) "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(MST.PDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Daily Attendance' AS AuthType,\r\n" + "    MST.ATDAUTHFlg AS AppStatus,\r\n"
					+ "    CASE \r\n" + "        WHEN (MST.ATDAuthFlg = 0 OR MST.ATDAuthFlg IS NULL) THEN 'Pending'\r\n"
					+ "        WHEN MST.ATDAuthFlg = 1 THEN 'Approved'\r\n" + "    END AS Status\r\n" + "FROM \r\n"
					+ "    Mx_DATDTrn MST WITH (NOLOCK)\r\n"
					+ "    INNER JOIN Mx_UserMst WITH (NOLOCK) ON MST.UserID = Mx_UserMst.UserID\r\n"
					+ "    INNER JOIN Mx_AttendancePolicyMst ATD_P WITH (NOLOCK) ON ATD_P.ATDPLCID = Mx_UserMst.ATDPLCID\r\n"
					+ "WHERE \r\n" + "    MST.PDate >= CONVERT(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "    AND MST.PDate < CONVERT(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "    AND (Punch1 IS NOT NULL OR Punch2 IS NOT NULL OR Punch3 IS NOT NULL \r\n"
					+ "         OR Punch4 IS NOT NULL OR Punch5 IS NOT NULL OR Punch6 IS NOT NULL)\r\n"
					+ "    AND ATD_P.ATDAuthFlg = 1\r\n"
					+ "    AND (Mx_UserMst.dltdflg <> 1 OR Mx_UserMst.dltdflg IS NULL)\r\n"
					+ "    AND Mx_UserMst.UserIDEnbl = 1\r\n" + "    AND Mx_UserMst.UserType = 'U' "
					+ additionalParameterforQ + "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n"
					+ "    Mx_UserMst.UserID,\r\n" + "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(OTAdv.OTDate, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Advance Overtime' AS AuthType,\r\n" + "    OTAdv.ApprovalStatus AS AppStatus,\r\n"
					+ "    CASE \r\n" + "        WHEN OTAdv.ApprovalStatus = 0 THEN 'Pending'\r\n"
					+ "        WHEN OTAdv.ApprovalStatus = 1 THEN 'Approved'\r\n"
					+ "        WHEN OTAdv.ApprovalStatus = 2 THEN 'Rejected'\r\n" + "    END AS Status\r\n"
					+ "FROM \r\n" + "    Mx_OTAdvance OTAdv WITH (NOLOCK)\r\n"
					+ "    INNER JOIN Mx_UserMst WITH (NOLOCK) ON Mx_UserMst.UserID = OTAdv.UserID\r\n" + "WHERE \r\n"
					+ "    (Mx_UserMst.dltdflg <> 1 OR Mx_UserMst.dltdflg IS NULL)\r\n"
					+ "    AND Mx_UserMst.UserIDEnbl = 1\r\n" + "    AND Mx_UserMst.UserType = 'U'\r\n"
					+ "    AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) >= CONVERT(DATETIME, '"
					+ fromDateS + "', 103)\r\n"
					+ "    AND CONVERT(DATETIME, CONVERT(NVARCHAR, OTAdv.OTDate, 103), 103) < CONVERT(DATETIME, '"
					+ toDateE + "', 103)\r\n" + "    AND OTAdv.ApprovalStatus IN (0, 1, 2) " + additionalParameterforQ
					+ "\r\n" + "\r\n" + "UNION ALL\r\n" + "\r\n" + "SELECT \r\n" + "    Mx_UserMst.UserID,\r\n"
					+ "    Mx_UserMst.Name,\r\n"
					+ "	FORMAT(AtdEvt.EDateTime, 'dd/MM/yyyy HH:mm') AS FormattedAppDate,\r\n"
					+ "    'Event Authorization' AS AuthType,\r\n" + "    AtdEvt.AuthStatus AS AppStatus,\r\n"
					+ "    CASE \r\n" + "        WHEN AtdEvt.AuthStatus = 0 THEN 'Pending'\r\n"
					+ "        WHEN AtdEvt.AuthStatus = 1 THEN 'Approved'\r\n" + "    END AS Status\r\n" + "FROM \r\n"
					+ "    Mx_AtdEventTrn AtdEvt WITH (NOLOCK)\r\n"
					+ "    INNER JOIN Mx_UserMst WITH (NOLOCK) ON AtdEvt.UserID = Mx_UserMst.UserID\r\n"
					+ "    INNER JOIN Mx_AttendancePolicyMst ATDPLC WITH (NOLOCK) ON ATDPLC.ATDPLCID = Mx_UserMst.ATDPLCID\r\n"
					+ "WHERE \r\n" + "    AtdEvt.EDateTime >= CONVERT(DATETIME, '" + fromDateS + "', 103)\r\n"
					+ "    AND AtdEvt.EDateTime < CONVERT(DATETIME, '" + toDateE + "', 103)\r\n"
					+ "    AND EventID <= 150\r\n" + "    AND Mx_UserMst.UserType = 'U'\r\n"
					+ "    AND (Mx_UserMst.dltdflg = 0 OR Mx_UserMst.dltdflg IS NULL)\r\n"
					+ "    AND (AtdEvt.AuthStatus <> 1 OR (AtdEvt.AuthStatus = 1 AND ATDPLC.EventAuthReq = 1))\r\n"
					+ "    AND Mx_UserMst.UserIDEnbl = 1 " + additionalParameterforQ + ") as a " + qd + "\r\n" + "",
					string);
		}

		System.out.println(expectedResult);
		this.testContextObject.pom.homePO().goToDashboard();
		this.testContextObject.pom.dashboard().openFilterData(string3, expectedResult, string);
		this.testContextObject.pom.dashboard().homeButtonClick();
	}

	@When("the user filters the {string} chart with the following data and saves it.")
	public void the_user_filters_the_chart_with_the_following_data_and_saves_it(String string,
			io.cucumber.datatable.DataTable dataTable) throws Exception {
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			List<String> keyValueOfMap = new ArrayList<String>();
			for (Map.Entry<String, String> entry : data.entrySet()) {
				if (!entry.getKey().equalsIgnoreCase("Select Users")) {
					String getAPIResult = this.testContextObject.baseTest.getAPI("get;format=json;", "sa", "admin",
							entry.getKey().replaceAll(" ", "-"), 200);
					JsonPath path = new JsonPath(getAPIResult);

					int count = path.getInt(entry.getKey().replaceAll(" ", "-").toLowerCase() + ".size()");
					if (entry.getValue() != null) {
						String[] mapVsplit = entry.getValue().split(",");
						String valOfEn = null;
						for (int x = 0; x < mapVsplit.length; x++) {
							String datatableV = mapVsplit[x].trim();
							for (int i = 0; i < count; i++) {
								String nameofEnt = path.getString(
										entry.getKey().toLowerCase().replaceAll(" ", "-") + "[" + i + "].name");
								if (nameofEnt.equalsIgnoreCase(datatableV)) {
//									System.out.println(path.getString(entry.getKey().toLowerCase().replaceAll(" ", "-") + "[" + i + "].id"));
									if (valOfEn == null) {
										valOfEn = path.getString(
												entry.getKey().toLowerCase().replaceAll(" ", "-") + "[" + i + "].id");
									} else {
										valOfEn = valOfEn + "," + path.getString(
												entry.getKey().toLowerCase().replaceAll(" ", "-") + "[" + i + "].id");
									}
								}
							}
						}
						keyValueOfMap.add(entry.getKey() + "|" + valOfEn);
					}
				} else {
					keyValueOfMap.add(entry.getKey() + "|" + entry.getValue());
				}

			}
			System.out.println(keyValueOfMap);
			this.testContextObject.pom.homePO().goToDashboard();
			this.testContextObject.pom.dashboard().editAndFilter(string, dataTable, keyValueOfMap);
			this.testContextObject.pom.dashboard().homeButtonClick();
		}

	}

}
