package PageObject.VisitorManagement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class VisitorLoginAuthorizationPO extends AbstractMethod{
	WebDriver driver;
	public VisitorLoginAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
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

	@FindBy(xpath = "//*[@id='accordion_master']//*[contains(text(),'Pending')]")
	private WebElement pendingPanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Pending')]")
	private List<WebElement> pendingPanelOpenOrNot;

	@FindBy(xpath = "//*[@id='div_grd_gridPending']//*[@name='cmnTxtSearch']")
	private WebElement pendingPanelSearchBar;

	@FindBy(id = "chkApprovegridPending")
	private WebElement approveBtn;

	@FindBy(id = "chkRejectgridPending")
	private WebElement rejectBtn;
	
	@FindBy(xpath="//*[@id='collapseOne']//*[@id='grid1']/tbody/tr[not(@hidden)]/td[not(@hidden)]//label[not(@hidden)]")
	private List<WebElement> details; 
	
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//label[contains(text(),\"Rejected\")]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rejectedPanelOpenOrNot;
	
	//************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public String visitorLoginAuthorizationFromVMS(Map<String, String> data) throws InterruptedException {
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
		Thread.sleep(1000);
		if (rejectedPanelOpenOrNot.size() > 0) {
			element_Click(pendingPanel);
		}
		// Pending Panel
		if (pendingPanelOpenOrNot.size() >0) {
			element_Click(pendingPanel);
		}
		if (pendingPanelSearchBar.isEnabled()) {
			element_InputTextUsingActionClass(pendingPanelSearchBar, data.get("VMobile"));
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
		String val = validationMessage2();
		return val;
	}
	
	public Map<String, String> visitorLoginAuthorizationGetData(String vName) throws InterruptedException {
		Map<String, String> data=new HashMap<String, String>();
		pageLoadWaitng();
		waitForElementVisible(viewBtn);
		element_Click(viewBtn);
		Thread.sleep(1000);
		// Pending Panel
		if (pendingPanelOpenOrNot.size()> 0) {
			element_Click(pendingPanel);
		}
		Thread.sleep(500);
		if (pendingPanelSearchBar.isEnabled()) {
			element_InputTextUsingActionClass(pendingPanelSearchBar, vName);
			element_TextBoxToClickOnEnter(pendingPanelSearchBar);
			Thread.sleep(1000);
			for(int i=0;i<details.size();i++) {
				if(i==0) {
					data.put("Visitor Name",details.get(i).getText());
				}else if(i==1){
					data.put("Mobile",details.get(i).getText());
				}else if(i==2){
					data.put("Email",details.get(i).getText());
				}else if(i==3){
					data.put("Organization",details.get(i).getText());
				}
			}
		}
		return data;
	}
}
