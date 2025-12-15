package PageObject.ContractorWorkerManagement;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class InductionApprovalPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(InductionApprovalPO.class);
	
	public InductionApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************************************************
	//**************** Elements *******************************************************************
	//*********************************************************************************************
	@FindBy(id = "pageonload")
	private List<WebElement> pageOnLoadCount;
	
	@FindBy(id = "pageonload")
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
	
	@FindBy(xpath = "//*[@id='gvPendingrow0'][not(@hidden)]")
	private List<WebElement> pendingAvailableornot;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//*[@class='pagination-bottom pull-right']")
	private List<WebElement> pendingPeginationCheck;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//*[@class='pagination-next']")
	private WebElement pendingNextPageBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//*[@class='pagination-next']")
	private List<WebElement> pendingPeginationNextBtnCheck;
	
	
	//**********************************************************************************************
	//**************** Functions *******************************************************************
	//*********************************************************************************************
	public void inductionApprovalsFromCWM(String workOrderID, String workerName, String approval) throws InterruptedException {
	waitForElementVisible_TimeinMinutes(filterWorkOrderDD, 1);
		String msg = null;
		// For page load, in this long time load so
		Thread.sleep(1000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(180));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.visibilityOf(filterWorkOrderDD));
			Thread.sleep(1000);
		}
		element_DropDownSelectByvisibleText(filterWorkOrderDD, "Individual");
		if (workOrderID != null) {
			element_Clear(workOrderIDTxt);
			element_dynamicDDSelect(workOrderIDTxt, workOrderID);
			element_TextBoxToClickOnTab(workOrderIDTxt);
		}
		element_Click(viewBtn);
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.elementToBeClickable(cancelButton));
			Thread.sleep(1000);
		}
		// Pending Tab
		pageLoadWaitng();
		waitForElementVisibleForLoadPage(pendingSearchBar);
		if (pendingSearchBar.isEnabled()) {
			waitForElementClickableForLoadPage(pendingSearchBar);
			element_Click(pendingSearchBar);
			element_Clear(pendingSearchBar);
			element_InputTextUsingActionClass(pendingSearchBar, workerName);
			element_TextBoxToClickOnEnter(pendingSearchBar);
			Thread.sleep(1000);
			if (pendingAvailableornot.size()>0) {
				if (approval.equalsIgnoreCase("Approve")) {
					element_Click(pendingAllApproveBtn);
					Thread.sleep(1000);
					saveButtonClick();
					msg = validationMessage();
				}
				else if (approval.equalsIgnoreCase("Reject")){
					element_Click(pendingAllRejectBtn);
					Thread.sleep(1000);
					saveButtonClick();
					msg = validationMessage();
				}
				Assert.assertEquals(msg, "Saved Successfully");	
			}
		}
		else {
			logger.debug("No Pending Available");
		}
	}
	
	
	// Work Order filter = All and all workers approval
	public void inductionApprovalsWithAllWorkOrderAndAllWorkers(String approval) throws InterruptedException {
		waitForElementVisible_TimeinMinutes(filterWorkOrderDD, 1);
		String msg = null;
		// For page load, in this long time load so
		Thread.sleep(1000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(180));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(pageOnLoad));
			Thread.sleep(1000);
		}
		element_DropDownSelectByvisibleText(filterWorkOrderDD, "All");
		element_Click(viewBtn);
		Thread.sleep(2000);
		// Pending Tab
		waitForElementVisibleForLoadPage(pendingSearchBar);
		if (pendingSearchBar.isEnabled()) {
			Thread.sleep(1000);
			if (pendingAvailableornot.size()>0) {
				if (pendingPeginationCheck.size()>0) {
					int i = 0;
					do {
						if (i!=0) {
							element_Click(pendingNextPageBtn);
						}
						if (approval.equalsIgnoreCase("Approve")) {
							element_Click(pendingAllApproveBtn);
						}
						else if (approval.equalsIgnoreCase("Reject")){
							Thread.sleep(1000);
							element_Click(pendingAllRejectBtn);
						}
						i++;
					} while (pendingPeginationNextBtnCheck.size()>0);
				}
				else {
					if (approval.equalsIgnoreCase("Approve")) {
						element_Click(pendingAllApproveBtn);
					}
					else if (approval.equalsIgnoreCase("Reject")){
						element_Click(pendingAllRejectBtn);
					}
				}
				Thread.sleep(1000);
				saveButtonClick();
				msg = validationMessage();
				Assert.assertEquals(msg, "Saved Successfully");	
			}
		}
		else {
			logger.debug("No Pending Available");
		}
	}
}
