package PageObject.ShiftAndSchedule;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;


public class MonthlySchedulePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(MonthlySchedulePO.class);
	
	public MonthlySchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id="ddlMnth")
	private WebElement monthSelect;
	
	@FindBy(id="ddlYear")
	private WebElement yearSelect;
	
	@FindBy(id="grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id="ID")
	private WebElement userID;
	
	@FindBy(xpath = "//*[@value='Process']")
	private WebElement process;
	
	@FindBy(name = "isOverWriteExistingSchedule")
	private WebElement overwriteExistngSchChk;
	
	public String monthlyProcess(String month,String year,List<Map<String, String>> data) throws InterruptedException {
		waitForElementVisible(monthSelect);
		String month1 = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		element_DropDownSelectByvisibleText(monthSelect, month1);
		String year1 = staticYearOrPlusMinusYearFromCurrentYear(month, year);
		element_DropDownSelectByvisibleText(yearSelect, year1);
		if (element_isSelected(overwriteExistngSchChk) != true) {
			element_Click(overwriteExistngSchChk);
		}
		for(int i=0;i<data.size();i++) {
			logger.info("UserID: "+data.get(i).get("UserID"));
			element_dynamicDDSelect(userID, data.get(i).get("UserID"));
			element_TextBoxToClickOnTab(userID);
		}
		//element_DropDownSelectByvisibleText(selectUserDD, "All");
		element_Click(process);
		element_DynamicwaitPerElement(validationMessageCloseButton, 120);
		String val=validationMessage();
		return val;
		
	}
	

}
