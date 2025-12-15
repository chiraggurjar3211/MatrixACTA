package PageObject.ESSLogin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssAttendanceCorrectionApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssAttendanceCorrectionApplicationPO.class);
	
	public EssAttendanceCorrectionApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_txtPDate")
	private WebElement atdDateTxt;

	@FindBy(id = "cmbShift")
	private WebElement shiftDrop;

	@FindBy(id = "cmbStat")
	private WebElement dayDrop;

	@FindBy(id = "txtReason")
	private WebElement reasonTxt;

	@FindBy(id = "BrkStartTime")
	private WebElement breakStartTimeTxt;

	@FindBy(id = "BrkEndTime")
	private WebElement breakEndTimeTxt;

	@FindBy(id = "btnAppPunch")
	private WebElement allPunchesBtn;

	@FindBy(id = "npunchgridaddBtn")
	private WebElement plusBtn;

	@FindBy(xpath = "//*[@class=\"modal-footer modal-popup-footer\"]//*[@default='Close']")
	private WebElement closeBtn;

	@FindBy(xpath = "//*[@default=\"Break Punches\"]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> breakPunchesPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Break Punches')]")
	private WebElement breakPunchesPanel;

	@FindBy(xpath = "//*[contains(text(),'Application Detail')]")
	private WebElement applicationDetailsTab;

	@FindBy(xpath = "//*[@class=\"col-md-12\"]//table[@class=\"table table-hover table-striped table-condensed table-bordered master-table\"]/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> appDetailsTable;

	@FindBy(xpath = "//*[@class='modal-body modal-body-sm-approval-details']//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//button[@class=\"close\"]")
	private WebElement closeBtnAprvalDetailsPage;

	@FindBy(id = "Time")
	private WebElement timeTxt;

	@FindBy(xpath = "//*[@class=\"grid-raw-size cursor grd-prevent-rtl\"]//*[@id='savebtn']")
	private WebElement saveBtn;

	@FindBy(xpath = "//*[@id='div_grd_npunchgrid']//*[@name='cmnTxtSearch']")
	private WebElement punchDetailsSearch;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody/tr/td[not(@hidden)][2]")
	private WebElement punchDetailsTable;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//a[@id='savebtn' and not(@hidden)]")
	private WebElement okBtn;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@title=\"Delete\" and not(@hidden)]")
	private WebElement deleteBtn;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@title=\"Edit\" and not(@hidden)]")
	private WebElement editBtn;
	
	@FindBy(xpath="//*[@id=\"collapseTwo\"]//*[@placeholder=\"HH:MM\"]")
	private List<WebElement> timeP;

	@FindBy(xpath="//*[@default=\"Status\"]/ancestor::div[@class=\"form-group\"][1]/div[2]/label")
	private WebElement status;
	
	@FindBy(xpath="//*[@default=\"Application Date\"]/ancestor::div[@class=\"form-group\"][1]/div[2]/label")
	private WebElement appDate;
	
	@FindBy(xpath="//*[@id=\"accordion\"]//*[@class=\"form-group\"][2]/label[2]")
	private WebElement userIDName; 
	
	
/////////////////
	public void generateAtdCorrection(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(atdDateTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AttendanceDate: "+data.get("AttendanceDate"));
			String attendanceDate = data.get("AttendanceDate");
			String shift = data.get("Shift");
			String day = data.get("Day");
			String reason = data.get("Reason");
			String breakStartTime = data.get("BreakStartTime");
			String breakEndTime = data.get("BreakEndTime");
			String validation = data.get("Validation");
			String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
			element_Clear(atdDateTxt);
			element_InputTextUsingActionClass(atdDateTxt, convertAtdDate);
			element_TextBoxToClickOnTab(atdDateTxt);
			Thread.sleep(1500);
			element_DropDownSelectByvisibleText(shiftDrop, shift);
			element_DropDownSelectByvisibleText(dayDrop, day);
			if (reason != null) {
				element_Clear(reasonTxt);
				element_InputTextUsingActionClass(reasonTxt, reason);
			}
			for(int i=0;i<timeP.size();i++) {
				String key="Punch"+(i+1)+"-Time";
				if(data.get(key)!=null) {
					timeP.get(i).clear();
					WebElement ele=timeP.get(i);
					element_inputTextUsingActionClassCharacterOneByOne(ele,data.get(key));
					//timeP.get(i).sendKeys(data.get(key));
				}
			}
			if (breakStartTime != null || breakEndTime != null) {
				if (breakPunchesPanelOpenOrNot.size() > 0) {
					element_Click(breakPunchesPanel);
				}
				if (breakStartTime != null) {
					element_Clear(breakStartTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(breakStartTimeTxt, breakStartTime);
					element_TextBoxToClickOnTab(breakStartTimeTxt);
				}
				if (breakEndTime != null) {
					element_Clear(breakEndTimeTxt);
					element_inputTextUsingActionClassCharacterOneByOne(breakEndTimeTxt, breakEndTime);
					element_TextBoxToClickOnTab(breakEndTimeTxt);
				}
			}
			Thread.sleep(1000);
			//Thread.sleep(10000);
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
		}
	}

	public void verifyAtdCorretionApprovalDetails(String atdDate, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(atdDateTxt);
		String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Click(applicationDetailsTab);
		Thread.sleep(1500);
		for (int i = 0; i < appDetailsTable.size(); i++) {
			String getAtdDate = appDetailsTable.get(i).getText();
			if (getAtdDate.equalsIgnoreCase(convertAtdDate)) {
				Thread.sleep(500);
				WebElement aprvlDetailsBtn = appDetailsTable.get(i)
						.findElement(By.xpath("following-sibling::td[not(@hidden)]/i"));
				element_Click(aprvlDetailsBtn);
				pageLoadWaitng();
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

	public void atdCorrectionForNPunchUser(String atdDate, String shift, String day, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(atdDateTxt);
		String convertAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Clear(atdDateTxt);
		element_InputTextUsingActionClass(atdDateTxt, convertAtdDate);
		element_TextBoxToClickOnTab(atdDateTxt);
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(shiftDrop, shift);
		element_DropDownSelectByvisibleText(dayDrop, day);
		Thread.sleep(1000);
		element_Click(allPunchesBtn);
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("action: "+data.get("action"));
			String actualTime = data.get("ActualTime");
			String action = data.get("Action");
			String newTime = data.get("NewTime");
			if (action != null) {
				if (actualTime != null && action.equalsIgnoreCase("edit") && newTime != null) {
					element_Clear(punchDetailsSearch);
					element_InputTextUsingActionClass(punchDetailsSearch, actualTime);
					element_TextBoxToClickOnEnter(punchDetailsSearch);
					Thread.sleep(1000);
					String getTime = punchDetailsTable.getText();
					if (getTime.equalsIgnoreCase(actualTime)) {
						element_Click(editBtn);
						Thread.sleep(700);
						element_Clear(timeTxt);
						element_inputTextUsingActionClassCharacterOneByOne(timeTxt, newTime);
						Thread.sleep(700);
						element_Click(okBtn);
					}
				} else if (action.equalsIgnoreCase("add") && newTime != null) {
					element_Click(plusBtn);
					Thread.sleep(700);
					element_inputTextUsingActionClassCharacterOneByOne(timeTxt, newTime);
					element_TextBoxToClickOnTab(timeTxt);
					element_Click(saveBtn);
				} else if (actualTime != null && action.equalsIgnoreCase("delete")) {
					element_Clear(punchDetailsSearch);
					element_InputTextUsingActionClass(punchDetailsSearch, actualTime);
					element_TextBoxToClickOnEnter(punchDetailsSearch);
					Thread.sleep(1000);
					String getTime = punchDetailsTable.getText();
					if (getTime.equalsIgnoreCase(actualTime)) {
						element_Click(deleteBtn);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
					}
				}
			}
		}
		Thread.sleep(700);
		element_Click(closeBtn);
		Thread.sleep(1500);
		//Thread.sleep(3000);
//		element_Clear(reasonTxt);
//		element_InputTextUsingActionClass(reasonTxt, "Personal1");
//		Thread.sleep(1500);
		//saveButtonClick();
		Actions action=new Actions(driver);
		action.keyDown(Keys.ALT).sendKeys("s").keyUp(Keys.ALT).perform();
		Thread.sleep(2500);
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, "Saved Successfully");
	}
	
	public Map<String, String> getAtdCorGetDataForCustomAlert(String date) throws Exception {
		Map<String, String> cuSData= new HashMap<String, String>();
		waitForElementVisible(atdDateTxt);
		element_Click(applicationDetailsTab);
		Thread.sleep(1500);
		for (int i = 0; i < appDetailsTable.size(); i++) {
			String getAtdDate = appDetailsTable.get(i).getText();
			if (getAtdDate.equalsIgnoreCase(date)) {
				Thread.sleep(500);
				WebElement aprvlDetailsBtn = appDetailsTable.get(i);
				element_Click(aprvlDetailsBtn);
				pageLoadWaitng();
				String[] pS=status.getText().split(" \\(");
				System.out.println(pS[1].replaceAll("\\(", "").replaceAll("\\)", ""));
				cuSData.put("StatusDatetime", pS[1].replaceAll("\\(", "").replaceAll("\\)", "").replace(" ", "-"));
				cuSData.put("ApplicationDate", appDate.getText());
				cuSData.put("Reason", element_getInputControlValue(reasonTxt));
				String[] shiftSplit=element_DropDownFirstSelectedValue(shiftDrop).split("-");
				cuSData.put("Shift",shiftSplit[0] );
				cuSData.put("Day",element_DropDownFirstSelectedValue(dayDrop) );
				cuSData.put("UserName",userIDName.getText() );
				break;
			}
		}
		return cuSData;
	}
}
