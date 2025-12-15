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

public class RestrictedHolidaysPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(RestrictedHolidaysPO.class);
	
	public RestrictedHolidaysPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//********************************************************************************
	//***********************ELEMENTS***********************************************
	//********************************************************************************
	
	@FindBy(xpath = "//*[@class=\"table-responsive\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][2]")
	private List<WebElement> allHSNames;
	
	// Configure Holidays Grid
	@FindBy(id = "gvRHolidayDtladdBtn")
	private WebElement grdHolidayaddBtn;

	
	@FindBy(id = "_HLDDT")
	private WebElement grdDtTxt;

	@FindBy(id = "HLDName")
	private WebElement grdHolidayNameTxt;

	@FindBy(xpath = "//*[@id=\"savebtn\" and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	//********************************************************************************
	// ***********************FUNCTIONS***********************************************
	// ********************************************************************************

	public void createRestrictedHolidaySchedule(String hsName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
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
				logger.debug("Holiday Schedule not found");
				Assert.assertEquals("Holiday Schedule not found", "Holiday schedule should be created");
			}
		} else {
			Thread.sleep(1000);
			logger.debug("Holiday Schedule not found");
			Assert.assertEquals("Holiday Schedule not found", "Holiday schedule should be created");
		}
		// Main Code
		// Add components in grid
		for (int i = 0; i < data.size(); i++) {
			String holidayDate = data.get(i).get("Date");
			String holidayName = data.get(i).get("RestrictedHolidayName");
			Thread.sleep(1000);
			element_Click(grdHolidayaddBtn);
			Thread.sleep(1000);
			if (holidayDate != null) {
				logger.info("HolidayDate: "+holidayDate);
				String date = staticDateOrPlusMinusFromCurrentDate(holidayDate);
				element_Clear(grdDtTxt);
				element_InputTextUsingActionClass(grdDtTxt, date);
			}
			if (holidayName != null) {
				logger.info("HolidayName: "+holidayName);
				element_Clear(grdHolidayNameTxt);
				element_InputTextUsingActionClass(grdHolidayNameTxt, holidayName);
			}
			Thread.sleep(500);
			element_Click(gridSaveBtn);
			Thread.sleep(1000);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	
}
