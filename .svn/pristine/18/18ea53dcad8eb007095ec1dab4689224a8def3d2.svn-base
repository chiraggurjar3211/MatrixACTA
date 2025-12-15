package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class FormSummaryPO extends AbstractMethod {
	WebDriver driver;

	public FormSummaryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Mayank
	// ************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(id = "StationLocationMstPicklistName")
	private WebElement stationLocationNameTxt;

	@FindBy(id = "OTPVerifiedVisitorsPickListID")
	private WebElement vMobileTxt;

	@FindBy(id = "_txtFrmDate")
	private WebElement fromDtTxt;

	@FindBy(id = "_txtToDate")
	private WebElement toDtTxt;

	@FindBy(id = "cboFormType")
	private WebElement typeDD;

	@FindBy(id = "btnPreview")
	private WebElement previewBtn;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr")
	private List<WebElement> formSummaryRowsSize;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)]//label[not(@hidden)]")
	private List<WebElement> tabData;

	// ************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void verifyFormSummary(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("StationLocation") != null) {
			element_Clear(stationLocationNameTxt);
			element_dynamicDDSelect(stationLocationNameTxt, data.get("StationLocation"));
			element_TextBoxToClickOnTab(stationLocationNameTxt);
		}
		if (data.get("VMobile") != null) {
			element_Clear(vMobileTxt);
			element_dynamicDDSelect(vMobileTxt, data.get("VMobile"));
			element_TextBoxToClickOnTab(vMobileTxt);
		}
		if (data.get("FromDt") != null) {
			String dt = staticDateOrPlusMinusFromCurrentDate(data.get("FromDt"));
			element_Clear(fromDtTxt);
			element_InputTextUsingActionClass(fromDtTxt, dt);
		}
		if (data.get("ToDt") != null) {
			String dt = staticDateOrPlusMinusFromCurrentDate(data.get("ToDt"));
			element_Clear(toDtTxt);
			element_InputTextUsingActionClass(toDtTxt, dt);
		}
		if (data.get("FormType") != null) {
			element_DropDownSelectByvisibleText(typeDD, data.get("FormType"));
		}
		element_Click(previewBtn);
		Thread.sleep(1000);
		int actualCount = formSummaryRowsSize.size();
		int expectedCount = Integer.parseInt(data.get("Count"));
		Assert.assertEquals(actualCount, expectedCount);
	}

	public Map<String, String> getFormSummaryDataForCustomAlert(String statn, String mobil, String formT) throws Exception {
		Map<String, String> data = new HashMap<String, String>();
		pageLoadWaitng();
		waitForElementVisible(stationLocationNameTxt);
		element_Clear(stationLocationNameTxt);
		element_InputTextUsingActionClass(stationLocationNameTxt, statn);
		element_TextBoxToClickOnTab(stationLocationNameTxt);
		element_Clear(vMobileTxt);
		Thread.sleep(250);
		element_dynamicDDSelect(vMobileTxt, mobil);
		Thread.sleep(250);
		element_DropDownSelectByvisibleText(typeDD, formT);
		element_Click(previewBtn);
		Thread.sleep(1000);
		for (int i = 0; i < tabData.size(); i++) {
			if (i == 1) {
				data.put("datetime", tabData.get(i).getText());
			} else if (i == 2) {
				data.put("formName", tabData.get(i).getText());
			} else if (i == 3) {
				data.put("Attempt", tabData.get(i).getText());
			} else if (i == 4) {
				data.put("FinalScore", tabData.get(i).getText());
			} else if (i == 7) {
				if(tabData.get(i).getText().equalsIgnoreCase("Pass")) {
				data.put("allowedDenied", "Allowed" );
				}
				else {
					data.put("allowedDenied", "Not Allowed" );
				}
			}
		}
		return data;
	}

}
