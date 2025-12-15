package PageObject.ESSLogin;

import java.time.Duration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class AssignAwardPenaltyHoursPO extends AbstractMethod{
	WebDriver driver;
	public AssignAwardPenaltyHoursPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	
	@FindBy(id = "loading-overlay")
	private List<WebElement> pageOnLoadCount;
	
	@FindBy(id = "TSJPCUserID")
	private WebElement useridtext;
	
	@FindBy(id = "TSJPCUserName")
	private WebElement userNametext;
	
	
	@FindBy(id = "_PDate")
	private WebElement datetext;
	
	@FindBy(id = "txtReason")
	private WebElement reasontxt;
	
	@FindBy(id = "AdjmntImgList_0")
	private WebElement row1Adjustment;
	
	@FindBy(id = "cmbAdjustmentType")
	private WebElement adjustmentTypeDD;
	
	@FindBy(id="txtApplicationDate")
	private WebElement applicationApplyDate;
	
	@FindBy(id = "txtAdjHours")
	private WebElement adjustmentHrstxt;
	
	@FindBy(id = "txtAdjRemark")
	private WebElement adjustmentRemarktxt;
	
	@FindBy(id = "btnOk")
	private WebElement okBtn;
	
	public static Map<String, String> assignAPDataForCustom=new HashMap<String, String>();
	//Functions
	// By Mayank
	public String assignAwardPenaltyHours(String userid, String date, String adjustmentType, String hours, String remark, String reason) throws InterruptedException {
		String val;
		pageLoadWaitng();
		waitForElementVisible(useridtext);
		if (userid != null) {
			element_Clear(useridtext);
			element_dynamicDDSelect(useridtext, userid);
		}
		Thread.sleep(1000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(180));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.elementToBeClickable(cancelButton));
			Thread.sleep(1000);
		}
		assignAPDataForCustom.put("userId", element_getInputControlValue(useridtext));
		assignAPDataForCustom.put("userName", element_getInputControlValue(userNametext));
		cancelButtonClick();
		if (date != null) {
			String pdate=dateSelectedinddMMyyyy(date);
			element_Clear(datetext);
			element_InputTextUsingActionClass(datetext, pdate);
			Thread.sleep(1000);
			}
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.elementToBeClickable(reasontxt));
			Thread.sleep(1000);
		}
		assignAPDataForCustom.put("ApplcationDate", element_getInputControlValue(datetext));
		if (reason != null) {
			element_Clear(reasontxt);
			element_InputTextUsingActionClass(reasontxt, reason);
		}
		assignAPDataForCustom.put("Reason", reason);
		Thread.sleep(1000);
		element_Click(row1Adjustment);
		Thread.sleep(5000);
		if (adjustmentType != null) {
			element_DropDownSelectByvisibleText(adjustmentTypeDD, adjustmentType);
		}
		if (hours != null) {
			element_Clear(adjustmentHrstxt);
			element_inputTextUsingActionClassCharacterOneByOne(adjustmentHrstxt, hours);
		}
		if (remark != null) {
			element_Clear(adjustmentRemarktxt);
			element_inputTextUsingActionClassCharacterOneByOne(adjustmentRemarktxt, remark);
		}
		String transacton1=element_DropDownFirstSelectedValue(adjustmentTypeDD)+"-"+element_getInputControlValue(adjustmentHrstxt)+"-"+element_getInputControlValue(adjustmentRemarktxt);
		assignAPDataForCustom.put("newTransactionValue", transacton1);
		element_Click(okBtn);
		Thread.sleep(1000);
		saveButtonClick();
		assignAPDataForCustom.put("ApplicationAppliedOn", dateSelectedinddMMyyyyWithSlash("0"));
		val = validationMessage();
		return val;
	}
	
}
