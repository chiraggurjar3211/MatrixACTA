package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;

public class VisitorEventsPO extends AbstractMethod{
	WebDriver driver;
	public VisitorEventsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(id = "_txtFrmDate")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_txtToDate")
	private WebElement toDtTxt;
	
	@FindBy(id = "cboVisitorFilter")
	private WebElement visitorFilterDD;
	
	@FindBy(id = "AllVisitorID")
	private WebElement vMobileTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_grdVisitorEvents']//table/tbody/tr[not(@hidden)]")
	private List<WebElement> eventRowsSize;
	//************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void verifyEventsCount(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String fdate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
		element_Clear(fromDtTxt);
		element_InputTextUsingActionClass(fromDtTxt, fdate);
		String tdate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
		element_Clear(toDtTxt);
		element_InputTextUsingActionClass(toDtTxt, tdate);
		element_DropDownSelectByvisibleText(visitorFilterDD, "Randomly");
		element_Clear(vMobileTxt);
		element_dynamicDDSelect(vMobileTxt, data.get("VMobile"));
		element_TextBoxToClickOnTab(vMobileTxt);
		element_Click(viewBtn);
		Thread.sleep(1000);
		int actualCount = eventRowsSize.size();
		int expectedCount = Integer.parseInt(data.get("EventCount"));
		Assert.assertEquals(actualCount, expectedCount);
	}

}
