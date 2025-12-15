package PageObject.LeaveManagement;

import java.io.IOException;
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

public class COFFApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(COFFApplicationPO.class);
	
	public COFFApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id= "CAUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_Todate")
	private WebElement toDateTxt;

	@FindBy(id = "cboLeaveID")
	private WebElement leaveDrop;

	@FindBy(id = "btnSave")
	private WebElement submitBtn;

	@FindBy(id = "imgSelCoff")
	private WebElement selectCOffHrsIcon;

	@FindBy(xpath = "//*[@id='div_grd_leaveBal']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> panelTable;

	@FindBy(id = "cboFromHalf")
	private WebElement fullDayHalfDayDrop1;

	@FindBy(xpath = "//*[@class='panel']//*[@id='btnSave']")
	private WebElement selectBtn;

	@FindBy(id = "txtRemarks")
	private WebElement reasonTxt;

	@FindBy(id = "ChkMedCert")
	private WebElement medicalCertAvailChk;

	@FindBy(xpath = "//*[@class=\"fa fa-upload\"]")
	private WebElement uploadBtn;
	
	///////////////////
	
	public void coffApplicationFromSA(DataTable dataTable) throws InterruptedException, IOException {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" FromDate: "+data.get("FromDate"));
			String userID = data.get("UserID");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String duration = data.get("Duration");
			String leave = data.get("Leave");
			String atdDate = data.get("AtdDate");
			String selectCOffHrs = data.get("SelectCOffHrs");
			String reason = data.get("Reason");
			String medCertAvail = data.get("MedCertAvail");
			String medCert = data.get("MedCert");
			String validation = data.get("Validation");
			String convrtdFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
			String convrtdToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
			Thread.sleep(500);
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userID);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(500);
			addButtonClick();
			Thread.sleep(1000);
			waitForElementVisible(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convrtdFromDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convrtdToDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(toDateTxt);
			Thread.sleep(500);
			if (duration != null) {
				element_DropDownSelectByvisibleText(fullDayHalfDayDrop1, duration);
				Thread.sleep(500);
			}
			element_DropDownSelectByvisibleText(leaveDrop, leave);
			Thread.sleep(500);
			element_Click(selectCOffHrsIcon);
			Thread.sleep(2000);
			waitForElementVisible(driver.findElement(By.xpath("//*[text()='Leave Balance Detail']")));
			String convrtdAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
			for (int i = 0; i < panelTable.size(); i++) {
				String getAtdDate = panelTable.get(i).getText();
				if (getAtdDate.equalsIgnoreCase(convrtdAtdDate)) {
					WebElement selectCOffTxt = panelTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]/input"));
					Thread.sleep(500);
				//	element_InputDataUsingJS(selectCOffTxt, selectCOffHrs);
					element_inputTextUsingActionClassCharacterOneByOne(selectCOffTxt, selectCOffHrs);
				}
			}
			Thread.sleep(500);
			element_Click(selectBtn);
			if (reason != null) {
				element_Clear(reasonTxt);
				element_InputTextUsingActionClass(reasonTxt, reason);
			}
			if (medCertAvail != null) {
				boolean medCertAvail1 = Boolean.parseBoolean(medCertAvail);
				if (medCertAvail1 == true) {
					if (element_isSelected(medicalCertAvailChk) != true) {
						element_Click(medicalCertAvailChk);
					}
				} else {
					if (element_isSelected(medicalCertAvailChk) == true) {
						element_Click(medicalCertAvailChk);
					}
				}
			}
			Thread.sleep(500);
			if (medCert != null) {
				if (medCert.equalsIgnoreCase("UploadFile")) {
					element_Click(uploadBtn);
					pageLoadWaitng();
					uploadDocumentUsingAutoIT();
				}
			}
			Thread.sleep(500);
			element_Click(submitBtn);
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
			Thread.sleep(1000);
			reloadPageButtonClick();
		}
	}

}
