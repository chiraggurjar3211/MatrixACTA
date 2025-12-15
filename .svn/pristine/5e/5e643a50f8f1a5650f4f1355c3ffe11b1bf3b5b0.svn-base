package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class RicFieldVisitCorrectionAutorizationPO extends AbstractMethod {
	WebDriver driver;

	public RicFieldVisitCorrectionAutorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//input[@name='cmnTxtSearch']")
	private WebElement pendingSearchTxt;

	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;

	@FindBy(xpath = "//*[@id='div_grd_grdRejected']//input[@name='cmnTxtSearch']")
	private WebElement rejectedSearchTxt;

	@FindBy(id = "chkRejectgrdPending")
	private WebElement rejectAllCheckbox;

	@FindBy(id = "chkApprovegrdPending")
	private WebElement approveAllCheckbox;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a")
	private WebElement rejectCollapsiblePanel;

	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//table//tbody//tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> rejectTable;

	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a")
	private WebElement approveCollapsiblePanel;

	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//table//tbody//tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> approveTable;

	////////
	public void fieldVisitCorrectionAuthorization(String fDate, String tDate, String userName, String attendanceDate,
			String approve, String reject, String validaton) throws InterruptedException {
		String valMsg = null;
		String fromDate = staticDateOrPlusMinusFromCurrentDate(fDate);
		String toDate = staticDateOrPlusMinusFromCurrentDate(tDate);
		String atdDate1 = staticDateOrPlusMinusFromCurrentDate(attendanceDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, fromDate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, toDate);
		element_TextBoxToClickOnTab(toDateTxt);
		Thread.sleep(700);
		element_Click(viewBtn);
		Thread.sleep(1000);
		if (element_isEnabled(pendingSearchTxt) == true) {
			element_Clear(pendingSearchTxt);
			element_InputTextUsingActionClass(pendingSearchTxt, userName);
			Thread.sleep(2000);
			pendingSearchTxt.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			for (int i = 0; i < pendingTable.size(); i++) {
				String getUserNm = pendingTable.get(i).getText();
				String getAtdDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
				if (getUserNm.equalsIgnoreCase(userName) && getAtdDate.equalsIgnoreCase(atdDate1)) {
					if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk = pendingTable.get(i)
								.findElement(By.xpath("following-sibling::td[5]//input"));
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
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingTable.get(i)
								.findElement(By.xpath("following-sibling::td[4]//input"));
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
					Thread.sleep(700);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		valMsg = validationMessage();
		Assert.assertEquals(valMsg, validaton);
	}

	public void verifyRejectedFieldVisitInRICLogin(String tabName, String userName, String attendanceDate)
			throws InterruptedException {
		String attendanceDate1 = dateSelected(attendanceDate);
		String expValue = userName + " " + attendanceDate1;
		String actValue = null;
		if (tabName.contains("Reject")) {
			waitForElementClickable(rejectCollapsiblePanel);
			element_Click(rejectCollapsiblePanel);
			Thread.sleep(1000);
			for (int i = 0; i < rejectTable.size(); i++) {
				String colValue = rejectTable.get(i).getText();
				if (colValue.equalsIgnoreCase(userName)) {
					WebElement atdDate = rejectTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
					String actDate = atdDate.getText();
					if (actDate.equalsIgnoreCase(attendanceDate1)) {
						actValue = colValue + " " + actDate;
					}
				}
			}
			Assert.assertEquals(expValue, actValue);
		} else if (tabName.contains("Approve")) {
			waitForElementClickable(approveCollapsiblePanel);
			element_Click(approveCollapsiblePanel);
			Thread.sleep(1000);

			for (int i = 0; i < approveTable.size(); i++) {
				String colValue = approveTable.get(i).getText();

				if (colValue.equalsIgnoreCase(userName)) {
					WebElement atdDate = approveTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
					String actDate = atdDate.getText();
					if (actDate.equalsIgnoreCase(attendanceDate1)) {
						actValue = colValue + " " + actDate;
					}
				}
			}
			Assert.assertEquals(expValue, actValue);
		}

	}

}
