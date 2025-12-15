package PageObject.UserModule;

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

public class HealthRecordsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(HealthRecordsPO.class);
	
	public HealthRecordsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "PLHealthRecordUserID")
	private WebElement userIdTxt;

	@FindBy(id = "PLHealthRecordUserName")
	private WebElement nameTxt;

	@FindBy(id = "_txtFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_txtToDate")
	private WebElement toDateTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id=\"div_grd_gvHealthRecords\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> healthRecordsTable;

	/////////////////////
	public void verifyHealthRecord(String userId, String fromDt, String toDt, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(userIdTxt);
		String fDate = dateSelected(fromDt);
		String tDate = dateSelected(toDt);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, userId);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(500);
		if (!element_getInputControlValue(nameTxt).isBlank() || !element_getInputControlValue(nameTxt).isEmpty()) {
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, fDate);
			element_TextBoxToClickOnTab(fromDateTxt);
			Thread.sleep(500);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, tDate);
			element_TextBoxToClickOnTab(toDateTxt);
			Thread.sleep(1000);
			element_Click(viewBtn);
			Thread.sleep(2000);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Date: "+data.get("Date"));
				String date = data.get("Date");
				String temperature = data.get("Temperature");
				String symptoms = data.get("Symptoms");
				String date1 = dateSelected(date);
				String expTempSym = temperature + " " + symptoms;
				String actTemp = null;
				String actSym = null;
				for (int i = 0; i < healthRecordsTable.size(); i++) {
					String actDate = healthRecordsTable.get(i).getText();
					if (actDate.equalsIgnoreCase(date1)) {
						WebElement temper = healthRecordsTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
						actTemp = temper.getText();
						WebElement symp = healthRecordsTable.get(i).findElement(By.xpath("following-sibling::td[4]"));
						actSym = symp.getText();
					}
				}
				String actTempSym = actTemp + " " + actSym;
				Assert.assertEquals(actTempSym, expTempSym);
			}
		}
	}
}
