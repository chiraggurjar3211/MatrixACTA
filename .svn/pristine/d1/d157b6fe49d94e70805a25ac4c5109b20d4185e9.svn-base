package PageObject.ESSLogin;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class RicApplicationAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(RicApplicationAuthorizationPO.class);
	
	public RicApplicationAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	////////////////
	public PageObjectModel pom() {
		pom = new PageObjectModel(driver);
		return pom;
	}

	//Common function for all types of Authorization from RIC accept Overtime/C-OFF authorization
	public void approveRejectApplication(String pageName, String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		pom().essPO().goToApproveRejectPage(pageName);
		pageLoadWaitng();
		switch (pageName) {
		case "Leave":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("User: "+data.get("User")+" FromDate: "+data.get("FromDate"));
				String user = data.get("User");
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String approve = data.get("Approve");
				String reject = data.get("Reject");
				String panelName = data.get("PanelName");
				String validation = data.get("Validation");
				pom().essLeaveApplicationApprovalPO().leaveApplicationApproval(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
						panelName, validation);
			}
			break;
		case "Tour":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("User: "+data.get("User")+" FromDate: "+data.get("FromDate"));
				String user = data.get("User");
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String approve = data.get("Approve");
				String reject = data.get("Reject");
				String validation = data.get("Validation");
				pom().essTourApplicationApprovalPO().tourApplicationApproval(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
						validation);
			}
			break;
		case "C-OFF":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("User: "+data.get("User")+" FromDate: "+data.get("FromDate"));
				String user = data.get("User");
				String fromDate = data.get("FromDate");
				String toDate = data.get("ToDate");
				String approve = data.get("Approve");
				String reject = data.get("Reject");
				String validation = data.get("Validation");
				pom().essCOffApplicationApprovalPO().cOffApplicationApproval(fromDtHeader, toDtHeader, user, fromDate, toDate, approve, reject,
						validation);
			}
			break;
		case "Attendance Correction":
				pom().essAttendanceCorrectionAuthorizationPO().approveRejectAtdCorrectionApp(fromDtHeader, toDtHeader, dataTable);
			break;
		case "Attendance":
			pom().essDailyAttendanceAuthorizationPO().authorizeDailyAttendanceByRIC(fromDtHeader, toDtHeader, dataTable);
			break;
		case "Event Authorization":
			pom().essEventAuthorizationPO().authorizeEvents(fromDtHeader, toDtHeader, dataTable);
			break;
		case "Advance Overtime Approval":
			pom().essAdvanceOvertimeApprovalPO().advOTAppApproval(fromDtHeader, toDtHeader, dataTable);
			break;
		case "Short Leave/Official IN-OUT":
			pom().essShortLeaveOfficialInOutAuthorizationPO().authorizeShortLeaveOfficialInOutFromRIC(fromDtHeader, toDtHeader, dataTable);
			break;
		case "Shift Change Approval":
			pom.essShiftChangeApprovalPO().approveRejectShiftChangeApp(fromDtHeader, toDtHeader, dataTable);
			break;
		default:
			logger.debug("Invalid Application Type");
			break;
		}
	}

	//Common function to Validate Authorized applications from RIC accept Overtime/C-OFF authorization
	public void validateApplicationApproval(String pageName, String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pom().essPO().goToApproveRejectPage(pageName);
		switch (pageName) {
		case "Leave":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserID: "+data.get("UserID")+" FromDt: "+data.get("FromDt"));
				String panelName = data.get("PanelName");
				String userId = data.get("UserID");
				String fromDt = data.get("FromDt");
				String toDt = data.get("ToDt");
				String status = data.get("Status");
				pom().essLeaveApplicationApprovalPO().validateLeaveApplicationApproval(fromDate, toDate, panelName, userId, fromDt, toDt, status);
			}
			break;
		case "Attendance":
			pom().essDailyAttendanceAuthorizationPO().validateAuthorizedDailyAttendance(fromDate, toDate, dataTable);
			break;
		case "Attendance Correction":
			pom().essAttendanceCorrectionAuthorizationPO().validateAuthorizedAtdCorrectAppInRIC(fromDate, toDate, dataTable);
			break;
		case "Short Leave/Official IN-OUT":
			pom().essShortLeaveOfficialInOutAuthorizationPO().validateShortLvOfficialINOUTAppApproval(fromDate, toDate, dataTable);
			break;
		default:
			break;
		}
	}
	
	public void otCOFFAuthFromRIC(String authFor, String period, String fromDt, String toDt, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		switch (authFor) {
		case "Single Record":
			pom().essOvertimeCOFFAuthorizationPO().singleRecordOTCOffAuthorizationRIC(authFor, period, fromDt, toDt, dataTable);
			Thread.sleep(1000);
			pom.abstractMethod().essDashboardButtonClick();
			Thread.sleep(500);
			break;
		case "Multiple Records":
			pom().essOvertimeCOFFAuthorizationPO().multipleRecordsOTCOFFAuthRIC(authFor, period, fromDt, toDt, dataTable);
			Thread.sleep(500);
			break;
		default:
			break;
		}
	}
	
}
