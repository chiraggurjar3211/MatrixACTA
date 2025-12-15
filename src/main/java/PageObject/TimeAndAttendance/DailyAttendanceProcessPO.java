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

public class DailyAttendanceProcessPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DailyAttendanceProcessPO.class);
	
	public DailyAttendanceProcessPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_fromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(id = "checkboxIncludeDenieddEvents")
	private WebElement includeDeniedEventsFlag;

	@FindBy(id = "checkboxReprocessAttendanceEvents")
	private WebElement reprocessAtdEventsFlag;

	@FindBy(id = "ID")
	private WebElement userIdTxt;

	@FindBy(xpath = "//*[@value='Process']")
	private WebElement processButton;

	@FindBy(xpath = "//*[@key='btnConfirmOK']")
	private List<WebElement> buttonOKSize;

	@FindBy(xpath = "//*[@key='btnConfirmOK']")
	private WebElement buttonOK;

	/////////////////
	public void dailyAttendanceProcess(String reprocesAtdEvents, String includDeniedEvents, String fromDate,
			String toDate, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String fdate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String tdate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, fdate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, tdate);
		element_TextBoxToClickOnTab(toDateTxt);
		Boolean reprocesAtdEvents1 = Boolean.parseBoolean(reprocesAtdEvents);
		if (reprocesAtdEvents1 == true) {
			if (element_isSelected(reprocessAtdEventsFlag) != true) {
				element_Click(reprocessAtdEventsFlag);
			}
			Thread.sleep(700);
		} else {
			if (element_isSelected(reprocessAtdEventsFlag) == true) {
				element_Click(reprocessAtdEventsFlag);
			}
		}
		Boolean includDeniedEvents1 = Boolean.parseBoolean(includDeniedEvents);
		if (includDeniedEvents1 == true) {
			if (element_isEnabled(includeDeniedEventsFlag) == true) {
				if (element_isSelected(includeDeniedEventsFlag) != true) {
					element_Click(includeDeniedEventsFlag);
				}
			} else {
				if (element_isSelected(includeDeniedEventsFlag) == true) {
					element_Click(includeDeniedEventsFlag);
				}
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			element_dynamicDDSelect(userIdTxt, data.get("UserID"));
			element_TextBoxToClickOnTab(userIdTxt);
		}
		element_Click(processButton);
		if (buttonOKSize.size() > 0) {
			element_Click(buttonOK);
		}
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		String val = validationMessage();
		Assert.assertEquals(val, "Process Completed");
	}
}
