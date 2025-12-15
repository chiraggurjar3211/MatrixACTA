package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class NPunchViewPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(NPunchViewPO.class);

	public NPunchViewPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "NPunchUserID")
	private WebElement userIdTxt;

	@FindBy(id = "_txtPDate")
	private WebElement dateTxt;

	@FindBy(xpath = "//*[@title=\"Set Modification Allowed Selection\"]")
	private WebElement modifyDate;

	@FindBy(xpath = "//*[@name=\"cboDateSelection1\"]")
	private WebElement customDrop;

	@FindBy(id = "txtAlwMonth")
	private WebElement periodTxt;

	@FindBy(xpath = "//*[@id='txtGrossWHrs' and contains(@class,'NPunchViewTextboxCss')]")
	private WebElement GrossWrkHrsTxt;

	@FindBy(xpath = "//footer/div[@class=\"col-lg-12 col-md-12 hidden-sm hidden-xs grid\"]//td/input")
	private List<WebElement> npunchDetailsXpath;

	@FindBy(id = "btnNet_Add")
	private WebElement plusBtn;

	@FindBy(xpath = "//*[@class='row inlinegrd']//table/tbody/tr/td[3]")
	private List<WebElement> punchDetailsTable;

	@FindBy(id = "txtTime")
	private WebElement addTimeTxt;

	@FindBy(xpath = "//*[@class='grid-raw-size cursor grd-prevent-rtl RTLCenter']//a[@title=\"OK\"  and not(@hidden)]//i[@class='fa fa-check']")
	private WebElement okBtn;

	@FindBy(xpath = "//*[@class='grid-raw-size cursor']/i")
	private WebElement deleteButton;

	@FindBy(xpath = "//*[@key='btnExport']/i")
	private WebElement exportButton;
	//////////////////

	public void npunchDetails(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: " + data.get("UserId") + " AttendanceDate: " + data.get("AttendanceDate"));
			String userId = data.get("UserId");
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String expStatus = data.get("Status");
//			element_Clear(userIdTxt);
			element_InputText(userIdTxt, userId);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(500);
			element_InputDataUsingJS(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
			element_Click(modifyDate);
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(customDrop, "Custom Period");
			Thread.sleep(500);
			element_Click(periodTxt);
			element_Clear(periodTxt);
			Thread.sleep(500);
			element_InputTextUsingActionClass(periodTxt, "99");
			Thread.sleep(1000);
			element_Clear(dateTxt);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(dateTxt, attendanceDate);
			element_TextBoxToClickOnTab(dateTxt);
			Thread.sleep(2000);
			ArrayList<String> npunchDetails = new ArrayList<String>();
			for (WebElement ele : npunchDetailsXpath) {
				npunchDetails.add(ele.getAttribute("value"));
			}
			logger.info(npunchDetails);
			if (data.get("GrossWorkHours") != null) {
				Assert.assertEquals(npunchDetails.get(0), data.get("GrossWorkHours"));
			}
			if (data.get("TotalOutTime") != null) {
				Assert.assertEquals(npunchDetails.get(1), data.get("TotalOutTime"));
			}
			if (data.get("N-PunchWorkHours") != null) {
				Assert.assertEquals(npunchDetails.get(2), data.get("N-PunchWorkHours"));
			}
			if (data.get("ExtraWorkHours") != null) {
				Assert.assertEquals(npunchDetails.get(3), data.get("ExtraWorkHours"));
			}
			if (data.get("AuthorizedOvertime") != null) {
				Assert.assertEquals(npunchDetails.get(4), data.get("AuthorizedOvertime"));
			}
			if (expStatus != null) {
				String[] expStatusAr = expStatus.split("-");
				Assert.assertEquals(npunchDetails.get(5), expStatusAr[0]);
				Assert.assertEquals(npunchDetails.get(6), expStatusAr[1]);
			}
			Thread.sleep(1000);
			reloadPageButtonClick();
			// Thread.sleep(1000);
		}
	}

	public void addEditNPunchDetails(String userID, String atdDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1500);
		waitForElementVisible(userIdTxt);
		String attendanceDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
//		element_Clear(userIdTxt);
		element_InputText(userIdTxt, userID);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(500);
//		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(250);
		element_InputDataUsingJS(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		element_Click(modifyDate);
		Thread.sleep(500);
		element_Click(customDrop);
		Thread.sleep(5000);
		element_DropDownSelectByvisibleText(customDrop, "Custom Period");
		Thread.sleep(500);
		periodTxt.sendKeys(Keys.CONTROL + "a");
		periodTxt.sendKeys(Keys.DELETE);
		element_InputTextUsingActionClass(periodTxt, "99");
		Thread.sleep(1000);
		element_Clear(dateTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(dateTxt, attendanceDate);
		element_TextBoxToClickOnTab(dateTxt);
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(" Action: " + data.get("Action"));
			String actualTime = data.get("ActualTime");
			String action = data.get("Action");
			String newTime = data.get("NewTime");
			String specialFunction = data.get("SpecialFunction");
			if (newTime != null && action.equalsIgnoreCase("add")) {
				element_Click(plusBtn);
				Thread.sleep(700);
				element_InputTextUsingActionClass(addTimeTxt, newTime);
				Thread.sleep(500);
				element_Click(okBtn);
				Thread.sleep(500);
			} else if (actualTime != null && action.equalsIgnoreCase("edit")) {
				for (int i = 0; i < punchDetailsTable.size(); i++) {
					Thread.sleep(1000);
					WebElement timeTxt = punchDetailsTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
					WebElement editBtn = punchDetailsTable.get(i).findElement(By.xpath("following-sibling::td[4]/i"));
					if (actualTime.equalsIgnoreCase(timeTxt.getText())) {
						Thread.sleep(1000);
						element_Click(editBtn);
						Thread.sleep(1000);
						WebElement editTime = punchDetailsTable.get(i)
								.findElement(By.xpath("following-sibling::td[1]/input"));
						WebElement editOKBtn = punchDetailsTable.get(i)
								.findElement(By.xpath("following-sibling::td[4]//i[@class='fa fa-check']"));
						Thread.sleep(500);
						if (newTime != null) {
							element_Clear(editTime);
							Thread.sleep(500);
							element_inputTextUsingActionClassCharacterOneByOne(editTime, newTime);
							// element_TextBoxToClickOnTab(editTime);
							Thread.sleep(700);
						}
						if (specialFunction != null) {
							WebElement spfDrop = punchDetailsTable.get(i).findElement(By.xpath(
									"following-sibling::td[3]/select[@id='specialFunc' and not(contains(@class,'ng-hide'))]"));
							element_DropDownSelectByvisibleText(spfDrop, specialFunction);
							Thread.sleep(700);
						}
						element_Click(editOKBtn);
						Thread.sleep(2500);
					}
				}
			} else if (actualTime != null && action.equalsIgnoreCase("delete")) {
				for (int i = 0; i < punchDetailsTable.size(); i++) {
					logger.info("Hello1");
					WebElement timeTxt = punchDetailsTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
					if (actualTime.equalsIgnoreCase(timeTxt.getText())) {
						WebElement deleteBtn = punchDetailsTable.get(i)
								.findElement(By.xpath("following-sibling::td[5]/i"));
						element_Click(deleteBtn);
						Thread.sleep(700);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
					}
				}
			}
		}
	}

	public void exportNPunchData(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AttendanceDate: " + data.get("AttendanceDate") + " UserID: " + data.get("UserID"));
			String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, data.get("UserID"));
			element_TextBoxToClickOnTab(userIdTxt);
			element_InputDataUsingJS(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
			element_Click(modifyDate);
			Thread.sleep(500);
			element_Click(customDrop);
			Thread.sleep(5000);
			element_DropDownSelectByvisibleText(customDrop, "Custom Period");
			Thread.sleep(500);
			periodTxt.sendKeys(Keys.CONTROL + "a");
			periodTxt.sendKeys(Keys.DELETE);
			element_InputTextUsingActionClass(periodTxt, "99");
			Thread.sleep(1000);
			element_Clear(dateTxt);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(dateTxt, attendanceDate);
			element_TextBoxToClickOnTab(dateTxt);
			Thread.sleep(2000);
			element_Click(exportButton);
			Thread.sleep(1000);
		}
	}
}
