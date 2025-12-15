package PageObject.TimeAndAttendance;

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

public class AttendanceCorrectionApprovalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AttendanceCorrectionApprovalPO.class);
	public AttendanceCorrectionApprovalPO(WebDriver driver) {
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

	@FindBy(id = "Filters")
	private WebElement filtersDrop;

	@FindBy(id = "AutoAllUsersID")
	private WebElement userIdTxt;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTableXpath;

	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Approved')]")
	private WebElement approvedPanel;

	@FindBy(xpath = "//label[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]")
	private WebElement rejectedPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;
	
	///////////////
	// Created by Mayank
	// Attendance Correction Approval/Rejection via API
	public String attendanceCorrectionApprovalAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data, String tid) {
		String apiPar = null;

		if (columnHeader.contains("Action")) {
			if (data.get("Action") != null) {
				apiParameter.add("Action=" + data.get("Action"));
			}
		}
		if (columnHeader.contains("userid")) {
			if (data.get("userid") != null) {
				apiParameter.add("userid=" + data.get("userid"));
			}
		}
		apiParameter.add("application-id=" + tid);
		if (columnHeader.contains("Verdict")) {
			if (data.get("Verdict") != null) {
				apiParameter.add("Verdict=" + data.get("Verdict"));
			}
		}
		if (columnHeader.contains("remark")) {
			if (data.get("remark") != null) {
				apiParameter.add("remark=" + data.get("remark"));
			}
		}

		return apiPar;
	}

	public void attendanceCorrectionApprovalSA(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		//pageLoadWaitng();
		
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" AttendanceDate: "+data.get("AttendanceDate"));
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
			String userId = data.get("UserID");
			String attendanceDate = data.get("AttendanceDate");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			String convertAtdDt = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, userId);
			element_TextBoxToClickOnTab(userIdTxt);
			element_Click(viewBtn);
			Thread.sleep(1500);
			for (int i = 0; i < pendingTableXpath.size(); i++) {
				String getUserId = pendingTableXpath.get(i).getText();
				String getAtdDate = pendingTableXpath.get(i)
						.findElement(By.xpath("following-sibling::td[not(@hidden)][3]")).getText();
				if (getUserId.equalsIgnoreCase(userId) && getAtdDate.equalsIgnoreCase(convertAtdDt)) {
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk1 = pendingTableXpath.get(i).findElement(
								By.xpath("following-sibling::td[not(@hidden)][10]//input"));
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
								By.xpath("following-sibling::td[not(@hidden)][11]//input"));
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
			reloadPageButtonClick();
		}
	}
	
	public void validateAuthorizedAtdCorrectApp(String panelName, String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		Thread.sleep(1500);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filtersDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" AttendanceDate: "+data.get("AttendanceDate"));
			String userId = data.get("UserID");
			String attendanceDate = data.get("AttendanceDate");
			String expStatus = data.get("Status");
			String actStatus = null;
			String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, userId);
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
					if (getUsrId.equalsIgnoreCase(userId) && getAtdDate.equalsIgnoreCase(convertAtdDate)) {
						actStatus = expStatus;
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
		Thread.sleep(1500);
	}
}
