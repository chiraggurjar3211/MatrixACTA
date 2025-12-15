package PageObject.CafeteriaManagement;

import java.util.ArrayList;
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

public class CafeteriaUsagePolicyPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(CafeteriaUsagePolicyPO.class);
	
	public CafeteriaUsagePolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(xpath = "//*[@gridname='grdRightSideCafeteriaUsagePolicy']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allPlcNames;
	
	@FindBy(xpath = "//*[@gridname='grdRightSideCafeteriaUsagePolicy']//*[@name='cmnTxtSearch']")
	private WebElement searchBar;
	
	@FindBy(id = "CafeteriaUsagePolicyName")
	private WebElement nameTxt;
	
	@FindBy(xpath = "//*[contains(@class,'collapsed')]//*[@key='Daily Restrictions']")
	private List<WebElement> dailyPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Daily Restrictions']")
	private WebElement dailyPanel;
	
	@FindBy(id = "itemPickListDailyName")
	private WebElement dailyRestrictItemTxt;
	
	@FindBy(id = "txtMaxQuantityAllowedDaily")
	private WebElement dailyMaxItemQuantityTxt;
	
	@FindBy(id = "cboOnExceedingMaximumQuantityDaily")
	private WebElement dailyItemExceedingMaxQuantityDD;
	
	@FindBy(id = "btnAddDaily")
	private WebElement dailyItemRestAddBtn;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	@FindBy(id = "RestrictOutofShiftEnbl")
	private WebElement dailyShiftRestrictionFlg;
	
	@FindBy(id = "cboRestrictOutOfShiftTimings")
	private WebElement dailyShiftRestrictionActionDD;
	
	@FindBy(xpath = "//*[@class='checkbox-inline checkbox-inline-width']")
	private List<WebElement> dayRestriction;
	
	@FindBy(xpath = "//*[contains(@class,'collapsed')]//*[@key='Monthly Restrictions']")
	private List<WebElement> monthlyPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Monthly Restrictions']")
	private WebElement monthlyPanel;
	
	@FindBy(id = "itemPickListMonthlyName")
	private WebElement monthlyRestrictItemTxt;
	
	@FindBy(id = "txtMaxQuantityAllowedMonthly")
	private WebElement monthlyMaxItemQuantityTxt;
	
	@FindBy(id = "cboOnExceedingMaximumQuantityMonthly")
	private WebElement monthlyItemExceedingMaxQuantityDDD;
	
	@FindBy(id = "btnAddMonthly")
	private WebElement monthlyItemRestAddBtn;
	
	@FindBy(xpath = "//*[contains(@class,'collapsed')]//*[@key='Weekly Restrictions']")
	private List<WebElement> weeklyPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Weekly Restrictions']")
	private WebElement weeklyPanel;
	
	@FindBy(id = "ChkWeeklyRstrn")
	private WebElement weeklyRestrictionFlg;
	
	@FindBy(id = "txtMaxWeeklyLimit")
	private WebElement maximumWeeklyLimitTxt;
	
	// COde
	public void createCafeUsagePolicy(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchBar)) {
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(1000);
			ArrayList<String> allPlc = new ArrayList<>();
			if (allPlcNames.size() > 0) {
				for (int j = 0; j < allPlcNames.size(); j++) {
					String plcName = allPlcNames.get(j).getText();
					allPlc.add(plcName);
					if (plcName.equalsIgnoreCase(data.get("Name"))) {
						allPlcNames.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!allPlc.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(nameTxt);
				element_InputTextUsingActionClass(nameTxt, data.get("Name"));
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, data.get("Name"));
		}
		// Main Code
		// Daily Panel
		if (data.get("DailyRestrictItem") != null || data.get("DailyMaxItemQuantity") != null || data.get("DailyItemExceedingMaxQuantity") != null || data.get("DailyShiftRestriction") != null || data.get("DailyShiftRestrictionAction") != null || data.get("DailyDayRestrictions") != null) {
			if (dailyPanelOpenOrNot.size()>0) {
				element_Click(dailyPanel);
			}
			Thread.sleep(1000);
			if (data.get("DailyRestrictItem") != null || data.get("DailyMaxItemQuantity") != null || data.get("DailyItemExceedingMaxQuantity") != null) {
				element_Clear(dailyRestrictItemTxt);
				element_InputTextUsingActionClass(dailyRestrictItemTxt, data.get("DailyRestrictItem"));
				element_Click(blank);
				Thread.sleep(500);
				element_Clear(dailyMaxItemQuantityTxt);
				element_InputTextUsingActionClass(dailyMaxItemQuantityTxt, data.get("DailyMaxItemQuantity"));
				Thread.sleep(500);
				element_DropDownSelectByvisibleText(dailyItemExceedingMaxQuantityDD, data.get("DailyItemExceedingMaxQuantity"));
				Thread.sleep(500);
				element_Click(dailyItemRestAddBtn);
				Thread.sleep(500);
			}
			if (data.get("DailyShiftRestriction") != null || data.get("DailyShiftRestrictionAction") != null) {
				boolean dailyShiftRestriction = Boolean.parseBoolean(data.get("DailyShiftRestriction"));
				if (dailyShiftRestriction==true) {
					if (!dailyShiftRestrictionFlg.isSelected()) {
						element_Click(dailyShiftRestrictionFlg);
					}
				} else {
					if (dailyShiftRestrictionFlg.isSelected()) {
						element_Click(dailyShiftRestrictionFlg);
					}
				}
				if (dailyShiftRestrictionFlg.isSelected()) {
					element_DropDownSelectByvisibleText(dailyShiftRestrictionActionDD, data.get("DailyShiftRestrictionAction"));
				}
			}
			Thread.sleep(500);
			if (data.get("DailyDayRestrictions") != null) {
				String[] commaSeparatedValues = data.get("DailyDayRestrictions").split(",");
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					String day = commaSeparatedValues[i].trim().toUpperCase();
					for (int j = 0; j < dayRestriction.size(); j++) {
						String label = dayRestriction.get(j).findElement(By.xpath("child::mx-label")).getText().toUpperCase();
						if (label.equalsIgnoreCase(day)) {
							element_Click(dayRestriction.get(j).findElement(By.xpath("child::input")));
							break;
						}
					}
				}
			}
			Thread.sleep(1000);
		}
		// Monthly
		if (data.get("MonthlyRestrictItem") != null || data.get("MonthlyMaxItemQuantity") != null || data.get("MonthlyItemExceedingMaxQuantity") != null) {
			if (monthlyPanelOpenOrNot.size()>0) {
				element_Click(monthlyPanel);
			}
			Thread.sleep(1000);
			element_Clear(monthlyRestrictItemTxt);
			element_InputTextUsingActionClass(monthlyRestrictItemTxt, data.get("MonthlyRestrictItem"));
			element_Click(blank);
			Thread.sleep(500);
			element_Clear(monthlyMaxItemQuantityTxt);
			element_InputTextUsingActionClass(monthlyMaxItemQuantityTxt, data.get("MonthlyMaxItemQuantity"));
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(monthlyItemExceedingMaxQuantityDDD, data.get("MonthlyItemExceedingMaxQuantity"));
			Thread.sleep(500);
			element_Click(monthlyItemRestAddBtn);
			Thread.sleep(500);
		}
		// Weekly
		if (data.get("WeeklyRestriction") != null || data.get("MaximumWeeklyLimit") != null) {
			if (weeklyPanelOpenOrNot.size()>0) {
				element_Click(weeklyPanel);
			}
			Thread.sleep(1000);
			boolean weeklyRestriction = Boolean.parseBoolean(data.get("WeeklyRestriction"));
			if (weeklyRestriction==true) {
				if (!weeklyRestrictionFlg.isSelected()) {
					element_Click(weeklyRestrictionFlg);
				}
			} else {
				if (weeklyRestrictionFlg.isSelected()) {
					element_Click(weeklyRestrictionFlg);
				}
			}
			Thread.sleep(500);
			element_Clear(maximumWeeklyLimitTxt);
			element_InputTextUsingActionClass(maximumWeeklyLimitTxt, data.get("MaximumWeeklyLimit"));
			Thread.sleep(1000);
		}
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	public void deleteCafeUsagePlc(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchBar)) {
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(1000);
			ArrayList<String> allPlc = new ArrayList<>();
			if (allPlcNames.size() > 0) {
				for (int j = 0; j < allPlcNames.size(); j++) {
					String plcName = allPlcNames.get(j).getText();
					allPlc.add(plcName);
					if (plcName.equalsIgnoreCase(data.get("Name"))) {
						allPlcNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			// logger.debug(ar);
			if (!allPlc.contains(data.get("Name"))) {
				logger.info("Plc not found");
			}
		} else {
			logger.info("Plc not found");
		}
	}

}
