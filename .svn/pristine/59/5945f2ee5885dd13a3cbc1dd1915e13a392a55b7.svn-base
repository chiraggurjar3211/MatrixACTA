package PageObject.TimeAndAttendance;

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
import io.cucumber.datatable.DataTable;

public class ShiftWiseManagementPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ShiftWiseManagementPO.class);
	public ShiftWiseManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_txtPDate")
	private WebElement atdDateTxtBox;
	
	@FindBy(id = "cboMode")
	private WebElement filterUsersDD;

	@FindBy(id = "SWMOrganizationID")
	private WebElement idTextBox;
	
	@FindBy(xpath = "//*[@default='View']")
	private WebElement viewButton;
	
	@FindBy(xpath = "//*[@default='Search']")
	private WebElement searchTxt;
	
	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> shiftIDColumn;
	
	@FindBy(xpath = "//table/thead/tr/th[not(@hidden)]")
	private List<WebElement> header;

	/////////////

	public void viewShiftWiseManagementData(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(atdDateTxtBox);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				if (header.get(i).get(j).equalsIgnoreCase("AttendanceDate")== false && header.get(i).get(j).equalsIgnoreCase("FilterUsers")== false && header.get(i).get(j).equalsIgnoreCase("ID")== false && header.get(i).get(j).equalsIgnoreCase("Shift ID")== false) {
					headerD.add(header.get(i).get(j));
				}
			}
		}
		logger.info(headerD);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AttendanceDate: "+data.get("AttendanceDate")+" ID: "+data.get("ID"));
			String atdDate = staticDateOrPlusMinusFromCurrentDate(data.get("AttendanceDate"));
			String filterUsers = data.get("FilterUsers");
			String id = data.get("ID");
			String shiftId= data.get("Shift ID");
			element_Clear(atdDateTxtBox);
			element_InputTextUsingActionClass(atdDateTxtBox, atdDate);
			Thread.sleep(1000);
			if(filterUsers != null) {
				element_DropDownSelectByvisibleText(filterUsersDD, filterUsers);
				Thread.sleep(1000);
			}
			if(id != null && element_isEnabled(idTextBox) == true) {
				element_Clear(idTextBox);
				element_InputTextUsingActionClass(idTextBox, id);
				element_TextBoxToClickOnTab(idTextBox);
				Thread.sleep(1000);
			}
			element_Click(viewButton);
			Thread.sleep(1500);
			element_Clear(searchTxt);
			element_InputTextUsingActionClass(searchTxt, shiftId);
			element_TextBoxToClickOnEnter(searchTxt);
			Thread.sleep(2000);
			for (int i = 0; i < shiftIDColumn.size(); i++) {
				if (shiftIDColumn.get(i).getText().equalsIgnoreCase(shiftId)) {
					for (int j = 0; j < headerD.size(); j++) {
						String dynamicXpath = "following-sibling::td[" + headerIntValue(headerD.get(j)) + "]";
						String actualV = shiftIDColumn.get(i).findElement(By.xpath(dynamicXpath)).getText();
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
