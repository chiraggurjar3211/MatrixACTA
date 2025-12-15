package PageObject.CafeteriaManagement;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyConsumptionReportPO extends AbstractMethod {
	WebDriver driver;
	
	public MonthlyConsumptionReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "cntFromMonth")
	private WebElement month;
	
	@FindBy(id = "cntFromYear")
	private WebElement year;
	
	@FindBy(id = "cboGrpLvl")
	private WebElement groupBy;
	
	@FindBy(id = "grpddl")
	private WebElement selectUser;
	
	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;
	
	public void monthlyConsumptionReport(String month1 , String year1 , String groupby ,  String selectuser , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month,month1);
		element_DropDownSelectByvisibleText(year, year1);
		Thread.sleep(1000);
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(groupBy, groupby);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(selectUser, selectuser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
