package PageObject.ESSLogin;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssFieldVisitStatusPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(EssFieldVisitStatusPO.class);

	public EssFieldVisitStatusPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "ddlMnthhh")
	private WebElement monthDropdown;

	@FindBy(id = "ddlYearss")
	private WebElement yearDropdown;

	@FindBy(xpath = "//*[@class='span8']//table/tbody/tr/td//div/label")
	private List<WebElement> calendar;

	@FindBy(xpath = "//*[@id='lblFVMDetail']/table/tbody/tr")
	private List<WebElement> scheduleStatusTable;

	@FindBy(xpath = "//*[@class='close']")
	private WebElement scheduleStatusCloseBtn;

	public void validateEssFieldVisitStatus(String attendancePeriodMonth, String attendancePeriodYear, String startDate,
			String endDate, String scheduleStartTime, String scheduleEndTime, String taskName, String location)
			throws InterruptedException {
		Boolean actMsg = false;
		Boolean expMsg = true;
		String expStatus = null;
		String actualStatus = null;
		pageLoadWaitng();
		String monthName = getfullMonthName(attendancePeriodMonth);
		element_Click(monthDropdown);
		element_DropDownSelectByvisibleText(monthDropdown, monthName);
		Thread.sleep(1000);
		String yearName = getYear(attendancePeriodYear);
		element_Click(yearDropdown);
		element_DropDownSelectByvisibleText(yearDropdown, yearName);
		Thread.sleep(1000);
		String stDt1 = dateSelectedinddMMyyyyWithSlash(startDate);
		String endDt1 = dateSelectedinddMMyyyyWithSlash(endDate);
		String[] dtAr = stDt1.split("/");
		String dt2 = dtAr[0];
		expStatus = stDt1 + " " + scheduleStartTime + " - " + endDt1 + " " + scheduleEndTime + " - "
				+ taskName.toUpperCase() + " - " + location.toUpperCase();
		for (WebElement cal : calendar) {
			String calDate = cal.getText();
			if (calDate.length() == 1) {
				calDate = "0" + calDate;
			}
			if (calDate.equalsIgnoreCase(dt2)) {
				element_Click(cal);
				pageLoadWaitng();
				break;
			}
		}
		for (WebElement sst : scheduleStatusTable) {
			String status1 = sst.getText().toUpperCase();
			if (status1.contains(":")) {
				String[] status2 = status1.split(":");
				status1 = status2[0] + status2[1] + status2[2];
				if (status1.equals(expStatus)) {
					actualStatus = status1;
					actMsg = true;
				}
			}
		}
		logger.debug("Expected Result : " + expStatus);
		logger.debug("Actual Result   : " + actualStatus);
		Assert.assertEquals(actMsg, expMsg);
		Thread.sleep(2000);
		element_Click(scheduleStatusCloseBtn);

	}

}
