package PageObject.LeaveManagement;

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

public class ImportLeaveBalancePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ImportLeaveBalancePO.class);
	
	// Created by Mayank
	public ImportLeaveBalancePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDrop;

	@FindBy(xpath = "//*[@name='filengf']")
	private WebElement chooseFile;
	
	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;
	
	@FindBy(xpath = "//*[@value='Import Data']")
	private WebElement importDataBtn;
	
	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> resultTable;
	///////////
	
	public void importLeaveBalance(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		Thread.sleep(500);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Leave Balance.csv";
		}
		element_InputText(chooseFile, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1000);
		String valMsg = validationMessage();
		Thread.sleep(1000);
		Assert.assertEquals(valMsg, "File saved successfully");
		Thread.sleep(500);
		element_Click(importDataBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: " + data.get("UserID") + " Result: " + data.get("Result"));
			String userId = data.get("UserID");
			String result = data.get("Result");
			String actResult = null;
			for(int i=0; i<resultTable.size(); i++) {
				String getUserId = resultTable.get(i).getText();
				if(getUserId.toUpperCase().equalsIgnoreCase(userId.toUpperCase())){
					actResult = resultTable.get(i)
							.findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
							.getText();
					Thread.sleep(1000);
					break;
				}
			}
			Assert.assertEquals(actResult, result);
		}
	}
}
