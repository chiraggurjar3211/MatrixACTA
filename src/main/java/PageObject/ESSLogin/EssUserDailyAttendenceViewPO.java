package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.Iterator;
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

public class EssUserDailyAttendenceViewPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssUserDailyAttendenceViewPO.class);
	
	public EssUserDailyAttendenceViewPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "month")
	private WebElement month;

	@FindBy(id = "TargetYear")
	private WebElement year;

	@FindBy(id = "templateList")
	private WebElement tempalteList;

	@FindBy(xpath = "//*[@id=\"div_grd_gvDailyAttendance\"]//*[@id=\"grid1\"]/thead/tr/th[not(@hidden)]/mx-label[not(@hidden)]/label[not(contains(text(),'Details'))]")
	private List<WebElement> header;

	@FindBy(xpath = "//*[@id=\"div_grd_gvDailyAttendance\"]//*[@id=\"grid1\"]/tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> dateField;

	@FindBy(xpath = "//*[@value=\"monthyear\"]")
	private WebElement radioBtnMonthYear;

	@FindBy(id = "btnExport")
	private WebElement exporteditBtn;

	@FindBy(id = "FileFormates")
	private WebElement fileformat;

	@FindBy(id = "btnApply")
	private WebElement exportBtn;
	
	@FindBy(xpath = "//*[@value='date']")
	private WebElement radioBtnDate;
	
	@FindBy(id = "_txtFromDt")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_txtToDt")
	private WebElement toDtTxt;


	public void essDailyAttendenceViewFormat(String typeselection, String fromOrMonth, String toOrYear, DataTable dataTable)
			throws Exception {
		waitForElementVisible(month);
		// Mayank - Date Condition added
		if (typeselection.equalsIgnoreCase("Month")) {
			element_Click(radioBtnMonthYear);
			Thread.sleep(1000);
			String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(fromOrMonth);
			element_DropDownSelectByvisibleText(month, month1);
			String year1 = staticYearOrPlusMinusYearFromCurrentYear(fromOrMonth, toOrYear);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(1000);
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
		}
		pageLoadWaitng();
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("date")== false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date"));
			String date = null;
			if (data.get("Date") != null) {
				date=staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			}
			for (int i = 0; i < dateField.size(); i++) {
				if (dateField.get(i).getText().equalsIgnoreCase(date)) {
					for (int j = 0; j < headerD.size(); j++) {
						String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j)) + "]";
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

	public void exportReport(String typeselection, String month1, String year1, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		if (typeselection.equalsIgnoreCase("Month")) {
			if (radioBtnMonthYear.isSelected() != true) {
				element_Click(radioBtnMonthYear);
			}
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(month, month1);
			element_DropDownSelectByvisibleText(year, year1);
			Thread.sleep(1000);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ExportReportFormat: "+data.get("ExportReportFormat"));
			String exportreportformat = data.get("ExportReportFormat");
			Thread.sleep(1000);
			element_Click(exporteditBtn);
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(fileformat, exportreportformat);
			Thread.sleep(1000);
			element_Click(exportBtn);
			Thread.sleep(1000);
		}
	}

}
