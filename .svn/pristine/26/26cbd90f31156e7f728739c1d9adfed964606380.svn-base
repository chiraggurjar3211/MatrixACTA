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

public class ShortLeaveOfficialOUTTimePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ShortLeaveOfficialOUTTimePO.class);
	
	public ShortLeaveOfficialOUTTimePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@gridname=\"fieldGrid\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> nextBtnCheck;
	
	@FindBy(xpath = "//*[@gridname=\"fieldGrid\"]//*[@class=\"pagination-next\"]")
	private WebElement nextBtn;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[@class=\"grid-raw-size cursor\"]/input[2]")
	private List<WebElement> checkbox;
	
	@FindBy(xpath = "//*[@default=\"Reason-Wise Out Time\"]")
	private WebElement reasonWiseOutTime;
	
	@FindBy(name = "chkDayWiseAtd")
	private WebElement addToExport;
	
	@FindBy(name = "chkTotOutTime")
	private WebElement totalOutTime;
	
	@FindBy(name = "chkNoReason")
	private WebElement noReason;
	
	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(xpath = "//*[@default=\"Configuration\"]")
    private WebElement configuration;
	
	@FindBy(xpath = "//*[@default=\"Export\"]/label")
    private WebElement export;
	
	@FindBy(id = "_fromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_toDate")
	private WebElement toDate;
	
	@FindBy(id = "fileName")
	private WebElement fileName;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[1]")
	private WebElement selectUsers;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[2]")
	private WebElement generateExportFor;
	
	@FindBy(xpath = "//input[@default=\"Export\"]")
	private WebElement exportBtn;
	
	public void notabConfiguration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
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
		}
		  element_Click(saveBtn);  
		  Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void reasonWiseOutTime(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(reasonWiseOutTime);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String addtoexport = data.get("Add To Export");
			String totalouttime = data.get("Total Out Time");
			String noreason = data.get("No Reason");
			
			if(addtoexport.equalsIgnoreCase("true")) {
				if(!addToExport.isSelected()) {
					element_Click(addToExport);
				}
			}
			
			if(totalouttime.equalsIgnoreCase("true")) {
				if(!totalOutTime.isSelected()) {
					element_Click(totalOutTime);
				}
			}
			
			if(noreason.equalsIgnoreCase("true")) {
				if(!noReason.isSelected()) {
					element_Click(noReason);
				}
			}
		}
		  element_Click(saveBtn);  
		  Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void shortLeaveOfficalOutTimeExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(export);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fromdate = data.get("FromDate");
			String todate = data.get("ToDate");
			String filename = data.get("FileName");
			String selectuser = data.get("SelectUsers");
			String generateexportfor = data.get("Generate Export For");
			
			String dateFormat = fromDate.getAttribute("title");
			String insertFromDate = reportFromDateToDateChangeFormat(fromdate, dateFormat);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, insertFromDate);
			String insertToDate = reportFromDateToDateChangeFormat(todate, dateFormat);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, insertToDate);
			Thread.sleep(1000);
			element_Clear(fileName);
			element_InputTextUsingActionClass(fileName, filename);
			element_DropDownSelectByvisibleText(selectUsers, selectuser);
			element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
			element_Click(exportBtn);
		}
		
	}

}
