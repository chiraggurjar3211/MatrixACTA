		package PageObject.ESSLogin;

import static org.testng.Assert.fail;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssTimesheetCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssTimesheetCorrectionPO.class);
	
	public EssTimesheetCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "_PDate")
	private WebElement dateTxt;

	@FindBy(id = "txtReason")
	private WebElement reasonTxt;

	
	@FindBy(xpath = "//*[@name='cosecForm1']//table//tbody//tr[not(@hidden)]//td[not(@hidden)][5]")
	private List<WebElement> timeshetCorrectionTable;

	@FindBy(xpath = "//*[@id='JobCode']")
	private WebElement jobCodeDropdown;

	@FindBy(xpath = "//*[@id = \"savebtn\" and not(@hidden)]")
	private WebElement saveBtnTimeCorrect;
	
	@FindBy(xpath = "//*[contains(text(),'Timesheet Correction')]/ancestor::a[@class=\"anchorclick\"]")
	private List<WebElement> timesheetCorrectionPanelXpath;
	
	@FindBy(xpath = "//*[contains(text(),'Timesheet Correction')]/ancestor::a")
	private WebElement timesheetCorrectionPanel;
	
	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement timesheetCorrectionSearch;
	
	@FindBy(xpath = "//*[@name='cosecForm1']//table//tbody//tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> timesheetCorrectionTable;
	
	/////////////////
	public void essTimesheetCorrectionApplication(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		cancelButtonClick();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Attendance-Date: "+data.get("attendance-date")+" StartTime: "+data.get("StartTime")+" job-code: "+data.get("job-code"));
			String attendanceDate = data.get("attendance-date");
			String startTime = data.get("StartTime");
			String jobCode = data.get("job-code");
			String reason = data.get("reason");
		//	String validation = data.get("Validation");
			String adate = dateSelected(attendanceDate);			
			pageLoadWaitng();
			Thread.sleep(2000);
			waitForElementVisible(dateTxt);
			element_Clear(dateTxt);
			element_InputTextUsingActionClass(dateTxt, adate);
			waitForElementClickable(reasonTxt);
			element_Clear(reasonTxt);
			element_InputTextUsingActionClass(reasonTxt, reason);
			Thread.sleep(1000);
			for(int i =0; i<timeshetCorrectionTable.size();i++)
			{
				String sTime = timeshetCorrectionTable.get(i).getText();
				
				if(startTime.equalsIgnoreCase(sTime))
				{
					WebElement editBtn1 = timeshetCorrectionTable.get(i).findElement(By.xpath("following-sibling::td[8]"));
					waitForElementClickable(editBtn1);
					element_Click(editBtn1);
					break;
				}
			}		
			waitForElementClickable(jobCodeDropdown);
			element_Click(jobCodeDropdown);
			element_DropDownSelectByvisibleText(jobCodeDropdown, jobCode);
			waitForElementClickable(saveBtnTimeCorrect);
			element_Click(saveBtnTimeCorrect);
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			String val = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(val, "Saved Successfully");
		}
	}
	
	public void validateTimesheetCorrectionApplication(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if(timesheetCorrectionPanelXpath.size() == 0) {
			element_Click(timesheetCorrectionPanel);
			Thread.sleep(1500);
		}
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			boolean actualRes = false;
			if(timesheetCorrectionTable.size()>0) {
				element_Clear(timesheetCorrectionSearch);
				element_InputTextUsingActionClass(timesheetCorrectionSearch, data.get("JobCode"));
				element_TextBoxToClickOnEnter(timesheetCorrectionSearch);
				Thread.sleep(700);
				for(int i=0; i<timesheetCorrectionTable.size(); i++) {
					String actualJobCode = timesheetCorrectionTable.get(i).getText();
					if(actualJobCode.equalsIgnoreCase(data.get("JobCode"))) {
						actualRes = true;
					}
				}
			}else {
				Assert.assertEquals("Table Not Found", data.get("JobCode"));
			}
			Assert.assertEquals(actualRes, true);
		}
	}
}
