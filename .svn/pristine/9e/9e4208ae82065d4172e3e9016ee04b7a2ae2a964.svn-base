package PageObject.LeaveManagement;

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

public class COFFEncashmentPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(COFFEncashmentPO.class);

	public COFFEncashmentPO(WebDriver driver) {

		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "COFFPK_userID")
	private WebElement usrIdTxt;

	@FindBy(id = "leave")
	private WebElement leaveDrop;

	@FindBy(id = "days")
	private WebElement encshModeDrop;

	@FindBy(xpath = "//*[@class='col-md-2 removeLeftPadding']//*[@class='btn-icon fa fa-edit mx-input-theme cursor']")
	private WebElement addTotHrsBtn;

	@FindBy(id = "days")
	private WebElement daysTxt;

	@FindBy(xpath = "//*[@class='modal-body modal-body-md']//table/tbody/tr/td[1]")
	private List<WebElement> cOffSelectionTable;

	@FindBy(xpath = "//*[@key='btnSelect']")
	private WebElement updateBtn;

	@FindBy(xpath = "//*[@key='btnApply']")
	private WebElement applyBtn;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[not(@hidden)][4]/label")
	private List<WebElement> rightGridTable;

	/////////////////

	public void cOffEncashment(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(usrIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: "+data.get("UserId")+" Leave: "+data.get("Leave")+" EncashMode: "+data.get("EncashMode"));
			String userId = data.get("UserId");
			String leave = data.get("Leave");
			String encashMode = data.get("EncashMode");
			String atdDate = data.get("AtdDate");
			String hours = data.get("Hours");
			String validation = data.get("Validation");
			String convertedAtdDate = null;
			if (atdDate != null) {
				convertedAtdDate = staticDateOrPlusMinusFromCurrentDate(atdDate);
			}
			Thread.sleep(500);
			element_Clear(usrIdTxt);
			element_InputTextUsingActionClass(usrIdTxt, userId);
			element_TextBoxToClickOnTab(usrIdTxt);
			pageLoadWaitng();
			addButtonClick();
			Thread.sleep(1500);
			element_DropDownSelectByvisibleText(leaveDrop, leave);
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(encshModeDrop, encashMode);
			Thread.sleep(1000);
			if (encashMode.equalsIgnoreCase("Defined")) {
				element_Click(addTotHrsBtn);
				pageLoadWaitng();
				for (int i = 0; i < cOffSelectionTable.size(); i++) {
					String atdDate1 = cOffSelectionTable.get(i).getText();
					if (atdDate1.equalsIgnoreCase(convertedAtdDate)) {
						WebElement selectCOffTxt = cOffSelectionTable.get(i)
								.findElement(By.xpath("following-sibling::td[2]/input"));
						element_Clear(selectCOffTxt);
						element_inputTextUsingActionClassCharacterOneByOne(selectCOffTxt, hours);
					}
				}
				Thread.sleep(1000);
				element_Click(updateBtn);
			}
			Thread.sleep(1000);
			element_Click(applyBtn);
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
		}
	}

	public void verifyCOffEncashment(String userId, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(usrIdTxt);
		boolean expRes = true;
		boolean actRes = false;
		element_Clear(usrIdTxt);
		element_InputTextUsingActionClass(usrIdTxt, userId);
		element_TextBoxToClickOnTab(usrIdTxt);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("userId: "+userId+" C-OffHours: "+data.get("C-OffHours"));
			String cOffHours = data.get("C-OffHours");
			actRes = false;
			Thread.sleep(1000);
			if (rightGridTable.size() > 0) {
				Thread.sleep(1900);
				logger.debug(rightGridTable.size()); 
				for (int i = 0; i <rightGridTable.size(); i++) {
					String getHrs = rightGridTable.get(i).getText();
					if(getHrs.equalsIgnoreCase(cOffHours)) {
						actRes =true;
						break;
					}
				}
			}
			Assert.assertEquals(actRes, expRes);
		}
	}
}
