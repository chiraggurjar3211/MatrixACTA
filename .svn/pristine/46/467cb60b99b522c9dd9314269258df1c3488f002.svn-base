package PageObject.TimeAndAttendance;

import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class SiteWiseHeadCountManHoursPO extends AbstractMethod {
	WebDriver driver;
	
	public SiteWiseHeadCountManHoursPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "_fromDate")
	private WebElement fromDate;
	
	@FindBy(id = "_toDate")
	private WebElement toDate;
	
	@FindBy(id = "cmbselectedGroupByValue")
	private WebElement groupBy;
	
	@FindBy(id = "cmbselectedShiftData")
	private WebElement dataFormat;
	
	@FindBy(id = "chkPRInclude")
	private WebElement presentUsersOnly;
	
	@FindBy(id = "fileName")
	private WebElement fileName;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[1]")
	private WebElement selectUsers;
	
	@FindBy(xpath = "(//*[@id='grpddl'])[2]")
	private WebElement generateExportFor;
	
	@FindBy(id = "cmbselectedSiteOtion")
	private WebElement selectedSites;
	
	@FindBy(xpath = "//*[@default=\"Export\"]")
	private WebElement exportBtn;
	
	public void siteWiseHeadCountManHours(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fromdate = data.get("FromDate");
			String todate = data.get("ToDate");
			String groupby = data.get("GroupBy");
			String dataformat = data.get("Data");
			String presentuser = data.get("Present User");
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
			element_DropDownSelectByvisibleText(groupBy, groupby);
			if(dataformat.equalsIgnoreCase("Head Count")) {
				element_DropDownSelectByvisibleText(dataFormat, dataformat);
				if(presentuser.equalsIgnoreCase("true")) {
					if(presentUsersOnly.isEnabled()) {
					if(!presentUsersOnly.isSelected()) {
						element_Click(presentUsersOnly);
					}
					}
				}
			}
			else if(dataformat.equalsIgnoreCase("Man Hours"))
			{
				element_DropDownSelectByvisibleText(dataFormat, dataformat);
			}
			else if(dataformat.equalsIgnoreCase("Work Hours")) {
				String selectsites = data.get("SelectedSites");
				element_DropDownSelectByvisibleText(dataFormat, dataformat);
				element_DropDownSelectByvisibleText(selectedSites, selectsites);
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
