package PageObject.UserModule;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ImportHealthDeclarationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ImportHealthDeclarationPO.class);
	public ImportHealthDeclarationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormtDropdown;
	
	@FindBy(name = "filengf")
	private WebElement chooseFileXpath;
	
	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;
	
	@FindBy(xpath = "//*[@value='Import Data']")
	private WebElement importDataBtn;
	
	@FindBy(xpath = "//*[@class=\"table-responsive\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> resultTable;
	
	////////////////////////////
	
	public void impDataForHealthDeclaration(String fileFormat, DataTable dataTable) throws InterruptedException
	{
		waitForElementVisible(fileFormtDropdown);
		String filePath = null;
		element_Click(fileFormtDropdown);
		element_DropDownSelectByvisibleText(fileFormtDropdown, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			 filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Health Declaration.csv";
		}
			element_InputText(chooseFileXpath, filePath);
			Thread.sleep(1000);
			element_Click(uploadBtn);
			Thread.sleep(1000);
			String valMsg1 = validationMessage();
			Assert.assertEquals(valMsg1, "File saved successfully");
			element_Click(importDataBtn);
			pageLoadWaitng();
			Thread.sleep(1500);
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserID: " + data.get("UserID") + " Result: " + data.get("Result"));
				String UsrId = data.get("UserID");
				String result = data.get("Result");
				String actRes = null;
				for (int i = 0; i < resultTable.size(); i++) {
					String userId1 = resultTable.get(i).getText();
					if (UsrId.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
						actRes = resultTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]")).getText();
						break;
					}
				}
				Thread.sleep(1000);
				Assert.assertEquals(actRes.toUpperCase(), result.toUpperCase());
			}
			
		
	}
	
	
}
