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

public class OvertimeCOffEntryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(OvertimeCOffEntryPO.class);
	public OvertimeCOffEntryPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);

	}
	// Elements

	@FindBy(id = "userID")
	private WebElement usrId;

	@FindBy(id = "_txtPDate")
	private WebElement dateTxt;

	@FindBy(name = "componentList")
	private WebElement componentDrop;

	@FindBy(name = "selectedCboType")
	private WebElement entryTypeDrop;

	@FindBy(xpath = "//*[@title=\"Set Modification Allowed Months\"]/i")
	private WebElement modifyDate;

	@FindBy(id = "cboDateSelection")
	private WebElement customDrop;

	@FindBy(id = "txtAlwMonth")
	private WebElement periodTxt;

	@FindBy(id = "value")
	private WebElement valueTxt;

	@FindBy(xpath = "//*[@key='btnPro']")
	private WebElement processBtn;

	@FindBy(xpath = "//*[@class=\"form-hr\"]//table/thead/tr/th[not(@hidden)]")
	private List<WebElement> header;

	@FindBy(xpath = "//*[@class=\"form-hr\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> componentField;

	@FindBy(xpath = "//*[@class=\"col-md-4 col-sm-4 col-xs-12 grid\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> dateField;
	
	//////////////////

	public void manualOvertimeCOffEntry(String userId, String atdDate, DataTable dataTable)
			throws InterruptedException {
		waitForElementVisible(usrId);
		element_dynamicDDSelect(usrId, userId);
		Thread.sleep(500);
		element_InputTextUsingActionClass(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		element_Click(modifyDate);
		Thread.sleep(500);
		element_Click(customDrop);
		element_DropDownSelectByvisibleText(customDrop, "Custom Period");
		Thread.sleep(500);
		periodTxt.sendKeys(Keys.CONTROL + "a");
		periodTxt.sendKeys(Keys.DELETE);
		element_InputTextUsingActionClass(periodTxt, "99");
		Thread.sleep(1000);
		String dt1 = staticDateOrPlusMinusFromCurrentDate(atdDate);
		System.out.println(" Date of  "+dt1);
		element_Clear(dateTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(dateTxt, dt1);
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(dateTxt);
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Component: "+data.get("Component")+" EntryType: "+data.get("EntryType")+" Value: "+data.get("Value"));
			String component = data.get("Component");
			String entryType = data.get("EntryType");
			String value = data.get("Value");
			String validation = data.get("Validation");
			String tm1 = staticTimeOrPlusMinusHoursFromCurrentTime(value);
			Thread.sleep(1000);
			element_Click(componentDrop);
			element_DropDownSelectByvisibleText(componentDrop, component);
			Thread.sleep(1000);
			element_Click(entryTypeDrop);
			element_DropDownSelectByvisibleText(entryTypeDrop, entryType);
			Thread.sleep(1000);
			element_Clear(valueTxt);
			//Thread.sleep(700);
			element_inputTextUsingActionClassCharacterOneByOne(valueTxt, tm1);
			Thread.sleep(500);
			element_Click(processBtn);
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
		}
	}

	public void verifyOvertimeCOffEntry(String userID, String atdDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(usrId);
		element_Clear(usrId);
		element_dynamicDDSelect(usrId, userID);
		element_TextBoxToClickOnTab(usrId);
		element_InputTextUsingActionClass(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		element_Click(modifyDate);
		Thread.sleep(500);
		element_Click(customDrop);
		element_DropDownSelectByvisibleText(customDrop, "Custom Period");
		Thread.sleep(500);
		periodTxt.sendKeys(Keys.CONTROL + "a");
		periodTxt.sendKeys(Keys.DELETE);
		element_InputTextUsingActionClass(periodTxt, "99");
		Thread.sleep(1000);
		String dt1 = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Clear(dateTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(dateTxt, dt1);
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(dateTxt);
		Thread.sleep(2000);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("Component") == false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Component: "+data.get("Component"));
			for (int i = 0; i < componentField.size(); i++) {
				if (componentField.get(i).getText().equalsIgnoreCase(data.get("Component"))) {
					for (int j = 0; j < headerD.size(); j++) {
						String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j)) + "]";
						String actualV = componentField.get(i).findElement(By.xpath(dynamicXpath)).getText();
						if (data.get(headerD.get(j)) != null) {
							Assert.assertEquals(actualV, data.get(headerD.get(j)));
						} else {
							if (actualV.isEmpty() == true || actualV.equalsIgnoreCase("-")) {
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
	
	public void verifyTotalOTCOffCrDrEntry(String userID, String atdDate, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(usrId);
		element_Clear(usrId);
		element_dynamicDDSelect(usrId, userID);
		element_TextBoxToClickOnTab(usrId);
		Thread.sleep(500);
		element_inputTextUsingActionClassCharacterOneByOne(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		//element_InputDataUsingJS(dateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		Thread.sleep(500);
		element_Click(modifyDate);
		Thread.sleep(500);
		//element_Click(customDrop);
		element_DropDownSelectByvisibleText(customDrop, "Custom Period");
		Thread.sleep(500);
		periodTxt.sendKeys(Keys.CONTROL + "a");
		periodTxt.sendKeys(Keys.DELETE);
		element_InputTextUsingActionClass(periodTxt, "99");
		Thread.sleep(1000);
		String dt1 = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Clear(dateTxt);
		Thread.sleep(1000);
		element_inputTextUsingActionClassCharacterOneByOne(dateTxt, dt1);
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(dateTxt);
		Thread.sleep(2000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Date: "+data.get("Date"));
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			String totalOTCredit = data.get("TotalOTCredit");
			String totalOTDebit = data.get("TotalOTDebit");
			String totalCOFFCredit = data.get("TotalC-OFFCredit");
			String totalCOFFDebit = data.get("TotalC-OFFDebit");
			for(int i=0; i< dateField.size(); i++) {
				String getDate = dateField.get(i).getText();
				if(getDate.equalsIgnoreCase(date)) {
					if(totalOTCredit != null) {
						String getTotalOTCredit = dateField.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
						Assert.assertEquals(getTotalOTCredit, totalOTCredit);
					}
					if(totalOTDebit != null) {
						String getTotalOTDebit = dateField.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
						Assert.assertEquals(getTotalOTDebit, totalOTDebit);
					}
					if(totalCOFFCredit != null) {
						String getTotalCOFFCredit = dateField.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
						Assert.assertEquals(getTotalCOFFCredit, totalCOFFCredit);
					}
					if(totalCOFFDebit != null) {
						String getTotalOTDebit = dateField.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
						Assert.assertEquals(getTotalOTDebit, totalCOFFDebit);
					}
				}
			}
		}
	}
}
