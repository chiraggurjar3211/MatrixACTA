package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;


import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class PreviousAdjustmentEntryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PreviousAdjustmentEntryPO.class);
	public PreviousAdjustmentEntryPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//***********************************************
	//Elements
	//***********************************************
	@FindBy(id = "AutoUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "_PrevDate")
	private WebElement preAtdDtTxt;
	
	@FindBy(id = "AttendanceDetails")
	private WebElement attendanceDetailsDD;
	
	@FindBy(id = "idTargetMonth")
	private WebElement targetMonthDD;
	
	@FindBy(id = "TargetYear")
	private WebElement targetYearDD;
	
	@FindBy(id = "idAttendanceDaysType")
	private WebElement atdDaysType;
	
	@FindBy(id = "AttendanceDaysValue")
	private WebElement atdDaysValue;
	
	@FindBy(id = "idWorkHoursType")
	private WebElement workHrsType;
	
	@FindBy(id = "WorkHoursValue")
	private WebElement workHrsValue;
	
	@FindBy(id = "idOverTimeType")
	private WebElement overtimeType;
	
	@FindBy(id = "OverTimeValue")
	private WebElement overtimeValue;
	
	@FindBy(id = "idShiftAllowanceType")
	private WebElement shiftAllownseType;
	
	@FindBy(id = "ShiftAllowanceValue")
	private WebElement shiftAllownseValue;
	
	@FindBy(id = "Remark")
	private WebElement remarkTxt;
	
	@FindBy(xpath = "//*[@default=\"Previous Adjustment Records\"]/ancestor::a[1]")
	private WebElement recordPanel;
	
	@FindBy(xpath = "//tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> recordRows;
	
	
	
	
	
	//***********************************************
	//Functions
	//*********************************************
	//Mayank
	public void previousAdjustmentEntry(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, data.get("UserId"));
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(1000);
		if (data.get("PrevAtdDt") != null) {
			String dt = staticDateOrPlusMinusFromCurrentDate(data.get("PrevAtdDt"));
			element_Clear(preAtdDtTxt);
			element_InputTextUsingActionClass(preAtdDtTxt, dt);
		}
		if (data.get("AtdDetails") != null) {
			element_DropDownSelectByvisibleText(attendanceDetailsDD, data.get("AtdDetails"));
		}
		if (data.get("TargetMonth") != null) {
			String month= staticMonthOrPlusMinusMonthFromCurrentMonth(data.get("TargetMonth"));
			element_DropDownSelectByvisibleText(targetMonthDD, month);
		}
		if (data.get("TargetYear") != null) {
			String year= staticYearOrPlusMinusYearFromCurrentYear(data.get("TargetMonth"), data.get("TargetYear"));
			element_DropDownSelectByvisibleText(targetYearDD, year);
		}
		if (data.get("AtdDays") != null) {
			String type = data.get("AtdDays").substring(0,1);
			String value = data.get("AtdDays").substring(1);
			if (type.equalsIgnoreCase("+")) {
				element_DropDownSelectByvisibleText(atdDaysType, "Add(+)");
			} else if (type.equalsIgnoreCase("-")) {
				element_DropDownSelectByvisibleText(atdDaysType, "Subtract(-)");
			}
			element_InputTextUsingActionClass(atdDaysValue, value);
		}
		if (data.get("WorkHrs") != null) {
			String type = data.get("WorkHrs").substring(0,1);
			String value = data.get("WorkHrs").substring(1);
			if (type.equalsIgnoreCase("+")) {
				element_DropDownSelectByvisibleText(workHrsType, "Add(+)");
			} else if (type.equalsIgnoreCase("-")) {
				element_DropDownSelectByvisibleText(workHrsType, "Subtract(-)");
			}
			element_inputTextUsingActionClassCharacterOneByOne(workHrsValue, value);
		}
		if (data.get("Overtime") != null) {
			String type = data.get("Overtime").substring(0,1);
			String value = data.get("Overtime").substring(1);
			if (type.equalsIgnoreCase("+")) {
				element_DropDownSelectByvisibleText(overtimeType, "Add(+)");
			} else if (type.equalsIgnoreCase("-")) {
				element_DropDownSelectByvisibleText(overtimeType, "Subtract(-)");
			}
			element_inputTextUsingActionClassCharacterOneByOne(overtimeValue, value);
		}
		if (data.get("ShiftAllowance") != null) {
			String type = data.get("ShiftAllowance").substring(0,1);
			String value = data.get("ShiftAllowance").substring(1);
			if (type.equalsIgnoreCase("+")) {
				element_DropDownSelectByvisibleText(shiftAllownseType, "Add(+)");
			} else if (type.equalsIgnoreCase("-")) {
				element_DropDownSelectByvisibleText(shiftAllownseType, "Subtract(-)");
			}
			element_InputTextUsingActionClass(shiftAllownseValue, value);
		}
		if (data.get("Remark") != null) {
			element_Clear(remarkTxt);
			element_InputTextUsingActionClass(remarkTxt, data.get("Remark"));
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	//Mayank
	public void previousAdjustmentVerify(String userid, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, userid);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(1000);
		
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String result = null;
			element_Click(recordPanel);
			Thread.sleep(1500);
			if (recordRows.size() == 0) {
				result = "Fail";
				logger.debug("No Any Records Found so Failed");
			} else {
				
				for (int i = 0; i < recordRows.size(); i++) {
					String dt = recordRows.get(i).findElement(By.xpath("child::label")).getText();
					if (dt.equalsIgnoreCase(staticDateOrPlusMinusFromCurrentDate(data.get("Adjusted Date")))) {
						logger.debug("Adjusted Date found");
						String aMonth = recordRows.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][1]")).getText();
						String aYear = recordRows.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][2]")).getText();
						String aGeneratedBy = recordRows.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][3]")).getText();
						Assert.assertEquals(aMonth, data.get("Target Month"));
						Assert.assertEquals(aYear, data.get("Target Year"));
						Assert.assertEquals(aGeneratedBy, data.get("Generated By"));
					}
					break;
				}
				logger.debug("All Values Passs");
				result = "Pass";
			}
			Assert.assertEquals(result, "Pass");
		}
	}
}
