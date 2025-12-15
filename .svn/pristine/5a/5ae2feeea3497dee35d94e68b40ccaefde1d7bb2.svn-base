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


public class AdvanceOTApprovalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AdvanceOTApprovalPO.class);
	public AdvanceOTApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "filtered")
	private WebElement otDateRadioBtn;

	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;

	@FindBy(id = "Filters")
	private WebElement filterDrop;

	@FindBy(id = "OTUserID")
	private WebElement userIDTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='div_grd_grdPendingOT']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingCollapsTable;

	@FindBy(xpath = "//*[@class=\"anchorclick\"]/ancestor::div[1]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;

	@FindBy(xpath = "//label[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//label[contains(text(),'Approved')]/ancestor::a[1]")
	private WebElement approvedPanel;

	@FindBy(xpath = "//label[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]")
	private WebElement rejectedPanel;

	/////////
	// Created by Mayank
	public String advanceOTApprovalAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data,
			String tid) {
		String apiPar = null;

		if (columnHeader.contains("Action")) {
			if (data.get("Action") != null) {
				apiParameter.add("Action=" + data.get("Action"));
			}
		}
		apiParameter.add("tid=" + tid);
		if (columnHeader.contains("approved")) {
			if (data.get("approved") != null) {
				apiParameter.add("approved=" + data.get("approved"));
			}
		}
		if (columnHeader.contains("ot-hours")) {
			if (data.get("ot-hours") != null) {
				apiParameter.add("ot-hours=" + data.get("ot-hours"));
			}
		}
		if (columnHeader.contains("remark")) {
			if (data.get("remark") != null) {
				apiParameter.add("remark=" + data.get("remark"));
			}
		}
		return apiPar;
	}

	public void advanceOvertimeApproval(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String convertedFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertedToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Click(otDateRadioBtn);
		waitForElementVisible(fromDateTxt);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertedFromDate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertedToDate);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filterDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" OTDate: "+data.get("OTDate"));
			String user = data.get("User");
			String otDate = data.get("OTDate");
			String otHours = data.get("OTHours");
			String approvedHours = data.get("ApprovedHours");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
			element_Clear(userIDTxt);
			element_InputTextUsingActionClass(userIDTxt, user);
			element_TextBoxToClickOnTab(userIDTxt);
			Thread.sleep(1000);
			element_Click(viewBtn);
			Thread.sleep(1500);
			for (int i = 0; i < pendingCollapsTable.size(); i++) {
				String getUsrId = pendingCollapsTable.get(i).getText();
				String getOTDate = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][2]/label"))
						.getText();
				String getOTHours = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][3]/label"))
						.getText();
				System.out.println(getUsrId+getOTDate+getOTHours);
				if (getUsrId.equalsIgnoreCase(user) && getOTDate.equalsIgnoreCase(convertOTDate)
						&& getOTHours.equalsIgnoreCase(otHours)) {
					WebElement approvedHoursTxt = pendingCollapsTable.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][5]/input"));
					Thread.sleep(1000);
					element_Clear(approvedHoursTxt);
					Thread.sleep(500);
					element_inputTextUsingActionClassCharacterOneByOne(approvedHoursTxt, approvedHours);
					element_TextBoxToClickOnTab(approvedHoursTxt);
					Thread.sleep(1000);
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingCollapsTable.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][6]//input"));
						if (approve1 == true) {
							if (element_isSelected(approveChk) != true) {
								element_Click(approveChk);
							}
						} else {
							if (element_isSelected(approveChk) == true) {
								element_Click(approveChk);
							}
						}
					}
					if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk = pendingCollapsTable.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][7]//input"));
						if (reject1 == true) {
							if (element_isSelected(rejectChk) != true) {
								element_Click(rejectChk);
							}
						} else {
							if (element_isSelected(rejectChk) == true) {
								element_Click(rejectChk);
							}
						}
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
		}
	}

	public void verifyAdvanceOTAppApprovalStatus(String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		element_Click(otDateRadioBtn);
		waitForElementVisible(fromDateTxt);
		String convertedFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertedToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertedFromDate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertedToDate);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filterDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("User: "+data.get("User")+" OTDate: "+data.get("OTDate"));
			String panelName = data.get("PanelName");
			String user = data.get("User");
			String otDate = data.get("OTDate");
			String otHours = data.get("OTHours");
			String expStatus = data.get("Status");
			String actStatus = null;
			String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
			element_Clear(userIDTxt);
			element_InputTextUsingActionClass(userIDTxt, user);
			element_TextBoxToClickOnTab(userIDTxt);
			Thread.sleep(1000);
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
			Thread.sleep(1500);
			if (allPanelTableUserIdXpath.size() > 0) {
				for (int i = 0; i < allPanelTableUserIdXpath.size(); i++) {
					String getUsrId = allPanelTableUserIdXpath.get(i).getText();
					String getOTDate = allPanelTableUserIdXpath.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][2]/label"))
							.getText();
					String getOTHours = allPanelTableUserIdXpath.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][3]/label"))
							.getText();
					if (getUsrId.equalsIgnoreCase(user) && getOTDate.equalsIgnoreCase(convertOTDate)
							&& getOTHours.equalsIgnoreCase(otHours)) {
						actStatus = expStatus;
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}

}
