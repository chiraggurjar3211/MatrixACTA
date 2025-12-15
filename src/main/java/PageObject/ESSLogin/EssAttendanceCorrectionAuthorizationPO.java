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

public class EssAttendanceCorrectionAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssAttendanceCorrectionAuthorizationPO.class);
	
	public EssAttendanceCorrectionAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement pendingCollapsSearchBox;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTableXpath;

	@FindBy(id = "Filters")
	private WebElement filtersDrop;

	@FindBy(id = "userID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a")
	private WebElement approvedPanel;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a")
	private WebElement rejectedPanel;
	
	@FindBy(xpath = "//div[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;
	
	/////////////

	public void approveRejectAtdCorrectionApp(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filtersDrop, "Individual");
		Thread.sleep(700);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" AttendanceDate: "+data.get("AttendanceDate"));
			String user = data.get("User");
			String attendanceDate = data.get("AttendanceDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			String convertAttendanceDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, user);
			element_TextBoxToClickOnTab(userIdTxt);
			element_Click(viewBtn);
			Thread.sleep(1500);
			for (int i = 0; i < pendingTableXpath.size(); i++) {
				String getUserId = pendingTableXpath.get(i).getText();
				String getAtdDate = pendingTableXpath.get(i)
						.findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][3]")).getText();
				if (getUserId.equalsIgnoreCase(user) && getAtdDate.equalsIgnoreCase(convertAttendanceDate)) {
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk1 = pendingTableXpath.get(i).findElement(
								By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][10]//input"));
						if (approve1 == true) {
							if (element_isSelected(approveChk1) != true) {
								element_Click(approveChk1);
							}
						} else {
							if (element_isSelected(approveChk1) == true) {
								element_Click(approveChk1);
							}
						}
					}
					if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk1 = pendingTableXpath.get(i).findElement(
								By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][11]//input"));
						if (reject1 == true) {
							if (element_isSelected(rejectChk1) != true) {
								element_Click(rejectChk1);
							}
						} else {
							if (element_isSelected(rejectChk1) == true) {
								element_Click(rejectChk1);
							}
						}
					}
					Thread.sleep(1000);
					// break;
				}
				Thread.sleep(1000);
			}
			saveButtonClick();
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
			//reloadPageButtonClick();
		}
	}
	
	public void validateAuthorizedAtdCorrectAppInRIC(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filtersDrop, "Individual");
		Thread.sleep(700);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" AttendanceDate: "+data.get("AttendanceDate"));
			String panelName = data.get("PanelName");
			String userID = data.get("UserID");
			String attendanceDate = data.get("AttendanceDate");
			String expStatus = data.get("Status");
			String actStatus = null;
			String convertAttendanceDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			element_Click(viewBtn);
			Thread.sleep(1500);
			if (panelName.equalsIgnoreCase("Approved")) {
				if (approvedPanelOpenOrNot.size() > 0) {
					element_Click(approvedPanel);
				}
			} else if (panelName.equalsIgnoreCase("Rejected")) {
				if (rejectedPanelOpenOrNot.size() > 0) {
					element_Click(rejectedPanel);
				}
			}
			if (allPanelTableUserIdXpath.size() > 0) {
				for (int i = 0; i < allPanelTableUserIdXpath.size(); i++) {
					String getUsrId = allPanelTableUserIdXpath.get(i).getText();
					String getAtdDate = allPanelTableUserIdXpath.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][3]/label"))
							.getText();
					if (getUsrId.equalsIgnoreCase(userID) && getAtdDate.equalsIgnoreCase(convertAttendanceDate)) {
						actStatus = expStatus;
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}
}
