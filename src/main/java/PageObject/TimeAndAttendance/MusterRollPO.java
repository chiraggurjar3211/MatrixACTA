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

public class MusterRollPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(MusterRollPO.class);
	
	public MusterRollPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[2]/a")
	private WebElement configuration;
	
	@FindBy(xpath = "//*[@default=\"Export Shift-Wise Attendance with Code Mapping\"]")
	private WebElement exportShiftWiseAttendence;
	
	@FindBy(xpath = "//*[@default=\"Select Fields to Export\"]")
	private WebElement selectFieldsExport;
	
	@FindBy(id = "gvAttendanceaddBtn")
	private WebElement addBtn;
	
	@FindBy(id = "chkActive")
	private WebElement addToExport;
	
	@FindBy(id = "SFTID")
	private WebElement shift;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//table/tbody/tr/td[not(@hidden)]/div/div[2]")
	private WebElement shiftIDBtn;
	
	@FindBy(xpath = "//*[@class=\"col-md-5\"]//*[@default=\"Search\"]")
	private WebElement searchBox;
	
	@FindBy(xpath = "//*[@class=\"modal-body modal-body-lg picklist-modal-body-lg\"]//table/tbody/tr/td[not(@hidden)][1]/input")
	private WebElement checkbox;
	
	@FindBy(xpath = "//*[@class=\"modal-body modal-body-lg picklist-modal-body-lg\"]//table/tbody/tr/td[not(@hidden)][2]")
	private WebElement shiftIDName;
	
	@FindBy(xpath = "//*[@default=\"OK\"]")
	private WebElement okBtn;
	
	@FindBy(id = "FirstHalf")
	private WebElement firstHalf;
	
	@FindBy(id = "SecondHalf")
	private WebElement secondHalf;
	
	@FindBy(id = "OutputCode1")
	private WebElement outputCode1;
	
	@FindBy(id = "OutputCode2")
	private WebElement outputCode2;
	
    @FindBy(xpath = "//*[@class=\"grid-raw-size cursor grd-prevent-rtl\"]/a[1]")
    private WebElement saveShiftBtn;
    
    @FindBy(xpath = "//*[@default=\"Save\"]")
    private WebElement saveBtn;
    
    @FindBy(xpath = "//*[@gridname=\"gvPersonalInfo\"]//table/tbody/tr/td[not(@hidden)][2]/input[not(@hidden)]")
    private List<WebElement> fieldscheckbox;
    
    @FindBy(xpath = "//*[@gridname=\"gvPersonalInfo\"]//*[@class=\"pagination-next\"]")
    private WebElement nextBtn;
    
    @FindBy(xpath = "//*[@gridname=\"gvPersonalInfo\"]//*[@class=\"pagination-next\"]")
    private List<WebElement> nextBtnsize;
    
    @FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[1]/a")
    private WebElement exportTabBtn;
    
    @FindBy(id = "_FromDate")
    private WebElement fromDate;
    
    @FindBy(id = "_ToDate")
    private WebElement toDate;
    
    @FindBy(id = "txtFileName")
    private WebElement fileName;
    
    @FindBy(id = "chkShowHeader")
    private WebElement showExportHeader;
    
    @FindBy(xpath = "(//*[@id='grpddl'])[1]")
    private WebElement selectUser;
    
    @FindBy(xpath = "(//*[@id='grpddl'])[2]")
    private WebElement generateExportFor;
    
    @FindBy(xpath = "//*[@type=\"button\" and @class=\"btn btn-default btn-label mx-input-theme\" and text()='Export']")
    private WebElement exportBtn;
    
    @FindBy(id = "HolidayFlg")
    private WebElement hoilyDay;
    
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(id = "ID")
	private WebElement userIdSelection;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][8]//*[@title=\"Delete\"]")
	private WebElement deleteBtn;
	
	@FindBy(xpath = "//*[@id=\"collapseOne\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][8]//*[@title=\"Delete\"]")
	private List<WebElement> deleteBtnsize;
    
    
	public void exportShiftWiseAttendancewithCodeMapping(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(exportShiftWiseAttendence);
		Thread.sleep(1000);
		if(!addToExport.isSelected()) {
			element_Click(addToExport);
		}
		
		while(deleteBtnsize.size()>0) {
			element_Click(deleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		
		element_Click(saveBtn);  
		Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String shift1 = data.get("Shift");
			String shiftid = data.get("ShiftID");
			String firsthalf = data.get("First half");
			String secondhalf = data.get("Second half");
			String holiday = data.get("Holiday");
			String outputcode1 = data.get("Output Code1");
			String outputcode2 = data.get("Output Code2");
			element_Click(addBtn);
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(shift, shift1);
			Thread.sleep(1000);
			element_Click(shiftIDBtn);
			Thread.sleep(1000);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, shiftid);
			searchBox.sendKeys(Keys.ENTER);
			if(shiftIDName.getText().equalsIgnoreCase(shiftid)) {
				element_Click(checkbox);
				Thread.sleep(1000);
				element_Click(okBtn);
			}
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(firstHalf, firsthalf);
			element_DropDownSelectByvisibleText(secondHalf, secondhalf);
			if(holiday.equalsIgnoreCase("true")) {
				if(hoilyDay.isEnabled()) {
					if(!hoilyDay.isSelected()) {
						element_Click(hoilyDay);
					}
				}
			}
			element_Clear(outputCode1);
			element_InputTextUsingActionClass(outputCode1, outputcode1);
			element_Clear(outputCode2);
			element_InputTextUsingActionClass(outputCode2, outputcode2);
			element_Click(saveShiftBtn);
			Thread.sleep(1000);
		}
		element_Click(saveBtn);  
		Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void selectFieldstoExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(selectFieldsExport);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fields = data.get("Fields");
			String checked = data.get("Checked");
			int m=0;
			   do {
				   if (m!=0) {
					   element_Click(nextBtn);
				   }
				   if(fields.equalsIgnoreCase("All") && checked.equalsIgnoreCase("false")) {
					   for(int i=0;i<fieldscheckbox.size();i++) {
						   if(fieldscheckbox.get(i).isEnabled()) {
							   logger.info("enabled");
							   logger.info(fieldscheckbox.get(i).isSelected()); 
							   if(fieldscheckbox.get(i).isSelected()) {
								   Thread.sleep(1000);
								   element_Click(fieldscheckbox.get(i));}
						   }
					   }
				   }
				   m++;
			   }while(nextBtnsize.size()>0);
		}
		element_Click(saveBtn);  
		Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void musterRollExport(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(exportTabBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fromdate = data.get("FromDate");
			String todate = data.get("ToDate");
			String filename = data.get("FileName");
			String showexportheader = data.get("Show Export Header");
			String selectuser = data.get("SelectUsers");
			String user=data.get("User");
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
			if(showexportheader.equalsIgnoreCase("true")) {
				if(!showExportHeader.isSelected()) {
					element_Click(showExportHeader);
				}
			}
			if(user!=null) {
				String[] userSplitWithComma=user.split(",");
				for(int i=0;i<userSplitWithComma.length;i++) {
					element_InputTextUsingActionClass(userIdSelection, userSplitWithComma[i]);
					element_TextBoxToClickOnTab(userIdSelection);
					Thread.sleep(1000);
				}
			}
			element_DropDownSelectByvisibleText(selectUser, selectuser);
			element_DropDownSelectByvisibleText(generateExportFor, generateexportfor);
			element_Click(exportBtn);
		}
		
	}

}
