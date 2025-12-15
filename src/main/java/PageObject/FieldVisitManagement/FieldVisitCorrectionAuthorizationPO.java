package PageObject.FieldVisitManagement;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class FieldVisitCorrectionAuthorizationPO extends AbstractMethod {
	WebDriver driver;

	public FieldVisitCorrectionAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@id='div_grd_grdPending']//*[@name='cmnTxtSearch']")
	private WebElement pendingSearchTxt;

	@FindBy(id = "chkRejectgrdPending")
	private WebElement rejectAllCheckbox;

	@FindBy(id = "chkApprovegrdPending")
	private WebElement approveAllCheckbox;

	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"]")
	private WebElement rejectCollapsiblePanel;
	
	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//table//tbody//tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> rejectTable;
	
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private WebElement approveCollapsiblePanel;
	
	@FindBy(xpath = "//*[@class=\"hidefrom show\"]//table//tbody//tr[not(@hidden)]//td[not(@hidden)][1]")
	private List<WebElement> approveTable;
	
	//////////

	public void fieldVisitCorrectionAuthorization(String userName, String attendanceDate, String approve, String reject,
			String validaton) throws InterruptedException {

		String valMsg = null;
		if (element_isEnabled(pendingSearchTxt) == true) {
			element_Clear(pendingSearchTxt);
			element_InputTextUsingActionClass(pendingSearchTxt, userName);
			Thread.sleep(2000);
			pendingSearchTxt.sendKeys(Keys.ENTER);
			Thread.sleep(2000);

			if (reject != null) {
				boolean rejectAll = Boolean.parseBoolean(reject);
				if (rejectAll == true) {
					if (element_isSelected(rejectAllCheckbox) != true) {
						element_Click(rejectAllCheckbox);
					}
				} else {
					if (element_isSelected(rejectAllCheckbox) == true) {
						element_Click(rejectAllCheckbox);
					}
				}
			}
			if (approve != null) {
				boolean approveAll = Boolean.parseBoolean(approve);
				if (approveAll == true) {
					if (element_isSelected(approveAllCheckbox) != true) {
						element_Click(approveAllCheckbox);
					}
				} else {
					if (element_isSelected(approveAllCheckbox) == true) {
						element_Click(approveAllCheckbox);
					}
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		valMsg = validationMessage();
		Assert.assertEquals(valMsg, validaton);
	}

	public void verifyRejectedFieldVisitInSA(String tabName, String userName, String attendanceDate) throws InterruptedException {
		Thread.sleep(2000);
		String attendanceDate1 = dateSelected(attendanceDate);
		Thread.sleep(1000);
		String expValue = userName+" "+attendanceDate1;
		String actValue = null;		
		Thread.sleep(1000);
		if(tabName.contains("Reject"))
		{
			waitForElementClickable(rejectCollapsiblePanel);
			element_Click(rejectCollapsiblePanel);
			Thread.sleep(1000);
			
			for(int i =0; i<rejectTable.size(); i++)
			{
				String colValue = rejectTable.get(i).getText();
				
				if(colValue.equalsIgnoreCase(userName))
				{
					WebElement atdDate = rejectTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]"));
					String actDate = atdDate.getText();
					if(actDate.equalsIgnoreCase(attendanceDate1))
					{
						actValue = colValue+" "+actDate;
					}
				}
			}
			Assert.assertEquals(expValue, actValue);
		}
		else if(tabName.contains("Approve"))
		{
			waitForElementClickable(approveCollapsiblePanel);
			element_Click(approveCollapsiblePanel);
			Thread.sleep(1000);
			
			for(int i =0; i<approveTable.size(); i++)
			{
				String colValue = approveTable.get(i).getText();
				
				if(colValue.equalsIgnoreCase(userName))
				{
					WebElement atdDate = approveTable.get(i)
							.findElement(By.xpath("following-sibling::td[2]"));
					String actDate = atdDate.getText();
					if(actDate.equalsIgnoreCase(attendanceDate1))
					{
						actValue = colValue+" "+actDate;
					}
				}
			}
			Assert.assertEquals(expValue, actValue);
		}
	}
}
