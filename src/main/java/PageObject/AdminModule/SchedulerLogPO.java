package PageObject.AdminModule;

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

public class SchedulerLogPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(SchedulerLogPO.class);
	public SchedulerLogPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath="//*[text()='Filter']")
	private WebElement filterTab;
	
	@FindBy(id="cboSchActivity")
	private WebElement scheduleActivity;
	
	@FindBy(xpath="//*[@value='View']")
	private WebElement viewButton;
	
	@FindBy(xpath="//table/tbody/tr/td[@style][1]")
	private List<WebElement> data;
	
	@FindBy(xpath="//*[text()='No Data']")
	private WebElement noData;
	
	@FindBy(xpath="//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchBox;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;
	
	@FindBy(xpath = "//table/thead/tr/th[2]/i[@class=\"fa m-4-left fa-caret-down\"]")
	private WebElement sorting1;

	@FindBy(xpath = "//table/thead/tr[not(@hidden)]/th[not(@hidden)][2]//i[@class=\"fa m-4-left fa-caret-up\"]")
	private WebElement sorting2;
	
	@FindBy(xpath = "//*[@class='table-responsive']//tbody//td[5]")
	private WebElement taskStatus;
	
	@FindBy(xpath = "//*[@class='table-responsive']//tbody//td[5]")
	private List<WebElement> taskStatusRows;
	
	@FindBy(xpath = "//*[@default='Search']")
	private WebElement searchBar;
	
	public void taskSchedulerVerify(List<Map<String, String>> data) throws InterruptedException {

		for (int i = 0; i < data.size(); i++) {
			String taskScheduler=data.get(i).get("TaskScheduler");
			String schedulerName=data.get(i).get("SchedulerName");
			String status=data.get(i).get("Status");
			Thread.sleep(1000);
			reloadPageButtonClick();
			Thread.sleep(1000);
			String currentDate = dateSelected("0");
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, currentDate);
			Thread.sleep(1000);
			element_Click(filterTab);
			Thread.sleep(1000);
			element_Click(viewButton);
			Thread.sleep(1000);
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, schedulerName);
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(1000);
			//element_Click(sorting1);
			String actualStatus = null;
			if (taskStatusRows.size()>0) {
				element_Click(sorting2);
				actualStatus = element_GetText(taskStatus);
			}
			else {
				actualStatus = "Scheduler is not run";
				logger.info(actualStatus);
			}
			Assert.assertEquals(actualStatus, status);
		}
	}
	
	
	

}
