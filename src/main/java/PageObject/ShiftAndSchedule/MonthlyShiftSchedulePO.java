package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;


public class MonthlyShiftSchedulePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(MonthlyShiftSchedulePO.class);
	
	public MonthlyShiftSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************************ELEMENTS************************************
	@FindBy(id = "AutoUserID")
	private WebElement userIDTxt;
	
	@FindBy(xpath = "//*[contains(@class,\"fc-daygrid-day-events\")]")
	private List<WebElement> shiftIDs;
	
	@FindBy(xpath = "//*[contains(@class,\"fc-daygrid-day-top\")]")
	private List<WebElement> dates;
	
	@FindBy(id = "cboMonth")
	private WebElement monthDD;
	
	@FindBy(id = "cboYear")
	private WebElement yearDD;
	
	//****************************FUNCTIONS************************************
	
	public boolean verifyShiftProcessedOrNot(String userID) throws InterruptedException {
		waitForElementVisible(userIDTxt);
		element_Clear(userIDTxt);
		element_InputTextUsingActionClass(userIDTxt, userID);
		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		Thread.sleep(1000);
		ArrayList<String> shifts = new ArrayList<>();
		for (WebElement ele : shiftIDs) {
			String shift = ele.getText();
			shifts.add(shift);
		}
		boolean shiftPresent = false;
		for (String string : shifts) {
			if (!string.isEmpty()) {
				shiftPresent = true;
				break;
			}
		}
		return shiftPresent;
	}
	
	// Mayank
	public void verifyShiftWoPhcodes(String shiftCode, String userID, String month,String year, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(userIDTxt);
		element_InputTextUsingActionClass(userIDTxt, userID);
		element_Click(driver.findElement(By.xpath("//html")));
		String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		element_DropDownSelectByvisibleText(monthDD, month1);
		String year1 = staticYearOrPlusMinusYearFromCurrentYear(month, year);
		element_DropDownSelectByvisibleText(yearDD, year1);
		Thread.sleep(3000);
		Map<String, String> dateWithThierShift = new LinkedHashMap<String, String>();
		for (int i = 0; i < dates.size(); i++) {
            String key = dates.get(i).getText();
            String value = shiftIDs.get(i).getText();
            dateWithThierShift.put(key, value);
        }
		logger.debug(dateWithThierShift);
		String validateDates = data.get("Validation");
		if (validateDates != null) {
			if (validateDates.contains(",")) {
				String[] commaSeparatedValues = validateDates.split(",");
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					String date = commaSeparatedValues[i].trim().toUpperCase();
					String actualshiftid = dateWithThierShift.get(date);
					String verify = "Shift is incorrect";
					if (actualshiftid.contains(shiftCode)) {
						verify = "Shift is correct";
					}
					Assert.assertEquals(verify, "Shift is correct");
				}
			}
			else {
				String date = validateDates;
				String actualshiftid = dateWithThierShift.get(date);
				String verify = "Shift is incorrect";
				if (actualshiftid.contains(shiftCode)) {
					verify = "Shift is correct";
				}
				Assert.assertEquals(verify, "Shift is correct");
			}
		}
	}
}
