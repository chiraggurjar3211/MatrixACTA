package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class HolidaySchedulePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(HolidaySchedulePO.class);
	
	public HolidaySchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//********************************************************************************
	//***********************ELEMENTS***********************************************
	//********************************************************************************
	
	@FindBy(xpath = "//*[@name='cmnTxtSearch' and not(@disabled)]")
	private WebElement searchTextBoxTitleBar;
	
	@FindBy(xpath = "//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> allHSNames;
	
	@FindBy(id = "plstHolidayScheduleName")
	private WebElement hsNameTxt;
	
	// Configure Holidays Grid
	@FindBy(id = "grdHolidayMemDetailaddBtn")
	private WebElement grdHolidayaddBtn;

	@FindBy(xpath = "//*[contains(@id,'grdHolidayMemDetailrow')]//*[@title='Delete']")
	private List<WebElement> gridHolidayDeleteBtns;

	@FindBy(xpath = "//*[@id='grdHolidayMemDetailrow0']//*[@title='Delete']")
	private WebElement gridHolidayDeleteBtn;
	
	@FindBy(id = "_FromDate")
	private WebElement grdFromDtTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement grdToDtTxt;
	
	@FindBy(id = "HolidayName")
	private WebElement grdHolidayNameTxt;
	
	@FindBy(id = "HLDSyncToDevice")
	private WebElement grdSyncedToDeviceFlag;
	
	@FindBy(xpath = "//*[@id=\"savebtn\" and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	
	//********************************************************************************
	//***********************FUNCTIONS***********************************************
	//********************************************************************************
	
	public void createHolidaySchedule(String hsName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, hsName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allHS = new ArrayList<>();
			if (allHSNames.size() > 0) {
				for (int j = 0; j < allHSNames.size(); j++) {
					String hsName1 = allHSNames.get(j).getText();
					allHS.add(hsName1);
					if (hsName1.equalsIgnoreCase(hsName)) {
						allHSNames.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!allHS.contains(hsName)) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(hsNameTxt);
				element_InputTextUsingActionClass(hsNameTxt, hsName);
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(hsNameTxt);
			element_InputTextUsingActionClass(hsNameTxt, hsName);
		}
		// Main Code
		//Delete already configured grid components for newly updated configuration if any
		while (gridHolidayDeleteBtns.size()!=0) {
			element_Click(gridHolidayDeleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		//Add components in grid
		for (int i = 0; i < data.size(); i++) {
			String holidayFromDate = data.get(i).get("FromDate");
			String holidayToDate = data.get(i).get("ToDate");
			String holidayName = data.get(i).get("HolidayName");
			String deviceSynced = data.get(i).get("DeviceSynced");
			element_Click(grdHolidayaddBtn);
			Thread.sleep(500);
			if (holidayFromDate != null) {
				logger.info("FromDate: "+holidayFromDate);
				String date = staticDateOrPlusMinusFromCurrentDate(holidayFromDate);
				element_Clear(grdFromDtTxt);
				element_InputTextUsingActionClass(grdFromDtTxt, date);
			}
			if (holidayToDate != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(holidayToDate);
				element_Clear(grdToDtTxt);
				element_InputTextUsingActionClass(grdToDtTxt, date);
			}
			if (holidayName != null) {
				element_Clear(grdHolidayNameTxt);
				element_InputTextUsingActionClass(grdHolidayNameTxt, holidayName);
			}
			if (deviceSynced != null) {
				boolean deviceSynced1 = Boolean.parseBoolean(deviceSynced);
				if (deviceSynced1==true) {
					if (!grdSyncedToDeviceFlag.isSelected()) {
						element_Click(grdSyncedToDeviceFlag);
					}
				}
				else {
					if (grdSyncedToDeviceFlag.isSelected()) {
						element_Click(grdSyncedToDeviceFlag);
					}
				}
			}
			Thread.sleep(500);
			element_Click(gridSaveBtn);
			Thread.sleep(1000);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	public void deleteHolidaySchedule(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("HSName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allHS = new ArrayList<>();
			if (allHSNames.size() > 0) {
				for (int j = 0; j < allHSNames.size(); j++) {
					String hsName1 = allHSNames.get(j).getText();
					allHS.add(hsName1);
					if (hsName1.equalsIgnoreCase(data.get("HSName"))) {
						allHSNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
						logger.debug("Holiday Schedule Deleted Succcessfully");
					}
				}
			}
		} else {
			logger.debug("Holiday Schedule Not Found");
		}
	}
}
