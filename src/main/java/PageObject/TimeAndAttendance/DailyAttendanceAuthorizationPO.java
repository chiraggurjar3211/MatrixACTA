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
import io.cucumber.datatable.DataTable;

public class DailyAttendanceAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DailyAttendanceAuthorizationPO.class);
	
	public DailyAttendanceAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_fromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_toDate")
	private WebElement _toDateTxt;

	@FindBy(id = "filter")
	private WebElement filterUserDrop;

	@FindBy(id = "userID")
	private WebElement userIDTxt;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='div_grd_gvPending']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingPanelTableXpath;
	
	@FindBy(xpath = "//*[@id='div_grd_gvApproved']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> authorizedPanelTableXpath;

	@FindBy(xpath = "//label[contains(text(),'Authorize')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> authorizedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Authorized')]")
	private WebElement authorizedPanel;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']/ancestor::div[1]//*[@name='cmnTxtSearch']")
	private WebElement searchBoxPendingCollaps;

	/////////////////

	public void authorizeDailyAttendance(String fDate, String tDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String valMsg = null;
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(tDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(_toDateTxt);
		element_InputTextUsingActionClass(_toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(_toDateTxt);
		element_Click(viewBtn);
	//	element_DropDownSelectByvisibleText(filterUserDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String date = data.get("Date");
			String authorize = data.get("Authorize");
			String convertedDate = staticDateOrPlusMinusFromCurrentDate(date);
			element_Clear(searchBoxPendingCollaps);
			element_InputTextUsingActionClass(searchBoxPendingCollaps, userID);
			element_TextBoxToClickOnEnter(searchBoxPendingCollaps);
			Thread.sleep(1000);
//			element_Clear(userIDTxt);
//			element_InputTextUsingActionClass(userIDTxt, userID);
//			element_TextBoxToClickOnTab(userIDTxt);
		//	element_Click(viewBtn);
			//Thread.sleep(1000);
			for (int i = 0; i < pendingPanelTableXpath.size(); i++) {
				String getUserId = pendingPanelTableXpath.get(i).getText();
				String getDate = pendingPanelTableXpath.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
						.getText();
				if (getUserId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertedDate)) {
					boolean authorize1 = Boolean.parseBoolean(authorize);
					WebElement authorizeChk = pendingPanelTableXpath.get(i)
							.findElement(By.xpath("following-sibling::td[12]//input"));
					if (authorize1 == true) {
						if (element_isSelected(authorizeChk) != true) {
							element_Click(authorizeChk);
						}
					} else {
						if (element_isSelected(authorizeChk) == true) {
							element_Click(authorizeChk);
						}
					}
					break;
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, "Saved Successfully");
//			reloadPageButtonClick();
		}
		
	}

	public void verifyAuthorizedDailyAttendance(String fDate, String tDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(tDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(_toDateTxt);
		element_InputTextUsingActionClass(_toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(_toDateTxt);
		element_DropDownSelectByvisibleText(filterUserDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID"));
			String userID = data.get("UserID");
			String date = data.get("Date");
			String expStatus = data.get("Status");
			String convertedDate = staticDateOrPlusMinusFromCurrentDate(date);
			String actStatus = null;
			element_Clear(userIDTxt);
			element_InputTextUsingActionClass(userIDTxt, userID);
			element_TextBoxToClickOnTab(userIDTxt);
			element_Click(viewBtn);
			Thread.sleep(1000);
			if (authorizedPanelOpenOrNot.size() > 0) {
				element_Click(authorizedPanel);
			}
			Thread.sleep(1000);
			for (int i = 0; i < authorizedPanelTableXpath.size(); i++) {
				String getUsrId = authorizedPanelTableXpath.get(i).getText();
				String getDate = authorizedPanelTableXpath.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertedDate)) {
					actStatus = "Authorized";
					Thread.sleep(1000);
					break;
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}
}
