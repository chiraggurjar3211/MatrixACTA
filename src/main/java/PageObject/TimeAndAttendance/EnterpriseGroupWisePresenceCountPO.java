package PageObject.TimeAndAttendance;

import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EnterpriseGroupWisePresenceCountPO extends AbstractMethod {
	WebDriver driver;
	
	public EnterpriseGroupWisePresenceCountPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@default=\"Configuration\"]")
	private WebElement configuration;
	
	@FindBy(name = "group1SelectedValue")
	private WebElement group1Select;
	
	@FindBy(name = "group2SelectedValue")
	private WebElement group2Select;
	
	@FindBy(name = "filterSelectedValue")
	private WebElement filterBy;
	
	@FindBy(name = "groupSelectedValue")
	private WebElement selectOrganization;
	
	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class='nav navbar-nav panel-group accordion']/li[1]")
	private WebElement exportTabBtn;
	
	@FindBy(id = "_fromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_toDate")
	private WebElement toDate;
	
	@FindBy(id = "fileName")
	private WebElement fileName;
	
	@FindBy(id = "chkShowHeader")
	private WebElement showExportHeader;
	
	@FindBy(id = "exportFor")
	private WebElement generateExportFor;
	
	@FindBy(xpath = "//*[@default=\"Export\" and @type=\"button\"]")
	private WebElement exportBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	
	public void configurationTab(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String group1 = data.get("Group-1");
			String group2 = data.get("Group-2");
			String filterby = data.get("FilterBy");
			String selectorgantization = data.get("SelectOrganization");
			
			element_DropDownSelectByvisibleText(group1Select, group1);
			element_DropDownSelectByvisibleText(group2Select, group2);
			element_DropDownSelectByvisibleText(filterBy, filterby);
			element_DropDownSelectByvisibleText(selectOrganization, selectorgantization);
			Thread.sleep(1000);
			element_Click(saveBtn);
			Assert.assertEquals(validationMsg.getText(), "Saved Successfully");
		}
		
	}
	
	public void enterpriseGroupWisePresenceCountExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(exportTabBtn);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
		 String fromdate = data.get("FromDate");
		 String todate = data.get("ToDate");
		 String filename = data.get("FileName");
		 String showexportheader = data.get("Show Export Header");
		 String generateexportfor = data.get("Generate Export For");
		 Thread.sleep(1000);
		 String dateFormat = fromDate.getAttribute("title");
		 String insertFromDate = reportFromDateToDateChangeFormat(fromdate, dateFormat);
		 element_Clear(fromDate);
		 element_InputTextUsingActionClass(fromDate, insertFromDate);
		 String insertToDate = reportFromDateToDateChangeFormat(todate, dateFormat);
		 element_Clear(toDate);
		 element_InputTextUsingActionClass(toDate, insertToDate);
		 Thread.sleep(1000);
		 element_Clear(fileName);
		 element_InputTextUsingActionClass(fileName,filename);
		 if(showexportheader.equalsIgnoreCase("true")) {
			 if(!showExportHeader.isSelected()) {
				 element_Click(showExportHeader);
			 }
		 }
		 element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
		 Thread.sleep(1000);
		 element_Click(exportBtn);
		}
	}

}
