package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ShortLeaveOfficialInOutEntryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ShortLeaveOfficialInOutEntryPO.class);
	public ShortLeaveOfficialInOutEntryPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);

	}
	
	//*****************************************************************
	//   Elements
	//*****************************************************************
	@FindBy(id = "AutoAllUsersID")
	private WebElement userIdTxt;

	@FindBy(id = "_txtPDate")
	private WebElement atdDateTxt;

	@FindBy(id = "cmbShift")
	private WebElement shiftDrop;

	@FindBy(id = "cmbStat")
	private WebElement dayDrop;

	@FindBy(id = "cboManABPRMrk")
	private WebElement manualStatusMarkingDD;

	@FindBy(id = "txtRemark")
	private WebElement remarkTxt;

	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@placeholder=\"HH:MM\"]")
	private List<WebElement> timeP;

	@FindBy(xpath = "//*[@class=\"panel-body no-padding\"]//*[contains(@id,\"CboSpFn\")]")
	private List<WebElement> spFunctionsDD;

	

	
	
	
	//*****************************************************************
	// Functions
	// *****************************************************************
	public void shortLeaveOfficialInOutEntry(Map<String, String> data) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		String userID = data.get("UserID");
		String attendanceDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
		String validation = data.get("Validation");
		element_Clear(userIdTxt);
		element_dynamicDDSelect(userIdTxt, userID);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(1500);
		element_Clear(atdDateTxt);
		element_InputTextUsingActionClass(atdDateTxt, attendanceDate);
		Thread.sleep(2000);
		for (int i = 0; i < timeP.size(); i++) {
			String punchTime = "Punch" + (i + 1) + "-Time";
			String spFunc = "SpFunction" + (i + 1);
			if (data.get(punchTime) != null) {
				//timeP.get(i).clear();
				//timeP.get(i).sendKeys(data.get(punchTime));
				//element_inputTextUsingActionClassCharacterOneByOne(timeP.get(i), data.get(punchTime));
				if (data.get(spFunc) != null) {
					element_DropDownSelectByvisibleText(spFunctionsDD.get(i), data.get(spFunc));
					Thread.sleep(500);
				}
			}
		}
		saveButtonClick();
		String valMsg = validationMessage();
		Assert.assertEquals(valMsg, validation);
		reloadPageButtonClick();
		
		
	}

}
