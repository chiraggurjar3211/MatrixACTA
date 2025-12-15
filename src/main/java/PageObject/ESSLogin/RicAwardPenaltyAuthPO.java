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

public class RicAwardPenaltyAuthPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(RicAwardPenaltyAuthPO.class);
	
	public RicAwardPenaltyAuthPO(WebDriver driver) {
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

	@FindBy(id = "Filters")
	private WebElement filterUserDropdown;

	@FindBy(id = "JPCAuthAutoAllUsersID")
	private WebElement userIdTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@gridname='grdAwardPending']//*[@name='cmnTxtSearch']")
	private WebElement searchTxtPending;

	@FindBy(id = "chkRejectgrdAwardPending")
	private WebElement rejectAllChk;

	@FindBy(id = "chkApprovegrdAwardPending")
	private WebElement approveAllChk;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]")
	private WebElement rejectCollapsiblePanel;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show' or @class='collapse show']//table/tbody/tr[not(@hidden)]//td[not(@hidden)][2]")
	private List<WebElement> pendingTable;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show' or @class='collapse show']//table/tbody/tr[not(@hidden)]//td[not(@hidden)][2]")
	private List<WebElement> rejectTable;

	@FindBy(xpath = "//*[contains(text(),'Approved')]")
	private WebElement approveCollapsiblePanel;

	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show' or @class='collapse show']//table/tbody/tr[not(@hidden)]//td[not(@hidden)][2]")
	private List<WebElement> approveTable;

	/////////////////
	public void authorizeAwardPenaltyAppFromRIC(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserName: "+data.get("UserName")+" AttendanceDate: "+data.get("AttendanceDate"));
			String ricName = data.get("RicName");
			String userId = data.get("UserName");
			String attendanceDate = data.get("AttendanceDate");
			String filterUser = data.get("FilterUser");
//				String awardHours = data.get("AwardHours");
//				String penaltyHours = data.get("PenaltyHours");
			String approval = data.get("Approval");
			String validation = data.get("Validation");
			String adate = dateSelected(attendanceDate);
			waitForElementVisible(fromDateTxt);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, adate);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, adate);
			Thread.sleep(1000);
			element_Click(filterUserDropdown);
			element_DropDownSelectByvisibleText(filterUserDropdown, filterUser);
			Thread.sleep(1000);
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, ricName);
			element_TextBoxToClickOnTab(userIdTxt);
			waitForElementClickable(viewBtn);
			element_ClickUsingJS(viewBtn);
			pageLoadWaitng();
			element_Clear(searchTxtPending);
			element_InputTextUsingActionClass(searchTxtPending, userId);
			element_TextBoxToClickOnEnter(searchTxtPending);
			String usrName = userId.toUpperCase();
			Thread.sleep(1000);
			for (int i = 0; i < pendingTable.size(); i++) {
				String userIdCol = pendingTable.get(i).getText().toUpperCase();
				if (usrName.equalsIgnoreCase(userIdCol)) {
					if (approval.equalsIgnoreCase("Approve")) {
						WebElement approveChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[7]"));
						element_Click(approveChk);
					} else if (approval.equalsIgnoreCase("Reject")) {
						WebElement rejectChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[8]"));
						element_Click(rejectChk);
					}
				}
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			String val = validationMessage();
			Assert.assertEquals(val, validation);
		}
		
	}

	public void verifyRicAwardPenaltyAuthorization(String tabName, String ricName, String userId, String attendanceDate,
			String filterUser) throws InterruptedException {
		String actDate1 = null;
		String adate = dateSelected(attendanceDate);
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, adate);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, adate);
		Thread.sleep(1000);
		element_Click(filterUserDropdown);
		element_DropDownSelectByvisibleText(filterUserDropdown, filterUser);
		Thread.sleep(1000);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, ricName);
		element_TextBoxToClickOnTab(userIdTxt);
		waitForElementClickable(viewBtn);
		element_ClickUsingJS(viewBtn);
		pageLoadWaitng();
		Thread.sleep(1000);

		if (tabName.contains("Rejected")) {
			waitForElementClickable(rejectCollapsiblePanel);
			element_Click(rejectCollapsiblePanel);
			Thread.sleep(1000);
			for (int i = 0; i < rejectTable.size(); i++) {
				String colValue = rejectTable.get(i).getText();
				if (colValue.toUpperCase().equalsIgnoreCase(userId.toUpperCase())) {
					WebElement atdDate = rejectTable.get(i).findElement(By.xpath("following-sibling::td[3]"));
					actDate1 = atdDate.getText();
				}
			}
			Assert.assertEquals(adate, actDate1);
		} else if (tabName.contains("Approved")) {
			Thread.sleep(1000);
			waitForElementClickable(approveCollapsiblePanel);
			element_Click(approveCollapsiblePanel);
			Thread.sleep(1000);

			for (int i = 0; i < approveTable.size(); i++) {
				String colValue = approveTable.get(i).getText();
				if (colValue.toUpperCase().equalsIgnoreCase(userId.toUpperCase())) {
					WebElement atdDate = approveTable.get(i).findElement(By.xpath("following-sibling::td[3]"));
					actDate1 = atdDate.getText();
				}
			}
			Assert.assertEquals(adate, actDate1);
		}
	}
}
