package PageObject.ESSLogin;

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

public class EssDailyAttendanceAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssDailyAttendanceAuthorizationPO.class);
	
	public EssDailyAttendanceAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Element
	@FindBy(id = "_fromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_toDate")
	private WebElement toDateTxt;

	@FindBy(id = "filter")
	private WebElement filterUserDrop;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement pendingCollapsSearchBox;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;
	
	@FindBy(xpath = "//*[@id='collapseTwo']//table/tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> authorizedTable;
	
	@FindBy(id = "userID")
	private WebElement userIDTxt;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[contains(text(),'Authorized')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> authorizedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Authorized')]")
	private WebElement authorizedPanel;

////////////////////////

	public void authorizeDailyAttendanceByRIC(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String valMsg = null;
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(viewBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userId = data.get("UserID");
			String date = data.get("Date");
			String authorize = data.get("Authorize");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			element_Clear(pendingCollapsSearchBox);
			element_InputTextUsingActionClass(pendingCollapsSearchBox, userId);
			element_TextBoxToClickOnEnter(pendingCollapsSearchBox);
			Thread.sleep(1000);
			for (int i = 0; i < pendingTable.size(); i++) {
				String getUserID = pendingTable.get(i).getText();
				String getDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
						.getText();
				if (getUserID.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)) {
					boolean authorize1 = Boolean.parseBoolean(authorize);
					WebElement authorizeChk = pendingTable.get(i)
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
		}
	}
	
	public void validateAuthorizedDailyAttendance(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_DropDownSelectByvisibleText(filterUserDrop, "Individual");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userId = data.get("UserID");
			String date=data.get("Date");
			String expStatus = data.get("Status");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			String actStatus = null;
			element_Clear(userIDTxt);
			Thread.sleep(700);
			element_InputTextUsingActionClass(userIDTxt, userId);
			element_TextBoxToClickOnTab(userIDTxt);
			Thread.sleep(1000);
			element_Click(viewBtn);
			Thread.sleep(1000);
			if (authorizedPanelOpenOrNot.size() > 0) {
				element_Click(authorizedPanel);
			}
			Thread.sleep(1500);
			for (int i = 0; i < authorizedTable.size(); i++) {
				String getUsrId = authorizedTable.get(i).getText();
				String getDate = authorizedTable.get(i).findElement(By.xpath("following-sibling::td[2]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)) {
					actStatus = "Authorized";
					Thread.sleep(1000);
					break;
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}
}
