package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;


public class AttendenceRegisterPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AttendenceRegisterPO.class);
	
	public AttendenceRegisterPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	
	@FindBy(id = "txtHeader")
	private WebElement headerMsg;
	
	@FindBy(id = "chkWeekOff")
	private WebElement weekOFF;
	
	@FindBy(id = "chkPH")
	private WebElement pH;
	
	@FindBy(id = "chkenblStrictCodeMap")
	private WebElement codeMapping;
	
	@FindBy(xpath = "//*[@default=\"Export Day-Wise Attendance with Code Mapping\"]")
	private WebElement exportDaywiseAttendnce;
	
	@FindBy(xpath = "//*[@default=\"Attendance Register Configuration\"]")
	private WebElement attendenceRegisterConfiguration;
	
	@FindBy(xpath = "//*[@default=\"Form 25 Configuration\"]")
	private WebElement form25Configuration;
	
	@FindBy(xpath = "//*[@key=\"btnSaveConfig\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@class=\"pagination-next\"]")
	private WebElement nextBtn;
	
	@FindBy(xpath = "//*[@id=\"collapseTwo\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> nextBtnCheck;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody//input[not(@hidden)]")
	private List<WebElement> checkbox;
	 	
	@FindBy(id = "chkIncludeSummary")
	private WebElement includeSummary;
	
	@FindBy(id = "chkExportPerLeave")
	private WebElement addToExport;
	
	@FindBy(id = "gvLeaveaddBtn")
	private WebElement addBtn;
	
	@FindBy(id = "LeaveID")
	private WebElement leaveId;
	
	@FindBy(xpath = "//*[@id=\"savebtn\" and not(@hidden)]")
	private WebElement leaveSaveBtn;
	
	@FindBy(id = "chkDayWiseAttendance")
	private WebElement addToExportDayWise;
	
	@FindBy(id = "chkOPCodeForLeaving")
	private WebElement leavingDate;
	
	@FindBy(id = "txtOPCodeForLeaveing")
	private WebElement leavingMsg;
	
	@FindBy(xpath = "//table//*[not(@hidden)]/i[2]")
	private WebElement deleteBtn;
	
	@FindBy(xpath = "//table//*[not(@hidden)]/i[2]")
	private List<WebElement> deleteBtnsize;
	
	@FindBy(id = "gvAttendanceaddBtn")
	private WebElement attendenceAddBtn;
	
	@FindBy(id = "FirstHalf")
	private WebElement firstHalf;
	
	@FindBy(id = "SecondHalf")
	private WebElement secondHalf;
	
	@FindBy(id = "OutputCode")
	private WebElement outputCode;
	
	@FindBy(id = "ColName")
	private WebElement outputCodeleave;
	
	@FindBy(id = "HolidayFlg")
	private WebElement holidayFlg;
	
	@FindBy(id = "ddlFormatSel")
	private WebElement format;
	
	@FindBy(id = "_FromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_ToDate")
	private WebElement toDate;
	
	@FindBy(id = "txtFileName")
	private WebElement fileName;
	
	@FindBy(id = "chkGroupBy")
	private WebElement groupByCheckbox;
	
	@FindBy(id = "cboGroupBy")
	private WebElement groupBy;
	
	@FindBy(xpath = "(//*[@class=\"user-selection\"]//*[@id='grpddl'])[1]")
	private WebElement selectUsers;
	
	@FindBy(xpath = "(//*[@class=\"user-selection\"]//*[@id='grpddl'])[2]")
	private WebElement generateExportFor;
	
    @FindBy(id = "ddlMnth")
    private WebElement month;
    
    @FindBy(id = "ddlYear")
    private WebElement year;
    
    @FindBy(id = "chkAttendance")
    private WebElement customAttendencePeriod;
	
    @FindBy(xpath = "//button[text()='Export']")
    private WebElement exportBtn;
    
    @FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[2]/a")
    private WebElement configuration;
    
    @FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[1]/a")
    private WebElement export;
    
    @FindBy(xpath = "//*[@id=\"div_grd_gvLeave\"]//table/tbody//*[@title=\"Delete\" and not(@hidden)]")
    private WebElement leaveDeleteBtn;
    
    @FindBy(xpath = "//*[@id=\"div_grd_gvLeave\"]//table/tbody//*[@title=\"Delete\" and not(@hidden)]")
    private List<WebElement> leaveDeleteBtnsize;
    
	
	
   public void form25Configuration(DataTable dataTable) throws Exception {
	   pageLoadWaitng();
	   element_Click(configuration);
	   element_Click(form25Configuration);
	   for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
		   String headermgs = data.get("Header Message");
		   String weekoff = data.get("Week-Off");
		   String ph = data.get("PH");
		   String codemapping = data.get("Code Mapping");
		   Thread.sleep(1000);
		   element_Clear(headerMsg);
		   element_InputTextUsingActionClass(headerMsg, headermgs);
		   if(weekoff.equalsIgnoreCase("true")) {
			   if(!weekOFF.isSelected()) {
				   element_Click(weekOFF);
			   }
		   }
		   if(ph.equalsIgnoreCase("true")) {
			   if(!pH.isSelected()) {
				   element_Click(pH);
			   }
		   }
		   
		   if(codemapping.equalsIgnoreCase("true")) {
			   if(!codeMapping.isSelected()) {
				   element_Click(codeMapping);
			   }
		   } 
	   }
	   element_Click(saveBtn);  
	   Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
   }
   
   
   public void attendenceRegisterConfiguration(DataTable dataTable) throws Exception {
	   pageLoadWaitng();
	   element_Click(configuration);
	   element_Click(attendenceRegisterConfiguration);
	   for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
		   String leaveid = data.get("Leave ID");
		   String leavename = data.get("Leave Name");
		   String outputcode = data.get("Output Code");
		   String fields = data.get("Fields");
		   String checked = data.get("Checked");
		   String includesummary = data.get("Include Summary");
		   String addtoexport = data.get("Add To Export");
		   int m=0;
		   do {
			   if (m!=0) {
				   element_Click(nextBtn);
			   }
			   if(fields.equalsIgnoreCase("All") && checked.equalsIgnoreCase("true")) {
				   for(int i=0;i<checkbox.size();i++) {
					   Thread.sleep(1000);
					   if(checkbox.get(i).isEnabled()) {
						   Thread.sleep(1000);
						   logger.info("enabled");
						   logger.info(checkbox.get(i).isSelected()); 
						   if(checkbox.get(i).isSelected()==false) {
							   logger.info("not selected");
							   Thread.sleep(1000);
							   element_Click(checkbox.get(i));
						   }
					   }
				   }
			   }
			   m++;
		   }while(nextBtnCheck.size()>0);
	      
		 if(includesummary.equalsIgnoreCase("true")) {
			 if(!includeSummary.isSelected()) {
				 Thread.sleep(1000);
				 element_Click(includeSummary);
			 }
		 }
		 
		 if(addtoexport.equalsIgnoreCase("true")) {
			 if(!addToExport.isSelected()) {
				 Thread.sleep(1000);
				 element_Click(addToExport);
			 }
		 }
		 
		 while(leaveDeleteBtnsize.size()>0) {
			 Thread.sleep(1000);
			 element_Click(leaveDeleteBtn);
			 driver.switchTo().alert().accept();
			 Thread.sleep(1000);
		 }
		 Thread.sleep(1000);
		 element_Click(addBtn);
		 Thread.sleep(1000);
		 element_Clear(leaveId);
		 element_InputTextUsingActionClass(leaveId, leaveid);
		 Thread.sleep(300);
		 element_Click(outputCodeleave);
		 //leaveId.sendKeys(Keys.TAB);
		 Thread.sleep(1000);
		 element_InputTextUsingActionClass(outputCodeleave, outputcode);
		 Thread.sleep(300);
		 element_Click(leaveSaveBtn);  
		 Thread.sleep(1000);
	   }
	   
	   element_Click(saveBtn);  
	   Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
   }

   public void exportDayWiseAttendence(DataTable dataTable) throws Exception {
	   pageLoadWaitng();
	   element_Click(configuration);
	   Thread.sleep(1000);
	   element_Click(exportDaywiseAttendnce);
	   Thread.sleep(1000);
	   if(!addToExportDayWise.isSelected()) {
		   element_Click(addToExportDayWise);
	   }
	  
		while(deleteBtnsize.size()>0) {
			element_Click(deleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
	   
	   
	   for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
		   String firsthalf = data.get("First Half");
		   String secondhalf = data.get("Second Half");
		   String present = data.get("Present");
		   String holiday = data.get("Holiday");
		   String outputcode = data.get("Output Code");
		   Thread.sleep(1000);
		 element_Click(attendenceAddBtn);
		 Thread.sleep(1000);
		 element_DropDownSelectByvisibleText(firstHalf, firsthalf);
		 element_DropDownSelectByvisibleText(secondHalf, secondhalf);
		 if(holidayFlg.isEnabled()) {
			 if(holiday.equalsIgnoreCase("true")) {
				 if(!holidayFlg.isSelected()) {
					 element_Click(holidayFlg);
				 }
			 }
		 }
		 element_Clear(outputCode);
		 element_InputTextUsingActionClass(outputCode, outputcode);
		element_Click(leaveSaveBtn);
		  
	   }
	   Thread.sleep(1000);
	   if(!leavingDate.isSelected()) {
		   element_Click(leavingDate);
	   }
	   Thread.sleep(1000);
	   element_Clear(leavingMsg);
	   element_InputTextUsingActionClass(leavingMsg, "Resign");
	   element_Click(saveBtn);  
	   Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
   }
	
   
   public void exportAttendenceRegister(DataTable dataTable) throws Exception {
	   pageLoadWaitng();
	   element_Click(export);
	   for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
		   String format1 = data.get("Format");
		   String fromdate = data.get("FromDate");
		   String todate = data.get("ToDate");
		   String filename = data.get("FileName");
		   String groupbycheckbox = data.get("GroupBy");
		   String groupby = data.get("GroupBy1");
		   String selectuser = data.get("SelectUsers");
		   String generateexportfor = data.get("Generate Export For");
		   
		   if(format1.equalsIgnoreCase("Basic Format")) {
			   element_DropDownSelectByvisibleText(format, format1);
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
				   if(groupbycheckbox.equalsIgnoreCase("true")) {
					   if(!groupByCheckbox.isSelected()) {
						   element_Click(groupByCheckbox);
					   }
				   }
				   element_DropDownSelectByvisibleText(groupBy, groupby);
				   element_DropDownSelectByvisibleText(selectUsers, selectuser);
				   element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
				   element_Click(exportBtn); 
		   }
		   else
		   {
			   String month1 = data.get("Month");
			   String year1 = data.get("Year");
			   String customattendenceperiod = data.get("CustomAttendencePeriod");
			   element_DropDownSelectByvisibleText(format, format1);
			   element_DropDownSelectByvisibleText(month, month1);
			   element_DropDownSelectByvisibleText(year, year1);
			   if(!customAttendencePeriod.isSelected()) {
				   element_Click(customAttendencePeriod);
			   }
			   Thread.sleep(1000);
			   element_Clear(fileName);
			   element_InputTextUsingActionClass(fileName, filename);
			   element_DropDownSelectByvisibleText(selectUsers, selectuser);
			   element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
			   element_Click(exportBtn); 
		   }
		   
		  
	   }
   }
	
}
