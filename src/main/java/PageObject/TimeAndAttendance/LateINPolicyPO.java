package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Alert;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class LateINPolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LateINPolicyPO.class);
	public LateINPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> lateInPlcNames;
	
	@FindBy(id = "LateInPickListName")
	private WebElement policyNameTxt;
	
	@FindBy(id = "LateInApplicable")
	private WebElement lateInApplicableFlag;
	
	@FindBy(id = "MAXLateIn")
	private WebElement maxLateInTxt;
	
	@FindBy(id = "LateInRNDFLG")
	private WebElement roundingForFractionOfAnHourFlag;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;
	
	// update Rounding For Fraction Of An Hour
	
	@FindBy(xpath = "//*[contains(@id,'grdRoundingFractionrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;
	
	@FindBy(xpath = "//*[@id='grdRoundingFractionrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;
	
	@FindBy(id = "grdRoundingFractionaddBtn")
	private WebElement gridAddBtn;
	
	@FindBy(id = "LateFrom")
	private WebElement rangeFromTxt;
	
	@FindBy(id = "LateUpTo")
	private WebElement rangeToTxt;
	
	@FindBy(id = "FixedFlgstr")
	private WebElement considerAsDD;
	
	@FindBy(id = "LateInRND")
	private WebElement replaceValueTxt;
	
	@FindBy(xpath = "//*[@id='savebtn' and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	@FindBy(xpath = "//*[@class=\"col-md-4 col-sm-4 col-xs-12 grid\"]//*[@name='cmnTxtSearch']")
	private WebElement searchbar;
	
	
	
	
	// Functions
	// Mayank
	public void createLateInPolicy(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (lateInPlcNames.size() > 0) {
				for (int j = 0; j < lateInPlcNames.size(); j++) {
					String plcname1 = lateInPlcNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(data.get("Name"))) {
						lateInPlcNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						String delVal = validationMessage();
						Assert.assertEquals(delVal, "Deleted Successfully");
						Thread.sleep(1000);
						addButtonClick();
					}
				}
			}
			//logger.info(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
			}
		}
		// Main Code
		if (data.get("Name") != null) {
			element_Clear(policyNameTxt);
			element_InputTextUsingActionClass(policyNameTxt, data.get("Name"));
		}
		if (data.get("LateINApplicable") != null) {
			Boolean lateINApplicable = Boolean.parseBoolean(data.get("LateINApplicable"));
			if (lateINApplicable == true) {
				if (!lateInApplicableFlag.isSelected()) {
					element_Click(lateInApplicableFlag);
				}
			} else {
				if (lateInApplicableFlag.isSelected()) {
					element_Click(lateInApplicableFlag);
				}
			}
		}
		if (data.get("MaxLateIN") != null) {
			if (lateInApplicableFlag.isSelected()) {
				element_Clear(maxLateInTxt);
				element_InputTextUsingActionClass(maxLateInTxt, data.get("MaxLateIN"));
			}
		}
		if (data.get("EnblRoundingForFracOfHrs") != null) {
			Boolean enblRoundingForFracOfHrs = Boolean.parseBoolean(data.get("EnblRoundingForFracOfHrs"));
			if (enblRoundingForFracOfHrs == true) {
				if (!roundingForFractionOfAnHourFlag.isSelected()) {
					element_Click(roundingForFractionOfAnHourFlag);
				}
			} else {
				if (roundingForFractionOfAnHourFlag.isSelected()) {
					element_Click(roundingForFractionOfAnHourFlag);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Mayank
	public void updateRoundingForFractionOfAnHour(String plcName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, plcName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (lateInPlcNames.size() > 0) {
				for (int j = 0; j < lateInPlcNames.size(); j++) {
					String plcname1 = lateInPlcNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(plcName)) {
						lateInPlcNames.get(j).click();
						Thread.sleep(1000);
						//Delete already configured grid components for newly updated configuration if any
						while (gridDeleteBtns.size()!=0) {
							element_Click(gridDeleteBtn);
							driver.switchTo().alert().accept();
							Thread.sleep(1000);
						}
						//Add components in grid
						for (int i = 0; i < data.size(); i++) {
							String rangeFrom = data.get(i).get("RangeFrom");
							String rangeTo = data.get(i).get("RangeTo");
							String considerValueAs = data.get(i).get("ConsiderValueAs");
							String replaceValue = data.get(i).get("ReplaceValue");
							element_Click(gridAddBtn);
							Thread.sleep(500);
							if (rangeFrom != null) {
								logger.info("RangeFrom: "+rangeFrom);
								element_Clear(rangeFromTxt);
								element_InputTextUsingActionClass(rangeFromTxt, rangeFrom);
							}
							if (rangeTo != null) {
								logger.info("rangeTo: "+rangeTo);
								element_Clear(rangeToTxt);
								element_InputTextUsingActionClass(rangeToTxt, rangeTo);
							}
							if (considerValueAs != null) {
								element_DropDownSelectByvisibleText(considerAsDD,considerValueAs);
							}
							if (replaceValue != null) {
								if (considerValueAs.equalsIgnoreCase("Fixed")) {
									element_Clear(replaceValueTxt);
									element_InputTextUsingActionClass(replaceValueTxt, replaceValue);
								}
							}
							element_Click(gridSaveBtn); 
							Thread.sleep(1000);
						}
						saveButtonClick();
						msg = validationMessage();
						break;
					}
				}
			}
			//logger.info(ar);
			if (!ar.contains(plcName)) {
				msg = "Defined Policy doesn't exist";
			}
		}
		Thread.sleep(1000);
		Assert.assertEquals(msg, "Saved Successfully");
	}

	
	// Mayank
	public void updatePolicyPeriod(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		Thread.sleep(1000);
		if (element_isEnabled(searchbar)) {
			element_InputTextUsingActionClass(searchbar, data.get("PlcName"));
			element_TextBoxToClickOnEnter(searchbar);
			ArrayList<String> ar = new ArrayList<>();
			if (lateInPlcNames.size() > 0) {
				for (int j = 0; j < lateInPlcNames.size(); j++) {
					String plcname1 = lateInPlcNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(data.get("PlcName"))) {
						lateInPlcNames.get(j).click();
						Thread.sleep(1000);
						if (data.get("StartDate") != null) {
							String sDt = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
							element_Clear(fromDateTxt);
							element_InputTextUsingActionClass(fromDateTxt, sDt);
						}
						if (data.get("EndDate") != null) {
							String eDt = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
							element_Clear(toDateTxt);
							element_InputTextUsingActionClass(toDateTxt, eDt);
						}
						Thread.sleep(1000);
						saveButtonClick();
						msg = validationMessage();
						break;
					}
				}
			}
			// logger.info(ar);
			if (!ar.contains(data.get("PlcName"))) {
				msg = "Defined Policy doesn't exist";
			}
		}
		Thread.sleep(1000);
		Assert.assertEquals(msg, "Saved Successfully");
	}
}
