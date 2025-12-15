package PageObject.JobProcessingCosting;

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

public class ImportDataJPCPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ImportDataJPCPO.class);
	
	public ImportDataJPCPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Element
	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDropdown;
	
	@FindBy(xpath = "//*[@name='filengf']")
	private WebElement chooseFile;
	
	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;
	
	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importDataBtn;
	
	@FindBy(xpath = "//*[@class='row']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> resultTable;
	
	/////////////////

	public void importJob(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath =null;
		element_Click(fileFormatDropdown);
		element_DropDownSelectByvisibleText(fileFormatDropdown, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}
		else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Job.csv";
		}
		element_InputText(chooseFile, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1500);
		String valMsg1 = validationMessage();
		Assert.assertEquals(valMsg1, "File saved successfully");
		element_Click(importDataBtn);
		pageLoadWaitng();
		Thread.sleep(1500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID"));
			String code = data.get("Code");
			String result = data.get("Result");
			String actRes = null;
			for (int i = 0; i < resultTable.size(); i++) {
				String actCode = resultTable.get(i).getText();
				if (code.toUpperCase().equalsIgnoreCase(actCode.toUpperCase())) {
					actRes = resultTable.get(i)
							.findElement(By.xpath("following-sibling::td[last()-1]"))
							.getText();
					Thread.sleep(1000);
					break;
				}
			}
			Thread.sleep(1000);
			Assert.assertEquals(actRes.toUpperCase(), result.toUpperCase());
		}
		Thread.sleep(1000);
	}
}
