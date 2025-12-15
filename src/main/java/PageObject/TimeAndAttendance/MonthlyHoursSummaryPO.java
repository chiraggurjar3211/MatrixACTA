package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class MonthlyHoursSummaryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(MonthlyHoursSummaryPO.class);
	
	public MonthlyHoursSummaryPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@default=\"Configuration\"]")
	private WebElement configuration;
	
	@FindBy(xpath = "//*[@default=\"Export Configuration\"]")
	private WebElement exportConfigurationTab;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> nextBtnCheck;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"pagination-next\"]")
	private WebElement nextBtn;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//table/tbody/tr/td[not(@hidden)]/input[2]")
	private List<WebElement> checkbox;
	
	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(xpath = "//*[@default=\"Attendance Status Code Mapping\"]")
	private WebElement attendenceStatusCodeMapping;
	
	@FindBy(id = "grdCodeMappingaddBtn")
	private WebElement addBtn;
	
	@FindBy(id = "FirstHalf")
	private WebElement firstHalf;
	
	@FindBy(id = "SecondHalf")
	private WebElement secondHalf;
	
	@FindBy(xpath = "//*[@class=\"dropdown-menu multiSelect MSform-hr\"]/li[1]/a")
	private WebElement applicableDays;
	
	@FindBy(id = "ShowOPCode")
	private WebElement showOutputCode;
	
	@FindBy(id = "OutputCode")
	private WebElement outputCode;
	
	@FindBy(id = "savebtn")
	private WebElement attendenceStatusSavebtn;
	
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[1]/a")
	private WebElement exportTabBtn;
	
	@FindBy(name = "selectedMonth")
	private WebElement month;
	
	@FindBy(name = "selectedYear")
	private WebElement year;
	
	@FindBy(id = "fileName")
	private WebElement fileName;
	
	@FindBy(id = "chkShowHeader")
	private WebElement showExportHeader;
	
	@FindBy(id = "grpddl")
	private WebElement selectUser;
	
	@FindBy(id = "exportFor")
	private WebElement generateExportFor;
	
	@FindBy(xpath = "//input[@key=\"Export\"]")
	private WebElement exportBtn;
	
	@FindBy(xpath = "//*[@class=\"caret\"]")
	private WebElement dropdownlistBtn;
	
	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@title=\"Delete\" and not(@hidden)]")
	private WebElement deleteBtn;
	
	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@title=\"Delete\" and not(@hidden)]")
	private List<WebElement> deleteBtnsize;
	
	
	public void exportConfiguration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		element_Click(exportConfigurationTab);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			
			String fields = data.get("Fields");
			String checked = data.get("Checked");
		 int m=0;
		   do {
			   if (m!=0) {
				   element_Click(nextBtn);
			   }
			   if(fields.equalsIgnoreCase("All") && checked.equalsIgnoreCase("true")) {
				   for(int i=0;i<checkbox.size();i++) {
					   if(checkbox.get(i).isEnabled()) {
						   logger.info("enabled");
						   logger.info(checkbox.get(i).isSelected()); 
						   if(!checkbox.get(i).isSelected()) {
							   logger.info("not selected");
							   Thread.sleep(1000);
							   element_Click(checkbox.get(i));}
					   }
				   }
			   }
			   m++;
		   }while(nextBtnCheck.size()>0);
		   
		   element_Click(saveBtn);  
		   Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
		}
	}
	
	public void attendenceStatusCodeMapping(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(attendenceStatusCodeMapping);
		Thread.sleep(1000);
		while(deleteBtnsize.size()>0) {
			element_Click(deleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String firsthalf = data.get("First Half");
			String secondhalf = data.get("Second Half");
			String applicabledays= data.get("Applicable Days");
			String showoutputcode = data.get("Show Output Code");
			String outputcode = data.get("Output Code");
			Thread.sleep(500);
			element_Click(addBtn);
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(firstHalf, firsthalf);
			element_DropDownSelectByvisibleText(secondHalf, secondhalf);
			if(applicabledays.equalsIgnoreCase("All")) {
				element_Click(dropdownlistBtn);
				Thread.sleep(1000);
				element_Click(applicableDays);
			}
			if(showoutputcode.equalsIgnoreCase("true")) {
				if(!showOutputCode.isSelected()) {
					element_Click(showOutputCode);
				}
			}
			Thread.sleep(1000);
			element_Clear(outputCode);
			element_InputTextUsingActionClass(outputCode, outputcode);
			element_Click(attendenceStatusSavebtn);
		}
		   element_Click(saveBtn);  
		   Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
		
	}
	
	public void monthlyHoursSummaryExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(exportTabBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String month1 = data.get("Month");
			String year1 = data.get("Year");
			String filename = data.get("FileName");
			String showexportheader = data.get("Show Export Header");
			String selectuser = data.get("SelectUsers");
			String generateexportfor = data.get("Generate Export For");
			
			element_DropDownSelectByvisibleText(month, month1);
			element_DropDownSelectByvisibleText(year, year1);
			element_Clear(fileName);
			element_InputTextUsingActionClass(fileName, filename);
			if(showexportheader.equalsIgnoreCase("true")) {
				if(!showExportHeader.isSelected()) {
					element_Click(showExportHeader);
				}
			}
			element_DropDownSelectByvisibleText(selectUser, selectuser);
			element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
			element_Click(exportBtn);
			Thread.sleep(60000);
		}
	}

}
