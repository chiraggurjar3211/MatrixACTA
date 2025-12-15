package PageObject.JobProcessingCosting;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class SchedulerLogsJPCPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(SchedulerLogsJPCPO.class);
	
	public SchedulerLogsJPCPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "_FromDate")
	private WebElement fromDatetxt;
	
	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "cboSchActivity")
	private WebElement schedulerDD;
	
	@FindBy(xpath = "//*[@default='View']")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@gridname='grdSchLogs']//*[@name='cmnTxtSearch']")
	private WebElement searchSchedulerLog;
	
	@FindBy(xpath = "//*[@gridname='grdSchLogs']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> jobStatusTable;
	
	@FindBy(xpath = "//*[@class='table-responsive']//tbody//td[5]")
	private WebElement jobStatus;
	
	@FindBy(xpath = "//*[@class='fa m-4-left fa-caret-up']")
	private WebElement sortingUpArrowClick;
	
	@FindBy(xpath = "//*[@class='fa m-4-left fa-caret-up']")
	private List<WebElement> sortingUpArrow;
	
	
	/////////////////
	public void verifyJobSchedulerLog(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDatetxt);
		String actualStatus = null;
		if(data.get("FromDate") != null) {
			element_Clear(fromDatetxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(fromDatetxt, data.get("FromDate"));
			element_TextBoxToClickOnTab(fromDatetxt);
		}
		if(data.get("ToDate") != null) {
			element_Clear(toDateTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(toDateTxt, data.get("ToDate"));
			element_TextBoxToClickOnTab(toDateTxt);
		}
		if(data.get("Scheduler") != null) {
			element_DropDownSelectByvisibleText(schedulerDD, data.get("Scheduler"));
			Thread.sleep(500);
		}
		element_Click(viewBtn);
		Thread.sleep(1000);
		if(data.get("SchedulerName") != null) {
			element_Clear(searchSchedulerLog);
			element_InputTextUsingActionClass(searchSchedulerLog, data.get("SchedulerName"));
			element_TextBoxToClickOnEnter(searchSchedulerLog);
		}
		if (jobStatusTable.size()>0) {
			if(sortingUpArrow.size() > 0) {
				element_Click(sortingUpArrowClick);
				Thread.sleep(500);
			}
			for(int i=0; i<jobStatusTable.size(); i++) {
				String actualSchedulerName = jobStatusTable.get(i).getText();
				if(data.get("SchedulerName").equalsIgnoreCase(actualSchedulerName)) {	
					actualStatus = element_GetText(jobStatus);
					break;
				}
			}
		}else {
			actualStatus = "Scheduler is not run";
			logger.info(actualStatus);
		}
		Assert.assertEquals(actualStatus, data.get("Status"));
	}
}
