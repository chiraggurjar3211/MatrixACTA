package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
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
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class ManualScheduleImportPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ManualScheduleImportPO.class);
	
	public ManualScheduleImportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// *****************************************
	//***********ELEMENTS***********************
	//*****************************************
	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importBtn;

	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDrop;

	@FindBy(name = "filengf")
	private WebElement chooseBtn;

	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> descriptionTable;

	@FindBy(id = "Cancel")
	private WebElement cancelBtn;
	
	// *****************************************
	//***********FUNCTIONS***********************
	//*****************************************
	public void importShiftSchedule(String fileFormat, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		pageLoadWaitng();
		//element_Click(fileFormatDrop);
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Shift Schedule.csv";
		}
			element_InputText(chooseBtn, filePath);
			Thread.sleep(2000);
			element_Click(uploadBtn);
			Thread.sleep(1000);
			Assert.assertEquals(validationMessage(), "File saved successfully");
			Thread.sleep(1000);
			element_Click(importBtn);
			pageLoadWaitng();

			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserID: " + data.get("UserID") + " Result: " + data.get("Result"));
				String userID = data.get("UserID");
				String result = data.get("Result");
				String description = data.get("Description");
				String actResult = null;
				String actDescription = null;
				for (int i = 0; i < descriptionTable.size(); i++) {
					String successCol = descriptionTable.get(i).getText();
					if (successCol.toUpperCase().equalsIgnoreCase(userID.toUpperCase())) {
						actResult = descriptionTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]")).getText();
						actDescription = descriptionTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()]")).getText();
						Thread.sleep(1000);
						break;
					}
				}
				Thread.sleep(1000);
				Assert.assertEquals(actResult.toUpperCase(), result.toUpperCase());
				Assert.assertEquals(actDescription, description);
			}
			Thread.sleep(1000);
	}
}
