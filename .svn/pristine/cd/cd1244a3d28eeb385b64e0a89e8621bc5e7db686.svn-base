package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class GroupWiseShiftHeadcountPO extends AbstractMethod {
	WebDriver driver;
	
	public GroupWiseShiftHeadcountPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(name = "cboGroup1")
	private WebElement group1;
	
	@FindBy(name = "cboGroup2")
	private WebElement group2;
	
	@FindBy(name = "cboGroup3")
	private WebElement group3;
	
	@FindBy(name = "cboFilterGroup")
	private WebElement filterBy;
	
	@FindBy(name = "cboGroupSelection")
	private WebElement selectOrganization;
	
	@FindBy(id = "group1ShiftID")
	private WebElement groupShiftId1;
	
	@FindBy(id = "group2ShiftID")
	private WebElement groupShiftId2;
	
	@FindBy(id = "group1Code")
	private WebElement groupCode1;
	
	@FindBy(id = "group2Code")
	private WebElement groupCode2;
	
	@FindBy(xpath = "//*[@default=\"Shift Configuration\"]")
	private WebElement shiftConfigurationTab;
	
	@FindBy(xpath = "//*[@default=\"Enterprise Group Configuration\"]")
	private WebElement enterpriseGroupConfigurationTab;
	
	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@class=\"table-responsive\"])[1]//tbody/tr//*[@title='Delete']")
	private WebElement shift1DeleteBtn;
	
	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@class=\"table-responsive\"])[1]//tbody/tr//*[@title='Delete']")
	private List<WebElement> shift1DeleteBtnsize;
	
	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@class=\"table-responsive\"])[2]//tbody/tr//*[@title='Delete']")
	private WebElement shift2DeleteBtn;
	
	@FindBy(xpath = "(//*[@id=\"collapseTwo\"]//*[@class=\"table-responsive\"])[2]//tbody/tr//*[@title='Delete']")
	private List<WebElement> shift2DeleteBtnsize;
	
	@FindBy(xpath = "//*[@default=\"Configuration\"]")
	private WebElement configuration;
	
	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(xpath = "(//*[@class=\"nav navbar-nav panel-group accordion\"]/li/a)[1]")
	private WebElement exportTabBtn;
	
	@FindBy(id = "ddlFormat")
	private WebElement formatSelection;
	
	@FindBy(id = "_fromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_toDate")
	private WebElement toDate;
	
	@FindBy(id = "fileName")
	private WebElement fileName;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[1]")
	private WebElement selectUser;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[2]")
	private WebElement generateExportFor;
	
	@FindBy(xpath = "//*[@default=\"Export\" and @type=\"button\"]")
	private WebElement exportBtn;
	
	@FindBy(id = "cboSelectedMonth")
	private WebElement month;
	
	@FindBy(id = "cboSelectedYear")
	private WebElement year;
	
	@FindBy(id = "chkAtdPeriod")
	private WebElement customAttendencecheckbox;

	public void enterpriseGroupConfiguration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(enterpriseGroupConfigurationTab);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String group1feild = data.get("Group-1");
			String group2feild = data.get("Group-2");
			String group3feild = data.get("Group-3");
			String filterby = data.get("Filter By");
			String selectorganization = data.get("Select Organization");
			
			element_DropDownSelectByvisibleText(group1, group1feild);
			element_DropDownSelectByvisibleText(group2, group2feild);
			element_DropDownSelectByvisibleText(group3, group3feild);
			element_DropDownSelectByvisibleText(filterBy, filterby);
			element_DropDownSelectByvisibleText(selectOrganization, selectorganization);
			Thread.sleep(1000);
			element_Click(saveBtn);
			Thread.sleep(3000);
			System.out.println(validationMessage());
			if(validationMessage().equalsIgnoreCase("Select at least one shift at Group-1 Shift")) {
				element_Click(shiftConfigurationTab);
				element_Clear(groupShiftId1);
				element_InputTextUsingActionClass(groupShiftId1, "A1");
				Thread.sleep(1000);
				groupShiftId1.sendKeys(Keys.TAB);
				Thread.sleep(1000);
				element_Clear(groupShiftId2);
				element_InputTextUsingActionClass(groupShiftId2, "A2");
				Thread.sleep(1000);
				groupShiftId2.sendKeys(Keys.TAB);
				Thread.sleep(1000);
				element_Click(saveBtn);
			}
			Assert.assertEquals(validationMessage(),"Saved Successfully");
		}
	}
	
	public  void shiftConfiguration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(shiftConfigurationTab);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String shiftid1 = data.get("ShiftID-1");
			String shiftid2 = data.get("ShiftID-2");
			String groupcode1 = data.get("Group-1 Code");
			String groupcode2 = data.get("Group-2 Code");
			
			while(shift1DeleteBtnsize.size()>0) {
				element_Click(shift1DeleteBtn);
				driver.switchTo().alert().accept();
				Thread.sleep(1000);
			}
			
			while(shift2DeleteBtnsize.size()>0) {
				element_Click(shift2DeleteBtn);
				driver.switchTo().alert().accept();
				Thread.sleep(1000);
			}
			
			String arr[] = shiftid1.split(",");
			for(int i=0; i<arr.length;i++) {
				element_Clear(groupShiftId1);
				element_InputTextUsingActionClass(groupShiftId1, arr[i]);
				Thread.sleep(1000);
				groupShiftId1.sendKeys(Keys.TAB);
				Thread.sleep(1000);
			}
			
			String arr1[] = shiftid2.split(",");
			for(int i=0; i<arr1.length;i++) {
				element_Clear(groupShiftId2);
				element_InputTextUsingActionClass(groupShiftId2, arr1[i]);
				Thread.sleep(1000);
				groupShiftId2.sendKeys(Keys.TAB);
				Thread.sleep(1000);
			}
			
			element_Clear(groupCode1);
			element_InputTextUsingActionClass(groupCode1, groupcode1);
			Thread.sleep(1000);
			element_Clear(groupCode2);
			element_InputTextUsingActionClass(groupCode2, groupcode2);
			element_Click(saveBtn);
			Assert.assertEquals(validationMessage(), "Saved Successfully");
			
		}
	}
	
	public void groupWiseShiftHeadCountExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(exportTabBtn);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String formatselection = data.get("Format");
			String fromdate = data.get("FromDate");
			String todate = data.get("ToDate");
			String filename = data.get("FileName");
			String selectuser = data.get("SelectUsers");
			String generateexportfor = data.get("Generate Export For");
			
			if(formatselection.equalsIgnoreCase("Daily Format")) {
			element_DropDownSelectByvisibleText(formatSelection, formatselection);
			 String dateFormat = fromDate.getAttribute("title");
				String insertFromDate = reportFromDateToDateChangeFormat(fromdate, dateFormat);
				element_Clear(fromDate);
				element_InputTextUsingActionClass(fromDate, insertFromDate);
				String insertToDate = reportFromDateToDateChangeFormat(todate, dateFormat);
				element_Clear(toDate);
				element_InputTextUsingActionClass(toDate, insertToDate);
				Thread.sleep(1000);
			}
			else {
				String month1 = data.get("Month");
				String year1 = data.get("Year");
				element_DropDownSelectByvisibleText(formatSelection, formatselection);
				element_DropDownSelectByvisibleText(month, month1);
				element_DropDownSelectByvisibleText(year, year1);
				if(!customAttendencecheckbox.isSelected()) {
					element_Click(customAttendencecheckbox);
				}
				Thread.sleep(1000);
			}
				element_Clear(fileName);
				element_InputTextUsingActionClass(fileName, filename);
				element_DropDownSelectByvisibleText(selectUser, selectuser);
				element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
				Thread.sleep(1000);
				element_Click(exportBtn);
				
		}
	}
	
}
