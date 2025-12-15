package PageObject.CafeteriaManagement;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
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

public class CorrectionApprovalPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(CorrectionApprovalPO.class);

	public CorrectionApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "_txtFromDate")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_txtTodate")
	private WebElement toDtTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@class='collapsed']//label[contains(text(),'Pending')]")
	private List<WebElement> pendingPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@class='panel']//label[contains(text(),'Pending')]")
	private WebElement pendingPanel;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//*[@name=\"cmnTxtSearch\"]")
	private WebElement pendingPanelSearchBar;
	
	@FindBy(xpath = "//*[@id='div_grd_gvPending']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingRows;
	
	@FindBy(id = "chkApprovegvPending")
	private WebElement pendingApproveBtn;
	
	@FindBy(id = "chkRejectgvPending")
	private WebElement pendingRejectBtn;
	
	// Code
	public void correctionApproval(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String date = staticDateOrPlusMinusFromCurrentDate(data.get("TrnDate"));
		element_Clear(fromDtTxt);
		element_InputTextUsingActionClass(fromDtTxt, date);
		element_Clear(toDtTxt);
		element_InputTextUsingActionClass(toDtTxt, date);
		Thread.sleep(500);
		element_Click(viewBtn);
		Thread.sleep(500);
		String val= null;
		
		if (pendingPanelOpenOrNot.size()>0) {
			element_Click(pendingPanel);
			Thread.sleep(1000);
		}
		if (!pendingPanelSearchBar.isEnabled()) {
			val = "Pending Application not found";
		} else {
			element_Clear(pendingPanelSearchBar);
			element_InputTextUsingActionClass(pendingPanelSearchBar, data.get("UserId"));
			element_TextBoxToClickOnEnter(pendingPanelSearchBar);
			Thread.sleep(1000);
			if (pendingRows.size()>0) {
				if (data.get("Approval").equalsIgnoreCase("Approve")) {
					element_Click(pendingApproveBtn);
				} else {
					element_Click(pendingRejectBtn);
				}
				Thread.sleep(1000);
				saveButtonClick();
				val = validationMessage();
				
			} else {
				val = "Pending Application not found";
			}
		}
		Assert.assertEquals(val, data.get("Validation"));
	}

}
