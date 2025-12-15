package PageObject.TimeAndAttendance;

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
import io.cucumber.datatable.DataTable;


public class AdvanceOTApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AdvanceOTApplicationPO.class);
	public AdvanceOTApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "OTAdvUserID")
	private WebElement userIdTxt;

	@FindBy(id = "_OTDate")
	private WebElement attendanceDateTxt;

	@FindBy(id = "txtOTHrs")
	private WebElement otHoursTxt;

	@FindBy(id = "txtReason")
	private WebElement reasonTxt;

	@FindBy(id = "btnSave")
	private WebElement submitBtn;

	@FindBy(xpath = "//*[contains(@class,\"col-md-12 col-sm-12 removeRightPadding bordercolorForLeaveinfo\")]")
	private WebElement detailGrid;

	@FindBy(xpath = "//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> otApplicationTable;

	@FindBy(id = "txtAppStatus")
	private WebElement applicationStatusTxt;

	// Created by Mayank
	public String advanceOTApplicationAPI(List<String> columnHeader, List<String> apiParameter,
			Map<String, String> data) {
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
		if (columnHeader.contains("OT-date")) {
			if (data.get("OT-date") != null) {
				String date = dateSelectedinddMMyyyy(data.get("OT-date"));
				apiParameter.add("OT-date=" + date);
			}
		}
		if (columnHeader.contains("ot-hours")) {
			if (data.get("ot-hours") != null) {
				apiParameter.add("ot-hours=" + data.get("ot-hours"));
			}
		}
		if (columnHeader.contains("reason")) {
			if (data.get("reason") != null) {
				apiParameter.add("reason=" + data.get("reason"));
			}
		}
		if (columnHeader.contains("Address")) {
			if (data.get("Address") != null) {
				apiParameter.add("Address=" + data.get("Address"));
			}
		}
		if (columnHeader.contains("contact")) {
			if (data.get("contact") != null) {
				apiParameter.add("contact=" + data.get("contact"));
			}
		}
		return apiPar;
	}

	public void createAdvanceOTApp(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" AttendanceDate: "+data.get("AttendanceDate"));
			String userID = data.get("User");
			String attendanceDate = data.get("AttendanceDate");
			String otHours = data.get("OTHours");
			String reason = data.get("Reason");
			String validation = data.get("Validation");
			if (userID != null) {
				addButtonClick();
				Thread.sleep(1000);
				waitForElementVisible(userIdTxt);
				element_Clear(userIdTxt);
				element_dynamicDDSelect(userIdTxt, userID);
				element_TextBoxToClickOnTab(userIdTxt);
			}
			if (attendanceDate != null) {
				String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
				element_Clear(attendanceDateTxt);
				element_InputTextUsingActionClass(attendanceDateTxt, convertAtdDate);
				Thread.sleep(1000);
				element_TextBoxToClickOnTab(attendanceDateTxt);
				Thread.sleep(1000);
			}
			if (otHours != null) {
				element_Clear(otHoursTxt);
				element_inputTextUsingActionClassCharacterOneByOne(otHoursTxt, otHours);
				Thread.sleep(1000);
			}
			if (reason != null) {
				element_Clear(reasonTxt);
				element_InputTextUsingActionClass(reasonTxt, reason);
				element_TextBoxToClickOnTab(reasonTxt);
			}
			Thread.sleep(1000);
			if (element_isEnabled(submitBtn) == true) {
				element_Click(submitBtn);
			}
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
		}
	}

	public void verifyAdvanceOTAppStatus(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		element_Click(detailGrid);
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" OTDate: "+data.get("OTDate"));
			String userId = data.get("User");
			String otDate = data.get("OTDate");
			String expStatus = data.get("Status");
			String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
			String actAppStatus = null;
			element_Clear(userIdTxt);
			element_dynamicDDSelect(userIdTxt, userId);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1500);
			for (int i = 0; i < otApplicationTable.size(); i++) {
				String getOTDate = otApplicationTable.get(i).getText();
				if (getOTDate.equalsIgnoreCase(convertOTDate)) {
					element_Click(otApplicationTable.get(i));
					pageLoadWaitng();
					String fullAppStatus = applicationStatusTxt.getAttribute("value");
					if (fullAppStatus.contains("(")) {
						String[] splitfullAppStatus = fullAppStatus.split(" ");
						actAppStatus = splitfullAppStatus[0];
						Thread.sleep(1000);
					}
				}
			}
			Assert.assertEquals(actAppStatus, expStatus);
		}
	}
}
