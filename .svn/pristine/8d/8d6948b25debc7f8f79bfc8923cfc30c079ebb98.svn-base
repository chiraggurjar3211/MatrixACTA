package PageObject.ESSLogin;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;


public class EssTourApplicationApprovalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssTourApplicationApprovalPO.class);
	
	public EssTourApplicationApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTableUserIdXpath;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement pendingCollapsSearchBox;
	
	@FindBy(id = "chkAll")
	private WebElement showAllPendingApp;

	/////////////
	public void tourApplicationApproval(String fromDtHeader, String toDtHeader, String user, String fromDate, String toDate, String approve, String reject,
			String validation) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDtH = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
		String convertToDtH = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDtH);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDtH);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(viewBtn);
		Thread.sleep(1000);
		String convertedFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertedToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(pendingCollapsSearchBox);
		// Thread.sleep(500);
		element_InputTextUsingActionClass(pendingCollapsSearchBox, user);
		element_TextBoxToClickOnEnter(pendingCollapsSearchBox);
		Thread.sleep(1000);
		for (int i = 0; i < pendingTableUserIdXpath.size(); i++) {
			String getUserID = pendingTableUserIdXpath.get(i).getText();
			String getFromDate = pendingTableUserIdXpath.get(i)
					.findElement(By.xpath("following-sibling::td[not(@hidden)][2]")).getText();
			WebElement toDateCol = pendingTableUserIdXpath.get(i)
					.findElement(By.xpath("following-sibling::td[not(@hidden)][3]"));
			String getToDate = toDateCol.getText();
			if (getUserID.equalsIgnoreCase(user) && getFromDate.equalsIgnoreCase(convertedFromDate)
					&& getToDate.equalsIgnoreCase(convertedToDate)) {
				if (approve != null) {
					boolean approve1 = Boolean.parseBoolean(approve);
					WebElement approveChk1 = pendingTableUserIdXpath.get(i)
							.findElement(By.xpath("following-sibling::td[not(@hidden)][8]//input"));
					if (approve1 == true) {
						if (element_isSelected(approveChk1) != true) {
							element_Click(approveChk1);
						}
					} else {
						if (element_isSelected(approveChk1) == true) {
							element_Click(approveChk1);
						}
					}
				}
				if (reject != null) {
					boolean reject1 = Boolean.parseBoolean(reject);
					WebElement rejectChk1 = pendingTableUserIdXpath.get(i)
							.findElement(By.xpath("following-sibling::td[not(@hidden)][9]//input"));
					logger.info(rejectChk1);
					if (reject1 == true) {
						if (element_isSelected(rejectChk1) != true) {
							element_Click(rejectChk1);
						}
					} else {
						if (element_isSelected(rejectChk1) == true) {
							element_Click(rejectChk1);
						}
					}
				}
				Thread.sleep(1000);
			}
		}
		saveButtonClick();
		Thread.sleep(1000);
		String valMsg = validationMessage();
		Thread.sleep(1000);
		Assert.assertEquals(valMsg, "Saved Successfully");
		reloadPageButtonClick();
	}
}
