package PageObject.TimeAndAttendance;

import static org.testng.Assert.ARRAY_MISMATCH_TEMPLATE;

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


public class DailyAttendenceViewPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DailyAttendenceViewPO.class);
	
	public DailyAttendenceViewPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "UserID")
	private WebElement userId;

	@FindBy(id = "month")
	private WebElement month;

	@FindBy(id = "TargetYear")
	private WebElement year;

	@FindBy(id = "templateList")
	private WebElement tempalteList;

	@FindBy(xpath = "//*[@id=\"div_grd_gvDailyAttendance\"]//*[@id=\"grid1\"]/thead/tr/th[not(@hidden)]/mx-label[not(@hidden)]/label")
	private List<WebElement> header;

	@FindBy(xpath = "//*[@id=\"div_grd_gvDailyAttendance\"]//*[@id=\"grid1\"]/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> dateField;

	@FindBy(xpath = "//*[@value=\"monthyear\"]")
	private WebElement radioBtnMonthYear;

	@FindBy(xpath = "//*[@default=\"Export\"]")
	private WebElement exporteditBtn;


	@FindBy(xpath = "//*[@value='date']")
	private WebElement radioBtnDate;

	@FindBy(id = "_txtFromDt")
	private WebElement fromDtTxt;

	@FindBy(id = "_txtToDt")
	private WebElement toDtTxt;
	
	@FindBy(xpath="//*[@id=\"gvDailyAttendancerow0\" and not(@hidden)]")
	private WebElement firstTableRow;

	public void fieldValidation(String userid, String typeselection, String fromOrMonth, String toOrYear,
			DataTable dataTable) throws Exception {
		waitForElementVisible(userId);
//		element_Clear(userId);
		
//		element_dynamicDDSelect(userId, userid);
		element_InputTextUsingActionClass(userId, userid);
//		element_TextBoxToClickOnTab(userId);
//		userId.sendKeys(Keys.TAB);
		if (typeselection.equalsIgnoreCase("Month")) {
			element_Click(radioBtnMonthYear);
			Thread.sleep(1000);
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromOrMonth);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromOrMonth, toOrYear);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(500);
		} else {
			element_Click(radioBtnDate);
			Thread.sleep(1000);
			String fromDt = staticDateOrPlusMinusFromCurrentDate(fromOrMonth);
			String toDt = staticDateOrPlusMinusFromCurrentDate(toOrYear);
			element_Clear(fromDtTxt);
			element_InputTextUsingActionClass(fromDtTxt, fromDt);
			Thread.sleep(500);
			element_Clear(toDtTxt);
			element_InputTextUsingActionClass(toDtTxt, toDt);
			element_TextBoxToClickOnTab(toDtTxt);
			Thread.sleep(500);
		}
		waitForElementVisible_TimeinMinutes(firstTableRow, 1);
		
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("date") == false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}

		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Userid: "+userid+" Date: "+data.get("Date"));
			String date = null;
			if (data.get("Date") != null) {
				date = staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			}
			for (int i = 0; i < dateField.size(); i++) {
			
				if (dateField.get(i).getText().equalsIgnoreCase(date)) {
					for (int j = 0; j < headerD.size(); j++) {
						//System.out.println(headerD);
						String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j)) + "]";
						//System.out.println(dynamicXpath);
						String actualV = dateField.get(i).findElement(By.xpath(dynamicXpath)).getText();
						
						if (data.get(headerD.get(j)) != null) {
							Assert.assertEquals(actualV, data.get(headerD.get(j)));
						} else {
							if (actualV.isEmpty() == true) {
								actualV = null;
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							} else {
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							}
						}
					}
				} 
			}
		}
	}

	public int headerIntValue(String name) {
		int findValue = 0;
		for (int i = 1; i <= header.size(); i++) {
			if (header.get(i).getText().toUpperCase().equals(name.toUpperCase())) {
				findValue = i;
				break;
			}
		}
		return findValue;
	}

}
