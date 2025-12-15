package PageObject.ESSLogin;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ESSInductionApprovalPO extends AbstractMethod{
	WebDriver driver;
	public ESSInductionApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************************************************
	//**************** Elements *******************************************************************
	//*********************************************************************************************
	
	@FindBy(id = "loading-overlay")
	private List<WebElement> pageOnLoadCount;
	
	@FindBy(id = "loading-overlay")
	private WebElement pageOnLoad;
	
	@FindBy(id = "cboWOType")
	private WebElement filterWorkOrderDD;
	
	@FindBy(id = "CWMWorkOrderID")
	private WebElement workOrderIDTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//*[@name='cmnTxtSearch']")
	private WebElement pendingSearchBar;
	
	@FindBy(id = "chkApprovegvPending")
	private WebElement pendingAllApproveBtn;
	
	@FindBy(id = "chkRejectgvPending")
	private WebElement pendingAllRejectBtn;
	
	@FindBy(xpath = "//*[@id='gvPendingrow0' and not(@hidden)]")
	private List<WebElement> pendingAvailableornot;
	
	
	//**********************************************************************************************
	//**************** Functions *******************************************************************
	//*********************************************************************************************
	public String inductionApprovalsFromESS(Map<String, String> data) throws InterruptedException {
		String msg = null;
		// For page load, in this long time load so
				Thread.sleep(1000);
				WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(180));
				if (pageOnLoadCount.size() > 0) {
					wait.until(ExpectedConditions.invisibilityOf(pageOnLoad));
					Thread.sleep(1000);
				}
		element_DropDownSelectByvisibleText(filterWorkOrderDD, "Individual");
		if (data.get("WorkOrderID") != null) {
			element_Clear(workOrderIDTxt);
			element_dynamicDDSelect(workOrderIDTxt, data.get("WorkOrderID"));
			element_TextBoxToClickOnTab(workOrderIDTxt);
		}
		element_Click(viewBtn);
		pageLoadWaitng();
		// Pending Tab
		waitForElementVisibleForLoadPage(pendingSearchBar);
		if (pendingSearchBar.isEnabled()) {
			waitForElementClickableForLoadPage(pendingSearchBar);
			element_Click(pendingSearchBar);
			element_InputTextUsingActionClass(pendingSearchBar, data.get("WorkerName"));
			element_TextBoxToClickOnEnter(pendingSearchBar);
			Thread.sleep(1000);
			if (pendingAvailableornot.size() > 0) {
				if (data.get("Approval").equalsIgnoreCase("Approve")) {
					element_Click(pendingAllApproveBtn);
					Thread.sleep(1000);
					saveButtonClick();
					msg = validationMessage();
				} else if (data.get("Approval").equalsIgnoreCase("Reject")) {
					element_Click(pendingAllRejectBtn);
					Thread.sleep(1000);
					saveButtonClick();
					msg = validationMessage();
				}
			} else {
				msg = "No Application Found";
			}
		} else {
			msg = "No Application Found";
		}
		return msg;
	}
}
