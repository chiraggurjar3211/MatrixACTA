package stepDefinations;

import java.io.FileInputStream;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import com.typesafe.config.ConfigException.Parse;

import CommonAbstract.AbstractMethod;
import CommonTestAbstract.TestContextObject;
import PageObject.ESSLogin.AssignAwardPenaltyHoursPO;
import PageObject.ShiftAndSchedule.ShiftChangeApplicationPO;
import PageObject.TimeAndAttendance.OvertimePolicyPO;
import PageObject.VisitorManagement.VisitorPortalPO;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;

public class CustomAlertSD {
	TestContextObject testContextObject;
	public static Properties prop;
	private static Logger logger = LogManager.getLogger(CustomAlertSD.class);

	public CustomAlertSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	// Chirag Analysis regarding Acustom alert
	@Given("{string} alert normal custom field value set")
	public void alert_normal_custom_field_value_set(String string, DataTable dataTable) throws Exception {
		logger.info(string + " Alert normal custom field value set started");
		switch (string) {
		case "Visitor Arrival":
			String visitorName = null;
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				Set<String> key = data.keySet();
				Iterator<String> keyValue = key.iterator();
				while (keyValue.hasNext()) {
					String mapKey = keyValue.next();
					if (mapKey.equalsIgnoreCase("Visitor Name")) {
						visitorName = data.get(mapKey);
					}
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, mapKey, data.get(mapKey));
				}
			}

			testContextObject.pom.homePO().goToVisitormodule();
			testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
			Map<String, String> val = testContextObject.pom.visitorPreRegistrationPO()
					.getDataOfVisitorPreRegistration(visitorName);
			testContextObject.pom.userConfigurationPO().homeButtonClick();
			testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DateTime", val.get("DateTime"));

			break;

		case "Visitor Pre-Registration":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String recieverTo = data.get("MailRecieveTo");
				testContextObject.pom.homePO().goToVisitormodule();
				if (recieverTo.equalsIgnoreCase("Host")) {
					testContextObject.pom.visitorManagementPO().goToVisitApprovalPage();
					Map<String, String> val1 = testContextObject.pom.visitApprovalPO().visiotrDataGetForAlert(vName);
					testContextObject.pom.userConfigurationPO().homeButtonClick();
					System.out.println(val1);
					// get Appoinment number from api
					String sdate = val1.get("VisitDate").replace("\\", "");
					String edate = val1.get("VisitUntilDate").replace("\\", "");
					String hostID = val1.get("HostName");
					String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id="
							+ hostID + ";status=0;FORMAT=JSON";
					String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration",
							200);
					String appointmentid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
							"visitor-pre-registration.appointment-no");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No",
							appointmentid);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Host User Name / Visitor Name", vName.toUpperCase());
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
							val1.get("VisitDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
							val1.get("VisitStartTime"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
							val1.get("VisitEndTime"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
							val1.get("DailyWeekly"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Mon,Tue,Wed,..,Sun/1,2,3,...,31", val1.get("RepeatVisitDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
							val1.get("VisitUntilDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
							val1.get("VisitStation"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
							vName.toUpperCase());
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Host User Name / Watchlisted Visitor Name/Visitor Name", vName.toUpperCase());
				} else {

					testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
					Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
							.getDataOfVisitorPreRegistration(vName);
					testContextObject.pom.userConfigurationPO().homeButtonClick();
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No",
							valData.get("Appointment No"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Host User Name / Visitor Name", valData.get("HostName"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
							valData.get("Visit Date"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
							valData.get("Visit Start Time"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
							valData.get("Visit End Time"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
							valData.get("DailyWeekly"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Mon,Tue,Wed,..,Sun/1,2,3,...,31", valData.get("RepeatVisitDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
							valData.get("Visit Until Date"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
							valData.get("Visit Station"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"Host User Name / Watchlisted Visitor Name/Visitor Name", valData.get("HostName"));
				}
			}
			break;

		case "Visitor Pass Expiry Reminder":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String expiryTime = data.get("ExpiryReminder");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorHistoryPage();
				Map<String, String> valData = testContextObject.pom.visitorHistoryPO().getVisitorHistroryData(vName);
				System.out.println(valData);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Pass Number",
						valData.get("PassNo"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expiry Reminder",
						expiryTime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("StationName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
						vName.toUpperCase());

			}
			break;

		case "Visitor Pass Expired":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorHistoryPage();
				Map<String, String> valData = testContextObject.pom.visitorHistoryPO().getVisitorHistroryData(vName);
				System.out.println(valData);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Pass Number",
						valData.get("PassNo"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor name",
						vName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Departure time",
						valData.get("VisitEndTime"));
//				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Pass Number",
//						valData.get("Appointment No"));
			}
			break;

		case "Visit Request Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String appStatus = data.get("ApplicationStatus");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
						vName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						valData.get("Visit Start Time"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "approved/rejected",
						appStatus);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Approval/Rejection Date-Time", valData.get("approvedRejectedTime"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark",
						valData.get("approvedRejectedRemark"));

			}

			break;

		case "Security Clearance":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						valData.get("Visit Start Time"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
						valData.get("Visit End Time"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
						valData.get("DailyWeekly"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31", valData.get("RepeatVisitDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("Visit Station"));
				// location wise code pending
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Location Code - Location Name/ Latitude , Longitude", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Mobile No.",
						valData.get("MobileNo"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Purpose",
						valData.get("Visit Purpose"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name", vName);

			}

			break;

		case "Visit Transfer":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String OldHN = data.get("OldHostName");
				String actorName = data.get("ActorName");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						testContextObject.pom.abstractMethod().convertedDatetime(valData.get("Visit Start Time"))
								.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
						testContextObject.pom.abstractMethod().convertedDatetime(valData.get("Visit End Time"))
								.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
						valData.get("DailyWeekly"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31", valData.get("RepeatVisitDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("Visit Station"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Mobile No.",
						valData.get("MobileNo"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Purpose",
						valData.get("Visit Purpose"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name", vName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Old Host Name", OldHN);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Actor Name", actorName);
			}
			Thread.sleep(60000);
			break;

		case "Visitor Pass":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				System.out.println(valData);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Access Pin", "");

			}
			break;

		case "Visitor - Login without OTP":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorLoginAuthorizationPage();
				Map<String, String> valData = testContextObject.pom.visitorLoginAuthorizationPO()
						.visitorLoginAuthorizationGetData(vName);
				System.out.println(valData);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
						vName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor's Name",
						vName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor's Mobile Number",
						valData.get("Mobile"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor's Email ID",
						valData.get("Email"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor's Organization Name",
						valData.get("Organization"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Mobile Number",
						valData.get("Mobile"));
			}
			break;

		case "Visitor Added - Watchlist/Blacklist":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String watcBlack = data.get("Watchlist/Blacklist");
				String secName = data.get("SecurityName");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name", vName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Watchlist/Blacklist",
						watcBlack);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Security Name", secName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToWatchlistBlacklistPage();
				String datet = testContextObject.pom.watchlistBlacklistPO().getWatchBlackDetails(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date-Time", datet);

			}
			break;

		case "Invite Visitor":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToInviteVisitorsPage();
				Map<String, String> vstrData = testContextObject.pom.inviteVisitorPO().getInviteVisitorData(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expiry Date",
						vstrData.get("VisitUntilDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "host-name",
						vstrData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "here", vstrData.get("Link"));
				String url = "get;id=" + vstrData.get("HostName") + ";Field-name=organization-name;format=json;";
				String getOrg = testContextObject.baseTest.getAPI(url, "sa", "admin", "user", 200);
				System.out.println(getOrg);
				String[] getOrgsplit = getOrg.split("\"");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "host-organization-name",
						getOrgsplit[5]);
				// testContextObject.baseTest.checkProduct().equalsIgnoreCase("COSEC")
				String iosLink = null;
				if (testContextObject.baseTest.checkProduct().equalsIgnoreCase("COSEC")) {
					iosLink = "https://apps.apple.com/in/app/cosec-vms/id1461763998?is=1";
				} else {
					iosLink = "https://apps.apple.com/in/app/EVERTECT-vms/id1461763998?is=1";
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "iOS App Link", iosLink);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Link", vstrData.get("Link"));
			}
			break;

		case "Create Visit - Watchlist/Blacklist":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String watcBlack = data.get("Watchlist/Blacklist");
				String alwDen = data.get("AllowedDenied");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name", vName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Watchlisted/Blacklisted",
						watcBlack);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Allowed/Denied", alwDen);
				if (watcBlack.equalsIgnoreCase("Watchlisted")) {
					testContextObject.pom.homePO().goToVisitormodule();
					testContextObject.pom.visitorManagementPO().goToVisitApprovalPage();
					Map<String, String> val1 = testContextObject.pom.visitApprovalPO().visiotrDataGetForAlert(vName);
					testContextObject.pom.userConfigurationPO().homeButtonClick();
					System.out.println(val1);
					// get Appoinment number from api
					String sdate = val1.get("VisitDate").replace("\\", "");
					String edate = val1.get("VisitUntilDate").replace("\\", "");
					String hostID = val1.get("HostName");
					String url = "get;user-type=0;date-range=" + sdate + "-" + edate + ";user-filter=0;user-id="
							+ hostID + ";status=0;FORMAT=JSON";
					String getres = testContextObject.baseTest.getAPI(url, "SA", "admin", "visitor-pre-registration",
							200);
					String appointmentid = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(getres,
							"visitor-pre-registration.appointment-no");

					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
							appointmentid);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
							val1.get("HostName"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
							val1.get("VisitDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
							val1.get("VisitStartTime"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
							val1.get("VisitEndTime"));
				} else {
					Map<String, String> visitData = VisitorPortalPO.visitData;
					System.out.println("portal Data" + visitData);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
							"Not Applicable");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
							visitData.get("HostName"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
							visitData.get("startDate"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
							visitData.get("StartTime"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
							visitData.get("EndTime"));
				}

			}
			break;

		case "Visitor Form Execution":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String formType = data.get("FormType");
				String attmptQ = data.get("Attquest");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToFormSummaryPage();
				Map<String, String> valData1 = testContextObject.pom.formSummaryPO().getFormSummaryDataForCustomAlert(
						valData.get("Visit Station"), valData.get("MobileNo"), formType);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name", vName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Allowed/Not Allowed",
						valData1.get("allowedDenied"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Check-In/Check-Out/Login",
						formType);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("Visit Station"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Form Name",
						valData1.get("formName"));
				String[] dateVF = valData1.get("datetime").substring(0, valData1.get("datetime").length() - 3)
						.split(" ");
				String cov = testContextObject.pom.abstractMethod().convertedDatetime(dateVF[1]);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Attempt Date-Time",
						dateVF[0] + " " + cov.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Attempt No.",
						valData1.get("Attempt"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Attempted Questions/Total Questions", attmptQ);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Achieved Score/Total Score",
						valData1.get("FinalScore"));

			}
			break;

		case "Visitor Pre-registration Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String initiated = data.get("Initiated");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						testContextObject.pom.abstractMethod().convertedDatetime(valData.get("Visit Start Time"))
								.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
						testContextObject.pom.abstractMethod().convertedDatetime(valData.get("Visit End Time"))
								.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
						valData.get("DailyWeekly"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Mon,Tue,Wed,..,Sun/1,2,3,...,31", valData.get("RepeatVisitDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("Visit Station"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host/Visitor", initiated);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
						vName.toUpperCase());

			}
			break;

		case "Visit Reminder":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String receiver = data.get("Reciever");
				String reminderPriorHours = data.get("ReminderPriorHours");
				String hd = data.get("HourDay");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				if (receiver.equalsIgnoreCase("Host")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name/Visitor Name",
							vName.toUpperCase());
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name/Visitor Name",
							valData.get("HostName"));
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "hour/s|day/s", hd);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Reminder Prior Hours|Reminder Prior Day", reminderPriorHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						valData.get("Visit Start Time"));

			}
			Thread.sleep(60000);
			break;

		case "Visit State Change":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String vName = data.get("Visitor");
				String actorName = data.get("ActorName");
				String visitState = data.get("Visit State");
				testContextObject.pom.homePO().goToVisitormodule();
				testContextObject.pom.visitorManagementPO().goToVisitorPreRegistrationPage();
				Map<String, String> valData = testContextObject.pom.visitorPreRegistrationPO()
						.getDataOfVisitorPreRegistration(vName);
				testContextObject.pom.userConfigurationPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Actor Name", actorName);

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Appointment No.",
						valData.get("Appointment No"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Host Name",
						valData.get("HostName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visitor Name",
						vName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Date",
						valData.get("Visit Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Start Time",
						valData.get("Visit Start Time"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit End Time",
						valData.get("Visit End Time"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily/Weekly/Monthly",
						valData.get("DailyWeekly"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Mon ,Tue ,Wed ,.., Sun/1,2,3,...,31", valData.get("RepeatVisitDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit Until Date",
						valData.get("Visit Until Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Station Name",
						valData.get("Visit Station"));
				// Location code related coding pending cause not in use right now
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Location Code - Location Name/ Latitude , Longitude", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Visit State", visitState);
				Thread.sleep(15000);
			}
			break;

		case "Attendance Correction Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String appDate = AbstractMethod.dateSelected(data.get("ApplicationDate"));
				testContextObject.pom.abstractMethod().logOut();
				Thread.sleep(1500);
				String valid = testContextObject.pom.loginPO().credential(uName, "admin");
				Assert.assertEquals(valid, "Welcome " + uName.toUpperCase());
				testContextObject.pom.essPO().goToAttendanceCorrectionPage();
				Map<String, String> atdCData = testContextObject.pom.essAttendanceCorrectionApplicationPO()
						.getAtdCorGetDataForCustomAlert(appDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User NAME",
						atdCData.get("UserName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date", appDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "application date-time",
						atdCData.get("StatusDatetime"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID",
						uName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason",
						atdCData.get("Reason"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "shift ID|shift ID",
						atdCData.get("Shift") + "|" + atdCData.get("Shift"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName.toUpperCase() + "-" + atdCData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().logOut();
				String valid12 = testContextObject.pom.loginPO().credential("sa", "admin");
				Assert.assertEquals(valid12, "Welcome System Admin");
				String url = "get;user-filter=0;Status=1;userid=" + uName + ";format=JSON;";
				String getOrg = testContextObject.baseTest.getAPI(url, "sa", "admin", "attendance-correction", 200);
				String punchesOLDNew = " <br/> ";
				for (int i = 1; i <= 12; i++) {
					String previousPunch = testContextObject.pom.abstractMethod()
							.convertedDatetimeDif(testContextObject.baseTest
									.readJSONdata("attendance-correction", "previous-punch" + i, getOrg)
									.replaceAll("\"", ""));
					String changedPunch = testContextObject.pom.abstractMethod()
							.convertedDatetimeDif(testContextObject.baseTest
									.readJSONdata("attendance-correction", "changed-punch" + i, getOrg)
									.replaceAll("\"", ""));
					if (previousPunch != null || changedPunch != null) {
						if (previousPunch == null) {
							previousPunch = "";
						}
						if (changedPunch == null) {
							changedPunch = "";
						}
						String newOld = "Punch" + i + ": " + previousPunch + " | " + changedPunch;
						if (punchesOLDNew.equalsIgnoreCase(" <br/> ")) {
							punchesOLDNew = " <br/> " + newOld;
						} else {
							punchesOLDNew = punchesOLDNew + " <br/> " + newOld;
						}
					}
				}
				String startBreakPrevious = testContextObject.pom.abstractMethod()
						.convertedDatetimeDif(testContextObject.baseTest
								.readJSONdata("attendance-correction", "previous-break-start-time", getOrg)
								.replaceAll("\"", ""));
				if (startBreakPrevious == null) {
					startBreakPrevious = "";
				}
				String startBreakChanges = testContextObject.pom.abstractMethod()
						.convertedDatetimeDif(testContextObject.baseTest
								.readJSONdata("attendance-correction", "changed-break-start-time", getOrg)
								.replaceAll("\"", ""));
				if (startBreakChanges == null) {
					startBreakChanges = "";
				}
				String endBreakPrevious = testContextObject.pom.abstractMethod()
						.convertedDatetimeDif(testContextObject.baseTest
								.readJSONdata("attendance-correction", "previous-break-end-time", getOrg)
								.replaceAll("\"", ""));
				if (endBreakPrevious == null) {
					endBreakPrevious = "";
				}
				String endBreakChanges = testContextObject.pom.abstractMethod()
						.convertedDatetimeDif(testContextObject.baseTest
								.readJSONdata("attendance-correction", "changed-break-end-time", getOrg)
								.replaceAll("\"", ""));
				if (endBreakChanges == null) {
					endBreakChanges = "";
				}
				punchesOLDNew = punchesOLDNew + " <br/> Break Start: " + startBreakPrevious + " | " + startBreakChanges
						+ "<br/> Break End: " + endBreakPrevious + " | " + endBreakChanges + " ";
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Day|Day",
						atdCData.get("Day") + " | " + atdCData.get("Day"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", punchesOLDNew);

			}
			Thread.sleep(15000);
			break;

		case "Attendance Correction Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String appDate = AbstractMethod.dateSelected(data.get("ApplicationDate"));
				String url = "get;user-filter=0;Status=0;userid=" + uName + ";format=JSON;";
				String getOrg = testContextObject.baseTest.getAPI(url, "sa", "admin", "attendance-correction", 200);
				String useName = testContextObject.baseTest.readJSONdata("attendance-correction", "user-name", getOrg)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserNAME", useName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date", appDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", uName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + "-" + useName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark",
						testContextObject.baseTest.readJSONdata("attendance-correction", "final-ric-remark", getOrg)
								.replaceAll("\"", ""));
				String vdate = testContextObject.pom.abstractMethod().convertedDatetimeDif(testContextObject.baseTest
						.readJSONdata("attendance-correction", "verdict-date", getOrg).replaceAll("\"", ""));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "verdict date-time", vdate);
				String aprRej = testContextObject.baseTest
						.readJSONdata("attendance-correction", "final-ric-verdict", getOrg).replaceAll("\"", "");
				if (aprRej.equalsIgnoreCase("2")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
							"Approved");
				} else if (aprRej.equalsIgnoreCase("3")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
							"Rejected");
				} else if (aprRej.equalsIgnoreCase("1")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
							"Pending");
				}

			}
			Thread.sleep(60000);
			break;

		case "Short Leave/Official Hours Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String url = "get;user-filter=0;authorization-status=1;userid=" + uName + ";format=JSON;";
				String appDate = AbstractMethod.dateSelected(data.get("ApplicationDate"));
				testContextObject.pom.abstractMethod().logOut();
				Thread.sleep(1500);
				String valid = testContextObject.pom.loginPO().credential(uName, "admin");
				Assert.assertEquals(valid, "Welcome " + uName.toUpperCase());
				testContextObject.pom.essPO().goToshortLeaveOfficialInOut();
				Map<String, String> appLiData = testContextObject.pom.essShortLeaveOfficialINOUTEntryPO()
						.shortOfficialApplicationDatagetForCustomAlert(appDate);
				System.out.println(appLiData);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User NAME",
						appLiData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Short Leave/Official Hours",
						appLiData.get("SpecialFunction"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date", appDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID",
						uName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason",
						appLiData.get("reason"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName.toUpperCase() + "-" + appLiData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName-UserID",
						appLiData.get("UserName").toUpperCase() + "-" + uName.toUpperCase());
				String leaveDuration = appDate + "-" + appLiData.get("start") + " to " + appDate + "-"
						+ appLiData.get("end");
				if (appLiData.get("SpecialFunction").equalsIgnoreCase("Short Leave")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Duration",
							"Short Leave Duration: " + appLiData.get("PostDuration"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM", "Short Leave: " + leaveDuration);

				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Duration",
							"Official Hours Duration: " + appLiData.get("PostDuration"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM", "Official Hours: " + leaveDuration);
					url = "get;user-filter=0;authorization-status=1;Entry-type=1;userid=" + uName + ";format=JSON;";
				}
				String getOrg = testContextObject.baseTest.getAPI(url, "sa", "admin", "short-leave-entry", 200);
				String apply = testContextObject.pom.abstractMethod().convertedDatetimeDif(testContextObject.baseTest
						.readJSONdata("short-leave-entry", "application-date", getOrg).replaceAll("\"", ""));
				String[] applySplitewithHyp = apply.split("-");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "application date",
						applySplitewithHyp[0]);

			}
			Thread.sleep(60000);
			break;

		case "Short Leave/Official Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String appDate = AbstractMethod.dateSelected(data.get("ApplicationDate"));
				testContextObject.pom.abstractMethod().logOut();
				Thread.sleep(1500);
				String valid = testContextObject.pom.loginPO().credential(uName, "admin");
				Assert.assertEquals(valid, "Welcome " + uName.toUpperCase());
				testContextObject.pom.essPO().goToshortLeaveOfficialInOut();
				Map<String, String> appLiData = testContextObject.pom.essShortLeaveOfficialINOUTEntryPO()
						.shortOfficialApplicationDatagetForCustomAlert(appDate);
				System.out.println(appLiData);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName",
						appLiData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Short Leave/Official Hours",
						appLiData.get("SpecialFunction"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "from dd/mm/yyyy-HH:MM",
						appDate + "-" + appLiData.get("start"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "to dd/mm/yyyy-HH:MM",
						appDate + "-" + appLiData.get("end"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						appLiData.get("status"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName.toUpperCase() + "-" + appLiData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID",
						uName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName",
						appLiData.get("UserName").toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark",
						appLiData.get("ApprovedRejectedRemark"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"dd/mm/yyyy-HH:MM to dd/mm/yyyy-HH:MM",
						appDate + "-" + appLiData.get("start") + " to " + appDate + "-" + appLiData.get("end"));
			}
			Thread.sleep(60000);
			break;

		case "Shift Change":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID",
						uName.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName",
						ShiftChangeApplicationPO.pendingshiftAppData.get("UserName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + " - " + ShiftChangeApplicationPO.pendingshiftAppData.get("UserName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + " - " + ShiftChangeApplicationPO.pendingshiftAppData.get("UserName"));
				String[] newshiftSplit = ShiftChangeApplicationPO.pendingshiftAppData.get("NewShift").split("-");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "new shift code",
						newshiftSplit[0].trim().toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "new shift start time hh:mm",
						newshiftSplit[1].trim());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "new shift end time hh:mm",
						newshiftSplit[2].trim());
				String[] previousShift = ShiftChangeApplicationPO.pendingshiftAppData.get("PreviousShift").split("-");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "previous shift code",
						previousShift[0].trim().toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"previous shift start time hh:mm", previousShift[1].trim());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"previous shift end time hh:mm", previousShift[2].trim());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date dd-mm-yy",
						ShiftChangeApplicationPO.pendingshiftAppData.get("FromDate"));
			}
			Thread.sleep(60000);
			break;

		case "Shift Change Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", uName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName",
						ShiftChangeApplicationPO.pendingshiftAppData.get("UserName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + " - " + ShiftChangeApplicationPO.pendingshiftAppData.get("UserName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "From Date-To Date",
						ShiftChangeApplicationPO.pendingshiftAppData.get("FromDate") + "-"
								+ ShiftChangeApplicationPO.pendingshiftAppData.get("Todate"));
				String[] newshiftSplit = ShiftChangeApplicationPO.pendingshiftAppData.get("NewShift").split("-");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "shift code",
						newshiftSplit[0].trim().toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "start time hh:mm",
						newshiftSplit[1].trim());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "end time hh:mm",
						newshiftSplit[2].trim());

			}
			Thread.sleep(60000);
			break;

		case "Overtime Limit Exceeded - User":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String eventDate = AbstractMethod.dateSelected(data.get("Event-Date"));
				System.out.println(OvertimePolicyPO.getOvertimeLimitCustomAlert);
				String url = "get;range=user;id=" + uName + ";Field-name=Overtime_HHMM;format=json;";
				String overtimeGet = testContextObject.baseTest.getAPI(url, "sa", "admin", "attendance-daily", 200);
				String oT = testContextObject.baseTest.readJSONdata("attendance-daily", "overtime_hhmm", overtimeGet)
						.replaceAll("\"", "");
				if (OvertimePolicyPO.getOvertimeLimitCustomAlert.get("OTCal").equalsIgnoreCase("Generated Overtime")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Generated/Authorized",
							"Generated");
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Generated/Authorized",
							"Authorized");
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Attendance Date", eventDate);
				if (OvertimePolicyPO.getOvertimeLimitCustomAlert.get("DailyOTLimit").length() != 0) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily AllowedOT",
							OvertimePolicyPO.getOvertimeLimitCustomAlert.get("DailyOTLimit"));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily ActualOT", oT);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily AllowedOT",
							"00:00");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily ActualOT",
							"00:00");
				}
				String weekDates = testContextObject.pom.abstractMethod().getWeekstartDateEndDateForCustomAlert(
						eventDate, OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeekStartDay"), "weekly");
				if (OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeeklyOTLimit").equalsIgnoreCase(":") == false) {
					String weekLimit = OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeeklyOTLimit");
					if (weekLimit.substring(0, 1).equalsIgnoreCase("0")) {
						testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly AllowedOT",
								weekLimit.substring(1, weekLimit.length()));
					} else {
						testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly AllowedOT",
								weekLimit);
					}
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly ActualOT", oT);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly AllowedOT",
							"00:00");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly ActualOT",
							"00:00");
				}

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"WeekStartDate to WeekEndDate", weekDates);

				String monthDates = testContextObject.pom.abstractMethod().getWeekstartDateEndDateForCustomAlert(
						eventDate, OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeekStartDay"), "Monthly");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"MonthStartDate to MonthEndDate", monthDates);

				if (OvertimePolicyPO.getOvertimeLimitCustomAlert.get("MonthlyOTLimit").equalsIgnoreCase(":") == false) {
					String monthLimit = OvertimePolicyPO.getOvertimeLimitCustomAlert.get("MonthlyOTLimit");
					if (monthLimit.substring(0, 1).equalsIgnoreCase("0")) {
						testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly AllowedOT",
								monthLimit.substring(1, monthLimit.length()));
					} else {
						testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly AllowedOT",
								monthLimit);
					}
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly ActualOT", oT);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly AllowedOT",
							"00:00");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly ActualOT",
							"00:00");
				}
			}
//				Thread.sleep(60000);
			break;

		case "Overtime Limit Exceeded - Group Incharge":
			List<Map<String, String>> otGI = new ArrayList<Map<String, String>>();
			int count = 0;
			int dailycount = 0;
			int weeklycount = 0;
			int monthlycount = 0;
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				Map<String, String> userOTdata = new HashMap<String, String>();
				String uName = data.get("UserID");
				String eventDate = AbstractMethod.dateSelected(data.get("Event-Date"));
				String exceedCheck = data.get("Exceedcheck");

				System.out.println(OvertimePolicyPO.getOvertimeLimitCustomAlert);
				String url = "get;range=user;id=" + uName + ";Field-name=Overtime_HHMM,UserName;format=json;";
				String overtimeGet = testContextObject.baseTest.getAPI(url, "sa", "admin", "attendance-daily", 200);
				String oT = testContextObject.baseTest.readJSONdata("attendance-daily", "overtime_hhmm", overtimeGet)
						.replaceAll("\"", "");
				String userName = testContextObject.baseTest.readJSONdata("attendance-daily", "username", overtimeGet)
						.replaceAll("\"", "");
				userOTdata.put("userid", uName);
				userOTdata.put("userName", userName);
				userOTdata.put("OTGeneratedFOR", exceedCheck);
				if (OvertimePolicyPO.getOvertimeLimitCustomAlert.get("OTCal").equalsIgnoreCase("Generated Overtime")) {
					userOTdata.put("Generated/Authorized", "Generated");
				} else {
					userOTdata.put("Generated/Authorized", "Authorized");
				}
				if (exceedCheck.equalsIgnoreCase("daily")) {
					userOTdata.put("date", eventDate);
					userOTdata.put("AllowedOT", OvertimePolicyPO.getOvertimeLimitCustomAlert.get("DailyOTLimit"));
					userOTdata.put("ActualOT", oT);
					dailycount++;
				} else if (exceedCheck.equalsIgnoreCase("weekly")) {
					String weekDates = testContextObject.pom.abstractMethod().getWeekstartDateEndDateForCustomAlert(
							eventDate, OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeekStartDay"), exceedCheck);
					String weekLimit = OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeeklyOTLimit");

					userOTdata.put("date", weekDates);
					userOTdata.put("AllowedOT", weekLimit.substring(1, weekLimit.length()));
					userOTdata.put("ActualOT", oT);
					weeklycount++;
				} else if (exceedCheck.equalsIgnoreCase("monthly")) {
					String monthDates = testContextObject.pom.abstractMethod().getWeekstartDateEndDateForCustomAlert(
							eventDate, OvertimePolicyPO.getOvertimeLimitCustomAlert.get("WeekStartDay"), exceedCheck);
					String monthLimit = OvertimePolicyPO.getOvertimeLimitCustomAlert.get("MonthlyOTLimit");
					userOTdata.put("date", monthDates);
					userOTdata.put("AllowedOT", monthLimit.substring(1, monthLimit.length()));
					userOTdata.put("ActualOT", oT);
					monthlycount++;
				}
				otGI.add(count, userOTdata);
				count++;
			}
			String groupOTGenerated = null;
			for (int i = 0; i < otGI.size(); i++) {
				Map<String, String> mainGTOT = otGI.get(i);
				if (mainGTOT.get("OTGeneratedFOR").equalsIgnoreCase("daily")) {
					String dataTG = "<tr><td>" + (i + 1) + "</td><td>" + mainGTOT.get("date") + "</td><td>"
							+ mainGTOT.get("userid") + "</td><td>" + mainGTOT.get("userName") + "</td><td>"
							+ mainGTOT.get("AllowedOT") + "</td><td>" + mainGTOT.get("ActualOT") + "<td> "
							+ mainGTOT.get("Generated/Authorized") + " </td></tr>";
					if (groupOTGenerated == null) {
						groupOTGenerated = dataTG;
					} else {
						groupOTGenerated = groupOTGenerated + dataTG;
					}
				} else if (mainGTOT.get("OTGeneratedFOR").equalsIgnoreCase("weekly")) {
					String[] dateSplitwithTo = mainGTOT.get("date").split(" to ");
					String dataTG = "<tr><td>" + (i + 1) + "</td><td>" + dateSplitwithTo[0].trim() + "</td><td>"
							+ dateSplitwithTo[1].trim() + "</td><td>" + mainGTOT.get("userid") + "</td><td>"
							+ mainGTOT.get("userName") + "</td><td>" + mainGTOT.get("AllowedOT") + "</td><td>"
							+ mainGTOT.get("ActualOT") + "<td> " + mainGTOT.get("Generated/Authorized") + " </td></tr>";
					if (groupOTGenerated == null) {
						groupOTGenerated = dataTG;
					} else {
						groupOTGenerated = groupOTGenerated + dataTG;
					}
				} else if (mainGTOT.get("OTGeneratedFOR").equalsIgnoreCase("Monthly")) {
					String[] dateSplitwithTo = mainGTOT.get("date").split(" to ");
					String dataTG = "<tr><td>" + (i + 1) + "</td><td>" + dateSplitwithTo[0].trim() + "</td><td>"
							+ dateSplitwithTo[1].trim() + "</td><td>" + mainGTOT.get("userid") + "</td><td>"
							+ mainGTOT.get("userName") + "</td><td>" + mainGTOT.get("AllowedOT") + "</td><td>"
							+ mainGTOT.get("ActualOT") + "<td> " + mainGTOT.get("Generated/Authorized") + " </td></tr>";
					if (groupOTGenerated == null) {
						groupOTGenerated = dataTG;
					} else {
						groupOTGenerated = groupOTGenerated + dataTG;
					}
				}
			}
			testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ExcideOT", groupOTGenerated);
			testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Daily UserCount",
					String.valueOf(dailycount));
			testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Weekly UserCount",
					String.valueOf(weeklycount));
			testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Monthly UserCount",
					String.valueOf(monthlycount));

			// Thread.sleep(60000);
			break;

		case "Overtime/C-OFF Authorization":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String eventDate = AbstractMethod.dateSelected(data.get("Event-Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date", eventDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Total Of All Users Who Did Overtime", String.valueOf(data.size()));

			}
			break;

		case "Advance Overtime Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String url = "get;user-filter=0;userid=" + uName + ";application-status=0;format=json;";
				String overtimeAppGet = testContextObject.baseTest.getAPI(url, "sa", "admin", "overtime-application",
						200);
				String userName = testContextObject.baseTest
						.readJSONdata("overtime-application", "user-name", overtimeAppGet).replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", uName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + "-" + userName);
				String reason = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-reason", overtimeAppGet)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				String appHours = testContextObject.baseTest
						.readJSONdata("overtime-application", "applied-hours", overtimeAppGet).replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Hours", appHours);
				String[] otdate = testContextObject.baseTest
						.readJSONdata("overtime-application", "ot-date", overtimeAppGet).replaceAll("\"", "")
						.split("/");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Date",
						otdate[1] + "/" + otdate[0] + "/" + otdate[2]);
				String[] applicationDate = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-date", overtimeAppGet).replaceAll("\"", "")
						.split(" ");
				String[] applicationDate1 = applicationDate[0].split("/");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Application Date",
						applicationDate1[1] + "/" + applicationDate1[0] + "/" + applicationDate1[2]);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Date-OT-Hours",
						otdate[1] + "/" + otdate[0] + "/" + otdate[2] + "-" + appHours);
			}
			Thread.sleep(60000);
			break;

		case "Advance Overtime Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String url = "get;user-filter=0;userid=" + uName + ";application-status=0;format=json;";
				String overtimeAppGet = testContextObject.baseTest.getAPI(url, "sa", "admin", "overtime-application",
						200);
				String userName = testContextObject.baseTest
						.readJSONdata("overtime-application", "user-name", overtimeAppGet).replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", uName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						uName + "-" + userName);
				String reason = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-reason", overtimeAppGet)
						.replaceAll("\"", "");
				String appHours = testContextObject.baseTest
						.readJSONdata("overtime-application", "applied-hours", overtimeAppGet).replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Hours", appHours);
				String[] otdate = testContextObject.baseTest
						.readJSONdata("overtime-application", "ot-date", overtimeAppGet).replaceAll("\"", "")
						.split("/");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Date",
						otdate[1] + "/" + otdate[0] + "/" + otdate[2]);
				String[] applicationDate = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-date", overtimeAppGet).replaceAll("\"", "")
						.split(" ");
				String[] applicationDate1 = applicationDate[0].split("/");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Application Date",
						applicationDate1[1] + "/" + applicationDate1[0] + "/" + applicationDate1[2]);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OT-Date-OT-Hours",
						otdate[1] + "/" + otdate[0] + "/" + otdate[2] + "-" + appHours);
				String appRemark = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-remark", overtimeAppGet)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", appRemark);
				String appStatus = testContextObject.baseTest
						.readJSONdata("overtime-application", "application-status", overtimeAppGet)
						.replaceAll("\"", "");
				String appOTH = testContextObject.baseTest
						.readJSONdata("overtime-application", "approved-hours", overtimeAppGet).replaceAll("\"", "");

				if (appStatus.equalsIgnoreCase("2")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
							"approved");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved OT-Hours",
							appOTH);

				} else if (appStatus.equalsIgnoreCase("3")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
							"rejected");
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved OT-Hours",
							"NA");

				}
				String vdAte = testContextObject.baseTest
						.readJSONdata("overtime-application", "verdict-date", overtimeAppGet).replaceAll("\"", "");
				String[] vdAteSplit = vdAte.split(" ");
				String[] vdAteSplit1 = vdAteSplit[0].split("/");
				String appRejDt = vdAteSplit1[1] + "/" + vdAteSplit1[0] + "/" + vdAteSplit1[2] + " " + vdAteSplit[1];
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected Date Time",
						appRejDt);

			}
			Thread.sleep(60000);
			break;

		case "Event Authorization":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				testContextObject.pom.abstractMethod().logOut();
				Thread.sleep(1500);
				String valid = testContextObject.pom.loginPO().credential(uName, "admin");
				Assert.assertEquals(valid, "Welcome " + uName.toUpperCase());
				testContextObject.pom.essPO().goToApproveRejectPage("Event Authorization");
				Map<String, String> eventData = testContextObject.pom.essEventAuthorizationPO()
						.getEventAuthForCustomAlert();
				System.out.println(eventData);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "application date-time",
						eventData.get("EventDatetime"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Entry/Exit",
						eventData.get("InOut"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID",
						eventData.get("userid"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username",
						eventData.get("userName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Source/Device/Location",
						eventData.get("Source"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Source Name/Device Name/Location Code-Location Name", eventData.get("SourceDetails"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason",
						eventData.get("Reason"));

			}
			break;

		case "Attendance Exception":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uName = data.get("UserID");
				String url = "get;range=user;id=" + uName
						+ ";Field-name=userid,username,workingshift,processdate,punch1,punch2,FIRSTHALF,SECONDHALF,WORKTIME_HHMM,SUMMARY;format=json;";
				String attDaily = testContextObject.baseTest.getAPI(url, "sa", "admin", "attendance-daily", 200);
				String excep = testContextObject.baseTest.readJSONdata("attendance-daily", "summary", attDaily)
						.replaceAll("\"", "");
				String pDate = testContextObject.baseTest.readJSONdata("attendance-daily", "processdate", attDaily)
						.replaceAll("\"", "");
				String[] punch1 = testContextObject.baseTest.readJSONdata("attendance-daily", "punch1", attDaily)
						.replaceAll("\"", "").split(" ");
				String p1 = testContextObject.pom.abstractMethod().convertedDatetime(punch1[1].substring(0, 5));
				String[] punch2 = testContextObject.baseTest.readJSONdata("attendance-daily", "punch2", attDaily)
						.replaceAll("\"", "").split(" ");
				String p2 = testContextObject.pom.abstractMethod().convertedDatetime(punch2[1].substring(0, 5));
				String firsthalf = testContextObject.baseTest.readJSONdata("attendance-daily", "firsthalf", attDaily)
						.replaceAll("\"", "");
				String uID = testContextObject.baseTest.readJSONdata("attendance-daily", "userid", attDaily)
						.replaceAll("\"", "");
				String uNAME = testContextObject.baseTest.readJSONdata("attendance-daily", "username", attDaily)
						.replaceAll("\"", "");
				String secondhalf = testContextObject.baseTest.readJSONdata("attendance-daily", "secondhalf", attDaily)
						.replaceAll("\"", "");
				String worktime_hhmm = testContextObject.baseTest
						.readJSONdata("attendance-daily", "worktime_hhmm", attDaily).replaceAll("\"", "");
				String workingShift = testContextObject.baseTest
						.readJSONdata("attendance-daily", "workingshift", attDaily).replaceAll("\"", "");
				String urlShift = "get;Shift-id=" + workingShift + ";format=json;";
				String shiftName = testContextObject.baseTest.getAPI(urlShift, "sa", "admin", "shift-details", 200);
				String Shiftname = testContextObject.baseTest.readJSONdata("shift-details", "shift-name", shiftName)
						.replaceAll("\"", "");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Exception", excep);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", pDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "1st Punch",
						p1.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Last Punch",
						p2.toUpperCase());
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "1st Half", firsthalf);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "2nd Half", secondhalf);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Work Duration",
						worktime_hhmm);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Shift", Shiftname);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User ID", uID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", uNAME);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Count",
						String.valueOf(data.size()));
			}
			break;

		case "Worker Approval":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String totalCount = data.get("CreateWorkerTotal");
				String approvalDate = AbstractMethod.dateSelected(data.get("Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Total number of approved Workers", totalCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "approval date",
						approvalDate);

			}
			break;

		case "Worker Assignment":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String totalCount = data.get("WorkerAssignmentTotal");
				String approvalDate = AbstractMethod.dateSelected(data.get("Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Total applications pending for approval", totalCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "request date", approvalDate);

			}
			break;

		case "Missing In Punch - Users":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("userid");
				String missingDate = AbstractMethod.dateSelected(data.get("Date"));
				String time = data.get("time");
				String shiftid = data.get("ShiftID");
				String url = "get;Shift-id=" + shiftid + ";format=json;";
				String shiftDetails = testContextObject.baseTest.getAPI(url, "sa", "admin", "shift-details", 200);
				String shiftstarttime = testContextObject.baseTest
						.readJSONdata("shift-details", "shift-start", shiftDetails).replaceAll("\"", "");
				String addedtime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftstarttime,
						time);
				String perfectShiftTime = testContextObject.pom.abstractMethod().convertedDatetime(addedtime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "time", perfectShiftTime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", missingDate);
				String userurl = "get;id=" + userid + ";format=json;";
				String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
				String username = testContextObject.baseTest.readJSONdata("user", "name", usernamedata).replaceAll("\"",
						"");
				String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
						"");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", username);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + username);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
			}
			break;

		case "Missing Out Punch - Users":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("userid");
				String missingDate = AbstractMethod.dateSelected(data.get("Date"));
				String stime = data.get("starttime");
				String etime = data.get("endtime");
				String shiftid = data.get("ShiftID");
				String url = "get;Shift-id=" + shiftid + ";format=json;";
				String shiftDetails = testContextObject.baseTest.getAPI(url, "sa", "admin", "shift-details", 200);
				String shiftendtime = testContextObject.baseTest
						.readJSONdata("shift-details", "shift-end", shiftDetails).replaceAll("\"", "");
				String addedstarttime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftendtime,
						stime);
				String perfectShiftstartTime = testContextObject.pom.abstractMethod().convertedDatetime(addedstarttime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Start Time",
						perfectShiftstartTime);
				String addedendtime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftendtime,
						etime);
				String perfectShiftEndTime = testContextObject.pom.abstractMethod().convertedDatetime(addedendtime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "End Time",
						perfectShiftEndTime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", missingDate);
				String userurl = "get;id=" + userid + ";format=json;";
				String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
				String username = testContextObject.baseTest.readJSONdata("user", "name", usernamedata).replaceAll("\"",
						"");
				String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
						"");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", username);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + username);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
			}
			break;

		case "Missing In Punch - Group Incharge":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String[] userid = data.get("userid").split(",");
				String missingDate = AbstractMethod.dateSelected(data.get("Date"));
				String time = data.get("time");
				String shiftid = data.get("ShiftID");
				String userCount = data.get("UserCount");
				String url = "get;Shift-id=" + shiftid + ";format=json;";
				String shiftDetails = testContextObject.baseTest.getAPI(url, "sa", "admin", "shift-details", 200);
				String shiftstarttime = testContextObject.baseTest
						.readJSONdata("shift-details", "shift-start", shiftDetails).replaceAll("\"", "");
				String addedtime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftstarttime,
						time);
				String perfectShiftTime = testContextObject.pom.abstractMethod().convertedDatetime(addedtime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "time", perfectShiftTime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", missingDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Count", userCount);
				String dataAc = null;
				for (int i = 0; i < userid.length; i++) {
					String userurl = "get;id=" + userid[i] + ";format=json;";
					String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
					String username = testContextObject.baseTest.readJSONdata("user", "name", usernamedata)
							.replaceAll("\"", "");
					String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
							"");
					String designation_code = testContextObject.baseTest
							.readJSONdata("user", "designation_code", usernamedata).replaceAll("\"", "");
					String designation_name = testContextObject.baseTest
							.readJSONdata("user", "designation-name", usernamedata).replaceAll("\"", "");
					if (dataAc == null) {
						dataAc = "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td><td>" + username + "</td><td>"
								+ designation_code + " - " + designation_name + "</td></tr>";
					} else {
						dataAc = dataAc + "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td><td>" + username
								+ "</td><td>" + designation_code + " - " + designation_name + "</td></tr>";
					}
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Table Data", dataAc);
			}
			break;

		case "Missing Out Punch - Group Incharge":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String[] userid = data.get("userid").split(",");
				String missingDate = AbstractMethod.dateSelected(data.get("Date"));
				String stime = data.get("starttime");
				String etime = data.get("endtime");
				String shiftid = data.get("ShiftID");
				String userCount = data.get("UserCount");
				String url = "get;Shift-id=" + shiftid + ";format=json;";
				String shiftDetails = testContextObject.baseTest.getAPI(url, "sa", "admin", "shift-details", 200);
				String shiftendtime = testContextObject.baseTest
						.readJSONdata("shift-details", "shift-end", shiftDetails).replaceAll("\"", "");
				String addedstarttime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftendtime,
						stime);
				String perfectShiftstartTime = testContextObject.pom.abstractMethod().convertedDatetime(addedstarttime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Start Time",
						perfectShiftstartTime);
				String addedendtime = testContextObject.pom.abstractMethod().convertedHHmmAddedMinites(shiftendtime,
						etime);
				String perfectShiftEndTime = testContextObject.pom.abstractMethod().convertedDatetime(addedendtime)
						.toUpperCase();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "End Time",
						perfectShiftEndTime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", missingDate);

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Count", userCount);
				String dataAc = null;
				for (int i = 0; i < userid.length; i++) {
					String userurl = "get;id=" + userid[i] + ";format=json;";
					String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
					String username = testContextObject.baseTest.readJSONdata("user", "name", usernamedata)
							.replaceAll("\"", "");
					String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
							"");
					String designation_code = testContextObject.baseTest
							.readJSONdata("user", "designation_code", usernamedata).replaceAll("\"", "");
					String designation_name = testContextObject.baseTest
							.readJSONdata("user", "designation-name", usernamedata).replaceAll("\"", "");
					if (dataAc == null) {
						dataAc = "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td><td>" + username + "</td><td>"
								+ designation_code + " - " + designation_name + "</td></tr>";
					} else {
						dataAc = dataAc + "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td><td>" + username
								+ "</td><td>" + designation_code + " - " + designation_name + "</td></tr>";
					}
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Table Data", dataAc);

			}
			break;

		case "New Joining - Confirmation":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String[] userid = data.get("Userid").split(",");
				String days = data.get("days");
				String dataAc = null;
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "no. of confirmations",
						String.valueOf(userid.length));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "no. of confirmation",
						String.valueOf(userid.length)); // for sms, whatsapp
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days", days);
				for (int i = 0; i < userid.length; i++) {
					String userurl = "get;id=" + userid[i] + ";format=json;";
					String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
					String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
							"");
					if (dataAc == null) {
						dataAc = "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td></tr>";
					} else {
						dataAc = dataAc + "<tr><td>" + (i + 1) + "</td><td>" + userID + "</td></tr>";
					}
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Table Data", dataAc);
			}
			break;

		case "Validity/Expiry Date":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("Userid");
				String days = data.get("days");
				String alertGenerateFor = data.get("FieldName");
				String userurl = "get;id=" + userid + ";format=json;";
				String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
				String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
						"");
				String userName = testContextObject.baseTest.readJSONdata("user", "name", usernamedata).replaceAll("\"",
						"");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Userid", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Visa/Driving License/Passport/(Custom Field Name)", alertGenerateFor);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days", days);
			}
			break;

		case "Award/Penalty Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String ricid = data.get("RicUserid");
				String ricurl = "get;id=" + ricid + ";format=json;";
				String ricnamedata = testContextObject.baseTest.getAPI(ricurl, "sa", "admin", "user", 200);
				String ricIID = testContextObject.baseTest.readJSONdata("user", "id", ricnamedata).replaceAll("\"", "");
				String ricNName = testContextObject.baseTest.readJSONdata("user", "name", ricnamedata).replaceAll("\"",
						"");
				Map<String, String> apData = AssignAwardPenaltyHoursPO.assignAPDataForCustom;
				System.out.println(apData);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "RIC Username", ricNName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username",
						apData.get("userName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "attendance date",
						apData.get("ApplcationDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "application date",
						apData.get("ApplicationAppliedOn"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Userid",
						apData.get("userId"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason",
						apData.get("Reason"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "RIC UserID-RIC UserName",
						ricid + "-" + ricNName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						apData.get("userId") + "-" + apData.get("userName"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "RIC Userid", ricid);
				String transaction = "Transaction 1:  | " + apData.get("newTransactionValue");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Transaction", transaction);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "RIC Username- RIC Userid",
						ricNName + "- " + ricid);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username-Userid",
						apData.get("userName") + "-" + apData.get("userId"));
			}
			break;

		case "Schedule Unavailable - Users":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String toDate = AbstractMethod.dateSelected(data.get("RemindPeriod"));
				String fromDate = AbstractMethod.dateSelected("0");
				String setReminder = data.get("SetReminder");
				int numberOfDays = Integer.parseInt(data.get("RemindPeriod")) + 1;
				if (setReminder.equalsIgnoreCase("Everyday")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "From Date", fromDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "To Date", toDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate-ToDate",
							fromDate + "-" + toDate);
					String table = null;
					for (int i = 0; i <= Integer.parseInt(data.get("RemindPeriod")); i++) {
						if (table == null) {
							table = "<br/>" + (i + 1) + ". " + AbstractMethod.dateSelected(String.valueOf(i));
						} else {
							table = table + "<br/>" + (i + 1) + ". " + AbstractMethod.dateSelected(String.valueOf(i));
						}
					}
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", table);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"No. of days having no defined Schedules", String.valueOf(numberOfDays));
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "From Date", fromDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "To Date", toDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", toDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
							"No. of days having no defined Schedules", String.valueOf(numberOfDays));
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate-ToDate",
							fromDate + "-" + toDate);
				}
			}
			break;

		case "Schedule Unavailable - Group Incharge":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String toDate = AbstractMethod.dateSelected(data.get("RemindPeriod"));
				String fromDate = AbstractMethod.dateSelected("0");
				String user = data.get("User");
				String userCount = data.get("UserCount");
				String userurl = "get;id=" + user + ";format=json;";
				String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
				String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
						"");
				String userName = testContextObject.baseTest.readJSONdata("user", "name", usernamedata).replaceAll("\"",
						"");
				String setReminder = data.get("SetReminder");
				String createTable = null;
				if (setReminder.equalsIgnoreCase("Everyday")) {
					for (int i = 0; i <= Integer.parseInt(data.get("RemindPeriod")); i++) {
						if (createTable == null) {
							createTable = "<tr><td rowspan='1' valign='top'>" + (i + 1)
									+ "</td><td rowspan='1' valign='top'>"
									+ AbstractMethod.dateSelected(String.valueOf(i)) + "</td><td>" + userID
									+ "</td><td>" + userName + "</td></tr>";
						} else {
							createTable = createTable + "<tr><td rowspan='1' valign='top'>" + (i + 1)
									+ "</td><td rowspan='1' valign='top'>"
									+ AbstractMethod.dateSelected(String.valueOf(i)) + "</td><td>" + userID
									+ "</td><td>" + userName + "</td></tr>";
						}
					}
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", createTable);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", toDate);
					createTable = "<tr><td rowspan='1' valign='top' >" + 1 + "</td><td rowspan='1' valign='top'>"
							+ toDate + "</td><td>" + userID + "</td><td>" + userName + "</td></tr>";
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", createTable);

				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "From Date", fromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "To Date", toDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Count", userCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "user Count", userCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate-ToDate",
						fromDate + "-" + toDate);
			}
			break;

		case "Schedule Modified":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String toDate = AbstractMethod.dateSelected(data.get("Date"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Schedule Date", toDate);
			}
			break;

		case "Password Generated":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String user = data.get("Userid");
				String mail = data.get("Mail");
				String userurl = "get;id=" + user + ";format=json;";
				String usernamedata = testContextObject.baseTest.getAPI(userurl, "sa", "admin", "user", 200);
				String userID = testContextObject.baseTest.readJSONdata("user", "id", usernamedata).replaceAll("\"",
						"");
				String userName = testContextObject.baseTest.readJSONdata("user", "name", usernamedata).replaceAll("\"",
						"");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "user name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "user id", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "dd/mm/yyyy",
						AbstractMethod.dateSelected("0"));

				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "code",
						mailTextContaint[0].trim());

			}
			break;

		case "OTP Generated":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String mail = data.get("Mail");
				String action12 = data.get("action");
				System.out.println(action12);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"To complete the required action", action12);
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "code",
						mailTextContaint[0].trim());

			}
			break;

		case "Identification Server Inactive":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				Thread.sleep(90000);
				String mail = data.get("Mail");
				String tolerancePeriod = data.get("Tolerance Period");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Tolerance Period",
						tolerancePeriod);
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split("Disconnected on");
				String[] mailTextContaintSpl = mailTextContaint[1].split("since 0 minutes");
				System.out.println(mailTextContaintSpl[0].trim());
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DateTime",
						mailTextContaintSpl[0].trim());
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToIdentificationServerConfiguration();
				Map<String, String> idsData = testContextObject.pom.identificationServerConfigurationPO()
						.getIDS1stDataGetForCustomAlert();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Identification Server ID",
						idsData.get("id"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Identification Server Name",
						idsData.get("name"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Identification Server ID-Identification Server Name",
						idsData.get("id") + "-" + idsData.get("name"));
				testContextObject.pom.adminPO().homeButtonClick();
			}
			break;

		case "APTA Auto Sign-In Configuration":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String android = data.get("android");
				String ios = data.get("ios");
				if (testContextObject.baseTest.checkProduct().toLowerCase().equalsIgnoreCase("evertect")) {
					android = android.replace("matrix", "EVERIT");
					ios = ios.replace("cosec", "EVERTECT");
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Android App Link", android);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "iOS App Link", ios);
			}
			break;

		case "Login Account Locked":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String account = data.get("Account");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "System/ESS/CSS", account);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "iUnlock my Account", "");
			}
			break;

		case "Self-Enrollment Notification":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("userid");
				String ricurl = "get;id=" + userid + ";format=json;";
				String ricnamedata = testContextObject.baseTest.getAPI(ricurl, "sa", "admin", "user", 200);
				System.out.println(ricnamedata);
				String usrID = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(ricnamedata, "user.id")
						.replaceAll("\"", "");
				String usrName = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(ricnamedata, "user.name")
						.replaceAll("\"", "");
				String pinNumber = testContextObject.pom.abstractMethod().getOneAPIParmeterVal(ricnamedata, "user.pin")
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", usrID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", usrName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "PIN number", pinNumber);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						usrID + "-" + usrName);

			}
			break;

		case "Happy Birthday COS_14":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("userid");
				String ricurl = "get;id=" + userid + ";format=json;";
				String ricnamedata = testContextObject.baseTest.getAPI(ricurl, "sa", "admin", "user", 200);
				String organizationName = testContextObject.baseTest
						.readJSONdata("user", "organization-name", ricnamedata).replaceAll("\"", "");
				String usrID = testContextObject.baseTest.readJSONdata("user", "id", ricnamedata).replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "OrganizationName",
						organizationName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "userid", usrID);

			}
			break;

		case "Health Declaration Pending":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String[] useridarray = data.get("userid").split(",");
				String date = AbstractMethod.dateSelected(data.get("date"));
				String reciever = data.get("Reciever");
				String mail = data.get("mail");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Date", date);
				if (reciever.equalsIgnoreCase("ESS")) {
					testContextObject.pom.homePO().goTOAdminModule();
					testContextObject.pom.adminPO().goToAlertView();
					String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
							.split(".Click");
					String[] mailTextContaintSpl = mailTextContaint[1].split("for self-declaration");
					System.out.println(mailTextContaintSpl[0].trim());
					testContextObject.pom.adminPO().homeButtonClick();
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Link",
							mailTextContaintSpl[0].trim());
					String[] mailTextContaintSp2 = mailTextContaint[0].split("till");
					System.out.println(mailTextContaintSp2[1].trim());
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Time",
							mailTextContaintSp2[1].trim().replace(".", ""));

				} else {
					String table = null;
					for (int i = 0; i < useridarray.length; i++) {
						String ricurl = "get;id=" + useridarray[i] + ";format=json;";
						String ricnamedata = testContextObject.baseTest.getAPI(ricurl, "sa", "admin", "user", 200);
						String usrID = testContextObject.baseTest.readJSONdata("user", "id", ricnamedata)
								.replaceAll("\"", "");
						String usrName = testContextObject.baseTest.readJSONdata("user", "name", ricnamedata)
								.replaceAll("\"", "");
						if (table == null) {
							table = "<tr><td>" + (i + 1) + "</td><td>" + usrID + "</td><td>" + usrName + "</td></tr>";
						} else {
							table = table + "<tr><td>" + (i + 1) + "</td><td>" + usrID + "</td><td>" + usrName
									+ "</td></tr>";
						}
					}
					testContextObject.pom.homePO().goTOAdminModule();
					testContextObject.pom.adminPO().goToAlertView();
					String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
							.split("till");
					String[] mailTextContaintSpl = mailTextContaint[1].split(":");
					System.out.println(mailTextContaintSpl[0].trim());
					testContextObject.pom.adminPO().homeButtonClick();
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Time",
							mailTextContaintSpl[0].trim() + ":" + mailTextContaintSpl[1].trim());
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", table);
				}

			}
			Thread.sleep(30000);
			break;

		case "Contractor Validity":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String contypeID = data.get("ContractorTypeID");
				String contractorID = data.get("ContractorID");
				String contractorCount = data.get("ContractorCount");
				String validityEndDate = AbstractMethod
						.staticDateOrPlusMinusFromCurrentDate(data.get("ValidityEndDate"));
				String daysRemainig = data.get("DaysRemaining");

				String tabledata = "<tr><td style='padding: 2px' align='center'>1</td><td style='padding:2px' align='center'>"
						+ contypeID + "</td><td style='padding:2px' align='center'>" + contractorID
						+ "</td><td style='padding:2px' align='center'>" + contractorID
						+ "</td><td style='padding:2px' align='center'>" + validityEndDate
						+ "</td><td style='padding:2px' align='center'>" + daysRemainig + "</td></tr>";
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", tabledata);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days", daysRemainig);
				if (contractorCount != null) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Contractor Count",
							contractorCount);
				}
			}
			break;

		case "Work Order Expiry":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String workOrderEndDate = AbstractMethod
						.staticDateOrPlusMinusFromCurrentDate(data.get("WorkOrderEndDate"));
				String workOrderID = data.get("WorkOrderID");
				String workOrderName = data.get("WorkOrderName");
				String setReminder = data.get("SetReminder");

				String tabledata = "<tr><td>1</td><td>" + workOrderEndDate + "</td><td>" + workOrderID + "</td><td>"
						+ workOrderName + "</td></tr>";
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", tabledata);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Set Reminder", setReminder);
			}
			break;

		case "Worker Induction":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String applicationDate = AbstractMethod
						.staticDateOrPlusMinusFromCurrentDate(data.get("ApplicationDate"));
				String contractorID = data.get("ContractorID");
				String contractorName = data.get("ContractorName");
				String workerName = data.get("WorkerName");
				String assignedWorkOrder = data.get("AssignedWorkOrder");
				String inductionLevel = data.get("InductionLevel");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Application Date",
						applicationDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Contractor ID",
						contractorID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Contractor Name",
						contractorName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Worker Name", workerName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Assigned Work Order",
						assignedWorkOrder);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Induction Level",
						inductionLevel);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ContractorID-ContractorName",
						contractorID + "-" + contractorName);
			}
			break;

		case "Worker Induction Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String applicationDate = AbstractMethod
						.staticDateOrPlusMinusFromCurrentDate(data.get("ApplicationDate"));
				String workerName = data.get("WorkerName");
				String assignedWorkOrder = data.get("AssignedWorkOrder");
				String approvedRejected = data.get("ApprovedRejected");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Application date",
						applicationDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Worker Name", workerName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Assigned Work Order",
						assignedWorkOrder);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						approvedRejected);
			}
			break;

		case "CSS Account Enable":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String contractorID = data.get("ContractorID");
				String mail = data.get("Mail");
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				testContextObject.pom.adminPO().homeButtonClick();
				int le=(mailTextContaint.length)-1;
				System.out.println(mailTextContaint[le]);
				System.out.println(mailTextContaint[le].substring(0, mailTextContaint[le].length()-1));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ContractorID", contractorID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Login Page link", mailTextContaint[le].substring(0, mailTextContaint[le].length()-1));

			}
			break;

		case "Contractor Details Alert":

			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String validityEndDate = AbstractMethod
						.staticDateOrPlusMinusFromCurrentDate(data.get("ValidityEndDate"));
				String contractorID = data.get("ContractorID");
				String contractorName = data.get("ContractorName");
				String fieldName = data.get("FieldName");
				String daysRemaining = data.get("DaysRemaining");
				String userID = data.get("UserID");
				String receiver = data.get("Receiver");
				String tabledata = null;
				if (receiver.equalsIgnoreCase("ESS")) {
					tabledata = "<tr><td style='padding: 2px' align='center'>1</td><td style='padding:2px' align='center'>"
							+ contractorID + "</td><td style='padding:2px' align='center'>" + contractorName
							+ "</td><td style='padding:2px' align='center'>" + fieldName
							+ "</td><td style='padding:2px' align='center'>" + validityEndDate
							+ "</td><td style='padding:2px' align='center'>" + daysRemaining + "</td></tr>";
				} else if (receiver.equalsIgnoreCase("Contractor")) {
					tabledata = "<tr><td style='padding: 2px' align='center'>1</td><td style='padding:2px' align='center'>"
							+ fieldName + "</td><td style='padding:2px' align='center'>" + validityEndDate
							+ "</td><td style='padding:2px' align='center'>" + daysRemaining + "</td></tr>";
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "table", tabledata);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ContractorName",
						contractorName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Contractor Count",
						data.get("ContractorCount"));
			}
			break;

		case "User Events":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userName = data.get("UserName");
				String userID = data.get("UserID");
				String entryExit = data.get("EntryExit");
				String mail = data.get("Mail");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Entry/Exit", entryExit);

				// Get Event date time
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				String eDatetTime = mailTextContaint[mailTextContaint.length - 3] + " "
						+ mailTextContaint[mailTextContaint.length - 2] + " "
						+ mailTextContaint[mailTextContaint.length - 1];
				// System.out.println(eDatetTime);
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DateTime", eDatetTime);

				// Get door name
				// select Name from Mx_SDCCfg where IPAddress='191.168.11.65'
				String globalPropertiesFilePath = System.getProperty("user.dir")
						+ "\\src\\test\\resources\\global.properties";
				FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
				prop = new Properties();
				prop.load(fis);
				String deviceurl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
						: prop.getProperty("deviceurl");
				String ipAddress = deviceurl.split("//")[deviceurl.split("//").length - 1];
				// System.out.println(ipAddress);
				String databaseFetchingQuery = "select Name from Mx_SDCCfg where UPPER(IPAddress)=UPPER('" + ipAddress
						+ "')";
				String doorName = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DoorName", doorName);

			}
			break;

		case "User Allowed":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userName = data.get("UserName");
				String userID = data.get("UserID");
				String entryExit = data.get("EntryExit");
				String mail = data.get("Mail");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User ID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName-User ID",
						userName + "-" + userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Entry/Exit", entryExit);

				// Get Event date time
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				String eDatetTime = mailTextContaint[mailTextContaint.length - 3] + " "
						+ mailTextContaint[mailTextContaint.length - 2] + " "
						+ mailTextContaint[mailTextContaint.length - 1];
				System.out.println(eDatetTime);
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DateTime", eDatetTime);

				// Get door name
				// select Name from Mx_SDCCfg where IPAddress='191.168.11.65'
				String globalPropertiesFilePath = System.getProperty("user.dir")
						+ "\\src\\test\\resources\\global.properties";
				FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
				prop = new Properties();
				prop.load(fis);
				String deviceurl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
						: prop.getProperty("deviceurl");
				String ipAddress = deviceurl.split("//")[deviceurl.split("//").length - 1];
				System.out.println(ipAddress);
				String databaseFetchingQuery = "select Name from Mx_SDCCfg where UPPER(IPAddress)=UPPER('" + ipAddress
						+ "')";
				String doorName = testContextObject.baseTest.getDataFDatabase(databaseFetchingQuery);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "DoorName", doorName);

			}
			break;

		case "Invite User":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String mail = data.get("Email");
				String expiryDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("ExpiryDate"));
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expiry Date", expiryDate);

				// Get Organization name
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToEnterpriseProfilePage();
				String companyName = testContextObject.pom.enterpriseProfilePO().getCompanyName();
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Company Name", companyName);

				// Get Link
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String link = testContextObject.pom.alertViewPO().getLinkFromAlertView(mail);
				testContextObject.pom.adminPO().homeButtonClick();
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Link", link);

			}
			break;

		case "Leave Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveType = data.get("LeaveType");
				String hourlyStartTime = data.get("HourlyStartTime");
				String hourlyEndTime = data.get("HourlyEndTime");
				String appliedDaysH = null;
				String postedDaysH = null;
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationGetData).replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationGetData).replaceAll("\"", "");
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate[2].split(" ")[0];
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationGetData).replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					appliedDaysH = testContextObject.baseTest
							.readJSONdata("leave-application", "applied-hours", leaveApplicationGetData)
							.replaceAll("\"", "");
				} else {
					String[] appliedDaysH1 = testContextObject.baseTest
							.readJSONdata("leave-application", "applied-days", leaveApplicationGetData)
							.replaceAll("\"", "").split("\\.");
					appliedDaysH = appliedDaysH1[0];
				}
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					postedDaysH = testContextObject.baseTest
							.readJSONdata("leave-application", "posted-hours", leaveApplicationGetData)
							.replaceAll("\"", "");
				} else {
					String[] postedDaysH1 = testContextObject.baseTest
							.readJSONdata("leave-application", "posted-days", leaveApplicationGetData)
							.replaceAll("\"", "").split("\\.");
					postedDaysH = postedDaysH1[0];
				}
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "application-reason", leaveApplicationGetData)
						.replaceAll("\"", "");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User NAME", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
							properFromDate + " " + hourlyStartTime);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
							properEndDate + " " + hourlyEndTime);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
							properFromDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
							properEndDate);
				}

				if (leaveType.equalsIgnoreCase("Compensatory Off")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours",
							 daysHours);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				}
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
							appliedDaysH + " hours");
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
							appliedDaysH + " days");
				}
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
							postedDaysH + " hours");
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
							postedDaysH + " days");
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-User Name",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
			}
			break;
		case "Leave Approval":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveType = data.get("LeaveType");
				String hourlyStartTime = data.get("HourlyStartTime");
				String hourlyEndTime = data.get("HourlyEndTime");
				String appliedDaysH = null;
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlgetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlgetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlgetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlgetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approveDate = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlgetData)
						.replaceAll("\"", "").split("/");
				String[] approvedDate1 = approveDate[2].split(" ");
				String properApproveDate = approveDate[1] + "/" + approveDate[0] + "/" + approvedDate1[0];
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					appliedDaysH = testContextObject.baseTest
							.readJSONdata("leave-application", "applied-hours", leaveApplicationUrlgetData)
							.replaceAll("\"", "");
				} else {
					appliedDaysH = testContextObject.baseTest
							.readJSONdata("leave-application", "applied-days", leaveApplicationUrlgetData)
							.replaceAll("\"", "");
				}
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "application-remark", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				if (leaveType.equalsIgnoreCase("Hourly Paid Leave")
						|| leaveType.equalsIgnoreCase("Hourly Unpaid Leave")) {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
							properFromDate + " " + hourlyStartTime);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
							properEndDate + " " + hourlyEndTime);
				} else {
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
							properFromDate);
					testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
							properEndDate);
				}
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved DateTime",
						properApproveDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Applied",
						appliedDaysH + "/" + appliedDaysH);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days/hours",
						" " + daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
			}
			break;

		case "Leave Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] rejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] rejectedDateTime1 = rejectedDatetime[2].split(" ");
				String properRejectedDatetime = rejectedDatetime[1] + "/" + rejectedDatetime[0] + "/"
						+ rejectedDateTime1[0];
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "application-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Rejected DateTime",
						properRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days/hours",
						" " + daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
			}
			break;
		case "Leave Cancellation Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] appliedDate1 = appliedDate[2].split(" ");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate1[0];
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String postedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "posted-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] postedDuration = postedDaysH.split("\\.");
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-reason", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
						postedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
			}
			break;
		case "Leave Cancellation Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String approvedRejected = data.get("ApprovedRejected");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedDatetime[2];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						approvedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code-Leave Name",
						leaveCode + "-" + leaveName);
			}
			break;

		case "Leave Modification Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String fromDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
				String endDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] appliedDate1 = appliedDate[2].split(" ");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate1[0];
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedFromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properModifiedFromDate = modifiedFromDate[1] + "/" + modifiedFromDate[0] + "/"
						+ modifiedFromDate[2];
				String[] modifiedEndDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-end-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properModifiedEndDate = modifiedEndDate[1] + "/" + modifiedEndDate[0] + "/" + modifiedEndDate[2];
				String modifiedAppliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedAppliedDuration = modifiedAppliedDaysH.split("\\.");
				String modifiedPostedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-posted-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedPostedDuration = modifiedPostedDaysH.split("\\.");
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-reason", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modificationApplicationDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] modificationAppliedYear = modificationApplicationDate[2].split(" ");
				String properModificationApplicationDate = modificationApplicationDate[1] + "/"
						+ modificationApplicationDate[0] + "/" + modificationAppliedYear[0];

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour", leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						fromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime", endDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Modified FromDate/FromDateTime", properModifiedFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified ToDate/ToDateTime",
						properModifiedEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified Applied Days/Hours",
						modifiedAppliedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified Posted Days/Hours",
						modifiedPostedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"modification application date", properModificationApplicationDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
						modifiedPostedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-Username",
						userID + "-" + userName);
			}
			break;
		case "Leave Modification Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String approvedRejected = data.get("ApprovedRejected");
				String fromDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
				String endDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] approvedRejectedYear = approvedRejectedDatetime[2].split(" ");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedYear[0];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour", leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leavename", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						fromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime", endDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						approvedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code-Leavename",
						leaveCode + " - " + leaveName);
			}
			break;
		case "Leave Credit/Debit":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String daysHours = data.get("DaysHours");
				String creditDebit = data.get("CreditedDebited");
				String creditDebit2 = data.get("CreditedDebited2");
				String month = testContextObject.pom.abstractMethod()
						.staticMonthOrPlusMinusMonthFromCurrentMonth(data.get("Month")).substring(0, 3);
				String year = testContextObject.pom.abstractMethod()
						.staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(data.get("Year"));
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-balance", 200);
				String creditDebitDaysHours[] = null;
				if (creditDebit.equalsIgnoreCase("Credited to")) {
					creditDebitDaysHours = testContextObject.baseTest
							.readJSONdata("leave-balance", "credit", leaveApplicationUrlGetData).replaceAll("\"", "")
							.split("\\.");
				} else {
					creditDebitDaysHours = testContextObject.baseTest
							.readJSONdata("leave-balance", "debit", leaveApplicationUrlGetData).replaceAll("\"", "")
							.split("\\.");
				}
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-balance", "leave-name", leaveApplicationUrlGetData).replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-balance", "leave-code", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userId = testContextObject.baseTest
						.readJSONdata("leave-balance", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-balance", "user-name", leaveApplicationUrlGetData).replaceAll("\"", "");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "No. of Days/Hours",
						creditDebitDaysHours[0]);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days/hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Credited to/Debited from",
						creditDebit);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "leave ID", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "LeaveID-LeaveName",
						leaveCode + "-" + leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "leave ID-Leave Name",
						leaveCode + "-" + leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Credited/Debited",
						creditDebit2);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Month-Year",
						month + "-" + year);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User id", userId);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username-User id",
						userName + "-" + userId);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userId + "-" + userName);
			}
			break;

		case "Leave Status Update":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String previousapprovedRejected = data.get("PreviousApprovedRejected");
				String currentapprovedRejected = data.get("CurrentApprovedRejected");
				// String approvedRejectedSplit[] = approvedRejected.split(",");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] approvedRejectedYear = approvedRejectedDatetime[2].split(" ");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedYear[0];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Previous Approved/Rejected",
						previousapprovedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Current Approved/Rejected",
						currentapprovedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
			}
			break;
		case "Tour Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String appliedDaysH = null;
				String postedDaysH = null;
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationGetData).replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationGetData).replaceAll("\"", "");
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate[2].split(" ")[0];
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationGetData).replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] appliedDaysH1 = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationGetData).replaceAll("\"", "")
						.split("\\.");
				appliedDaysH = appliedDaysH1[0];
				String[] postedDaysH1 = testContextObject.baseTest
						.readJSONdata("leave-application", "posted-days", leaveApplicationGetData).replaceAll("\"", "")
						.split("\\.");
				postedDaysH = postedDaysH1[0];
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "application-reason", leaveApplicationGetData)
						.replaceAll("\"", "");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User NAME", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
						postedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-User Name",
						userID + "-" + userName);
			}
			break;
		case "Tour Approval":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String appliedDaysH = null;
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlgetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlgetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlgetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlgetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approveDate = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlgetData)
						.replaceAll("\"", "").split("/");
				String[] approvedDate1 = approveDate[2].split(" ");
				String properApproveDate = approveDate[1] + "/" + approveDate[0] + "/" + approvedDate1[0];
				appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "application-remark", leaveApplicationUrlgetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved DateTime",
						properApproveDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Applied",
						appliedDaysH + "/" + appliedDaysH);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days/hours",
						" " + daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
			}
			break;

		case "Tour Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] rejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] rejectedDateTime1 = rejectedDatetime[2].split(" ");
				String properRejectedDatetime = rejectedDatetime[1] + "/" + rejectedDatetime[0] + "/"
						+ rejectedDateTime1[0];
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "application-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Rejected DateTime",
						properRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "days/hours",
						" " + daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
			}
			break;

		case "Tour Cancellation Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] appliedDate1 = appliedDate[2].split(" ");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate1[0];
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String postedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "posted-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] postedDuration = postedDaysH.split("\\.");
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-reason", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
						postedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
			}
			break;
		case "Tour Cancellation Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String approvedRejected = data.get("ApprovedRejected");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedDatetime[2];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "cancellation-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						approvedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code-Leave Name",
						leaveCode + "-" + leaveName);

			}
			break;

		case "Tour Modification Application":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String daysHours = data.get("DaysHours");
				String fromDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
				String endDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String[] appliedDate = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] appliedDate1 = appliedDate[2].split(" ");
				String properAppliedDate = appliedDate[1] + "/" + appliedDate[0] + "/" + appliedDate1[0];
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String appliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedFromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properModifiedFromDate = modifiedFromDate[1] + "/" + modifiedFromDate[0] + "/"
						+ modifiedFromDate[2];
				String[] modifiedEndDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-end-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properModifiedEndDate = modifiedEndDate[1] + "/" + modifiedEndDate[0] + "/" + modifiedEndDate[2];
				String modifiedAppliedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-applied-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedAppliedDuration = modifiedAppliedDaysH.split("\\.");
				String modifiedPostedDaysH = testContextObject.baseTest
						.readJSONdata("leave-application", "modified-posted-days", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modifiedPostedDuration = modifiedPostedDaysH.split("\\.");
				String reason = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-reason", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] modificationApplicationDate = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-applied-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] modificationAppliedYear = modificationApplicationDate[2].split(" ");
				String properModificationApplicationDate = modificationApplicationDate[1] + "/"
						+ modificationApplicationDate[0] + "/" + modificationAppliedYear[0];

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour", leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Date",
						properAppliedDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave Name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						fromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime", endDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Days/Hours", daysHours);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Applied Days/Hours",
						appliedDaysH + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"Modified FromDate/FromDateTime", properModifiedFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified ToDate/ToDateTime",
						properModifiedEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified Applied Days/Hours",
						modifiedAppliedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Modified Posted Days/Hours",
						modifiedPostedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Reason", reason);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"modification application date", properModificationApplicationDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Posted Days/Hours",
						modifiedPostedDuration[0] + " days");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-Username",
						userID + "-" + userName);
			}
			break;
		case "Tour Modification Approval/Rejection":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String approvedRejected = data.get("ApprovedRejected");
				String fromDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
				String endDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String userID = testContextObject.baseTest
						.readJSONdata("leave-application", "user-id", leaveApplicationUrlGetData).replaceAll("\"", "");
				String userName = testContextObject.baseTest
						.readJSONdata("leave-application", "user-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String leaveCode = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-code", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] approvedRejectedYear = approvedRejectedDatetime[2].split(" ");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedYear[0];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "modification-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour", leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code", leaveCode);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leavename", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						fromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime", endDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Approved/Rejected",
						approvedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave code-Leavename",
						leaveCode + " - " + leaveName);
			}
			break;
		case "Tour Status Update":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String uid = data.get("UserID");
				String leaveTourCOFF = data.get("LeaveTourCOFF");
				String previousapprovedRejected = data.get("PreviousApprovedRejected");
				String currentapprovedRejected = data.get("CurrentApprovedRejected");
				// String approvedRejectedSplit[] = approvedRejected.split(",");
				String leaveApplicationUrl = "get;userid=" + uid + ";format=json;";
				String leaveApplicationUrlGetData = testContextObject.baseTest.getAPI(leaveApplicationUrl, uid, "admin",
						"leave-application", 200);
				String leaveName = testContextObject.baseTest
						.readJSONdata("leave-application", "leave-name", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				String[] fromDate = testContextObject.baseTest
						.readJSONdata("leave-application", "start-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String properFromDate = fromDate[1] + "/" + fromDate[0] + "/" + fromDate[2];
				String[] endDate = testContextObject.baseTest
						.readJSONdata("leave-application", "end-date", leaveApplicationUrlGetData).replaceAll("\"", "")
						.split("/");
				String properEndDate = endDate[1] + "/" + endDate[0] + "/" + endDate[2];
				String[] approvedRejectedDatetime = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-verdict-date", leaveApplicationUrlGetData)
						.replaceAll("\"", "").split("/");
				String[] approvedRejectedYear = approvedRejectedDatetime[2].split(" ");
				String properApprovedRejectedDatetime = approvedRejectedDatetime[1] + "/" + approvedRejectedDatetime[0]
						+ "/" + approvedRejectedYear[0];
				String remark = testContextObject.baseTest
						.readJSONdata("leave-application", "final-ric-remark", leaveApplicationUrlGetData)
						.replaceAll("\"", "");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Previous Approved/Rejected",
						previousapprovedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Current Approved/Rejected",
						currentapprovedRejected);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave/Tour/C-OFF Leave",
						leaveTourCOFF);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Leave name", leaveName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "FromDate/FromDateTime",
						properFromDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "ToDate/ToDateTime",
						properEndDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "status DateTime",
						properApprovedRejectedDatetime);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Remark", remark);
			}
			break;

		case "User Onboarding - On Submit":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userName = data.get("UserName");
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "User Name", userName);
			}
			break;

		case "User Onboarding - Schedule Time":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String submitCount = data.get("SubmitCount");
				String expiryCount = data.get("ExpiryCount");
				String submittedUserName = data.get("SubmittedUserName");
				String submitDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("SubmitDate"));
				String expiredUserName = data.get("ExpiredUserName");
				String expiryDate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("ExpiryDate"));

				// Update Expiry and request date in DB
				DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
				DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
				LocalDate localDate = LocalDate.parse(expiryDate, inputFormatter);
				LocalDateTime localDateTime = localDate.atStartOfDay();
				String expiryDateDBformat = localDateTime.format(outputFormatter);

				String requestDate = String.valueOf(Integer.parseInt(data.get("ExpiryDate")) - 1);
				String requestDate1 = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(requestDate);
				LocalDate localDate1 = LocalDate.parse(requestDate1, inputFormatter);
				LocalDateTime localDateTime1 = localDate1.atStartOfDay();
				String requestDateDBformat = localDateTime1.format(outputFormatter);
				String query = "update Mx_InviteUser set RequestDateTime='" + requestDateDBformat
						+ "', LinkExpiredDateTime='" + expiryDateDBformat + "' where UPPER(Name)='" + expiredUserName
						+ "';";

				System.out.println(query);
				testContextObject.baseTest.updateORDeleteDatabase(query);
				String[] submitDates=submitDate.split("\\/");
				String revesr=submitDates[2]+"-"+submitDates[1]+"-"+submitDates[0];
				
				String query1 = "update Mx_InviteUser set DetailsSubmittedDateTime='" + revesr
						+ "' where UPPER(Name)='" + submittedUserName
						+ "';";
				System.out.println(query1);
				testContextObject.baseTest.updateORDeleteDatabase(query1);

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Submit Count", submitCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expiry Count", expiryCount);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Submitted User Name",
						submittedUserName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Submit Date", submitDate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expired User Name",
						expiredUserName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Expiry Date", expiryDate);
			}
			Thread.sleep(60000);
			break;

		case "User Access - QR Credential":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userID = data.get("UserID");
				String userName = data.get("UserName");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID", userID);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserName", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "UserID-UserName",
						userID + "-" + userName);
			}
			break;

		case "Exceeding Health Declaration Parameters":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String userid = data.get("Userid");
				String userName = data.get("Username");
				String temperature = data.get("Temperature");
				String temperatureSms = data.get("Temperature").replaceAll(" &deg;", " ");
				String temperatureWp = data.get("Temperature").replaceAll(" &deg;", " °");
				String symptoms = data.get("Symptoms");

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Userid", userid);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Username", userName);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Temperature", temperature);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "TemperatureSms",
						temperatureSms);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "TemperatureWp",
						temperatureWp);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Symptoms", symptoms);
			}
			break;

		case "Database Backup":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String mail = data.get("Mail");
				String pdate = testContextObject.pom.abstractMethod()
						.staticDateOrPlusMinusFromCurrentDate(data.get("ProcessDate"));

				// Get
				testContextObject.pom.homePO().goTOAdminModule();
				testContextObject.pom.adminPO().goToAlertView();
				String[] mailTextContaint = testContextObject.pom.alertViewPO().getUserEmailPasswordForCustom(mail)
						.split(" ");
				String status = mailTextContaint[9];
				System.out.println(status);
				String processTime = mailTextContaint[mailTextContaint.length - 1];
				System.out.println(processTime);
				testContextObject.pom.adminPO().homeButtonClick();

				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "process run date", pdate);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string, "Successfully/With Error",
						status);
				testContextObject.pom.abstractMethod().readwriteJSONdata("write", string,
						"process completion time hh:mm", processTime);
			}
			break;

		default:
			break;
		}
		Thread.sleep(150000);
	}

	@Then("Validate Alert Containt")
	public void validate_alert_containt(io.cucumber.datatable.DataTable dataTable) throws Exception {
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String alertType = data.get("AlertType");
			String alertEvent = data.get("AlertEvent");
			String mailRecieveTo = data.get("MailRecieveTo");
			logger.info("1st I am in Validate");
			// given below code for Mail
			Map<String, String> finalData = testContextObject.baseTest.getExpectedAndActualData(alertEvent, alertType,
					mailRecieveTo);
			String expectedR = finalData.get("ExpectedResult");
			System.out.println(expectedR);
			Map<Object, List<Map<String, String>>> jsonD = testContextObject.baseTest.getJSONDataForCustomAlert(
					System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\AlertData.json");
			Map<String, String> jsonDataKey = jsonD.get(alertEvent).get(0);
			for (String keyV : jsonDataKey.keySet()) {
				String findKey = "[" + keyV + "]";
				expectedR = expectedR.replace(findKey, jsonDataKey.get(keyV));
			}
			if (expectedR.contains("href")) {
				expectedR = expectedR.replaceAll("href='[^\"]+'", "");
			}
			String actualResult = finalData.get("ActualResult");
			Thread.sleep(1000);
			if (actualResult.contains("href")) {
				actualResult = actualResult.replaceAll("href='[^\"]+'", "");
			}
			if (testContextObject.baseTest.checkProduct().equalsIgnoreCase("COSEC")) {
				logger.info("Email Alert Expected result:" + expectedR);
				logger.info("Email Alert Actual result:" + actualResult);
//				System.out.println("Alert Expected result:" + expectedR);
//				System.out.println("Alert actualResult result:" + actualResult);
			} else {
				if (expectedR.toLowerCase().contains(("cosec").toLowerCase())) {
					expectedR = expectedR.replaceAll("COSEC", "EVERTECT");
					// expectedR = expectedR.replaceAll("cosec", "evertect");
					logger.info("Email Alert Expected result:" + expectedR);
					logger.info("Email Alert Actual result:" + actualResult);
//					System.out.println("Alert Expected result:" + expectedR);
//					System.out.println("Alert actualResult result:" + actualResult);
				}
			}

			Assert.assertEquals(actualResult.trim(), expectedR.trim());
			Thread.sleep(10000);
			logger.info("Email Alert validate successfully");
			// System.out.println("Email Alert validate successfully");

			// Given Below Code for SMS
			Map<String, String> smsfinalData = testContextObject.baseTest.getSMSExpectedAndActualData(alertEvent,
					alertType, mailRecieveTo);
			String smsexpectedR = smsfinalData.get("ExpectedResult");
			for (String keyV : jsonDataKey.keySet()) {
				String findKey = "[" + keyV + "]";
				smsexpectedR = smsexpectedR.replace(findKey, jsonDataKey.get(keyV));
			}
			if (smsexpectedR.contains("href")) {
				smsexpectedR = smsexpectedR.replaceAll("href='[^\"]+'", "");
			}
			String smsactualResult = smsfinalData.get("ActualResult");
			if (smsactualResult.contains("href")) {
				smsactualResult = smsactualResult.replaceAll("href='[^\"]+'", "");
			}
			if (testContextObject.baseTest.checkProduct().equalsIgnoreCase("COSEC")) {
				logger.info("SMS Alert Expected result:" + smsexpectedR);
				logger.info("SMS Alert Actual result:" + smsactualResult);
//				System.out.println("SMS Alert Expected result:" + smsexpectedR);
//				System.out.println("SMS Alert actualResult result:" + smsactualResult);
			} else {
				if (smsexpectedR.toLowerCase().contains(("cosec").toLowerCase())) {
					smsexpectedR = smsexpectedR.replaceAll("COSEC", "EVERTECT");
					// expectedR = expectedR.replaceAll("cosec", "evertect");
				}
				logger.info("SMS Alert Expected result:" + smsexpectedR);
				logger.info("SMS Alert Actual result:" + smsactualResult);
			}

			Assert.assertEquals(smsactualResult.trim(), smsexpectedR.trim());
			logger.info("SMS Alert validate successfully");
			// System.out.println("SMS Alert validate successfully");

			// Given Below Code for Whats App
			Map<String, String> wsfinalData = testContextObject.baseTest.getWhatsAPPExpectedAndActualData(alertEvent,
					alertType, mailRecieveTo);
			String wsexpectedR = wsfinalData.get("ExpectedResult");
			for (String keyV : jsonDataKey.keySet()) {
				String findKey = "[" + keyV + "]";
				wsexpectedR = wsexpectedR.replace(findKey, jsonDataKey.get(keyV));
			}
			if (wsexpectedR.contains("href")) {
				wsexpectedR = wsexpectedR.replaceAll("href='[^\"]+'", "");
			}
			String wsactualResult = wsfinalData.get("ActualResult");
			if (wsactualResult.contains("href")) {
				wsactualResult = wsactualResult.replaceAll("href='[^\"]+'", "");
			}
			if (testContextObject.baseTest.checkProduct().equalsIgnoreCase("COSEC")) {
				logger.info("WhatsApp Alert Expected result:" + wsexpectedR);
				logger.info("WhatsApp Actual result:" + wsactualResult);
//				System.out.println("Whats App Alert Expected result:" + wsexpectedR);
//				System.out.println("Whats App Alert actualResult result:" + wsactualResult);
			} else {
				if (wsexpectedR.toLowerCase().contains(("cosec").toLowerCase())) {
					wsexpectedR = wsexpectedR.replaceAll("COSEC", "EVERTECT");
					// expectedR = expectedR.replaceAll("cosec", "evertect");
//					System.out.println("Whats App Alert Expected result:" + wsexpectedR);
//					System.out.println("Whats App Alert actualResult result:" + wsactualResult);
				}
				logger.info("WhatsApp Alert Expected result:" + wsexpectedR);
				logger.info("WhatsApp Alert Actual result:" + wsactualResult);
			}

			Assert.assertEquals(wsactualResult.trim(), wsexpectedR.trim());
			logger.info("WhatsApp Alert validate successfully");
			// System.out.println("Whats App Alert validate successfully");
		}
	}
}
