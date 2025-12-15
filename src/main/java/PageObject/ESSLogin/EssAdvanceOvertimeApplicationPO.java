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

public class EssAdvanceOvertimeApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssAdvanceOvertimeApplicationPO.class);
	
	public EssAdvanceOvertimeApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_OTDate")
	private WebElement attendanceDateTxt;

	@FindBy(id = "txtOTHrs")
	private WebElement otHoursTxt;

	@FindBy(id = "txtReason")
	private WebElement reasonTxt;

	@FindBy(id = "btnSave")
	private WebElement submitBtn;

	@FindBy(xpath = "//*[@class=\"col-md-12 col-sm-12 removeRightPadding bordercolorForLeaveinfo cursor\"]")
	private WebElement detailGrid;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> otApplicationTable;

	@FindBy(id = "txtAppStatus")
	private WebElement applicationStatusTxt;

	@FindBy(xpath = "//*[@id=\"div_grd_grdApprovalDetails\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;

	@FindBy(xpath = "//*[@class=\"close\"]")
	private WebElement closeBtnAprvalDetailsPage;

	/////////////
	public void createAdvanceOvertimeApplication(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("attendanceDate: "+data.get("attendanceDate"));
			String attendanceDate = data.get("AttendanceDate");
			String otHours = data.get("OTHours");
			String reason = data.get("Reason");
			String validation = data.get("Validation");
			if (attendanceDate != null && otHours != null) {
				String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
				addButtonClick();
				Thread.sleep(1000);
				waitForElementVisible(attendanceDateTxt);
				element_Clear(attendanceDateTxt);
				element_InputTextUsingActionClass(attendanceDateTxt, convertAtdDate);
				Thread.sleep(1000);
				element_TextBoxToClickOnTab(attendanceDateTxt);
				element_Clear(otHoursTxt);
				element_InputTextUsingActionClass(otHoursTxt, otHours);
				Thread.sleep(1000);
				if (reason != null) {
					element_Clear(reasonTxt);
					element_InputTextUsingActionClass(reasonTxt, reason);
					element_TextBoxToClickOnTab(reasonTxt);
				}
				Thread.sleep(500);
				element_Click(submitBtn);
			}
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(700);
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
		}
	}

	public void verifyAdvanceOvertimeApplicationStatus(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		element_Click(detailGrid);
		Thread.sleep(2500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("OTDate: "+data.get("OTDate"));
			String otDate = data.get("OTDate");
			String expStatus = data.get("Status");
			String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
			String actAppStatus = null;
			for (int i = 0; i < otApplicationTable.size(); i++) {
				String getOTDate = otApplicationTable.get(i).getText();
				if (getOTDate.equalsIgnoreCase(convertOTDate)) {
					element_Click(otApplicationTable.get(i));
					pageLoadWaitng();
					String fullAppStatus = applicationStatusTxt.getAttribute("value");
					if (fullAppStatus.contains("(")) {
						String[] splitfullAppStatus = fullAppStatus.split(" ");
						actAppStatus = splitfullAppStatus[0];
						Thread.sleep(1500);
					}
				}
			}
			Assert.assertEquals(actAppStatus, expStatus);
		}
	}

	public void validateAdvanceOTAppApprovalDetails(String otDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
		element_Click(detailGrid);
		Thread.sleep(2500);
		for (int i = 0; i < otApplicationTable.size(); i++) {
			String getOTDate = otApplicationTable.get(i).getText();
			if (getOTDate.equalsIgnoreCase(convertOTDate)) {
				Thread.sleep(500);
				WebElement aprvlDetailsBtn = otApplicationTable.get(i)
						.findElement(By.xpath("following-sibling::td[not(@hidden)]/i"));
				Thread.sleep(1000);
				element_Click(aprvlDetailsBtn);
				pageLoadWaitng();
				Thread.sleep(2000);
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Incharge: "+data.get("Incharge"));
			String incharge = data.get("Incharge");
			String status = data.get("Status");
			String actStatus = null;
			String statusColumnValue = null;
			for (int j = 0; j < approvalDetailsTable.size(); j++) {
				String ricName1 = approvalDetailsTable.get(j).getText();
				if (incharge.toUpperCase().equalsIgnoreCase(ricName1.toUpperCase())) {
					WebElement statusColumn = approvalDetailsTable.get(j).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][1]"));
					try {
						if (statusColumn.findElement(By.tagName("img")) != null) {
							statusColumnValue = approvalDetailsTable.get(j).findElement(By.xpath(
									"following-sibling::td[not(@hidden)][1]//img[not(@hidden)]"))
									.getAttribute("src");
							logger.debug("statusColumnValue " + statusColumnValue);
							if (statusColumnValue.contains("/Approved")) {
								actStatus = "Approved";
								break;
							} else if (statusColumnValue.contains("/Rejected")) {
								actStatus = "Rejected";
								break;
							} else if (statusColumnValue.contains("/Pending")) {
								actStatus = "Pending";
								break;
							} else {
								actStatus = "No Application";
								break;
							}
						}
					} catch (org.openqa.selenium.NoSuchElementException e) {
						actStatus = "No Application";
					}
				}
			}
			Thread.sleep(500);
			Assert.assertEquals(actStatus, status);
		}
		Thread.sleep(1000);
		element_Click(closeBtnAprvalDetailsPage);
	}
}
