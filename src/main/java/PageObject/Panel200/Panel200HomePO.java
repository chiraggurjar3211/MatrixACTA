package PageObject.Panel200;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class Panel200HomePO extends AbstractMethod{
	WebDriver driver;
	public Panel200HomePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id="dashBoardHome")
	private WebElement dashBoardHome;
	
	@FindBy(xpath="//li[@class=\"active\"]/a[@id=\"dashBoardHome\"]")
	private List<WebElement> dashBoardSelect;
	
	@FindBy(id="configuration")
	private WebElement configuration;
	
	@FindBy(id="panel-frame")
	private WebElement panelframe;
	
	@FindBy(id="deviceHeaderli")
	private WebElement devicesPanel;
	
	@FindBy(id="doorConfigurationList")
	private WebElement doorConfigurationList;
	
	@FindBy(id="elevatorAcs")
	private WebElement elevatorAcs;
	
	@FindBy(id="eleCnfgList")
	private WebElement eleCnfgList;
	
	@FindBy(id="eleFlrGrpList")
	private WebElement eleFlrGrpList;
	
	@FindBy(id="smartElevatorAcs")
	private WebElement smartElevatorAcs;
	
	@FindBy(id="eleFacility")
	private WebElement eleFacility;
	
	@FindBy(id="smartEleFlrGrpList")
	private WebElement smartEleFlrGrpList;
	
	
	public String dashboardValueGet() {
		waitForElementVisible(dashBoardHome);
		String getDashboardValue=dashBoardHome.getText();
		return getDashboardValue;
	}
	
	
	public void clickOnDashboard() throws InterruptedException {
		element_Click(dashBoardHome);
		Thread.sleep(1500);
		Assert.assertEquals(dashBoardSelect.size(), 1);
	}
	
	public void goToDoorConfigurationPage() throws InterruptedException {
		element_Click(configuration);
		Thread.sleep(1000);
		driver.switchTo().frame(panelframe);
		waitForElementVisible(devicesPanel);
		Thread.sleep(1000);
		element_Click(devicesPanel);
		Thread.sleep(1000);
		element_Click(doorConfigurationList);
		Thread.sleep(1000);
	}
	
	public void gotoElevatorConfiguration() throws InterruptedException {
		element_Click(configuration);
		Thread.sleep(1000);
		driver.switchTo().frame(panelframe);
		waitForElementVisible(devicesPanel);
		Thread.sleep(1000);
		element_Click(elevatorAcs);
		Thread.sleep(1000);
		element_Click(eleCnfgList);
		Thread.sleep(1000);
	}
	
	public void gotoElevatorFloorGroup() throws InterruptedException {
		element_Click(configuration);
		Thread.sleep(1000);
		driver.switchTo().frame(panelframe);
		waitForElementVisible(devicesPanel);
		Thread.sleep(1000);
		element_Click(elevatorAcs);
		Thread.sleep(1000);
		element_Click(eleFlrGrpList);
		Thread.sleep(1000);
	}
	
	public static String[][] excelData(String sheetName) throws IOException {
		DataFormatter formatter = new DataFormatter();
		FileInputStream fis = new FileInputStream(System.getProperty("user.dir")+"\\src\\test\\resources\\TestDataResource\\ElevatorAccessControl.xlsx");
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheet(sheetName);
		int numberofRow = sheet.getPhysicalNumberOfRows();
		XSSFRow firstrow = sheet.getRow(0);
		int numberofCell = firstrow.getPhysicalNumberOfCells();
		String[][] data = new String[numberofRow][numberofCell];
		for (int i = 0; i < numberofRow; i++) {
			XSSFRow row = sheet.getRow(i);
			for (int j = 0; j < numberofCell; j++) {
				XSSFCell cell = row.getCell(j);
				data[i][j] = formatter.formatCellValue(cell);
			}
		}
		return data;
	}
	
	public static void writeData(String sheetName, int row, int col, String result) throws IOException {
		FileInputStream fis = new FileInputStream(System.getProperty("user.dir")+"\\src\\test\\resources\\TestDataResource\\ElevatorAccessControl.xlsx");
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheet(sheetName);
		XSSFCell cell = sheet.getRow(row).getCell(col);
		// System.out.println(cell);
		if (cell == null) {
			XSSFCell cell1 = sheet.getRow(row).createCell(col);
				cell1.setCellValue(result);
		} else {
				cell.setCellValue(result);
		}
		FileOutputStream fos = new FileOutputStream(System.getProperty("user.dir")+"\\src\\test\\resources\\TestDataResource\\ElevatorAccessControl.xlsx");
		wb.write(fos);
		wb.close();
	}
	
	public void gotoSmartElevatorConfiguration() throws InterruptedException {
		element_Click(configuration);
		Thread.sleep(500);
		driver.switchTo().frame(panelframe);
		waitForElementVisible(devicesPanel);
		Thread.sleep(500);
		element_Click(smartElevatorAcs);
		Thread.sleep(500);
		element_Click(eleFacility);
		Thread.sleep(500);
	}
	
	public void gotoSmartElevatorFloorGroupConfiguration() throws InterruptedException {
		element_Click(configuration);
		Thread.sleep(500);
		driver.switchTo().frame(panelframe);
		waitForElementVisible(devicesPanel);
		Thread.sleep(500);
		element_Click(smartElevatorAcs);
		Thread.sleep(500);
		element_Click(smartEleFlrGrpList);
		Thread.sleep(500);
	}
	
	
}
