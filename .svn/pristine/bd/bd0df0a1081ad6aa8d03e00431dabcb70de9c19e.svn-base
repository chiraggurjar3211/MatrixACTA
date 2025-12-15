package PageObject.EnterpriseModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class EnterpriseModuleReportPO extends AbstractMethod  {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EnterpriseModuleReportPO.class);
	
	public EnterpriseModuleReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	public PageObjectModel pom() {
		pom=new PageObjectModel(driver);
		return pom;
	}
	
	public void enterpriseModuleReport(String reportName, DataTable dataTable) throws Exception {
		switch(reportName) {
		case "Organization":
			pom().enterprisePO().gotoOrganizationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().organizationReportPO().organtizationReport(exportFormat);
			}
			break;
			
		case "Branch":
			pom().enterprisePO().gotoBranchReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().branchReportPO().branchReport(exportFormat);
			}
			break;
		case "Department":
			pom().enterprisePO().gotoDepartmentReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().departmentReportPO().departmentReport(exportFormat);
			}
			break;
		case "Designation":
			pom().enterprisePO().gotodesigationReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().designationReportPO().designationReport(exportFormat);
			}
			break;
		
		case "Section":
			pom().enterprisePO().gotoSectionReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().sectionReportPO().sectionReport(exportFormat);
			}
			break;
		
		case "Category":
			pom().enterprisePO().gotoCategoryReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().categoryReportPO().categoryReport(exportFormat);
			}
			break;
			
			
		case "Grade":
			pom().enterprisePO().gotoGradeReport();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().gradeReportPO().gradeReport(exportFormat);
			}
			break;
		
		case "Custom Group 1":
			pom().enterprisePO().gotoCustomGroup1Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().customGroup1ReportPO().customGroup1Report(exportFormat);	
				}
			    break;
		case "Custom Group 2":
			pom().enterprisePO().gotoCustomGroup2Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().customGroup2ReportPO().customGroup2Report(exportFormat);
			}
			break;
			
		case "Custom Group 3":
			pom().enterprisePO().gotoCustomGroup3Report();
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("ExportFormat: "+data.get("ExportFormat"));
				String exportFormat = data.get("ExportFormat");
				pom().customGroup3ReportPO().customGroup3Report(exportFormat);
			}
			break;
			
		default:
			break;
		}
	}

}
