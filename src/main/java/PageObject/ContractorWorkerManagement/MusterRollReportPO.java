package PageObject.ContractorWorkerManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MusterRollReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MusterRollReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(id = "cmbContractor")
	private WebElement selectContractors;
	
	@FindBy(id = "cmbWorkOrder")
	private WebElement selectworkOrders;
	
	@FindBy(id = "cmbWorkers")
	private WebElement selectWorkers;
	
	@FindBy(id = "chkArchieve")
	private WebElement checkbox;
	
	public void musterRollReport(String month1 , String year1, String selectcontracter , String selectworkorder, String selectworker , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		if(!checkbox.isSelected()) {
			element_Click(checkbox);
		}
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectContractors, selectcontracter);
		element_DropDownSelectByvisibleText(selectworkOrders, selectworkorder);
		element_DropDownSelectByvisibleText(selectWorkers, selectworker);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
