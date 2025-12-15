package PageObject.UserModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ContactInfoReportPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ContactInfoReportPO.class);
	
	public ContactInfoReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	@FindBy(xpath = "//*[@value='Generate Report']")
	private WebElement generateReport;

	public void contactInfoReport(String selectUsers, String exportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUserDD, selectUsers);
		Thread.sleep(1000);
		generateReportToAllModule(exportFormat);
		
	}
	public void contactInfoReportAdmin(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		for(Map<String, String> data:dataTable.asMaps(String.class, String.class))
		{
			logger.info("SelectUsers: "+data.get("SelectUsers"));
			element_DropDownSelectByvisibleText(selectUserDD, data.get("SelectUsers"));
			Thread.sleep(1000);
			element_Click(generateReport);
		}
	}
	

}
