package PageObject.AdminModule;

import java.util.ArrayList;
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

public class ImportDataPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ImportDataPO.class);
	
	public ImportDataPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cmbTableList")
	private WebElement importDataForDropdown;

	@FindBy(xpath = "//*[@id='cmbTableList']//option")
	private List<WebElement> importDataForDropdownValues;

	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDrop;

	@FindBy(xpath = "//*[@class='ng-untouched ng-pristine ng-valid']")
	private WebElement chooseFile;

	@FindBy(id = "btnUpload")
	private WebElement uploadBtn;

	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importDataBtn;

	@FindBy(xpath = "//table//tbody//tr//td[3]/label[@class='grid-raw-font mx-input-theme word-break cursor label-text grid-raw-disable']//ancestor::td")
	private List<WebElement> importTableXpath1;
	
	@FindBy(xpath = "//table//tbody//tr//td[4]/label[@class='grid-raw-font mx-input-theme word-break cursor label-text grid-raw-disable']//ancestor::td")
	private List<WebElement> importTableXpath2;
	
	@FindBy(xpath = "//table//tbody//tr//td[2]/label[@class='grid-raw-font mx-input-theme word-break cursor label-text grid-raw-disable']//ancestor::td")
	private List<WebElement> importTableXpath3;
	
	@FindBy(xpath="//*[@class='control-label mx-input-theme']//*[text()=''Result']")
	private WebElement result;
	
	@FindBy(xpath="//*[@class='control-label mx-input-theme']//*[text()=''Result']")
	private List<WebElement> resultsize;
	
	@FindBy(id="cboresultFielter")
	private WebElement resultFilter;
	
	@FindBy(xpath="//*[@key=\"No Data\"]")
	private WebElement nodataExcel;
	
	@FindBy(xpath="//*[@key=\"No Data\"]")
	private List<WebElement> nodataExcelSize;

	public void verifyImportDataGroupName(String renamedGroupName) throws InterruptedException {
		Thread.sleep(1000);
		String actualRes = null;
		element_Click(importDataForDropdown);
		Thread.sleep(2000);

		for (WebElement dropVal : importDataForDropdownValues) {
			String dropdownValue = dropVal.getText();

			if (dropdownValue.equalsIgnoreCase(renamedGroupName)) {
				actualRes = dropVal.getText();
			}
		}

		Assert.assertEquals(actualRes, renamedGroupName);
	}

	public void importData(String fileFormat, String strName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		element_Click(importDataForDropdown);
		if(strName.equalsIgnoreCase("Work Orders")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Work Order");
		}
		else if(strName.equalsIgnoreCase("Reporting Group")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Reporting Groups");
		}
		else if(strName.equalsIgnoreCase("Contractors")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Contractor");
		}
		else {
			element_DropDownSelectByvisibleText(importDataForDropdown, strName);
		}
		element_Click(fileFormatDrop);
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\"+strName+".csv";
		}
		element_InputText(chooseFile, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1500);
		String valMsg1 = validationMessage();
		Assert.assertEquals(valMsg1, "File saved successfully");
		element_Click(importDataBtn);
		pageLoadWaitng();
		Thread.sleep(3000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("CODE: "+data.get("CODE"));
			String code = data.get("CODE");
			String deviceName = data.get("Device Name");
			String id = data.get("ID");
			String name = data.get("Name");
			String result = data.get("Result");
			String actRes = null;
			if (code != null) {
				for (int i = 0; i < importTableXpath1.size(); i++) {
					String code1 = importTableXpath1.get(i).getText();
					if (code.toUpperCase().equalsIgnoreCase(code1.toUpperCase())) {
						actRes = importTableXpath1.get(i)
								.findElement(
										By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
								.getText();
						Thread.sleep(1000);
						break;
					}
				}
			}
			if (deviceName != null) {
				for (int i = 0; i < importTableXpath2.size(); i++) {
					String deviceName1 = importTableXpath2.get(i).getText();
					if (deviceName.toUpperCase().equalsIgnoreCase(deviceName1.toUpperCase())) {
						actRes = importTableXpath2.get(i)
								.findElement(
										By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
								.getText();
						Thread.sleep(1000);
						break;
					}
				}
			}
			if (id != null) {
				for (int i = 0; i < importTableXpath3.size(); i++) {
					String id1 = importTableXpath3.get(i).getText();
					if (id.toUpperCase().equalsIgnoreCase(id1.toUpperCase())) {
						actRes = importTableXpath3.get(i)
								.findElement(
										By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
								.getText();
						Thread.sleep(1000);
						break;
					}
				}
			}
			if (name != null) {
				for (int i = 0; i < importTableXpath1.size(); i++) {
					String name1 = importTableXpath1.get(i).getText();
					if (name.toUpperCase().equalsIgnoreCase(name1.toUpperCase())) {
						actRes = importTableXpath1.get(i)
								.findElement(
										By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]"))
								.getText();
						Thread.sleep(1000);
						break;
					}
				}
			}
			Assert.assertEquals(actRes.toUpperCase(), result.toUpperCase());
		}
		Thread.sleep(1000);
	}
	
	public void importDataForSingleSelect(String fileFormat, String impDataF) throws InterruptedException {
		pageLoadWaitng();
		String filePath = null;
		element_Click(importDataForDropdown);
		if(impDataF.equalsIgnoreCase("Work Orders")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Work Order");
		}
		else if(impDataF.equalsIgnoreCase("Reporting Group")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Reporting Groups");
		}
		else if(impDataF.equalsIgnoreCase("Contractors")) {
			element_InputTextUsingActionClass(importDataForDropdown, "Contractor");
		}
		else {
			element_DropDownSelectByvisibleText(importDataForDropdown, impDataF);
		}
		element_Click(fileFormatDrop);
		element_DropDownSelectByvisibleText(fileFormatDrop, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		} else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\"+impDataF+".csv";
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
		waitForElementVisible_TimeinMinutes(result,120);
		boolean resultDisp=false;
		boolean noDataDdisp=false;
		if(resultsize.size()>0) {
			resultDisp=true;
			element_DropDownSelectByvisibleText(resultFilter, "Failure");
			Thread.sleep(2000);
			if(nodataExcelSize.size()>0) {
				noDataDdisp=true;
				System.out.println("File data imported!!!!!");
			}
			else {
				System.out.println("Some Data imported Failed....");
				noDataDdisp=false;
			}
			Assert.assertEquals(noDataDdisp, true);
		}
		else {
			resultDisp=false;
		}
		Assert.assertEquals(resultDisp, true);
		
	}
}
