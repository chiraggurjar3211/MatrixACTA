package PageObject.TimeAndAttendance;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;


public class COFFPolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(COFFPolicyPO.class);
	public COFFPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id = "COFFPolicyName")
	private WebElement policyNameTxt;
	
	@FindBy(id = "txtMinOTREQ")
	private WebElement minOTReqForCOffTxt;
	
	@FindBy(id = "COAUTHMLTPL")
	private WebElement cOffAuthInMultTxt;
	
	@FindBy(id = "txtcovlf")
	private WebElement cOffValidityTypeDrop;
	
	@FindBy(xpath = "//*[@name='txtCOVLDT']")
	private WebElement cOffValidityMonTxt;
	
	@FindBy(id = "cboDays")
	private WebElement cOffValidityResetOnDtDrop;
	
	@FindBy(id = "cboMonths")
	private WebElement cOffValidityResetOnMonDrop;
	
	@FindBy(id = "txtCOVLDT")
	private WebElement cOffValidityDaysTxt;
	
	@FindBy(id = "txtMinCoffHrsHalfDay")
	private WebElement MinCOFFForHalfDayOffTxt;
	
	@FindBy(id = "txtMinCoffHrsFullDay")
	private WebElement MinCOFFForFullDayOffTxt;
	
	@FindBy(id = "chkCOAUTHFLG")
	private WebElement autoAuthCOffChk;
	
	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allCOPlcNames;
	
	//////////////
	public void createCOFFPolicy(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PlcName: "+data.get("PlcName"));
			String plcName = data.get("PlcName");
			String minOTReqForCOFF = data.get("MinOTReqForCOFF");
			String cOFFAuthInMultOf = data.get("COFFAuthInMultOf");
			String cOffValidityType = data.get("COffValidityType");
			String cOffValidityMonths = data.get("COffValidityMonths");
			String cOffValidityResetOnDate = data.get("COffValidityResetDate");
			String cOffValidityResetOnMonth = data.get("COffValidityResetMonth");
			String cOffValidityDays = data.get("COffValidityDays");
			String minCOff4HalfDayOff = data.get("MinCOff4HalfDayOff");
			String minCOff4FullDayOff = data.get("MinCOff4FullDayOff");
			String autoAuthCOFF = data.get("AutoAuthCOFF");
			String validation = data.get("Validation");
			
			if (element_isEnabled(searchTextBoxTitleBar)) {
				element_Clear(searchTextBoxTitleBar);
				element_InputTextUsingActionClass(searchTextBoxTitleBar, plcName);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
				Thread.sleep(1000);
				ArrayList<String> allCOPlc = new ArrayList<>();
				if (allCOPlcNames.size() > 0) {
					for (int j = 0; j < allCOPlcNames.size(); j++) {
						String plName = allCOPlcNames.get(j).getText();
						allCOPlc.add(plName);
						if (plName.equalsIgnoreCase(plcName)) {
							allCOPlcNames.get(j).click();
							deleteButtonClick();
							Thread.sleep(1000);
							driver.switchTo().alert().accept();
							Thread.sleep(1000);
							String valMsg = validationMessage();
							Thread.sleep(1000);
							Assert.assertEquals(valMsg, "Deleted Successfully");
							Thread.sleep(1000);
						}
					}
				}
			}
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(2000);
			element_Clear(policyNameTxt);
			element_InputTextUsingActionClass(policyNameTxt, plcName);
			Thread.sleep(1000);
			element_Clear(minOTReqForCOffTxt);
			element_inputTextUsingActionClassCharacterOneByOne(minOTReqForCOffTxt, minOTReqForCOFF);
			element_Clear(cOffAuthInMultTxt);
			element_inputTextUsingActionClassCharacterOneByOne(cOffAuthInMultTxt, cOFFAuthInMultOf);
			element_DropDownSelectByvisibleText(cOffValidityTypeDrop, cOffValidityType);
			if(cOffValidityType.equalsIgnoreCase("Monthly") && cOffValidityMonths != null) {
				element_Clear(cOffValidityMonTxt);
				element_InputTextUsingActionClass(cOffValidityMonTxt, cOffValidityMonths);
				Thread.sleep(500);
			}
			//Provided static data for C-OFF Validity Reset On (Date-Month)
			if(cOffValidityType.equalsIgnoreCase("Yearly")) {
				String dt = staticDateOrPlusMinusFromCurrentDate("-1");
				String dt1[] = dt.split("/");
				if(dt1[0].startsWith("0")) {
					dt1[0]= dt1[0].replace("0", "");
				}
				element_DropDownSelectByvisibleText(cOffValidityResetOnDtDrop, dt1[0]);
				Thread.sleep(500);
				String month1 = getMonthCheckWhilePlusOrMinusDate("0", "-1");
				element_DropDownSelectByvisibleText(cOffValidityResetOnMonDrop, month1);
			}
			if(cOffValidityType.equalsIgnoreCase("Days") && cOffValidityDays != null) {
				element_Clear(cOffValidityDaysTxt);
				element_InputTextUsingActionClass(cOffValidityDaysTxt, cOffValidityDays);
				Thread.sleep(500);
			}
			element_Clear(MinCOFFForHalfDayOffTxt);
			element_inputTextUsingActionClassCharacterOneByOne(MinCOFFForHalfDayOffTxt, minCOff4HalfDayOff);
			Thread.sleep(500);
			element_Clear(MinCOFFForFullDayOffTxt);
			element_inputTextUsingActionClassCharacterOneByOne(MinCOFFForFullDayOffTxt, minCOff4FullDayOff);
			if(autoAuthCOFF !=null) {
				boolean autoAuthCOFFBool = Boolean.parseBoolean(autoAuthCOFF);
				if (autoAuthCOFFBool == true) {
					if (element_isSelected(autoAuthCOffChk) != true) {
						element_Click(autoAuthCOffChk);
					}
				} else {
					if (element_isSelected(autoAuthCOffChk) == true) {
						element_Click(autoAuthCOffChk);
					}
				}
				Thread.sleep(1000);
			}
			saveButtonClick();
			Thread.sleep(1000);
			String actValMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(actValMsg, validation);
			Thread.sleep(1000);
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}
	
	public String getMonthCheckWhilePlusOrMinusDate(String month,String date) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MMMM");
		LocalDateTime now = LocalDateTime.now();
		int dat = Integer.parseInt(date);
		LocalDateTime nextdate = now.plusDays(dat);
		String ddMMyyyy = nextdate.format(dtf);
		int mo = Integer.parseInt(month);
		LocalDateTime monthGet = now.plusDays(mo);
		String ddMonth = monthGet.format(dtf);
		if(ddMMyyyy.equalsIgnoreCase(ddMonth)==false) {
			ddMonth=ddMMyyyy;
		}
		return ddMMyyyy;
	}
}
