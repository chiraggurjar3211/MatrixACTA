package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
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
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import com.aventstack.extentreports.Status;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class EssShortLeaveOfficialINOUTEntryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssShortLeaveOfficialINOUTEntryPO.class);
	public EssShortLeaveOfficialINOUTEntryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//***********************************************************
	//Elements
	//**********************************************************
	@FindBy(id = "_txtPDate")
	private WebElement dateTxt;
	
	@FindBy(xpath = "//*[@class=\"fa-sharp fa-regular fa-calendar\"]")
	private WebElement calendericonForMoreDate;
	
	@FindBy(id = "cboDateSelection")
	private WebElement dateselectionDD;
	
	@FindBy(id = "txtAlwMonth")
	private WebElement monthcountTxt;
	
	@FindBy(xpath = "//*[@class=\"col-md-7 col-sm-7 removeRightPadding\" and @hidden]")
	private List<WebElement> calendericonForMoreDateOpenOrNot;
	
	
	// Short Leave/Official Hours Entry
	@FindBy(id = "btnAppPunch")
	private List<WebElement> allPunchesBtnCheck;
	
	@FindBy(id = "btnAppPunch")
	private WebElement allPunchesBtn;
	
	@FindBy(xpath="//*[@id='collapseTwo']//*[@placeholder='HH:MM']")
	private List<WebElement> timeP;
	
	@FindBy(xpath="//*[@id='collapseTwo']//*[contains(@id,'CboSpFn')]")
	private List<WebElement> specialFns;
	
	@FindBy(xpath="//*[@id='collapseTwo']//*[@class='ImgEdit']")
	private List<WebElement> reasonEditBtns;
	
	@FindBy(xpath="//*[@id='collapseTwo']//*[contains(@name,'Reason')]")
	private List<WebElement> reasonTxts;
	
	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name='cmnTxtSearch']")
	private WebElement nPunchListSearchbar;
	
	@FindBy(xpath = "//*[@class=\"modal-content\"]//td[4]")
	private WebElement nPunchRowSpfn;
	
	@FindBy(xpath = "//*[@default='OK']")
	private WebElement nPunchPopupOkBtn;
	
	// Application Summary
	
	@FindBy(xpath = "//*[@default=\"Application Summary\"]/ancestor::a[@class=\"collapseThree\"][1]")
	private List<WebElement> applicationSummaryPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@default='Application Summary']")
	private WebElement applicationSummaryPanel;
	
	@FindBy(xpath = "//*[@id='div_grd_grdSummary']//*[@name='cmnTxtSearch']")
	private WebElement applicationSummarySearchBar;
	
	@FindBy(xpath = "//*[@id=\"div_grd_grdSummary\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> applicationsRows;
	
	@FindBy(xpath = "//*[@id=\"div_grd_grdSummary\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][5]")
	private List<WebElement> specialFunctionsColumn;
	
//	@FindBy(xpath = "//*[@title='Cancel (Alt+C)']")
//	private WebElement cancelIcon;
	
	@FindBy(xpath="//*[@id=\"div_grd_grdSummary\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)]/label")
	private List<WebElement> applicationSummaryGetData;
	
	@FindBy(id="txtSummaryReason")
	private WebElement appReason;
	
	@FindBy(xpath="//input[@value=\"OK\"]")
	private WebElement okButtonPopUp;
	
	@FindBy(xpath="//*[@id=\"accordion\"]//*[@class=\"form-group\"][2]/label[2]")
	private WebElement userIDName; 
	
	@FindBy (xpath="//*[@id=\"div_grd_grdSummary\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][7]/i")
	private WebElement appDetails; 
	
	@FindBy(id="txtSummaryRemark")
	private WebElement appRejRemark; 
	
	@FindBy(xpath="//*[@default=\"Don't Save\"]")
	private List<WebElement> dontsavesize;
	
	@FindBy(xpath="//*[@default=\"Don't Save\"]")
	private WebElement dontsaveB;
	
	//***********************************************************
	//Functions
	//***********************************************************
	//Mayank
	public void verifyShortLeaveOfficialINOUTEntryInESS(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (data.get("Date") != null) {
			if (element_isEnabled(cancelButton)) {
				element_Click(cancelButton);
			}
			Thread.sleep(1000);
			element_Clear(dateTxt);
			String date = staticDateOrPlusMinusFromCurrentDate(data.get("Date"));
			if (calendericonForMoreDateOpenOrNot.size()>0) {
				element_Click(calendericonForMoreDate);
				Thread.sleep(1000);
			}
			element_DropDownSelectByvisibleText(dateselectionDD, "Custom Period");
			Thread.sleep(1000);
			monthcountTxt.sendKeys(Keys.CONTROL + "a");
			monthcountTxt.sendKeys(Keys.DELETE);
			Thread.sleep(500);
			element_InputTextUsingActionClass(monthcountTxt, "99");
			element_TextBoxToClickOnTab(monthcountTxt);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(dateTxt, date);
			Thread.sleep(2000);
		}
		if (applicationSummaryPanelOpenOrNot.size()>0) {
			element_Click(applicationSummaryPanel);
		}
		if (element_isEnabled(applicationSummarySearchBar)) {
			element_Clear(applicationSummarySearchBar);
			element_InputText(applicationSummarySearchBar, data.get("Start"));
			element_TextBoxToClickOnEnter(applicationSummarySearchBar);
			Thread.sleep(1000);
			ArrayList<String> actualStartTimes = new ArrayList<String>();
			for (int i = 0; i < applicationsRows.size(); i++) {
				String startTime = applicationsRows.get(i).getText();
				String specialFunction1 = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
				actualStartTimes.add(startTime + specialFunction1);
				if(startTime.equalsIgnoreCase(data.get("Start")) && specialFunction1.equalsIgnoreCase(data.get("Special Function"))) { //Changes according to CSR-2881 - FIT 2975
					Assert.assertEquals(startTime, data.get("Start"));
					if (data.get("End") != null) {
						String endTime = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
						Assert.assertEquals(endTime, data.get("End"));
					}
					if (data.get("Applied Duration") != null) {
						String appliedDuration = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
						Assert.assertEquals(appliedDuration, data.get("Applied Duration"));
					}
					if (data.get("Posted Duration") != null) {
						String postedDuration = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
						Assert.assertEquals(postedDuration, data.get("Posted Duration"));
					}
					if (data.get("Special Function") != null) {
						String specialFunction = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
						Assert.assertEquals(specialFunction, data.get("Special Function"));
					}
					if (data.get("Status") != null) {
						String status = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
						Assert.assertEquals(status, data.get("Status"));
					}
					break;
				}
//				else if (startTime.equalsIgnoreCase(data.get("Start"))) {
//					Assert.assertEquals(startTime, data.get("Start"));
//					if (data.get("End") != null) {
//						String endTime = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[1]")).getText();
//						Assert.assertEquals(endTime, data.get("End"));
//					}
//					if (data.get("Applied Duration") != null) {
//						String appliedDuration = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
//						Assert.assertEquals(appliedDuration, data.get("Applied Duration"));
//					}
//					if (data.get("Posted Duration") != null) {
//						String postedDuration = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[3]")).getText();
//						Assert.assertEquals(postedDuration, data.get("Posted Duration"));
//					}
//					if (data.get("Special Function") != null) {
//						String specialFunction = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[4]")).getText();
//						Assert.assertEquals(specialFunction, data.get("Special Function"));
//					}
//					if (data.get("Status") != null) {
//						String status = applicationsRows.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
//						Assert.assertEquals(status, data.get("Status"));
//					}
//					break;
//				} 
			}
			//Changes according to CSR-2881 - FIT 2975
			if (!actualStartTimes.contains(data.get("Start")+data.get("Special Function"))) {
				Assert.assertEquals("No Data", data.get("Status"));
			}
			
		} else {
			//Changes according to CSR-2881 - FIT 2975
			Assert.assertEquals("No Data", data.get("Status"));
		}
		
	}
	
	//Mayank
	public String applyShortLeaveOfficialInOutApplication(String atdDate, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		if (atdDate != null) {
			logger.info("atdDate: "+atdDate);
			if (element_isEnabled(cancelButton)) {
				element_Click(cancelButton);
			}
			Thread.sleep(1000);
			element_Clear(dateTxt);
			String date = staticDateOrPlusMinusFromCurrentDate(atdDate);
			if (calendericonForMoreDateOpenOrNot.size()>0) {
				element_Click(calendericonForMoreDate);
				Thread.sleep(1000);
			}
			element_DropDownSelectByvisibleText(dateselectionDD, "Custom Period");
			Thread.sleep(1000);
			monthcountTxt.sendKeys(Keys.CONTROL + "a");
			monthcountTxt.sendKeys(Keys.DELETE);
			Thread.sleep(500);
			element_InputText(monthcountTxt, "99");
			element_TextBoxToClickOnTab(monthcountTxt);
			Thread.sleep(1000);
			element_InputTextUsingActionClass(dateTxt, date);
			Thread.sleep(2000);
		}
		if (allPunchesBtnCheck.size() == 0) { // for 2,4,6,8,10,12 punch user
			logger.info("2,4,6,8,10,12 punch user");
			for (int i = 0; i < data.size(); i++) {
				for (int j = 0; j < timeP.size(); j++) {
					String punchtime = timeP.get(j).getAttribute("value");
					if (punchtime.equalsIgnoreCase(data.get(i).get("Time"))) {
						logger.debug("Special function apply at "+data.get(i).get("Time"));
						element_DropDownSelectByvisibleText(specialFns.get(j), data.get(i).get("SpecialFunction"));
						Thread.sleep(500);
						// element_Click(reasonEditBtns.get(j));
						WebElement ele = timeP.get(j).findElement(By.xpath("following::label[@class='ImgEdit'][1]"));
						element_Click(ele);
						Thread.sleep(500);
						element_InputTextUsingActionClass(reasonTxts.get(j), data.get(i).get("Reason"));
						Thread.sleep(500);
						break;
					}
				}
			}
		} else {
			logger.info("N punch user");
			element_Click(allPunchesBtn);
			Thread.sleep(1000);
			for (int i = 0; i < data.size(); i++) {
				Thread.sleep(700);
				String punchtime = data.get(i).get("Time");
				logger.debug("Special function apply at "+punchtime);
				element_Click(nPunchListSearchbar);
				element_Clear(nPunchListSearchbar);
				Thread.sleep(700);
				element_InputTextUsingActionClass(nPunchListSearchbar, punchtime);
				Thread.sleep(700);
				element_Click(nPunchRowSpfn);
				
				element_DropDownSelectByvisibleText(nPunchRowSpfn.findElement(By.xpath("select")), data.get(i).get("SpecialFunction"));
				Thread.sleep(700);
				element_Click(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[1]//*[@class='mx-input-theme cursor grid_Icon']")));
				Thread.sleep(700);
				List<WebElement> reasonTxtEleChk = nPunchRowSpfn.findElements(By.xpath("following-sibling::td[1]//*[@id='txtNpunchReason']"));
				if (reasonTxtEleChk.size()>0) {
					element_Clear(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[1]//*[@id='txtNpunchReason']")));
					element_InputTextUsingActionClass(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[1]//*[@id='txtNpunchReason']")),data.get(i).get("Reason"));
				} else {
					element_Click(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[1]//*[@class='mx-input-theme cursor grid_Icon']")));
					element_Clear(nPunchRowSpfn.findElement(By.xpath("")));
					element_InputTextUsingActionClass(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[1]//*[@id='txtNpunchReason']")),data.get(i).get("Reason"));
				}
				Thread.sleep(700);
				element_Click(nPunchRowSpfn.findElement(By.xpath("following-sibling::td[4]//a[@id='savebtn' and not(@hidden)]")));
			}
			Thread.sleep(700);
			element_Click(nPunchPopupOkBtn);
		}
		Thread.sleep(500);
		saveButtonClick();
		String val = validationMessage();
		if (val.contains("Available Short Leave Count")) {
			val = "Available Short Leave Count is less";
			cancelButtonClick();
		}
		return val;
	}
	public Map<String, String> shortOfficialApplicationDatagetForCustomAlert(String date) throws InterruptedException {
		Map<String, String> data=new HashMap<String, String>();
		pageLoadWaitng();
		waitForElementVisible(dateTxt);
		element_InputTextUsingActionClass(dateTxt, date);
		Thread.sleep(2000);
		if (applicationSummaryPanelOpenOrNot.size()>0) {
			element_Click(applicationSummaryPanel);
		}
		data.put("UserName",userIDName.getText() );
		Thread.sleep(1500);
		for(int i=0;i<applicationSummaryGetData.size();i++) {
			if(i==0) {
				data.put("start", applicationSummaryGetData.get(i).getText());
			}
			else if(i==1) {
				data.put("end", applicationSummaryGetData.get(i).getText());
			}
			else if(i==2) {
				data.put("applyDuration", applicationSummaryGetData.get(i).getText());
			}
			else if(i==3) {
				data.put("PostDuration", applicationSummaryGetData.get(i).getText());
			}
			else if(i==4) {
				data.put("SpecialFunction", applicationSummaryGetData.get(i).getText());
			}else if(i==5) {
				data.put("status", applicationSummaryGetData.get(i).getText());
			}

		}
		element_Click(appDetails);
		Thread.sleep(1500);
		data.put("reason", element_getInputControlValue(appReason));
		data.put("ApprovedRejectedRemark", element_getInputControlValue(appRejRemark));
		element_Click(okButtonPopUp);
		Thread.sleep(1000);
		
		
		return data;
	}
		

}
