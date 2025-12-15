package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class VisitorHistoryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(VisitorHistoryPO.class);

	public VisitorHistoryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Mayank
	// ************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(xpath = "//*[@class='col-md-12']//*[@name='cmnTxtSearch']")
	private WebElement searchbar;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[5]")
	private List<WebElement> allVisitsHistory;

	@FindBy(id = "txtPhn")
	private WebElement mobileTxt;

	@FindBy(id = "txtFromDate")
	private WebElement fromDtTxt;

	@FindBy(id = "txtToDate")
	private WebElement toDtTxt;

	@FindBy(id = "txtHostID")
	private WebElement hostIdTxt;
	
	@FindBy(id="txtPassID")
	private WebElement paasNo;

	@FindBy(id="txtVStationName")
	private WebElement station;
	
	@FindBy(id="txtEDTime")
	private WebElement visitEndTime;
	
	// ************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void verifyVisitorHistory(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, data.get("VName"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (allVisitsHistory.size() > 0) {
				for (int j = 0; j < allVisitsHistory.size(); j++) {
					String tName = allVisitsHistory.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("VName"))) {
						logger.debug("Visitor found, Mobile No = " + data.get("VName"));
						allVisitsHistory.get(j).click();
						Thread.sleep(1000);
						if (data.get("VMobile") != null) {
							String actualMobile = mobileTxt.getAttribute("value");
							Assert.assertEquals("Visitor Mobile = " + actualMobile,
									"Visitor Mobile = " + data.get("VMobile"));
						}
						if (data.get("VStartDate") != null) {
							String actualVStartDate = fromDtTxt.getAttribute("value");
							String expectedVStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("VStartDate"));
							Assert.assertEquals("Visit Start Date = " + actualVStartDate,
									"Visit Start Date = " + expectedVStartDate);
						}
						if (data.get("VEndDate") != null) {
							String actualVEndDate = toDtTxt.getAttribute("value");
							String expectedVEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("VEndDate"));
							Assert.assertEquals("Visit End Date = " + actualVEndDate,
									"Visit End Date = " + expectedVEndDate);
						}
						if (data.get("HostId") != null) {
							String actualHostId = hostIdTxt.getAttribute("value");
							Assert.assertEquals("Visit Host ID = " + actualHostId,
									"Visit Host ID = " + data.get("HostId"));
						}
					}
				}
			}
			if (!allvisit.contains(data.get("VName"))) {
				logger.debug("Visitor not found, Mobile No = " + data.get("VName"));
				Assert.assertEquals("Visitor history not found", "Visitor history should be displayed");
			}
		} else {
			logger.debug("Visitor not found, Mobile No = " + data.get("VName"));
			Assert.assertEquals("Visitor history not found", "Visitor history should be displayed");
		}
	}

	public Map<String, String> getVisitorHistroryData(String vNam) throws Exception {
		Map<String,String> data=new HashMap<String, String>();
		pageLoadWaitng();
		waitForElementVisible(mobileTxt);
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, vNam);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			if (allVisitsHistory.size() > 0) {
				for (int j = 0; j < allVisitsHistory.size(); j++) {
					String tName = allVisitsHistory.get(j).getText();
					if (tName.equalsIgnoreCase(vNam)) {
						logger.debug("Visitor found, Mobile No = " + vNam);
						allVisitsHistory.get(j).click();
						Thread.sleep(2000);
						data.put("PassNo",element_getInputControlValue(paasNo));
						data.put("StationName",element_getInputControlValue(station));
						data.put("VisitEndTime",element_getInputControlValue(visitEndTime));
						break;
					}
				}
			}
		}
		return data;
	}

}
