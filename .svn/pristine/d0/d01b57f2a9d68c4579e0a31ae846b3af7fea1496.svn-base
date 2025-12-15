package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class WorkerDetialsReportPO extends AbstractMethod {
	WebDriver driver;
	
	public WorkerDetialsReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cmbContractor")
	private WebElement selectContractors;
	
	@FindBy(id = "cmbWorkOrder")
	private WebElement selectworkOrders;
	
	@FindBy(id = "cmbWorkers")
	private WebElement selectWorkers;
	
	public void workerDetialsReport(String selectcontractor , String selectworkorder , String selectworker , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectContractors, selectcontractor);
		element_DropDownSelectByvisibleText(selectworkOrders, selectworkorder);
		element_DropDownSelectByvisibleText(selectWorkers, selectworker);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
