package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class WorkOrderDetailsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public WorkOrderDetailsReportPO(WebDriver driver) {
          super(driver);
          this.driver = driver;
          PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cmbContractor")
	private WebElement selectContractors;
	
	@FindBy(id = "cmbWorkOrder")
	private WebElement selectworkOrders; 
	
	public void workOrderDetialsReport(String selectcontractor , String selectworkorder , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectContractors, selectcontractor);
		element_DropDownSelectByvisibleText(selectworkOrders, selectworkorder);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
