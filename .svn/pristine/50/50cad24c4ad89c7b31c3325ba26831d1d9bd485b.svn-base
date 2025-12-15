package PageObject.AccessControlModule;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import com.aventstack.extentreports.reporter.configuration.Theme;

import CommonAbstract.AbstractMethod;

public class AccessControlPO  extends AbstractMethod{
	WebDriver driver;
	
	public AccessControlPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Kamal
	
	@FindBy(id = "Reports")
	private WebElement report;
	
	@FindBy(id = "2029")
	private WebElement accessZoneReport;
	
	@FindBy(id = "2030")
	private  WebElement timeZoneReport;
	
	@FindBy(xpath = "//*[@data-bs-target=\"#2031\"]")
	private WebElement groupsReport;
	
	@FindBy(xpath = "//*[@data-bs-target=\"#2036\"]")
	private WebElement IolinkingReport;
	
	@FindBy(xpath = "//*[@data-bs-target=\"#2041\"]")
	private WebElement userAccessReport;
	
	@FindBy(xpath = "//*[@data-bs-target=\"#2045\"]")
	private WebElement guardReport;
	
	@FindBy(id = "2057")
	private WebElement accessRouteMasterReport;
	
   @FindBy(xpath = "//*[@data-bs-target=\"#2064\"]")
   private WebElement elevatorAccessControlReport;
   
   @FindBy(id = "2048")
   private WebElement doorHeldOpenReport;
   
   @FindBy(id = "2049")
   private WebElement emergencyEvacuationReport;
   
   @FindBy(id = "2055")
   private  WebElement alarmDetialsReport;
   
   @FindBy(id = "2032")
   private WebElement accessGroupReport;
   
   @FindBy(id = "2033")
   private WebElement functionalGroupReport;
   
   @FindBy(id = "2034")
   private WebElement twopersonsGroupReport;
   
   @FindBy(id = "2035")
   private WebElement accessGroupWiseTimeZoneReport;
   
   @FindBy(id = "2037")
   private WebElement inputPortGroupReport;
   
   @FindBy(id = "2038")
   private WebElement outputPortGroupReport;
   
   @FindBy(id = "2039")
   private WebElement panelsReport;
   
   @FindBy(id = "2040")
   private WebElement directDoorReport;
   
   @FindBy(id = "2042")
   private WebElement firstInUserReport;
   
   @FindBy(id = "2043")
   private WebElement zoneAccessedByUserReport;
   
   @FindBy(id = "2044")
   private WebElement twoPersonAccessReport;
   
   @FindBy(id = "2052")
   private WebElement zoneWiseWhoIsInReport;
   
   @FindBy(id = "2053")
   private WebElement accessRouteWiseWhoIsInReport;
   
   @FindBy(id = "2054")
   private WebElement smartAccessRouteWiseWhoIsInReport;
   
   @FindBy(id = "2056")
   private WebElement assignedDevicesReport;
   
   @FindBy(id = "2046")
   private WebElement guardTourReport;
   
   @FindBy(id = "2047")
   private WebElement tourDetialsReport;
   
   @FindBy(id = "2066")
   private WebElement elevatorAccessReport;
   
   @FindBy(id = "2067")
   private WebElement elevatorFloorGroupMasterReport;
   
   @FindBy(id = "Elevator Access Control")
   private WebElement elevatorAccessControlTab;
   
   @FindBy(id = "2060")
   private WebElement elevatorConfigurationPage;
   
   @FindBy(id = "2063")
   private WebElement elevatorFloorGroupPage;
  
   @FindBy(xpath = "//*[@class='active' and @id='Access Group']")
	private List<WebElement> accessGroupTab;
   
   @FindBy(id = "Access Group")
   private WebElement accessGroup;
  
   @FindBy(id = "2015")
   private WebElement accessProfilePage;
   
   @FindBy(id="Smart Elevator Access Control")
   private WebElement smartElevatorAccessControl;
   
   @FindBy(id="2072")
   private WebElement elevatorFacilityConfiguration;
   
   @FindBy(id="2073")
   private WebElement smartElevatorFloorGroup;
   
   @FindBy(id = "Smart Access")
   private WebElement smartAccess;
   
   @FindBy(id = "2024")
   private WebElement smartAccessRoute;
   
   @FindBy(id = "2-Person Rule")
   private WebElement twoPersonRuleTab;
   
   @FindBy(id = "2018")
   private WebElement twoPersonGroupPage;
   
   @FindBy(id = "First-In User Rule")
   private WebElement firstInUserRuleTab;
   
   @FindBy(id = "2021")
   private WebElement firstInUserGroupPage;
  
   
   //Kamal
   public  void gotoReports() {
	   element_Click(report);
   }
	
   //Kamal
   public void gotoAccessZoneReport() {
	   gotoReports();
	   element_Click(accessZoneReport);
   }
   
   //Kamal
   public void gotoTimeZoneReport() {
	   gotoReports();
	   element_Click(timeZoneReport);
   }
   
   //Kamal
   public void gotoGroupsReport() {
	   gotoReports();
	   element_Click(groupsReport);
   }
   
   //Kamal
   public void gotoIOLinkngReport() {
	   gotoReports();
	   element_Click(IolinkingReport);
   }
   
   //Kamal
   public void gotoUserAccessReport() {
	   gotoReports();
	   element_Click(userAccessReport);
   }
   
   //Kamal
   public void gotoGuardReport() {
	   gotoReports();
	   element_Click(guardReport);
   }
   
   //Kamal
   public void gotoAccessRouteMaterReport() {
	   gotoReports();
	   element_Click(accessRouteMasterReport);
   }
   
   //Kamal
   public void gotoElevatorAccessControlReport() {
	   gotoReports();
	   element_Click(elevatorAccessControlReport);
   }
   
   //Kamal
   public void gotoDoorHeldOpenReport() {
	   gotoReports();
	   element_Click(doorHeldOpenReport);
   }
   
   //Kamal
   public void gotoEmergencyEvacuationReport() {
	   gotoReports();
	   element_Click(emergencyEvacuationReport);
   }
   
   //Kamal
   public void gotoAlarmDetialsReport() {
	   gotoReports();
	   element_Click(alarmDetialsReport);
   }
   
   //Kamal
   public void gotoAccessGroupReport() throws InterruptedException {
	   gotoGroupsReport();
	   Thread.sleep(1000);
	   element_Click(accessGroupReport);
   }
   
   //Kamal
   public void gotoFunctionalGroupReport() throws InterruptedException {
	   gotoGroupsReport();
	   Thread.sleep(1000);
	   element_Click(functionalGroupReport);
   }
   
   //Kamal
   public void gotoTwoPersonsGroupReport() throws InterruptedException {
	   gotoGroupsReport();
	   Thread.sleep(1000);
	   element_Click(twopersonsGroupReport);
   }
   
   //Kamal 
   public void gotoAccessGroupWiseTimeZoneReport() throws InterruptedException {
	   gotoGroupsReport();
	   Thread.sleep(1000);
	   element_Click(accessGroupWiseTimeZoneReport);
   }
   
   //Kamal
   public void gotoInputPortGroupReport() throws InterruptedException {
	   gotoIOLinkngReport();
	   Thread.sleep(1000);
	   element_Click(inputPortGroupReport);
   }
   
   //Kamal
   public void gotoOutputPortGroupReport() throws InterruptedException {
	   gotoIOLinkngReport();
	   Thread.sleep(1000);
	   element_Click(outputPortGroupReport);
   }
   
   //Kamal
   public void gotoPanelsReport() throws InterruptedException {
	   gotoIOLinkngReport();
	   Thread.sleep(1000);
	   element_Click(panelsReport);
   }
   
   //Kamal
   public void gotoDirectDoorsReport() throws InterruptedException {
	   gotoIOLinkngReport();
	   Thread.sleep(1000);
	   element_Click(directDoorReport);
   }
   
   //Kamal
   public void gotoFirstInUserReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(firstInUserReport);
   }
   
   //Kamal
   public void gotoZoneAccessedByUserReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(zoneAccessedByUserReport);
   }
   
   //Kamal
   public void gotoTwoPersonAccessReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(twoPersonAccessReport);
   }
   
   //Kamal
   public void gotoZoneWiseWhoIsInReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(zoneWiseWhoIsInReport);
   }
   
   //Kamal
   public void gotoAccessRouteWiseWhoIsInReort() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(accessRouteWiseWhoIsInReport);
   }
   
   //Kamal
   public void gotoSmartAccessRouteWiseWhoIsInReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(smartAccessRouteWiseWhoIsInReport);
   }
   
   //Kamal
   public void gotoAssignedDevicesReport() throws InterruptedException {
	   gotoUserAccessReport();
	   Thread.sleep(1000);
	   element_Click(assignedDevicesReport);
   }
   
   //Kamal
   public void gotoGuardTourReport() throws InterruptedException {
	   gotoGuardReport();
	   Thread.sleep(1000);
	   element_Click(guardTourReport);
   }
   
   //Kamal
   public void gotoTourDetialsReport() throws InterruptedException {
	   gotoGuardReport();
	   Thread.sleep(1000);
	   element_Click(tourDetialsReport);
   }
   
   //Kamal
   public void gotoElevatorAccessReport() throws InterruptedException {
	   gotoElevatorAccessControlReport();
	   Thread.sleep(1000);
	   element_Click(elevatorAccessReport);
   }
   
   //Kamal
   public void gotoElevatorFloorGroupMasterReport() throws InterruptedException {
	   gotoElevatorAccessControlReport();
	   Thread.sleep(1000);
	   element_Click(elevatorFloorGroupMasterReport);
   }
   
   public void gotoElevatorConfigurationPage(){
	   element_Click(elevatorAccessControlTab);
	   element_Click(elevatorConfigurationPage);
   }
   
   public void gotoElevatorFloorGroupPage(){
	   element_Click(elevatorAccessControlTab);
	   element_Click(elevatorFloorGroupPage);
   }
   
   public static String[][] excelDataElevator(String sheetName) throws IOException {
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
   
   public void gotoAccessProfilePage() throws InterruptedException {
		if (accessGroupTab.size() == 0) {
			element_Click(accessGroup);
		}
		Thread.sleep(1000);
		element_Click(accessProfilePage);
		Thread.sleep(1000);
		element_Click(accessProfilePage);
	}
   public void goToElevatorFacilityConfiguration() throws InterruptedException {
	   element_Click(smartElevatorAccessControl);
	   Thread.sleep(1000);
	   element_Click(elevatorFacilityConfiguration);
   }
   
   public void goToSmartElevatorFloorGroup() throws InterruptedException {
	   element_Click(smartElevatorAccessControl);
	   Thread.sleep(1000);
	   element_Click(smartElevatorFloorGroup);
   }
   
   public void goToSmartAccessRoute() throws InterruptedException {
	   element_Click(smartAccess);
	   Thread.sleep(1000);
	   element_Click(smartAccessRoute);
   }
   
   public void goToTwoPersonGroupPage() throws InterruptedException {
	   element_Click(twoPersonRuleTab);
	   Thread.sleep(1000);
	   element_Click(twoPersonGroupPage);
   }
   
   public void goToFirstInUserGroupPage() throws InterruptedException {
	   element_Click(firstInUserRuleTab);
	   Thread.sleep(1000);
	   element_Click(firstInUserGroupPage);
   }
   
}
