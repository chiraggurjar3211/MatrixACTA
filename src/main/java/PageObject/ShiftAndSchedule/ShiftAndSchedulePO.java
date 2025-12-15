package PageObject.ShiftAndSchedule;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class ShiftAndSchedulePO extends AbstractMethod {
	WebDriver driver;

	public ShiftAndSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "10001")
	private WebElement shiftConfiguration;

	@FindBy(id = "10002")
	private WebElement shiftSchedule;

	@FindBy(id = "Process")
	private WebElement process;

	@FindBy(id = "10011")
	private WebElement monthlySchedule;

	@FindBy(id = "Utilities")
	private WebElement utilities;

	@FindBy(id = "10006")
	private WebElement manageShifts;

	@FindBy(id = "10019")
	private WebElement monthlyShiftSchedule;

	@FindBy(id = "10020")
	private WebElement weekOffGroup;

	@FindBy(id = "10003")
	private WebElement holidaySchedule;

	@FindBy(id = "10007")
	private WebElement changeSchedule;

	@FindBy(id = "10008")
	private WebElement changeWeekOff;

	@FindBy(id = "10017")
	private WebElement manualScheduleImport;

	@FindBy(id = "10004")
	private WebElement restrictedHolidays;
	
	@FindBy(id = "Reports")
	private WebElement report;
	
	@FindBy(id = "10013")
	private WebElement shiftsReport;
	
	@FindBy(id = "10014")
	private WebElement scheduleGroupsReport;
	
	@FindBy(id = "10015")
	private WebElement holidayScheduleReport;
	
	@FindBy(id = "10016")
	private WebElement shiftScheduleReport;
	
	@FindBy(id ="10018")
	private WebElement weekOffChangeReport;
	
	@FindBy(id ="Application/Approval")
	private WebElement applicationApprovalTab;
	
	@FindBy(id ="10023")
	private WebElement shiftChangeApplicationPage;
	
	@FindBy(id ="10022")
	private WebElement shiftChangeApprovalPage;
	
	
	// Functions
	public void goToShiftConfiguration() {
		element_Click(shiftConfiguration);
	}

	public void goToShiftSchedule() {
		element_Click(shiftSchedule);
	}

	public void goToMonthlySchedule() throws InterruptedException {
		Thread.sleep(500);
		element_Click(process);
		Thread.sleep(500);
		element_Click(monthlySchedule);
	}

	public void goToManageShifts() {
		element_Click(utilities);
		element_Click(manageShifts);
	}

	public void goToMonthlyShiftSchedule() {
		element_Click(utilities);
		element_Click(monthlyShiftSchedule);
	}

	public void goToWeekOffGroup() {
		element_Click(weekOffGroup);
	}

	public void goToHolidaySchedule() {
		element_Click(holidaySchedule);
	}

	public void goToChangeSchedule() {
		element_Click(utilities);
		element_Click(changeSchedule);
	}

	public void goToChangeWeekOff() {
		element_Click(utilities);
		element_Click(changeWeekOff);
	}

	public void goToManualScheduleImport() {
		element_Click(utilities);
		element_Click(manualScheduleImport);
	}

	public void goToRestrictedHolidays() {
		element_Click(restrictedHolidays);
	}

	// Kamal
	public void gotoShiftReport() {
		element_Click(report);
		element_Click(shiftsReport);
	}

	// Kamal
	public void gotoScheduleGroupsReport() {
		element_Click(report);
		element_Click(scheduleGroupsReport);
	}

	// Kamal
	public void gotoHolidayScheduleReport() {
		element_Click(report);
		element_Click(holidayScheduleReport);
	}

	// Kamal
	public void gotoShiftScheduleReport() {
		element_Click(report);
		element_Click(shiftScheduleReport);
	}

	// Kamal
	public void gotoWeekOffChangeReport() {
		element_Click(report);
		element_Click(weekOffChangeReport);
	}
	
	public void gotoShiftChangeApprovalPage() {
		element_Click(applicationApprovalTab);
		element_Click(shiftChangeApprovalPage);
	}
	
	public void gotoShiftChangeApplicationPage() {
		element_Click(applicationApprovalTab);
		element_Click(shiftChangeApplicationPage);
	}
}
