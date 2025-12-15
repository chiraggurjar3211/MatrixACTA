package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class MonthlyAttendanceProcess extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(MonthlyAttendanceProcess.class);
	
	public MonthlyAttendanceProcess(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "ddlMnth")
	private WebElement selectMonth;
	
	@FindBy(id = "ddlYear")
	private WebElement selectYear;
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "ID")
	private WebElement userID;
	
	@FindBy(xpath = "//*[@value='Process']")
	private WebElement processButton;
	
	@FindBy(name = "sendAlert")
	private WebElement sendAlertFlag;
	
	@FindBy(name = "isCloseAttendance")
	private WebElement clsAtdPeriodFlag;
	
	@FindBy(xpath = "//*[@key='btnConfirmOK']")
	private WebElement clsAtdPeriodConfirmOk;
	
	// Created by Chirag
	public String monthlyAttendanceProcess(String clsAtdPeriod, String month,String year,List<Map<String, String>> data) throws InterruptedException {
		waitForElementVisible(selectMonth);
		String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		String year1 = staticYearOrPlusMinusYearFromCurrentYear(month, year);
		element_DropDownSelectByvisibleText(selectMonth, month1);
		element_DropDownSelectByvisibleText(selectYear, year1);
		element_Click(sendAlertFlag);  // Changed by Mayank for Alert
		Boolean clsAtdPeriod1 = Boolean.parseBoolean(clsAtdPeriod);
		if (clsAtdPeriod1==true) {
			if (!clsAtdPeriodFlag.isSelected()) {
				element_Click(clsAtdPeriodFlag);
			}
			Thread.sleep(500);
			for(int i=0;i<data.size();i++) {
				logger.info("userID: "+data.get(i).get("UserID"));
				element_dynamicDDSelect(userID, data.get(i).get("UserID"));
				element_TextBoxToClickOnTab(userID);
			}
			element_Click(processButton);
			element_Click(clsAtdPeriodConfirmOk);
		}
		else {
			if (clsAtdPeriodFlag.isSelected()) {
				element_Click(clsAtdPeriodFlag);
			}
			Thread.sleep(500);
			for(int i=0;i<data.size();i++) {
				logger.info("userID: "+data.get(i).get("UserID"));
				element_dynamicDDSelect(userID, data.get(i).get("UserID"));
				element_TextBoxToClickOnTab(userID);
			}
			element_Click(processButton);
		}
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		String val=validationMessage();
		return val;
		
	}
	
}
