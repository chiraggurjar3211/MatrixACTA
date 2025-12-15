package PageObject.UserModule;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class InOutSummaryReportPO extends AbstractMethod{
	WebDriver driver;
	public InOutSummaryReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_calFromDate")
	private WebElement fromdate;

	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(xpath="//*[@id='accordion_master'][position()=1]/a[@class=\"collapsed\"]")
	private List<WebElement> optionalParameterTabCount;
	
	@FindBy(xpath="//*[@id='accordion_master'][position()=1]/a[@class=\"collapsed\"]")
	private WebElement optionalParameterTab;
	
	@FindBy(id="cboGroupBy")
	private WebElement groupByE;
	
	@FindBy(id="cboGrpLvl")
	private WebElement formatE;
	


	public void inOutSummaryReport(String fdate,String selectDD, String reportExportFormat,String groupBy,String format) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromdate);
		String dateFormat = fromdate.getAttribute("title");
		String insertFromDate = reportFromDateToDateChangeFormat(fdate, dateFormat);
		element_Clear(fromdate);
		element_InputTextUsingActionClass(fromdate, insertFromDate);
		if(optionalParameterTabCount.size()>0) {
			optionalParameterTab.click();
			element_DropDownSelectByvisibleText(groupByE, groupBy);
			element_DropDownSelectByvisibleText(formatE, format);
		}
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}
	
}
