package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class FrequentVisitorsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(FrequentVisitorsPO.class);
	public FrequentVisitorsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************ELEMENTS***************************************
	
	@FindBy(xpath = "//*[@gridname='grddetail']//*[@name='cmnTxtSearch']")
	private WebElement searchTextBoxTitleBar1;
	
	@FindBy(xpath="//*[@gridname='grddetail']//i[@class='fa fa-search cursor']")
	private WebElement searchButton;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> visitorMobileNos;
	
	@FindBy(id = "btnWatchlist")
	private WebElement addToWatchlistBtn;
	
	@FindBy(id = "btnBlacklist")
	private WebElement addToBlacklistBtn;
	
	@FindBy(id = "AddVisitors")
	private WebElement addVisitorButton;
	
	@FindBy(id = "txtVisName")
	private WebElement vNameTxt;
	
	@FindBy(id = "txtOrg")
	private WebElement vOrgTxt;
	
	@FindBy(id = "txtMobNo")
	private WebElement vMobileTxt;
	
	//*************************Code****************************************************
	
	//Mayank
	public String addToWatchlistBlacklist(String visitorMobileNo, String addIn) throws InterruptedException {
		String val = null;
		waitForElementVisible(addVisitorButton);
		reloadPageButtonClick();
		waitForElementVisible(addVisitorButton);
		if (element_isEnabled(searchTextBoxTitleBar1))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar1, visitorMobileNo);
			//element_InputDataUsingJS(searchTextBoxTitleBar1, visitorMobileNo);
			Thread.sleep(1000);
			//buttonClickUsingJS(searchButton);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar1);
			Thread.sleep(3000);
			ArrayList<String> allvisitorMobileNo = new ArrayList<>();
			if (visitorMobileNos.size() > 0) {
				for (int j = 0; j < visitorMobileNos.size(); j++) {
					String tName = visitorMobileNos.get(j).getText();
					allvisitorMobileNo.add(tName);
					if (tName.equalsIgnoreCase(visitorMobileNo)) {
						logger.debug("Visitor found, Mobile No = "+visitorMobileNo);
						visitorMobileNos.get(j).click();
						Thread.sleep(1000);
						cancelButtonClick();
						if (addIn.equalsIgnoreCase("Watchlist")) {
							element_Click(addToWatchlistBtn);
						}
						else if (addIn.equalsIgnoreCase("Blacklist")) {
							element_Click(addToBlacklistBtn);
						}
						else {
							logger.debug("Add In option is invalid");
						}
						val = validationMessage2();
						//return val;
					}
				}
			}
			//System.out.println(ar);
			if (!allvisitorMobileNo.contains(visitorMobileNo)) {
				logger.debug("Visitor not found, Mobile No = "+visitorMobileNo);
				val = "Visitor Not Found";
			}
		}
		else {
			logger.debug("Visitor not found, Mobile No = "+visitorMobileNo);
			val = "Visitor Not Found";
		}
		
		Thread.sleep(1000);
		return val;
	}
	
	public String verifyFrequentVisitor(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar1))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar1, data.get("VMobile")); 
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar1);
			Thread.sleep(1000);
			ArrayList<String> allvisitorMobileNo = new ArrayList<>();
			if (visitorMobileNos.size() > 0) {
				for (int j = 0; j < visitorMobileNos.size(); j++) {
					String tName = visitorMobileNos.get(j).getText();
					allvisitorMobileNo.add(tName);
					if (tName.equalsIgnoreCase(data.get("VMobile"))) {
						logger.debug("Visitor found, Mobile No = "+data.get("VMobile"));
						visitorMobileNos.get(j).click();
						Thread.sleep(1000);
						String actualVName = vNameTxt.getAttribute("value");
						if (actualVName.equalsIgnoreCase(data.get("VisitorName"))) {
							val = "Visitor Found";
						}
						else {
							val = "Visitor Found but Name is different";
						}
						
					}
				}
			}
			if (!allvisitorMobileNo.contains(data.get("VMobile"))) {
				logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
				val = "Visitor Not Found";
			}
		}
		else {
			logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
			val = "Visitor Not Found";
		}
		Thread.sleep(1000);
		return val;
	}
	
	// Create Visitor
	public void createFrequentVisitor(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar1))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar1, data.get("VMobile")); 
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar1);
			Thread.sleep(1000);
			ArrayList<String> allvisitorMobileNo = new ArrayList<>();
			if (visitorMobileNos.size() > 0) {
				for (int j = 0; j < visitorMobileNos.size(); j++) {
					String tName = visitorMobileNos.get(j).getText();
					allvisitorMobileNo.add(tName);
					if (tName.equalsIgnoreCase(data.get("VMobile"))) {
						visitorMobileNos.get(j).click();
						Thread.sleep(1000);
					}
				}
			}
			if (!allvisitorMobileNo.contains(data.get("VMobile"))) {
				addButtonClick();
				Thread.sleep(1000);
			}
		}
		else {
			addButtonClick();
			Thread.sleep(1000);
		}
		// Main Code
		if (data.get("VisitorName") != null) {
			element_Clear(vNameTxt);
			element_InputTextUsingActionClass(vNameTxt, data.get("VisitorName"));
		}
		if (data.get("Organization") != null) {
			element_Clear(vOrgTxt);
			element_InputTextUsingActionClass(vOrgTxt, data.get("Organization"));
		}
		if (data.get("VMobile") != null) {
			element_Clear(vMobileTxt);
			element_InputTextUsingActionClass(vMobileTxt, data.get("VMobile"));
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage2(), "Saved Successfully");
	}
	
	
	
}
