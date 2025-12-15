package PageObject.LeaveManagement;

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
import io.cucumber.datatable.DataTable;
import io.opentelemetry.exporter.logging.SystemOutLogRecordExporter;

public class AccrualPolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AccrualPolicyPO.class);
	
	// Created by Mayank
	public AccrualPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "AccrualPolicyID")
	private WebElement plcIdTxt;

	@FindBy(id = "AccrualPolicyName")
	private WebElement accrlPlcNameTxt;

	@FindBy(id = "CboMnthYear")
	private WebElement plcPrdDrop;

	@FindBy(id = "cboCreditMode")
	private WebElement accrlModeDrop;

	@FindBy(id = "cboLCInTerms")
	private WebElement crInTermsDrop;

	@FindBy(id = "txtJan")
	private WebElement janTxt;

	@FindBy(id = "txtFeb")
	private WebElement febTxt;

	@FindBy(id = "txtMar")
	private WebElement marTxt;

	@FindBy(id = "txtApr")
	private WebElement aprTxt;

	@FindBy(id = "txtMay")
	private WebElement mayTxt;

	@FindBy(id = "txtJun")
	private WebElement junTxt;

	@FindBy(id = "txtJul")
	private WebElement julTxt;

	@FindBy(id = "txtAug")
	private WebElement augTxt;

	@FindBy(id = "txtSep")
	private WebElement sepTxt;

	@FindBy(id = "txtOct")
	private WebElement octTxt;

	@FindBy(id = "txtNov")
	private WebElement novTxt;

	@FindBy(id = "txtDec")
	private WebElement decTxt;

	@FindBy(id = "txtYearlyCreditDay")
	private WebElement crDaysTxt;

	@FindBy(id = "cboMonths")
	private WebElement preMnthConsDrop;

	@FindBy(id = "cboPayNPDay")
	private WebElement atdDaysDrop;

	@FindBy(id = "cboPayDays")
	private WebElement payableDaysDrop;

	@FindBy(id = "cboNonPayDays")
	private WebElement nonPayableDaysDrop;

	@FindBy(id = "timeJan_1")
	private WebElement timeJanTxtHHH;

	@FindBy(id = "timeJan_2")
	private WebElement timeJanTxtMM;

	@FindBy(id = "timeFeb_1")
	private WebElement timeFebTxtHHH;

	@FindBy(id = "timeFeb_2")
	private WebElement timeFebTxtMM;

	@FindBy(id = "timeMar_1")
	private WebElement timeMarTxtHHH;

	@FindBy(id = "timeMar_2")
	private WebElement timeMarTxtMM;

	@FindBy(id = "timeApr_1")
	private WebElement timeAprTxtHHH;

	@FindBy(id = "timeApr_2")
	private WebElement timeAprTxtMM;

	@FindBy(id = "timeMay_1")
	private WebElement timeMayTxtHHH;

	@FindBy(id = "timeMay_2")
	private WebElement timeMayTxtMM;

	@FindBy(id = "timeJun_1")
	private WebElement timeJunTxtHHH;

	@FindBy(id = "timeJun_2")
	private WebElement timeJunTxtMM;

	@FindBy(id = "timeJul_1")
	private WebElement timeJulTxtHHH;

	@FindBy(id = "timeJul_2")
	private WebElement timeJulTxtMM;

	@FindBy(id = "timeAug_1")
	private WebElement timeAugTxtHHH;

	@FindBy(id = "timeAug_2")
	private WebElement timeAugTxtMM;

	@FindBy(id = "timeSep_1")
	private WebElement timeSepTxtHHH;

	@FindBy(id = "timeSep_2")
	private WebElement timeSepTxtMM;

	@FindBy(id = "timeOct_1")
	private WebElement timeOctTxtHHH;

	@FindBy(id = "timeOct_2")
	private WebElement timeOctTxtMM;

	@FindBy(id = "timeNov_1")
	private WebElement timeNovTxtHHH;

	@FindBy(id = "timeNov_2")
	private WebElement timeNovTxtMM;

	@FindBy(id = "timeDec_1")
	private WebElement timeDecTxtHHH;

	@FindBy(id = "timeDec_2")
	private WebElement timeDecTxtMM;

	@FindBy(id = "timeYearlyCreditHr_1")
	private WebElement crHrsHHHTxt;

	@FindBy(id = "timeYearlyCreditHr_2")
	private WebElement crHrsMMTxt;

	@FindBy(id = "LeaveFrom")
	private WebElement fromTxt;

	@FindBy(id = "LeaveUpTo")
	private WebElement toTxt;

	@FindBy(id = "LeaveRND")
	private WebElement fixValTxt;

	@FindBy(id = "LeaveRND_1")
	private WebElement fixValTxtHHH;

	@FindBy(id = "LeaveRND_2")
	private WebElement fixValTxtMM;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> tableAfterSearch;

	@FindBy(xpath = "//*[@class='col-md-5 col-sm-12']/input")
	private List<WebElement> days;

	@FindBy(xpath = "//*[@class='col-md-5 col-sm-12']//table//tr/td[1]/input")
	private List<WebElement> hrsTxt;

	@FindBy(xpath = "//*[@class='col-md-5 col-sm-12']//table//tr/td[3]/input")
	private List<WebElement> minuteTxt;

	@FindBy(id = "grdConsideredAttendenceaddBtn")
	private WebElement plusButton;

	@FindBy(xpath = "//*[@id='savebtn']/i")
	private WebElement okBtn;

	@FindBy(xpath = "//*[@id='div_grd_grdConsideredAttendence']//table/tbody/tr/td[5]/i[@class='fa fa-trash-can']")
	private WebElement ConsidrAtdTblDeleteBtn;

	@FindBy(xpath = "//*[@id='div_grd_grdConsideredAttendence']//table/tbody/tr[not(@hidden)]")
	private List<WebElement> ConsidrAtdTbl;

	//////////////////

	public void createAccrualPolicy(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(plcIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("AccrPlcName: "+data.get("AccrPlcName")+" AccrualMode: "+data.get("AccrualMode"));
			String accrPlcName = data.get("AccrPlcName");
			String policyPeriod = data.get("PolicyPeriod");
			String accrualMode = data.get("AccrualMode");
			String creditInTermsOf = data.get("CreditInTermsOf");
			String creditDays = data.get("CreditDays");
			String previMnthConsi = data.get("PreviMonConsi");
			String atdDays = data.get("AtdDays");
			String payableDays = data.get("PayableDays");
			String nonPayableDays = data.get("NonPayableDays");
			String fromDate = data.get("FromDate");
			String toDate = data.get("ToDate");
			String fixVal = data.get("FixVal");
			String crHrs = data.get("CrHrs");
			String validation = data.get("Validation");
			List<String> month = new ArrayList<String>();
			month.add(data.get("January"));
			month.add(data.get("February"));
			month.add(data.get("March"));
			month.add(data.get("April"));
			month.add(data.get("May"));
			month.add(data.get("June"));
			month.add(data.get("July"));
			month.add(data.get("August"));
			month.add(data.get("September"));
			month.add(data.get("October"));
			month.add(data.get("November"));
			month.add(data.get("December"));

			if (element_isEnabled(searchTextBoxTitleBar)) {
				element_Clear(searchTextBoxTitleBar);
				element_InputTextUsingActionClass(searchTextBoxTitleBar, accrPlcName);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
				Thread.sleep(1000);
				ArrayList<String> ar = new ArrayList<>();
				if (tableAfterSearch.size() > 0) {
					for (int i = 0; i < tableAfterSearch.size(); i++) {
						String plcName1 = tableAfterSearch.get(i).getText().toUpperCase();
						ar.add(plcName1);
						if (plcName1.equalsIgnoreCase(accrPlcName.toUpperCase())) {
							tableAfterSearch.get(i).click();
							break;
						}
					}
				} 
				if (!ar.contains(accrPlcName.toUpperCase())) {
					Thread.sleep(1000);
					addButtonClick();
					Thread.sleep(1000);
					element_Clear(accrlPlcNameTxt);
					element_InputTextUsingActionClass(accrlPlcNameTxt, accrPlcName);
				}

			} else {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(accrlPlcNameTxt);
				element_InputTextUsingActionClass(accrlPlcNameTxt, accrPlcName);
			}
			// Main Code
			Thread.sleep(500);
			if (policyPeriod != null) {
				if (plcPrdDrop.isEnabled() == true) {
					//element_Click(plcPrdDrop);
					element_DropDownSelectByvisibleText(plcPrdDrop, policyPeriod);
					Thread.sleep(1000);
				}
			}
			if (accrualMode != null) {
				//element_Click(accrlModeDrop);
				element_DropDownSelectByvisibleText(accrlModeDrop, accrualMode);
				Thread.sleep(1000);
			}
			if (creditInTermsOf != null) {
				if (crInTermsDrop.isEnabled() == true) {
					//element_Click(crInTermsDrop);
					element_DropDownSelectByvisibleText(crInTermsDrop, creditInTermsOf);
					Thread.sleep(2000);
				}
			}
			if (creditDays != null) {
				element_Clear(crDaysTxt);
				Thread.sleep(1000);
				element_Click(crDaysTxt);
				//element_InputTextUsingActionClass(crDaysTxt, creditDays);
				//element_InputDataUsingJS(crDaysTxt, creditDays);
				//element_TextBoxToClickOnTab(crDaysTxt);
				element_InputTextUsingActionClass(crDaysTxt, creditDays);
				Thread.sleep(1000);
				element_Click(accrlPlcNameTxt);
			}
			if (crHrs != null) {
				if (crHrs.contains(":")) {
					String[] crHrs1 = crHrs.split(":");
					element_Clear(crHrsHHHTxt);
					element_InputTextUsingActionClass(crHrsHHHTxt, crHrs1[0]);
					element_Clear(crHrsMMTxt);
					element_InputTextUsingActionClass(crHrsMMTxt, crHrs1[1]);
					Thread.sleep(1000);
				}
			}
			if (accrualMode.equalsIgnoreCase("Fixed")) {
				if (creditInTermsOf.equalsIgnoreCase("Hours")) {
					for (int i = 0; i < hrsTxt.size(); i++) {
						if (month.get(i) != null) {
							if (month.get(i).contains(":")) {
								String[] hrsMMAr = month.get(i).split(":");
								Thread.sleep(500);
								hrsTxt.get(i).clear();
								element_InputTextUsingActionClass(hrsTxt.get(i), hrsMMAr[0]);
								minuteTxt.get(i).clear();
								element_InputTextUsingActionClass(minuteTxt.get(i), hrsMMAr[1]);
							}
						}
					}
				} else {
					for (int i = 0; i < days.size(); i++) {
						if (month.get(i) != null) {
							days.get(i).sendKeys(Keys.CONTROL + "a");
							days.get(i).sendKeys(Keys.DELETE);
							element_InputTextUsingActionClass(days.get(i), month.get(i));
						}
					}
				}
			} else {
				if (previMnthConsi != null) {
					if (preMnthConsDrop.isEnabled() == true) {
						//element_Click(preMnthConsDrop);
						element_DropDownSelectByvisibleText(preMnthConsDrop, previMnthConsi);
						Thread.sleep(1000);
					}
				}
				if (atdDays != null) {
					//element_Click(atdDaysDrop);
					element_DropDownSelectByvisibleText(atdDaysDrop, atdDays);
					Thread.sleep(1000);
				}
				if (payableDays != null) {
					if (payableDaysDrop.isDisplayed() == true) {
						//element_Click(payableDaysDrop);
						element_DropDownSelectByvisibleText(payableDaysDrop, payableDays);
						Thread.sleep(1000);
					}
				}
				if (nonPayableDays != null) {
					if (nonPayableDaysDrop.isDisplayed() == true) {
						//element_Click(nonPayableDaysDrop);
						element_DropDownSelectByvisibleText(nonPayableDaysDrop, nonPayableDays);
						Thread.sleep(1000);
					}
				}
				if (ConsidrAtdTbl.size()==0) {
					element_Click(plusButton);
					element_Clear(fromTxt);
					element_InputTextUsingActionClass(fromTxt, fromDate);
					element_TextBoxToClickOnTab(fromTxt);
					element_Clear(toTxt);
					element_InputTextUsingActionClass(toTxt, toDate);
					element_TextBoxToClickOnTab(toTxt);
					if (fixVal.contains(":")) {
						String[] fixValAr = fixVal.split(":");
						element_Clear(fixValTxtHHH);
						element_InputTextUsingActionClass(fixValTxtHHH, fixValAr[0]);
						element_Clear(fixValTxtMM);
						element_InputTextUsingActionClass(fixValTxtMM, fixValAr[1]);
					} else {
						element_Clear(fixValTxt);
						element_InputTextUsingActionClass(fixValTxt, fixVal);
					}
					Thread.sleep(500);
					element_Click(okBtn);
					Thread.sleep(500);
				}
			}
			Thread.sleep(1000);
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, validation);
		}
	}

	public void addValuesInAccrualPolicy(String plcName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(plcIdTxt);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, plcName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);

			if (tableAfterSearch.size() > 0) {
				for (int i = 0; i < tableAfterSearch.size(); i++) {
					String plcName1 = tableAfterSearch.get(i).getText().toUpperCase();

					if (plcName1.equalsIgnoreCase(plcName.toUpperCase())) {
						tableAfterSearch.get(i).click();
						break;
					}
				}
				Thread.sleep(1000);
				if(ConsidrAtdTbl.size() > 0) {
					for(int i=0; i<ConsidrAtdTbl.size(); i++) {
						element_Click(ConsidrAtdTblDeleteBtn);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
					}
				}
				for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
					logger.info("Accrual Policy Name: "+plcName+" FromDate: "+data.get("FromDate"));
					String fDate = data.get("FromDate");
					String tDate = data.get("ToDate");
					String fixVal = data.get("FixVal");
					element_Click(plusButton);
					Thread.sleep(500);
					element_Clear(fromTxt);
					element_InputTextUsingActionClass(fromTxt, fDate);
					element_TextBoxToClickOnTab(fromTxt);
					element_Clear(toTxt);
					element_InputTextUsingActionClass(toTxt, tDate);
					element_TextBoxToClickOnTab(toTxt);
					if (fixVal.contains(":")) {
						String[] fixValAr = fixVal.split(":");
						element_Clear(fixValTxtHHH);
						element_InputTextUsingActionClass(fixValTxtHHH, fixValAr[0]);
						Thread.sleep(500);
						element_Clear(fixValTxtMM);
						element_InputTextUsingActionClass(fixValTxtMM, fixValAr[1]);
					} else {
						element_Clear(fixValTxt);
						element_InputTextUsingActionClass(fixValTxt, fixVal);
					}
					Thread.sleep(500);
					element_Click(okBtn);
					Thread.sleep(500);
				}
				saveButtonClick();
				Thread.sleep(1000);
				Thread.sleep(1000);
				String valMsg = validationMessage();
				Assert.assertEquals(valMsg, "Saved Successfully");

			} else {
				Thread.sleep(1000);
				element_Clear(searchTextBoxTitleBar);
			}

		}
	}
}
