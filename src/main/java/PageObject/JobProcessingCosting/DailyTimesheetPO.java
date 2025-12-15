package PageObject.JobProcessingCosting;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class DailyTimesheetPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DailyTimesheetPO.class);
	public DailyTimesheetPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//elements
	@FindBy(id = "_fromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(id = "txtFileName")
	private WebElement fileNameTxt;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDropdown;

	@FindBy(id = "ID")
	private WebElement UserIdTxt;

	@FindBy(xpath = "//*[@id='cosecForm']//*[@key='Export']")
	private WebElement exportBtn;
	
	//////////

	public void exportDailyTimesheet(DataTable dataTable) throws InterruptedException
	{
		pageLoadWaitng();
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date")+" UserId: "+data.get("UserId"));
			String date = data.get("Date");
			String fileName = data.get("FileName");
			String selectUser1 = data.get("SelectUser");
			String userId = data.get("UserId");		
			String adate = dateSelected(date);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, adate);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, adate);
			element_Clear(fileNameTxt);
			element_InputTextUsingActionClass(fileNameTxt, fileName);
			element_Click(selectUserDropdown);
			element_DropDownSelectByvisibleText(selectUserDropdown, selectUser1);
			Thread.sleep(1000);
			element_Clear(UserIdTxt);
			element_InputTextUsingActionClass(UserIdTxt, userId);
			element_TextBoxToClickOnTab(UserIdTxt);	
		}
		element_ClickUsingJS(exportBtn);
	}
}
