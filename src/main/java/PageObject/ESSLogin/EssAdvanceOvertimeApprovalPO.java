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
import io.cucumber.datatable.DataTable;

public class EssAdvanceOvertimeApprovalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssAdvanceOvertimeApprovalPO.class);
	
	public EssAdvanceOvertimeApprovalPO(WebDriver driver) {
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

	@FindBy(id = "filtered")
	private WebElement otDateRadioBtn;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement pendingCollapsSearchBox;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingCollapsTable;

///////////////////
	public void advOTAppApproval(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		//pageLoadWaitng();
		element_Click(otDateRadioBtn);
		waitForElementVisible(fromDateTxt);
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
			logger.info("User: "+data.get("User")+" OTDate: "+data.get("OTDate"));
			String user = data.get("User");
			String otDate = data.get("OTDate");
			String otHours = data.get("OTHours");
			String approvedHours = data.get("ApprovedHours");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			String convertOTDate = staticDateOrPlusMinusFromCurrentDate(otDate);
			element_Clear(pendingCollapsSearchBox);
			element_InputTextUsingActionClass(pendingCollapsSearchBox, user);
			element_TextBoxToClickOnEnter(pendingCollapsSearchBox);
			Thread.sleep(1000);
			for (int i = 0; i < pendingCollapsTable.size(); i++) {
				String getUsrId = pendingCollapsTable.get(i).getText();
				String getOTDate = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][2]/label"))
						.getText();
				String getOTHours = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][3]/label"))
						.getText();
				if (getUsrId.equalsIgnoreCase(user) && getOTDate.equalsIgnoreCase(convertOTDate)
						&& getOTHours.equalsIgnoreCase(otHours)) {
					WebElement approvedHoursTxt = pendingCollapsTable.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][5]/input"));
					Thread.sleep(1000);
					element_Clear(approvedHoursTxt);
					Thread.sleep(500);
					element_InputTextUsingActionClass(approvedHoursTxt, approvedHours);
					element_TextBoxToClickOnTab(approvedHoursTxt);
					Thread.sleep(1000);
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingCollapsTable.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][6]//input"));
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
						WebElement rejectChk = pendingCollapsTable.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][7]//input"));
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
			Assert.assertEquals(valMsg, validation);
		}
	}
}
