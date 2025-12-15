package PageObject.ESSLogin;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssVisitRegistrationApprovalPO extends AbstractMethod{
	WebDriver driver;
	public EssVisitRegistrationApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(id = "filtered")
	private WebElement visitDateFilter;

	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a")
	private WebElement pendingPanel;

	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> pendingPanelOpenOrNot;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name='cmnTxtSearch']")
	private WebElement pendingPanelSearchBar;

	@FindBy(id = "chkApprovegvPending")
	private WebElement approveBtn;

	@FindBy(id = "chkRejectgvPending")
	private WebElement rejectBtn;

	// ************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public String visitRegistartionApprovalFromESS(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("FromDate") != null) {
			element_Click(visitDateFilter);
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, date);
		}
		if (data.get("ToDate") != null) {
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, date);
		}
		element_Click(viewBtn);
		// Pending Panel
		if (pendingPanelOpenOrNot.size() == 1) {
			element_Click(pendingPanel);
		}
		if (pendingPanelSearchBar.isEnabled()) {
			element_InputTextUsingActionClass(pendingPanelSearchBar, data.get("HostID"));
			element_TextBoxToClickOnEnter(pendingPanelSearchBar);
			Thread.sleep(1000);
			if (data.get("Approval").equalsIgnoreCase("Approve")) {
				if (approveBtn.isEnabled()) {
					element_Click(approveBtn);
				}
			} else if (data.get("Approval").equalsIgnoreCase("Reject")) {
				if (rejectBtn.isEnabled()) {
					element_Click(rejectBtn);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;

	}
}
