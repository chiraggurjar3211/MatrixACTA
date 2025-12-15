package PageObject.UserModule;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import org.testng.Assert;
import CommonAbstract.AbstractMethod;

public class AccessProfileReportPO extends AbstractMethod
{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AccessProfileReportPO.class);
	
	public AccessProfileReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	
	@FindBy(id = "grpddl")
	private WebElement selectUserDD;
	
	@FindBy(id = "ID")
	private WebElement useridTxt;
	
	@FindBy(xpath = "//*[@value='Generate Report']")
	private WebElement generateReport;
	
	@FindBy(xpath = "//*[@class='dxrd-preview-export-toolbar-item dxrd-toolbar-item']")
	private WebElement exportDropdown;
	
	@FindBy(xpath = "//*[@class='dxrd-preview-export-item-text']")
	private List<WebElement> exportDropdownFileFormat;
	
	
	
	
	public void accessProfileReportPO(String selectDD , String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}
	/*public void verifyExportReportFileFormat(String fileFormat)
	{
		String valmsg = null;
		driver.switchTo().frame(driver.findElement(By.id("report1")));
		
		//*[@class="dxrd-preview-export-item-image dxrd-image-export-to"]
		element_Click(exportDropdown);
		logger.info(exportDropdownFileFormat.size());
		
		if(exportDropdownFileFormat.size() == 1)
		{
			valmsg = exportDropdownFileFormat.get(0).getText();
			Assert.assertEquals(valmsg, fileFormat);
		}
		else
		{
			logger.info("ExportTo Dropdown has more than one file formats");
		}
		
		driver.switchTo().defaultContent();
	}*/
}
