package PageObject.TimeAndAttendance;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class SiteWiseMonthlySummaryPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(SiteWiseMonthlySummaryPO.class);
	
	public SiteWiseMonthlySummaryPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	

	
	@FindBy(xpath = "//*[@id=\"div_grd_fieldGrid\"]//table/tbody//input")
	private List<WebElement> checkbox;
	
	@FindBy(xpath = "//*[@id=\"div_grd_fieldGrid\"]//*[@class=\"pagination-next\"]")
	private WebElement nextBtn;
	
	@FindBy(xpath = "//*[@id=\"div_grd_fieldGrid\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> nextBtnSize;
	
	@FindBy(id = "chkAbsent")
	private WebElement absent;
	
	@FindBy(id = "chkLeaveTourCoff")
	private WebElement leaveTourOff;
	
	@FindBy(xpath = "//*[@default=\"Custom Export Field Configuration\"]")
	private WebElement customExportFieldName;
	
	@FindBy(id = "txtFieldName")
	private WebElement fieldName;
	
	@FindBy(xpath = "//*[@id=\"eventPageListBox\"]")
	private WebElement fieldValue;
	
	
	@FindBy(xpath = "//*[@key=\"btnAddtoList\"]")
	private WebElement transferLeftBtn;
	
	@FindBy(id = "btnSaveConfigAdd")
	private WebElement addBtn;
	
	@FindBy(xpath = "//*[@default=\"Save\"]")
	private WebElement saveBtn;
	
	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[1]/a")
	private WebElement exportTabBtn;
	
	@FindBy(id = "ddlMnth")
	private WebElement month;
	
	@FindBy(id = "ddlYear")
	private WebElement year;
	
	@FindBy(id = "txtFileName")
	private WebElement fileName;
	
	@FindBy(id = "chkShowHeader")
	private WebElement showExportHeader;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[1]")
	private WebElement selectUser;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[2]")
	private WebElement generateExportFor;
	
	@FindBy(xpath = "//input[@default=\"Export\"]")
	private WebElement exoprtBtn;
	
	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement validationMsg;
	
	@FindBy(xpath = "//*[@class=\"grid-raw-size cursor\"]/i")
	private WebElement deleteBtn;
	
	@FindBy(xpath = "//*[@class=\"grid-raw-size cursor\"]/i")
	private List<WebElement> deleteBtnSize;
	
	@FindBy(xpath = "//*[@default=\"Configuration\"]")
	private WebElement configuration;
	
	public void configuration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fields = data.get("Fields");
			String checked = data.get("Checked");
			String absent1 = data.get("Absent");
			String leave = data.get("leave");
			
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
			   }while(nextBtnSize.size()>0);
			   
			if(absent1.equalsIgnoreCase("true")) {
				if(!absent.isSelected()) {
					element_Click(absent);
				}
			}
			
			if(leave.equalsIgnoreCase("true")) {
				if(!leaveTourOff.isSelected()) {
					element_Click(leaveTourOff);
				}
			}
		}
		element_Click(saveBtn);  
		Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void customExportFieldConfigguration(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Click(configuration);
		Thread.sleep(1000);
		element_Click(customExportFieldName);
		Thread.sleep(1000);
		while(deleteBtnSize.size()>0) {
			element_Click(deleteBtn);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fieldname = data.get("Field Name");
			String fieldvalue = data.get("Field Value");
			String arr[] = fieldvalue.split(",");
			element_Clear(fieldName);
			element_InputTextUsingActionClass(fieldName, fieldname);
			for(int i=0 ; i<arr.length;i++) {
				//element_DropDownSelectByvisibleText(fieldValue, arr[i]);
				Thread.sleep(500);
				element_DropDownSelectByvisibleText(fieldValue, arr[i]);
				Actions a =new Actions(driver);
				a.moveToElement(driver.findElement(By.xpath("//*[@class='panel-collapse panel-collapse-custom collapse show']//*[text()=' "+arr[i]+" ']"))).doubleClick().build().perform();
//				driver.findElement(By.xpath("//*[@class='panel-collapse panel-collapse-custom collapse show']//*[text()=' "+arr[i]+" ']")).click();
				Thread.sleep(1000);
				element_Click(transferLeftBtn);
				//element_Click(transferLeftBtn);
				Thread.sleep(500);
				
			}
			element_Click(addBtn);
		}
		element_Click(saveBtn);  
		Assert.assertEquals(validationMsg.getText(),"Saved Successfully");
	}
	
	public void siteWiseMonthlySummaryExport(DataTable dataTable) throws Exception {
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
			element_Click(exoprtBtn);
		}
	}

}
