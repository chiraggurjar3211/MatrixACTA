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

public class ImportUserPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ImportUserPO.class);
	
	public ImportUserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(id = "btnClose")
	private WebElement okBtn;

	@FindBy(xpath = "//*[@title='Download Sample Import File']")
	private WebElement impSampleFile;

	@FindBy(xpath = "//img[@title=\"Download detailed data sheet\"]")
	private WebElement impDetailDataSheet;

	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDropdown;

	@FindBy(xpath = "//*[@name=\"filengf\"]")
	private WebElement chooseFile;

	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;

	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importDataBtn;

	@FindBy(xpath = "//table/thead/tr//label[text()='ReferenceID']//ancestor::table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> resultTable;

	///////////////////////
	public void downloadFile(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		boolean expMsg = true;
		boolean actMsg = false;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FileType: "+data.get("FileType"));
			String fileType = data.get("FileType");
			if (fileType.equalsIgnoreCase("Sample file")) {
				element_Click(impSampleFile);
				actMsg = true;
			}
			if (fileType.equalsIgnoreCase("Detailed user sheet")) {
				element_Click(impDetailDataSheet);
				pageLoadWaitng();
				element_Click(selectUsers);
				element_DropDownSelectByvisibleText(selectUsers, "All");
				Thread.sleep(1000);
				element_Click(okBtn);
				actMsg = true;
			}
			Assert.assertEquals(expMsg, actMsg); // how to validate
		}
	}

	public void importFile(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath =null;
		element_Click(fileFormatDropdown);
		element_DropDownSelectByvisibleText(fileFormatDropdown, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}
		else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\User.csv";
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
			String UsrId = data.get("UserID");
			String result = data.get("Result");
			String actRes = null;
			for (int i = 0; i < resultTable.size(); i++) {
				String userId1 = resultTable.get(i).getText();
				System.out.println(userId1);
				if (UsrId.toUpperCase().equalsIgnoreCase(userId1.toUpperCase())) {
					actRes = resultTable.get(i)
							.findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]//label"))
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
