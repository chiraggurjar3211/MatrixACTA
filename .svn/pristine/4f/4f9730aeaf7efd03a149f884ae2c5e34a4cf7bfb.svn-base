package PageObject.CSSLogin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class CssWorkerProfilePO extends AbstractMethod {
	WebDriver driver;

	public CssWorkerProfilePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// **********************************************************************************************
	// **************** Elements
	// *******************************************************************
	// *********************************************************************************************

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> workerNames;

	@FindBy(xpath = "//html//form")
	private WebElement blankSpace;

	@FindBy(id = "WorkerProfileName")
	private WebElement workerNameTxt;

	@FindBy(id = "WorkerProfileID")
	private WebElement workerIDTxt;

	@FindBy(id = "CWMSkillID")
	private WebElement skillIDTxt;

	@FindBy(id = "CWMWorkOrderID")
	private WebElement workOrderIDTxt;

	@FindBy(id = "_SDate")
	private WebElement assignStartDtTxt;

	@FindBy(xpath = "//*[@id=\"_SDate\"]/ancestor::div[1]/span[1]/i")
	private WebElement startDatePicker;

	@FindBy(id = "_EDate")
	private WebElement assignEndDtTxt;

	@FindBy(xpath = "//*[@id=\"_EDate\"]/ancestor::div[1]/span[1]/i")
	private WebElement endDatePicker;

	@FindBy(id = "btnSendForApproval")
	private WebElement sendApprovalBtn;

//	@FindBy(xpath = "//*[@title='Delete (Alt+L)']")
//	private WebElement deleteButton;

	@FindBy(id = "txtShortName")
	private WebElement assignmentStatusTxt;
	
	@FindBy(xpath="//*[@class=\"close\"]")
	private WebElement valCloseB;
	

	// **********************************************************************************************
	// **************** Functions
	// *******************************************************************
	// *********************************************************************************************

	public void createWorkerProfile(List<String> columnHeader, Map<String, String> data) throws InterruptedException {
		Thread.sleep(1000);
		addButtonClick();
		waitForElementVisible(workerNameTxt);
		// Main Code
		Thread.sleep(1000);
		if (columnHeader.contains("WorkerName")) {
			if (data.get("WorkerName") != null) {
				element_Clear(workerNameTxt);
				element_InputTextUsingActionClass(workerNameTxt, data.get("WorkerName"));
			}
		}

		Thread.sleep(500);
		if (columnHeader.contains("SkillID")) {
			if (data.get("SkillID") != null) {
				element_Clear(skillIDTxt);				
				element_dynamicDDSelect(skillIDTxt, data.get("SkillID"));
//				element_InputTextUsingActionClass(skillIDTxt, data.get("SkillID"));
				element_TextBoxToClickOnTab(skillIDTxt);
			}
		}
		Thread.sleep(500);
		if (columnHeader.contains("WorkOrderID")) {
			if (data.get("WorkOrderID") != null) {
				element_Clear(workOrderIDTxt);
				element_dynamicDDSelect(workOrderIDTxt, data.get("WorkOrderID"));
				element_TextBoxToClickOnTab(workOrderIDTxt);
			}
		}
		Thread.sleep(500);
		if (columnHeader.contains("AssignStartDt")) {
			if (data.get("AssignStartDt") != null) {
				String fromDt1 = staticDateOrPlusMinusFromCurrentDate(data.get("AssignStartDt"));
				element_Clear(assignStartDtTxt);
				element_InputTextUsingActionClass(assignStartDtTxt, fromDt1);
				Thread.sleep(500);
			}
		}
		Thread.sleep(500);
		if (columnHeader.contains("AssignEndDt")) {
			if (data.get("AssignEndDt") != null) {
				String fromDt2 = staticDateOrPlusMinusFromCurrentDate(data.get("AssignEndDt"));
				element_Clear(assignEndDtTxt);
				element_InputTextUsingActionClass(assignEndDtTxt, fromDt2);
				Thread.sleep(500);
			}
		}
		// *********************************************************************************
		Thread.sleep(3000);
		saveButtonClick();
		Thread.sleep(3000);
		String msg = validationMessage();
		Assert.assertEquals(msg, data.get("Validation"));
		element_Click(valCloseB);
		// Send for Approval
		if (sendApprovalBtn.isEnabled()) {
			System.out.println("Send For Approval button is enable");
			element_Click(workerIDTxt);
			Thread.sleep(1000);
			element_Click(sendApprovalBtn);
			String msg2 = validationMessage();
			Assert.assertEquals(msg2, data.get("Validation"));
		}
	}

	public void deleteWorkerProfile(String workerName) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(workerNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, workerName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(workerName)) {
						workerNames.get(j).click();
						Thread.sleep(1000);
						waitForElementVisible(deleteButton);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						String valmsg = validationMessage();
						Assert.assertEquals(valmsg, "Deleted Successfully");
						break;
					}
				}
			}
		}
	}

	public String verifyWorkerID(String name) throws InterruptedException {
		waitForElementVisible(workerNameTxt);
		Thread.sleep(2000);
		waitForElementVisible(workerNameTxt);
		element_InputTextUsingActionClass(workerNameTxt, name);
		element_Click(blankSpace);
		Thread.sleep(2000);
		String userid = workerIDTxt.getAttribute("value");
		return userid;
	}

	// Mayank
	public void verifyWorkerAssignmentStatus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(workerNameTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("WorkerName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workerNames.size() > 0) {
				for (int j = 0; j < workerNames.size(); j++) {
					Thread.sleep(1000);
					String id1 = workerNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("WorkerName"))) {
						workerNames.get(j).click();
						pageLoadWaitng();
						String status = element_getInputControlValue(assignmentStatusTxt);
						Assert.assertEquals(status, data.get("AssignmentStatus"));
					}
				}
			}
			if (!ar.contains(data.get("WorkerName"))) {
				Assert.assertEquals("Worker not exist", "Worker should be exist");
			}
		} else {
			Assert.assertEquals("Worker not exist", "Worker should be exist");
		}
	}

}
