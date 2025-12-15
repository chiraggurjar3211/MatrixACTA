package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ContractorDetailsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public ContractorDetailsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cmbContractor")
	private WebElement selectContractors;
	
	public void contractorDetialsReport(String selectcontractor , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectContractors, selectcontractor);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
