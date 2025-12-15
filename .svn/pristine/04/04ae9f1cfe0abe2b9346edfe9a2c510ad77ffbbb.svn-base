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

public class EssShortLeaveOfficialInOutAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssShortLeaveOfficialInOutAuthorizationPO.class);

	public EssShortLeaveOfficialInOutAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id = "_txtFrmDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_txtToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "btnView")
	private WebElement btnView;
	
	@FindBy(xpath = "//*[@class='panel-collapse collapse panel-collapse-custom show']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;
	
	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Approved')]")
	private WebElement approvedPanel;
	
	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected') and not(@hidden)]")
	private WebElement rejectedPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@placeholder=\"Search\"]")
	private WebElement searchBox;
	
	//////////
	public void authorizeShortLeaveOfficialInOutFromRIC(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		//pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(btnView);
		Thread.sleep(1000);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userID = data.get("UserID");
			String Date = data.get("Date");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(Date);
			String specialFunction = data.get("SpecialFunction");
			String startTime = data.get("Start");
			String endTime = data.get("End");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			for(int i=0; i<pendingTable.size(); i++) {
				String getUsrId = pendingTable.get(i).getText();
				String getDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
				String getSpecialFunction = pendingTable.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
				String getStartTime = pendingTable.get(i).findElement(By.xpath("following-sibling::td[6]")).getText();
				String getEndTime = pendingTable.get(i).findElement(By.xpath("following-sibling::td[7]")).getText();
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate) && getSpecialFunction.equalsIgnoreCase(specialFunction) && getStartTime.equalsIgnoreCase(startTime) && getEndTime.equalsIgnoreCase(endTime)){
					Thread.sleep(1000);
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[11]//input"));
						if (approve1 == true) {
							if (element_isSelected(approveChk) != true) {
								element_Click(approveChk);
							}
						} else {
							if (element_isSelected(approveChk) == true) {
								element_Click(approveChk);
							}
						}
					}
					if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[12]//input"));
						if (reject1 == true) {
							if (element_isSelected(rejectChk) != true) {
								element_Click(rejectChk);
							}
						} else {
							if (element_isSelected(rejectChk) == true) {
								element_Click(rejectChk);
							}
						}
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
		}
	}
	
	public void validateShortLvOfficialINOUTAppApproval(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		//pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(btnView);
		Thread.sleep(1000);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date")+" SpecialFunction: "+data.get("SpecialFunction"));
			String panelName = data.get("PanelName");
			String userID = data.get("UserID");
			String Date = data.get("Date");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(Date);
			String specialFunction = data.get("SpecialFunction");
			String startTime = data.get("Start");
			String endTime = data.get("End");
			String expStatus = data.get("Status");
			String actStatus = null;
			if (panelName.equalsIgnoreCase("Approved")) {
				if (approvedPanelOpenOrNot.size() >0) {
					element_Click(approvedPanel);
					Thread.sleep(1000);
				}
			}else if(panelName.equalsIgnoreCase("Rejected")) {
				if (rejectedPanelOpenOrNot.size() >0) {
					element_Click(rejectedPanel);
					Thread.sleep(1000);
				}
			}
			Thread.sleep(1500);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			if (allPanelTableUserIdXpath.size() > 0) {
				for (int i = 0; i < allPanelTableUserIdXpath.size(); i++) {
					String getUsrId = allPanelTableUserIdXpath.get(i).getText();
					String getDate = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
					String getSpecialFunction = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
					String getStartTime = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[6]")).getText();
					String getEndTime = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[7]")).getText();
					if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate) && getSpecialFunction.equalsIgnoreCase(specialFunction) && getStartTime.equalsIgnoreCase(startTime) && getEndTime.equalsIgnoreCase(endTime)) {
						actStatus = expStatus;
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}
}
