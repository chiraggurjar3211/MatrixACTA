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

public class EssShiftChangeApprovalPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssShiftChangeApprovalPO.class);

	public EssShiftChangeApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "btnView")
	private WebElement btnView;
	
	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;
	
	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a")
	private WebElement approvedPanel;
	
	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a")
	private WebElement rejectedPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@placeholder=\"Search\"]")
	private WebElement searchBox;
	
	@FindBy(id = "filtered")
	private WebElement dateRadio;
	
	/////////////////////
	public void approveRejectShiftChangeApp(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1500);
		element_Click(dateRadio);
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
			String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String newShift = data.get("NewShift");
			String validation = data.get("Validation");
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			for(int i=0; i<pendingTable.size(); i++) {
				String getUsrId = pendingTable.get(i).getText();
				String getFromDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
				String getToDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
				String getNewShiftArray[] = pendingTable.get(i).findElement(By.xpath("following-sibling::td[5]")).getText().split(" ");
				if (getUsrId.equalsIgnoreCase(userID) && getFromDate.equalsIgnoreCase(fromDate) && getToDate.equalsIgnoreCase(toDate) && getNewShiftArray[0].equalsIgnoreCase(newShift) ){
					Thread.sleep(1000);
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[6]//input"));
						if (approve1 == true) {
							if (element_isSelected(approveChk) != true) {
								element_Click(approveChk);
							}
						} else {
							if (element_isSelected(approveChk) == true) {
								element_Click(approveChk);
							}
						}
					}else if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[7]//input"));
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

}
