package PageObject.ESSLogin;

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

public class RicTimesheetCorrectionAuthPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(RicTimesheetCorrectionAuthPO.class);
	
	public RicTimesheetCorrectionAuthPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;

	@FindBy(id = "cboMode")
	private WebElement filterUserDropdown;

	@FindBy(id = "AutoUserID")
	private WebElement groupUserIdTxt;

	@FindBy(xpath = "//*[@key=\"btnView\"]")
	private WebElement viewBtn;
	
	@FindBy(id = "chkRejectgvPending")
	private WebElement rejectAllChk;

	@FindBy(id = "chkApprovegvPending")
	private WebElement approveAllChk;
	
	@FindBy(xpath = "//*[contains(text(),'Rejected')]")
	private WebElement rejectCollapsiblePanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> rejectTable;
	
	@FindBy(xpath = "//*[contains(text(),'Approved')]")
	private WebElement approveCollapsiblePanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> approveTable;
	
	
	///////////

	public void ricTimesheetCorrectionAuthorization(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		
//		String val = null;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+" AttendanceDate: "+data.get("AttendanceDate"));
			String val = null;
			String userName = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String filterUser = data.get("FilterUser");
			String approval = data.get("Approval");
			String validation = data.get("Validation");

			Thread.sleep(1000);
			String adate = dateSelected(attendanceDate);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, adate);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, adate);
			waitForElementClickable(filterUserDropdown);
			element_Click(filterUserDropdown);
			element_DropDownSelectByvisibleText(filterUserDropdown, filterUser);
			Thread.sleep(1000);
			element_Clear(groupUserIdTxt);
			element_InputTextUsingActionClass(groupUserIdTxt, userName);
			element_TextBoxToClickOnTab(groupUserIdTxt);
			waitForElementClickable(viewBtn);
			element_ClickUsingJS(viewBtn);
			pageLoadWaitng();
			if (approval.equalsIgnoreCase("Reject")) {
				element_Click(rejectAllChk);
			} else if (approval.equalsIgnoreCase("Approve")) {
				element_Click(approveAllChk);
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			val = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(val, validation);
		}
		//Assert.assertEquals(val, "Saved Successfully");
	}
	
	public void verifyRicTimesheetCorrectionAuthorization(String tabName, String userName, String attendanceDate, String filterUser) throws InterruptedException
	{
		reloadPageButtonClick();
		pageLoadWaitng();
		String actDate1 = null;
		String adate = dateSelected(attendanceDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, adate);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, adate);
		waitForElementClickable(filterUserDropdown);
		element_Click(filterUserDropdown);
		element_DropDownSelectByvisibleText(filterUserDropdown, filterUser);
		Thread.sleep(1000);
		element_Clear(groupUserIdTxt);
		element_InputTextUsingActionClass(groupUserIdTxt, userName);
		element_TextBoxToClickOnTab(groupUserIdTxt);
		waitForElementClickable(viewBtn);
		element_ClickUsingJS(viewBtn);
		//element_Click(viewBtn);
		pageLoadWaitng();
		
		if(tabName.contains("Rejected"))
		{
			logger.debug("Reject TAb");
			Thread.sleep(1000);
		//	waitForElementClickable(rejectCollapsiblePanel);
			element_Click(rejectCollapsiblePanel);
			Thread.sleep(1000);
			
			for(int i =0; i<rejectTable.size(); i++)
			{
				String colValue = rejectTable.get(i).getText();				
				if(colValue.toUpperCase().equalsIgnoreCase(userName.toUpperCase()))
				{				
					WebElement atdDate = rejectTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]"));
					actDate1 = atdDate.getText();
				}
			}
			Assert.assertEquals(adate, actDate1);
		}
		else if(tabName.contains("Approved"))
		{
			logger.debug("Approve TAb");
			Thread.sleep(1000);
			//waitForElementClickable(approveCollapsiblePanel);
			element_Click(approveCollapsiblePanel);
			Thread.sleep(1000);
			
			for(int i=0; i<approveTable.size(); i++)
			{
				String colValue = approveTable.get(i).getText();				
				if(colValue.toUpperCase().equalsIgnoreCase(userName.toUpperCase()))
				{
					WebElement atdDate = approveTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]"));
					actDate1 = atdDate.getText();
				}
			}
			Assert.assertEquals(adate, actDate1);
		}
	}
}
