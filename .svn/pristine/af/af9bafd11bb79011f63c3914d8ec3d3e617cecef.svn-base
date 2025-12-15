package PageObject.JobProcessingCosting;

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

public class JobAssignmentProcessPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(JobAssignmentProcessPO.class);
	
	public JobAssignmentProcessPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id = "ddlMnth")
	private WebElement monthDD;
	
	@FindBy(id = "ddlYear")
	private WebElement yearDD;
	
	@FindBy(id = "ID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//*[@default='Process']")
	private WebElement processBtn;
	
	//////////////
	public void jobAssignmentProcess(String month, String year, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(monthDD);
		String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		String year1 = staticYearOrPlusMinusYearFromCurrentYear(month, year);
		element_DropDownSelectByvisibleText(monthDD, month1);
		Thread.sleep(500);
		element_DropDownSelectByvisibleText(yearDD, year1);
		Thread.sleep(500);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			element_InputTextUsingActionClass(userIdTxt, data.get("UserID"));
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(1000);
		}
		element_Click(processBtn);
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		String val=validationMessage();
		Assert.assertEquals(val, "Process Completed");
	}

}
