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

public class EssVisitApprovalPO extends AbstractMethod{
	WebDriver driver;
	public EssVisitApprovalPO(WebDriver driver) {
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
	
	@FindBy(xpath = "//*[@gridname='gvPending']//*[@name='cmnTxtSearch']")
	private WebElement pendingPanelSearchBar;
	
	@FindBy(xpath = "//*[@id='grid1']/tbody/tr[contains(@id,'gvPendingrow')][1]/td//input[contains(@id,'chkData1gvPending')]")
	private WebElement approveBtn;
	
	@FindBy(xpath = "//*[@id='grid1']/tbody/tr[contains(@id,'gvPendingrow')][1]/td//input[contains(@id,'chkData2gvPending')]")
	private WebElement rejectBtn;
	
	//************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public String visitApprovalFromESS(Map<String, String> data) throws InterruptedException {
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
		//Pending Panel
		if (pendingPanelOpenOrNot.size()==1) {
			element_Click(pendingPanel);
		}
		if (pendingPanelSearchBar.isEnabled()) {
			element_InputTextUsingActionClass(pendingPanelSearchBar, data.get("VName"));
			element_TextBoxToClickOnEnter(pendingPanelSearchBar);
			Thread.sleep(1000);
			if (data.get("Approval").equalsIgnoreCase("Approve")) {
				element_Click(approveBtn);
			}
			else if (data.get("Approval").equalsIgnoreCase("Reject")) {
				element_Click(rejectBtn);
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;
		
	}
}
