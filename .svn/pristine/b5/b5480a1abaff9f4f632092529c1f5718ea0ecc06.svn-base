package PageObject.UserModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class UserModuleReportsPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger = LogManager.getLogger(UserModuleReportsPO.class);

	public UserModuleReportsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	public PageObjectModel pom() {
		pom = new PageObjectModel(driver);
		return pom;
	}

	public void userModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch (reportName) {
		case "In/Out Event":
			pom().userPO().goToInOutEventReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String groupBy1 = data.get("GroupBy1");
				String groupNeededInReport = data.get("GroupNeededInReport");
				String groupBy2 = data.get("GroupBy2");
				String newPageForEachDateOrUser = data.get("NewPageForEachDateOrUser");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().inOutEventReport().inOutEventReportGenerate(fromDate, toDate, groupBy1, groupNeededInReport,
						groupBy2, newPageForEachDateOrUser, selectUsers, exportFormat);
			}
			break;
		case "In/Out Summary":
			pom().userPO().goToInOutSummaryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate"));
				String fromDate = data.get("fromDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				String groupBy = data.get("GroupBy");
				String format = data.get("Format");
				
				pom().inOutSummaryReportPO().inOutSummaryReport(fromDate, selectUsers, exportFormat,groupBy,format);
			}
			break;

		case "Access Denied":
			pom().userPO().goToAccessDeniedReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().accessDeniedReportPO().accessDeniedReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;

		case "Doors Accessed by User":
			pom().userPO().gotoDoorAccessbyUser();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().doorAccessedbyUserReportPO().doorAccessbyUserReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;

		case "Doors Usage":
			pom().userPO().gotoDoorUsage();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().doorUsageReportPO().doorUsageReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;
		case "Who Is In":
			pom().userPO().gotoWhoIsInReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("INPunchPeriod: " + data.get("INPunchPeriod"));
				String inpunchTime = data.get("INPunchPeriod");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().whoIsInReportPO().whoIsInReport(inpunchTime, selectUsers, exportFormat);
			}
			break;

		case "Out Time":
			pom().userPO().gotoOutTimeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().outTimeReportPO().outTimeReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;
		case "User Event Interval":
			pom().userPO().gotoUserEventIntervalReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: " + data.get("fromDate") + " ToDate: " + data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userEventIntervalReportPO().userEventIntervalReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;

		case "Former Users":
			pom().userPO().gotoFormerUsersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Month: "+data.get("Month")+" Year: "+data.get("Year"));
				String month = data.get("Month");
				String year = data.get("Year");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().formerUserReportPO().formerUsersReport(month, year, selectUsers, exportFormat);
			}
			break;

		case "New Joining":
			pom().userPO().gotoNewJoiningReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("fromDate")+" ToDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().newJoiningReportPO().newJoiningReport(fromDate, toDate, selectUsers, exportFormat);
			}
			break;

		case "Pending Confirmation":
			pom().userPO().gotoPendingConformationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("fromDate")+" ToDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String conformationperiod = data.get("ConformationPeriod");
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().pendingConformationReportPO().pendingConformationReport(fromDate, toDate, conformationperiod,
						selectUsers, exportFormat);
			}
			break;
		case "Reporting Groups":
			pom().userPO().gotoReportingGroupsReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().reportingGruopsReportPO().reportingGroupsReport(selectUsers, exportFormat);
			}
			break;

		case "Users Without Reporting In-Charge":
			pom().userPO().gotoUserWithoutReportingInchargeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().userWithoutReportingInchargeReportPO().userWithoutReportingInchargeReport(exportFormat);

			}
			break;
		case "User-Wise Policy Assignment":
			pom().userPO().gotoUserWisePolicyAssginmentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userWisePolicyAssignmentReportPO().userWisePolicyAssignmentReport(selectUsers, exportFormat);
			}
			break;

		case "Panel-Wise Users":
			pom().userPO().gotoPanelWiseUsersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().panelWiseUsersReportPO().panelWiseUsersReportPO(selectUsers, exportFormat);
			}
			break;

		case "Door-Wise Users":
			pom().userPO().gotoDoorWiseUsersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectUsers = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().doorWiseUsersReportPO().doorWiseUsersReport(selectUsers, exportFormat);
			}
			break;
		case "User-Wise Controllers":
			pom().userPO().gotoUserWiseControllersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().userWiseControllerReportPO().userWiseController(selectuser, exportFormat);
			}
			break;

		case "Blocked Users Report":
			pom().userPO().gotoBlockedUsersReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().blockedUsersReportPO().blockedUsersReport(selectuser, exportFormat);
			}
			break;

		case "Device Assignment Information":
			pom().userPO().gotoDeviceAssignmentInformationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("fromDate")+" ToDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().deviceAssignmentInformationReportPO().deviceAssignmentInformation(fromDate, toDate, selectuser,
						exportFormat);
			}
			break;

		case "Access Profile":
			pom().userPO().goToAccessProfileReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().accessProfileReportPO().accessProfileReportPO(selectuser, exportFormat);
			}
			break;
		case "Personal Info":
			pom().userPO().goToPersonalInfoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().personalInformationReportPO().personalInformationPO(selectuser, exportFormat);
			}
			break;
		case "Contact Info":
			pom().userPO().goToContactInfoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().contactInfoReportPO().contactInfoReport(selectuser, exportFormat);
			}
			break;
		case "Offical Info":
			pom().userPO().goToOfficalInfoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().officalInfoReportPO().officalInfoReport(exportFormat, selectuser);
			}
			break;
		case "Retirement Info":
			pom().userPO().goToRetirementInfoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("fromDate")+" ToDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String retireage = data.get("RetireAge");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().retirementInfoReportPO().retirementInfoReport(fromDate, toDate, retireage, selectuser,
						exportFormat);
			}
			break;
		case "Enrollment Info":
			pom().userPO().goToEnrollmentInfoReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().enrollmentInfoReportPO().enrollmentInfoReport(selectuser, exportFormat);
			}
			break;
		case "Change Group":
			pom().userPO().goToChangeGroupReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("FromDate: "+data.get("fromDate")+" ToDate: "+data.get("toDate"));
				String fromDate = data.get("fromDate");
				String toDate = data.get("toDate");
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().changeGroupReportPO().changeGroupReport(fromDate, toDate, selectuser, exportFormat);
			}
			break;
		case "Biometric Enrollment Report":
			pom().userPO().goToBiometricEnrollmentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("SelectUsers: "+data.get("SelectUsers"));
				String selectuser = data.get("SelectUsers");
				String exportFormat = data.get("ExportFormat");
				pom().biometricEnrollmentReportPO().biometricEnrollmentReport(selectuser, exportFormat);
			}
			break;

		default:
			break;
		}
	}

}
