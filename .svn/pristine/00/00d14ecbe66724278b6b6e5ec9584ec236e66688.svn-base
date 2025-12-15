package PageObject.AccessControlModule;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;


public class SmartAccessRoutePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(SmartAccessRoutePO.class);
	
	public SmartAccessRoutePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "SmartAccessRouteName")
	private WebElement smartAccessRouteName;
	
	@FindBy(id = "chkActive")
	private WebElement smartAccessRouteActiveFlg;
	
	@FindBy(id = "chkSeqRoute")
	private WebElement smartAccessRouteSequencedFlg;
	
	@FindBy(id = "cboHardSoft")
	private WebElement smartAccessRouteRestrictions;
	
	@FindBy(id = "chkReset")
	private WebElement smartAccessRouteResetFlg;
	
	@FindBy(id = "grdSmartAccessRouteaddBtn")
	private WebElement smartAccessRouteConfigureAddBtn;
	
	@FindBy(id = "AutoDoorID")
	private WebElement smartAccessRouteDeviceId;
	
	@FindBy(id = "AutoDoorName")
	private WebElement smartAccessRouteDeviceName;
	
	@FindBy(id = "LvlNo")
	private WebElement smartAccessRouteDeviceLevel;
	
	@FindBy(id = "savebtn")
	private WebElement smartAccessRouteDeviceAdd;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> smartAccessRouteNames;
	
	
	//Main Code
	public void createSmartAccessRoute(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (smartAccessRouteNames.size() > 0) {
				for (int j = 0; j < smartAccessRouteNames.size(); j++) {
					String plcname1 = smartAccessRouteNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(data.get("Name"))) {
						smartAccessRouteNames.get(j).click();
						Thread.sleep(1000);
//						deleteButtonClick();
//						Thread.sleep(1000);
//						driver.switchTo().alert().accept();
//						Thread.sleep(1000);
//						String delVal = validationMessage();
//						Assert.assertEquals(delVal, "Deleted Successfully");
//						Thread.sleep(1000);
//						addButtonClick();
					}
				}
			}
			//logger.info(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
		}
		
		// main code
		if (data.get("Name") != null) {
			element_Clear(smartAccessRouteName);
			element_InputTextUsingActionClass(smartAccessRouteName, data.get("Name"));
		}
		
		if (data.get("smartAccessRouteActive") != null) {
			if(data.get("smartAccessRouteActive").equalsIgnoreCase("true")) {
				if(smartAccessRouteActiveFlg.isSelected() == false) {
					element_Click(smartAccessRouteActiveFlg);
				}
			}else{
				if(smartAccessRouteActiveFlg.isSelected() == true) {
					element_Click(smartAccessRouteActiveFlg);
				}
			}
		}
		
		if (data.get("sequencedRouteActive") != null) {
			if(data.get("sequencedRouteActive").equalsIgnoreCase("true")) {
				if(smartAccessRouteSequencedFlg.isSelected() == false) {
					element_Click(smartAccessRouteSequencedFlg);
				}
			}else{
				if(smartAccessRouteSequencedFlg.isSelected() == true) {
					element_Click(smartAccessRouteSequencedFlg);
				}
			}
		}
		
		if (data.get("restrictions") != null) {
			element_DropDownSelectByValue(smartAccessRouteRestrictions, data.get("restrictions"));
		}
		
		if (data.get("resetOnStartLevel") != null) {
			if(data.get("resetOnStartLevel").equalsIgnoreCase("true")) {
				if(smartAccessRouteResetFlg.isSelected() == false) {
					element_Click(smartAccessRouteResetFlg);
				}
			}else{
				if(smartAccessRouteResetFlg.isSelected() == true) {
					element_Click(smartAccessRouteResetFlg);
				}
			}
		}
		
		Thread.sleep(2000);
		element_Click(smartAccessRouteConfigureAddBtn);
		Thread.sleep(2000);
		if (data.get("deviceID") != null) {
			element_InputTextUsingActionClass(smartAccessRouteDeviceId, data.get("deviceID"));
			element_TextBoxToClickOnTab(smartAccessRouteDeviceId);
		}
		if (data.get("deviceName") != null) {
			element_InputTextUsingActionClass(smartAccessRouteDeviceName, data.get("deviceName"));
			element_TextBoxToClickOnTab(smartAccessRouteDeviceName);
		}
		
		Thread.sleep(2000);
		element_Click(smartAccessRouteDeviceAdd);
		
		Thread.sleep(3000);
		saveButtonClickUsingJS();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}

}