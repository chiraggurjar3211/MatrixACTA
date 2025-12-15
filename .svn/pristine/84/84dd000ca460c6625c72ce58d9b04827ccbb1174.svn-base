package PageObject.TimeAndAttendance;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class ExportsPO extends AbstractMethod{
	WebDriver driver;
	private PageObjectModel pom;
	
	public ExportsPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom = new PageObjectModel(driver);
		return pom;
	}
    
	public void exportsConfiguration(String tabName , String exportName , DataTable dataTable) throws Exception {
		switch(exportName) {
		case "Attendence Register":
			pom().timeAndAttendancePO().gotoAttendenceRegister();
			if(tabName.equalsIgnoreCase("Export Day-Wise Attendance with Code Mapping")) {
				pom().attendenceRegisterPO().exportDayWiseAttendence(dataTable);
			}
			else if(tabName.equalsIgnoreCase("Attendance Register Configuration")) {
				pom().attendenceRegisterPO().attendenceRegisterConfiguration(dataTable);
			}
			else if(tabName.equalsIgnoreCase("Form 25 Configuration")) {
				pom().attendenceRegisterPO().form25Configuration(dataTable);
			}
			break;
			
		case "Short Leave Official OUT Time":
			pom().timeAndAttendancePO().gotoShortLeaveOfficaloutTime();
			if(tabName.equalsIgnoreCase("No Tab")) {
				pom().shortLeaveOfficialOUTTimePO().notabConfiguration(dataTable);
			}
			else {
				pom().shortLeaveOfficialOUTTimePO().reasonWiseOutTime(dataTable);
			}
			break;
			
		case "Group-Wise Shift Headcount":
			pom().timeAndAttendancePO().gotoGroupWiseShiftHeadcount();
			if(tabName.equalsIgnoreCase("Enterprise Group Configuration")) {
				pom().groupWiseShiftHeadcountPO().enterpriseGroupConfiguration(dataTable);
			}
			else {
				pom().groupWiseShiftHeadcountPO().shiftConfiguration(dataTable);
			}
			break;
			
		case "Enterprise Group-Wise Presence Count":
			pom().timeAndAttendancePO().gotoEnterpriseGroupWisePresenceCount();
			if(tabName.equalsIgnoreCase("No Tab")) {
				pom().enterpriseGroupWisePresenceCountPO().configurationTab(dataTable);
			}
			break;
		
		case "Monthly Hours Summary":
			pom().timeAndAttendancePO().gotoMonthlyHoursSummary();
			if(tabName.equalsIgnoreCase("Export Configuration")) {
				pom().monthlyHoursSummaryPO().exportConfiguration(dataTable);
			}
			else {
				pom().monthlyHoursSummaryPO().attendenceStatusCodeMapping(dataTable);
			}
			break;
			
		case "Site Wise Monthly Summary":
			pom().timeAndAttendancePO().gotoSiteWiseMonthlySummary();
			if(tabName.equalsIgnoreCase("No Tab")) {
				pom().siteWiseMonthlySummaryPO().configuration(dataTable);
			}
			else {
				pom().siteWiseMonthlySummaryPO().customExportFieldConfigguration(dataTable);
			}
			break;
			
		case "Muster Roll":
			pom().timeAndAttendancePO().gotoMusterRoll();
			if(tabName.equalsIgnoreCase("Export Shift-Wise Attendence with Code Mapping")) {
				pom().musterRollPO().exportShiftWiseAttendancewithCodeMapping(dataTable);
			}
			else {
				pom().musterRollPO().selectFieldstoExport(dataTable);
			}
			break;
			
	default:
		break;
				
		}
	}
	
	public void exportReport(String exportName, DataTable dataTable) throws Exception {
		switch(exportName) {
		case "Attendence Register":
			pom().timeAndAttendancePO().gotoAttendenceRegister();
			pom().attendenceRegisterPO().exportAttendenceRegister(dataTable);
			break;
			
		case "Site-Wise Head Count Man Hours":
			pom().timeAndAttendancePO().gotoSiteWiseHeadcountManHours();
			pom().siteWiseHeadCountManHoursPO().siteWiseHeadCountManHours(dataTable);
			break;
			
		case "Short Leave Official OUT Time":
			pom().timeAndAttendancePO().gotoShortLeaveOfficaloutTime();
			pom().shortLeaveOfficialOUTTimePO().shortLeaveOfficalOutTimeExport(dataTable);
			break;
			
		case "Group-Wise Shift Headcount":
			pom().timeAndAttendancePO().gotoGroupWiseShiftHeadcount();
			pom().groupWiseShiftHeadcountPO().groupWiseShiftHeadCountExport(dataTable);
			break;
			
		case "Enterprise Group-Wise Presence Count":
			pom().timeAndAttendancePO().gotoEnterpriseGroupWisePresenceCount();
			pom().enterpriseGroupWisePresenceCountPO().enterpriseGroupWisePresenceCountExport(dataTable);
			break;
			
		case "Monthly Hours Summary":
			pom().timeAndAttendancePO().gotoMonthlyHoursSummary();
			pom().monthlyHoursSummaryPO().monthlyHoursSummaryExport(dataTable);
			break;
			
		case "Site Wise Monthly Summary":
			pom().timeAndAttendancePO().gotoSiteWiseMonthlySummary();
			pom().siteWiseMonthlySummaryPO().siteWiseMonthlySummaryExport(dataTable);
			break;
			
		case "Muster Roll":
			pom().timeAndAttendancePO().gotoMusterRoll();
			pom().musterRollPO().musterRollExport(dataTable);
			break;
			
	   default:
		   break;
		}
	}

}
