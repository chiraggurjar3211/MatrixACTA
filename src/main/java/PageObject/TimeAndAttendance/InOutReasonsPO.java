package PageObject.TimeAndAttendance;

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
import io.cucumber.datatable.DataTable;

public class InOutReasonsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(InOutReasonsPO.class);
	public InOutReasonsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "Reason")
	private WebElement reasonTxtBox;

	@FindBy(xpath = "//*[@name=\"Type\"]")
	private WebElement typeDD;
	
	@FindBy(xpath = "//*[@name=\"cmnTxtSearch\"]")
	private WebElement inOutReasonSearch;
	
	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> inOutReasonNames; 

	///////////////////
	public void createInOutReasons(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(reasonTxtBox);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Reason: "+data.get("Reason"));
			String reason = data.get("Reason");
			String type = data.get("Type");
			String validation = data.get("Validation");
			addButtonClick();
			Thread.sleep(500);
			element_Clear(reasonTxtBox);
			element_InputTextUsingActionClass(reasonTxtBox, reason);
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(typeDD, type);
			Thread.sleep(500);
			saveButtonClick();
			Thread.sleep(500);
			String valMsg = validationMessage();
			Thread.sleep(500);
			Assert.assertEquals(valMsg, validation);
			reloadPageButtonClick();
			Thread.sleep(500);
		}
	}
	
	public void deleteInOutReasons(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(reasonTxtBox);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Reason: "+data.get("Reason"));
			String reason = data.get("Reason");
			if(element_isEnabled(inOutReasonSearch)) {
				element_Clear(inOutReasonSearch);
				element_InputTextUsingActionClass(inOutReasonSearch, reason);
				element_TextBoxToClickOnEnter(inOutReasonSearch);
				Thread.sleep(1000);
				if (inOutReasonNames.size() > 0) {
					for (int j = 0; j < inOutReasonNames.size(); j++) {
						String reasonName1 = inOutReasonNames.get(j).getText();
						if (reasonName1.equalsIgnoreCase(reason)) {
							inOutReasonNames.get(j).click();
							Thread.sleep(1000);
							deleteButtonClick();
							Thread.sleep(1000);
							driver.switchTo().alert().accept();
							Thread.sleep(1000);
							String valMsg = validationMessage();
							Thread.sleep(1000);
							Assert.assertEquals(valMsg, "Deleted Successfully");
							Thread.sleep(500);
							break;
						}
					}
				}
			}else {
				logger.info("Reason not Found");
			}
			reloadPageButtonClick();
			Thread.sleep(500);
		}
	}
	
}
