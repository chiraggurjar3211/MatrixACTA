package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
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

public class LeaveApplicationPO extends AbstractMethod {
	WebDriver driver;

	public LeaveApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "LAUserID")
	private WebElement useridtxt;
	
	@FindBy(xpath = "(//*[@id='CboHalfDay'])[1]")
	private WebElement consiInTermsOfDrop;

	@FindBy(id = "_PDate")
	private WebElement atdDateTxt;

	@FindBy(id = "txtFromTime")
	private WebElement startTimeTxt;

	@FindBy(id = "txtToTime")
	private WebElement toTimeTxt;
	
	@FindBy(id = "cboFromHalf")
	private WebElement fullDayHalfDayDrop1;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_Todate")
	private WebElement toDateTxt;

	@FindBy(id = "cboLeaveID")
	private WebElement leaveDrop;

	@FindBy(xpath = "//*[@id='btnSave']")
	private WebElement submitBtn;
	
	// Created by Mayank
	// Leave Application via API
	public String leaveApplicationAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
		String apiPar=null;

				if (columnHeader.contains("Action")) {
					if (data.get("Action")!=null) {
						apiParameter.add("Action="+data.get("Action"));
					}
				}
				if (columnHeader.contains("userid")) {
					if (data.get("userid")!=null) {
					apiParameter.add("userid="+data.get("userid"));
					}
				}
				if (columnHeader.contains("half-consideration")) {
					if (data.get("half-consideration")!=null) {
					apiParameter.add("half-consideration="+data.get("half-consideration"));
					}
				}
				if (columnHeader.contains("Start-date")) {
					if (data.get("Start-date")!=null) {
					String date=staticDateOrPlusMinusFromCurrentDate(data.get("Start-date"));
					apiParameter.add("Start-date="+date);
					}
				}
				if (columnHeader.contains("end-date")) {
					if (data.get("end-date")!=null) {
					String date=staticDateOrPlusMinusFromCurrentDate(data.get("end-date"));
					apiParameter.add("end-date="+date);
					}
				}
				if (columnHeader.contains("leave-code")) {
					if (data.get("leave-code")!=null) {
					apiParameter.add("leave-code="+data.get("leave-code"));
					}
				}
				if (columnHeader.contains("attendance-date")) {
					if (data.get("attendance-date")!=null) {
						String date=staticDateOrPlusMinusFromCurrentDate(data.get("attendance-date"));
					apiParameter.add("attendance-date="+date);
					}
				}
				if (columnHeader.contains("hourly-start-time")) {
					if (data.get("hourly-start-time")!=null) {
					String startTime=staticTimeOrPlusMinusHoursFromCurrentTime(data.get("hourly-start-time"));
					apiParameter.add("hourly-start-time="+startTime);
					}
				}
				if (columnHeader.contains("hourly-end-time")) {
					if (data.get("hourly-end-time")!=null) {
					String endTime=staticTimeOrPlusMinusHoursFromCurrentTime(data.get("hourly-end-time"));
					apiParameter.add("hourly-end-time="+endTime);
					}
				}
				
		return apiPar;
	}
	
	// Created by Mayank
	// Leave Modification Cancellation Application via API
		public String leaveModificationCancellationAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data, String tid) {
			String apiPar=null;

					if (columnHeader.contains("Action")) {
						if (data.get("Action")!=null) {
						apiParameter.add("Action="+data.get("Action"));
						}
					}
					if (columnHeader.contains("userid")) {
						if (data.get("userid")!=null) {
						apiParameter.add("userid="+data.get("userid"));
						}
					}
					apiParameter.add("tid="+tid);
					if (columnHeader.contains("request-type")) {
						if (data.get("request-type")!=null) {
						apiParameter.add("request-type="+data.get("request-type"));
						}
					}
					if (columnHeader.contains("half-consideration")) {
						if (data.get("half-consideration")!=null) {
						apiParameter.add("half-consideration="+data.get("half-consideration"));
						}
					}
					if (columnHeader.contains("Start-date")) {
						if (data.get("Start-date")!=null) {
						String date=dateSelectedinddMMyyyy(data.get("Start-date"));
						apiParameter.add("Start-date="+date);
						}
					}
					if (columnHeader.contains("end-date")) {
						if (data.get("end-date")!=null) {
						String date=dateSelectedinddMMyyyy(data.get("end-date"));
						apiParameter.add("end-date="+date);
						}
					}
					
			return apiPar;
		}

	//Mayank
	public void applyLeaveApplication(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (data.get("userid") != null) {
			element_Clear(useridtxt);
			Thread.sleep(250);
			element_dynamicDDSelect(useridtxt, data.get("userid"));
//			element_TextBoxToClickOnTab(useridtxt);
		}
		Thread.sleep(1000);
		addButtonClick();
		Thread.sleep(2000);
		if (data.get("ConsiInTermsOf") != null) {
			element_DropDownSelectByvisibleText(consiInTermsOfDrop, data.get("ConsiInTermsOf"));
			Thread.sleep(1000);
		}
		if (data.get("AtdDate") != null) {
			String atdDate = staticDateOrPlusMinusFromCurrentDate(data.get("AtdDate"));
			element_InputTextUsingActionClass(atdDateTxt, atdDate);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(atdDateTxt);
		}
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("FromDate")));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, staticDateOrPlusMinusFromCurrentDate(data.get("ToDate")));
		Thread.sleep(500);
		element_TextBoxToClickOnTab(toDateTxt);
		Thread.sleep(500);
		if (data.get("Duration") != null) {
			element_DropDownSelectByvisibleText(fullDayHalfDayDrop1, data.get("Duration"));
			Thread.sleep(500);
		}
		if (data.get("FromTime") != null) {
			String convertStartTime = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("FromTime"));
			element_inputTextUsingActionClassCharacterOneByOne(startTimeTxt, convertStartTime);
			Thread.sleep(500);
		}
		if (data.get("ToTime") != null) {
			String convertToTime = staticTimeOrPlusMinusMinutesFromCurrentTime(data.get("ToTime"));
			element_inputTextUsingActionClassCharacterOneByOne(toTimeTxt, convertToTime);
			Thread.sleep(500);
		}
		element_DropDownSelectByvisibleText(leaveDrop, data.get("Leave"));
		Thread.sleep(500);
		element_ClickUsingJS(submitBtn);
		element_ClickUsingJS(submitBtn);
		Thread.sleep(1500);
		Assert.assertEquals(validationMessage(), data.get("Validation"));
		
		
		
	}



}
