package PageObject.VisitorManagement;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ImportDataVisitorVisitPO extends AbstractMethod{
	WebDriver driver;
	public ImportDataVisitorVisitPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importBtn;
	
	@FindBy(id = "cmbImportOf")
	private WebElement importDataOf;

	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDrop;

	@FindBy(xpath = "//*[@name='filengf']")
	private WebElement chooseBtn;

	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;

	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> descriptionTable;

	@FindBy(id = "Cancel")
	private WebElement cancelBtn;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessagexpathCheck;
	
	//**********************************************************************
	//Functions
	//******************************************************
	
	public void importVisitorVisit(String fileFormat, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		pageLoadWaitng();
		//element_Click(fileFormatDrop);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			element_DropDownSelectByvisibleText(importDataOf, data.get("ImportDataOf"));
		}
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Visitor and Visit.csv";
		}
			element_InputText(chooseBtn, filePath);
			Thread.sleep(2000);
			element_Click(uploadBtn);
			Thread.sleep(1000);
			Assert.assertEquals(validationMessage(), "File saved successfully");
			Thread.sleep(1000);
			element_Click(importBtn);
			pageLoadWaitng();
			String importVal = null;
			if (validationMessagexpathCheck.size()>0) {
				importVal = validationMessage();
			} else {
				for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
					String vMobile = data.get("VMobile");
					String result = data.get("Result");
					String description = data.get("Description");
					String actResult = null;
					String actDescription = null;
					for (int i = 0; i < descriptionTable.size(); i++) {
						String successCol = descriptionTable.get(i).getText();
						if (successCol.toUpperCase().equalsIgnoreCase(vMobile.toUpperCase())) {
							actResult = descriptionTable.get(i)
									.findElement(By
											.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
									.getText();
							actDescription = descriptionTable.get(i)
									.findElement(
											By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()]"))
									.getText();
							Thread.sleep(1000);
							break;
						}
					}
					Thread.sleep(1000);
					Assert.assertEquals(actResult.toUpperCase(), result.toUpperCase());
					Assert.assertEquals(actDescription.toUpperCase(), description.toUpperCase());
				}
				importVal = "Imported Successfully";
			}
			Assert.assertEquals(importVal, "Imported Successfully");
			Thread.sleep(1000);
	}

}
