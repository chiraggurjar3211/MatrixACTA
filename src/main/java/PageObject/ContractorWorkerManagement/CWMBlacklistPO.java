package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class CWMBlacklistPO extends AbstractMethod{
	WebDriver driver;
	public CWMBlacklistPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************
	//Elements
	//*********************************************************
	@FindBy(id = "cmbSelectType")
	private WebElement blacklistTypeDD;
	
	@FindBy(id = "BlackLstContractorsName")
	private WebElement contractorNameTxt;
	
	@FindBy(id = "BlackListCWMWorkersName")
	private WebElement workerNameTxt;
	
	@FindBy(id = "txtReason")
	private WebElement reasoncontractorTxt;
	
	@FindBy(id = "txtWrkReason")
	private WebElement reasonTxt;
	
	@FindBy(xpath = "//*[@key='btnBlackList']")
	private WebElement addToBlacklistBtn;
	
	@FindBy(xpath = "//*[@value='Yes']")
	private WebElement popupYesBtn;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement validationMessagexpath;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessagexpathCheck;
	
	@FindBy(xpath = "//*[@class='modal-dialog modal-sm']/*[@class='modal-content']")
	private List<WebElement> popupCheck;
	
	// Blacklisted panel
	@FindBy(xpath = "//*[@id='accordion_master']//*[contains(text(),'Blacklisted')]")
	private WebElement blacklistedPanel;
	
	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Blacklisted')]")
	private List<WebElement> blacklistedPanelOpenOrNotWorker;
	
	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Blacklisted')]")
	private List<WebElement> blacklistedPanelOpenOrNotContractor;
	
	@FindBy(xpath = "//*[contains(@id,'div_grd_gvBlocked')]//*[@name='cmnTxtSearch']")
	private WebElement blacklistedPanelSearchBar;
	
	@FindBy(xpath = "//*[contains(@id,'gvBlocked')]//tbody/tr[not(@hidden)]/td[1]")
	private List<WebElement> blacklistedRows;
	
	// Restored panel
	@FindBy(xpath = "//*[@id='accordion_master']//*[contains(text(),'Restored')]")
	private WebElement restoredPanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Restored')]")
	private List<WebElement> restoredPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@id='collapseTwo']//*[@name='cmnTxtSearch']")
	private WebElement restoredPanelSearchBar;
	
	@FindBy(xpath = "//*[@gridname='gvDetailGrid']//tbody/tr/td[2]")
	private List<WebElement> restoredRows;
	
	//**********************************************************
	// Functions
	// **********************************************************
	
	//**********************************************************
	// Add to blacklist 
	//**********************************************************
	
	public void blacklistFromBlacklistPageinCWM(String blacklistType, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(blacklistTypeDD, blacklistType);
		Thread.sleep(1000);
		if (blacklistType.equalsIgnoreCase("Contractor")) {
			element_Clear(contractorNameTxt);
			element_dynamicDDSelect(contractorNameTxt, data.get("Name"));
			element_TextBoxToClickOnTab(contractorNameTxt);
			Thread.sleep(1000);
			element_Clear(reasoncontractorTxt);
			element_InputTextUsingActionClass(reasoncontractorTxt, data.get("Reason"));
			Thread.sleep(1000);
			element_Click(addToBlacklistBtn);
		} else if (blacklistType.equalsIgnoreCase("Worker")) {
			element_Clear(workerNameTxt);
			element_dynamicDDSelect(workerNameTxt, data.get("Name"));
			element_TextBoxToClickOnTab(workerNameTxt);
			Thread.sleep(1000);
			element_Clear(reasonTxt);
			element_InputTextUsingActionClass(reasonTxt, data.get("Reason"));
			Thread.sleep(1000);
			element_Click(addToBlacklistBtn);
			Thread.sleep(1000);
			if (popupCheck.size()>0) {
				element_Click(popupYesBtn);
			}
		}
		//
		String val1 = null;
		if (validationMessagexpathCheck.size()>0) {
			String val = validationMessage();
			if (val.equalsIgnoreCase("Select at least one Contractor") || val.equalsIgnoreCase("Select at least one Worker")) {
				val1 = blacklistType+" doesn't exist";
			}
			else {
				val1 = val;
			}
		}
		else {
			val1 = "Added to blacklist";
		}
		Assert.assertEquals(val1, "Added to blacklist");
	}
	
	// MAyank
	//**********************************************************
	// verify blacklisted Worker / Contractor
	//**********************************************************
	
	public void verifyBlacklistedinCWM(String blacklistType, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(blacklistTypeDD, blacklistType);
		Thread.sleep(1000);
		//element_Click(addToBlacklistBtn); // For panel open
		if (blacklistType.toUpperCase().equalsIgnoreCase("WORKER")) {
			if (blacklistedPanelOpenOrNotWorker.size()==1) {
				element_Click(blacklistedPanel);
			}
		}else {
			if (blacklistedPanelOpenOrNotContractor.size()==1) {
				element_Click(blacklistedPanel);
			}
		}
		
		String val = null;
		if (!element_isEnabled(blacklistedPanelSearchBar)) {
			val = blacklistType+" doesn't exist in blacklisted";
		}
		else {
			element_Clear(blacklistedPanelSearchBar);
			element_InputTextUsingActionClass(blacklistedPanelSearchBar, data.get("Name"));
			element_TextBoxToClickOnEnter(blacklistedPanelSearchBar);
			Thread.sleep(1000);
			if (blacklistedRows.size()>0) {
				ArrayList<String> rowsData = new ArrayList<>();
				for (WebElement row : blacklistedRows) {
					String name = row.findElement(By.xpath("following-sibling::td[1]")).getText();
					rowsData.add(name);
					if (name.equalsIgnoreCase(data.get("Name"))) {
						val = blacklistType+" blacklisted";
						break;
					}
				}
				if (!rowsData.contains(data.get("Name"))) {
					val = blacklistType+" doesn't exist in blacklisted";
				}
			}
			else {
				val = blacklistType+" doesn't exist in blacklisted";
			}
		}
		Assert.assertEquals(val, blacklistType+" blacklisted");
	}
	
	//**********************************************************
	// Restore blacklisted Worker / Contractor
	//**********************************************************
	
	public void restoreFromBlacklistedinCWM(String blacklistType, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(blacklistTypeDD, blacklistType);
		Thread.sleep(1000);
		//element_Click(addToBlacklistBtn); // For panel open
		if (blacklistType.toUpperCase().equalsIgnoreCase("WORKER")) {
			if (blacklistedPanelOpenOrNotWorker.size()==1) {
				element_Click(blacklistedPanel);
			}
		}else {
			if (blacklistedPanelOpenOrNotContractor.size()==1) {
				element_Click(blacklistedPanel);
			}
		}
		
		String val = null;
		if (!element_isEnabled(blacklistedPanelSearchBar)) {
			val = blacklistType+" doesn't exist in blacklisted";
		}
		else {
			element_Clear(blacklistedPanelSearchBar);
			element_InputTextUsingActionClass(blacklistedPanelSearchBar, data.get("Name"));
			element_TextBoxToClickOnEnter(blacklistedPanelSearchBar);
			Thread.sleep(1000);
			if (blacklistedRows.size()>0) {
				ArrayList<String> rowsData = new ArrayList<>();
				for (WebElement row : blacklistedRows) {
					String name = row.findElement(By.xpath("following-sibling::td[1]")).getText();
					rowsData.add(name);
					if (name.equalsIgnoreCase(data.get("Name"))) {
						WebElement restoreBtn = null;
						if (blacklistType.toUpperCase().equalsIgnoreCase("WORKER")) {
							restoreBtn = row.findElement(By.xpath("following-sibling::td[5]/i"));
						} else {
							restoreBtn = row.findElement(By.xpath("following-sibling::td[4]/i"));
						}
						element_Click(restoreBtn);
						Thread.sleep(1000);
						if (validationMessagexpathCheck.size()>0) {
							val = validationMessage();
						}
						else {
							val = blacklistType+" restored";
						}
						break;
					}
				}
				if (!rowsData.contains(data.get("Name"))) {
					val = blacklistType+" doesn't exist in blacklisted";
				}
			}
			else {
				val = blacklistType+" doesn't exist in blacklisted";
			}
		}
		Assert.assertEquals(val, blacklistType+" restored");
	}
	
	//**********************************************************
	// verify Restored Worker / Contractor
	//**********************************************************
	
	public void verifyRestoredFromBlacklistedinCWM(String blacklistType, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(blacklistTypeDD, blacklistType);
		Thread.sleep(1000);
		//element_Click(addToBlacklistBtn); // For panel open
		if (restoredPanelOpenOrNot.size()==1) {
			element_Click(restoredPanel);
		}
		String val = null;
		if (!element_isEnabled(restoredPanelSearchBar)) {
			val = blacklistType+" doesn't exist in restored";
		}
		else {
			element_Clear(restoredPanelSearchBar);
			element_InputTextUsingActionClass(restoredPanelSearchBar, data.get("Name"));
			element_TextBoxToClickOnEnter(restoredPanelSearchBar);
			Thread.sleep(1000);
			if (restoredRows.size()>0) {
				ArrayList<String> rowsData = new ArrayList<>();
				for (WebElement row : restoredRows) {
					String name = row.findElement(By.xpath("following-sibling::td[1]")).getText();
					rowsData.add(name);
					if (name.equalsIgnoreCase(data.get("Name"))) {
						val = blacklistType+" restored";
						break;
					}
				}
				if (!rowsData.contains(data.get("Name"))) {
					val = blacklistType+" doesn't exist in restored";
				}
			}
			else {
				val = blacklistType+" doesn't exist in restored";
			}
		}
		Assert.assertEquals(val, blacklistType+" restored");
	}
	
}
