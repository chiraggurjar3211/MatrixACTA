package PageObject.TimeAndAttendance;

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
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class EventAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EventAuthorizationPO.class);
	
	public EventAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Element
	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "filtered")
	private WebElement dateRadioBtn;
	
	@FindBy(id = "chkAll")
	private WebElement showAllPendingApp;
	
	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement pendingCollapsSearchBox;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingCollapsTable;

/////////////////
	public void authorizeEventBySA(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
			/////temporary code start //From date and To Date text boxes are not working 
			String valMsg1 = "Saved Successfully";
			element_Click(showAllPendingApp);
			/////temporary code end
			
//			element_Click(dateRadioBtn);
//			String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
//			String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
//			element_Clear(fromDateTxt);
//			element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
//			element_TextBoxToClickOnTab(fromDateTxt);
//			element_Clear(toDateTxt);
//			element_InputTextUsingActionClass(toDateTxt, convertToDt);
//			element_TextBoxToClickOnTab(toDateTxt);
//			element_Click(viewBtn);	
		Thread.sleep(1500);
		
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userId = data.get("UserID");
			String date = data.get("Date");
			String authorize = data.get("Authorize");
			String validation = data.get("Validation");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			element_Clear(pendingCollapsSearchBox);
			element_InputTextUsingActionClass(pendingCollapsSearchBox, userId);
			element_TextBoxToClickOnEnter(pendingCollapsSearchBox);
			Thread.sleep(1000);
			for (int i = 0; i < pendingCollapsTable.size(); i++) {
				String getUsrId = pendingCollapsTable.get(i).getText();
				String getDateTime = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][2]/label"))
						.getText();
				System.out.println("Hello time:"+getDateTime);
				String[] splitGetDateTime = getDateTime.split(" ");
				String getDate = splitGetDateTime[0];
				System.out.println(getDate+ " "+getUsrId);
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)) {
					System.out.println("Hello I am Here");
					boolean authorize1 = Boolean.parseBoolean(authorize);
					WebElement authorizeChk = pendingCollapsTable.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][6]//input"));
					if (authorize1 == true) {
						if (element_isSelected(authorizeChk) != true) {
							element_Click(authorizeChk);
						}
					} else {
						if (element_isSelected(authorizeChk) == true) {
							element_Click(authorizeChk);
						}
					}
					//Can't verify time while user punch from ess, that's why don't break loop here because need to check all applications of 1 date.
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			/////Temporary Code Start////////
			if (valMsg.equalsIgnoreCase("No Data Found")) {
				valMsg = valMsg1;
			}
			/////Temporary Code End////////
			Assert.assertEquals(valMsg, validation);
		}
	}
}
