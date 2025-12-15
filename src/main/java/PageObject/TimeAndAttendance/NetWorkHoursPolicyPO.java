package PageObject.TimeAndAttendance;

import java.util.ArrayList;
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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class NetWorkHoursPolicyPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(NetWorkHoursPolicyPO.class);
	
	public NetWorkHoursPolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> netWorkHrsPlcName;
	
	@FindBy(xpath = "//*[contains(@id,'gvNetWorkConfigrow')]//*[@title='Delete']")
	private List<WebElement> gridDeleteBtns;
	
	@FindBy(xpath = "//*[@id='gvNetWorkConfigrow0']//*[@title='Delete']")
	private WebElement gridDeleteBtn;
	
	@FindBy(id = "NWPolicyID")
	private WebElement plcIdtext;
	
	@FindBy(id = "NWPolicyName")
	private WebElement nwPolicyName;
	
	@FindBy(id = "gvNetWorkConfigaddBtn")
	private WebElement gridAddBtn;
	
	@FindBy(id = "WorkComponent")
	private WebElement workComponentDD;
	
	@FindBy(id = "WrkRengeFromTime")
	private WebElement wrkRengeFromTime;
	
	@FindBy(id = "WrkRengeToTime")
	private WebElement wrkRengeToTime;
	
	@FindBy(id = "ConsiderAs")
	private WebElement considerAsDD;
	
	@FindBy(id = "MinDurationReq")
	private WebElement minDurationReq;
	
	@FindBy(id = "Factor")
	private WebElement factorDD;
	
	@FindBy(id = "ApplicableDays")
	private WebElement applicableDays;
	
	@FindBy(xpath = "//*[@id=\"savebtn\" and not(@hidden)]")
	private WebElement gridSaveBtn;
	
	@FindBy(xpath = "//*[@aria-labelledby='dropdownMenu']/li[not(@class='divider')]")
	private List<WebElement> appDaysSelection;
	
	
	public String createNetWorkHoursPolicy(String plcName, List<Map<String, String>> data) throws InterruptedException {
		String msg = null;
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, plcName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (netWorkHrsPlcName.size() > 0) {
				for (int j = 0; j < netWorkHrsPlcName.size(); j++) {
					String plcname1 = netWorkHrsPlcName.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(plcName)) {
						netWorkHrsPlcName.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						String val = validationMessage();
						Thread.sleep(1000);
						Assert.assertEquals(val, "Deleted Successfully");
						Thread.sleep(1000);
						break;
					}
				}
			}
		}
		addButtonClick();
		Thread.sleep(2000);
		element_Clear(nwPolicyName);
			element_InputTextUsingActionClass(nwPolicyName, plcName);
//			//Delete already configured grid components for newly updated configuration if any
//			while (gridDeleteBtns.size()!=0) {
//				element_Click(gridDeleteBtn);
//				driver.switchTo().alert().accept();
//				Thread.sleep(1000);
//			}
			//Add components in grid
			for (int i = 0; i < data.size(); i++) {
				String workComponent = data.get(i).get("WorkComponent");
				String rangeFrom = data.get(i).get("RangeFrom");
				String rangeTo = data.get(i).get("RangeTo");
				String considerAs = data.get(i).get("ConsiderAs");
				String minDurReq = data.get(i).get("MinDurReq");
				String factor = data.get(i).get("Factor");
				String applicableDaysS = data.get(i).get("ApplicableDays");
				element_Click(gridAddBtn);
				Thread.sleep(500);
				if (workComponent != null) {
					logger.info("workComponent: "+workComponent);
					element_DropDownSelectByvisibleText(workComponentDD, workComponent);
				}
				if (rangeFrom != null) {
					logger.info("rangeFrom: "+rangeFrom);
					element_Clear(wrkRengeFromTime);
					element_InputText(wrkRengeFromTime, splitWithColan(rangeFrom));
				}
				Thread.sleep(250);
				if (rangeTo != null) {
					logger.info("rangeTo: "+rangeTo);
					element_Clear(wrkRengeToTime);
					element_InputText(wrkRengeToTime, splitWithColan(rangeTo));
				}
				Thread.sleep(250);
				if (considerAs != null) {
					element_DropDownSelectByvisibleText(considerAsDD,considerAs);
				}
				Thread.sleep(250);
				if (minDurReq != null) {
					element_Clear(minDurationReq);
					element_InputText(minDurationReq, splitWithColan(minDurReq));
				}
				Thread.sleep(500);
				if (applicableDaysS != null) {
					element_Click(applicableDays);
					String[] applicableDaysSSplit=applicableDaysS.split(",");
					for(int j=0;j<applicableDaysSSplit.length;j++) {
						for(int k=0;k<appDaysSelection.size();k++) {
							if(appDaysSelection.get(k).getText().equalsIgnoreCase(applicableDaysSSplit[j])) {
								appDaysSelection.get(k).click();
								break;
							}
						}
					}
				}
				if (factor != null) {
					element_DropDownSelectByvisibleText(factorDD, factor);
				}
				element_Click(gridSaveBtn); 
				Thread.sleep(1000);
			}

			saveButtonClick();
			msg = validationMessage();
			return msg;
	}
}
