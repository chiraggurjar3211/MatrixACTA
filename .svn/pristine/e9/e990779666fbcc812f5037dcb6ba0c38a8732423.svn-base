package PageObject.JobProcessingCosting;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class JobPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(JobPO.class);
	
	public JobPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> jobCodes;

	@FindBy(id = "JobID")
	private WebElement codetext;

	@FindBy(id = "JobName")
	private WebElement nametext;

	@FindBy(id = "_FromDate")
	private WebElement fromDatetext;

	@FindBy(id = "_ToDate")
	private WebElement toDatetext;

	@FindBy(xpath = "//*[@id='txtEstimatedHours']//input")
	private List<WebElement> estimatedHrs;

	// By Chhaya
	@FindBy(xpath = "//*[text()=\"Job Date\"]/ancestor::div[@class=\"form-group\"]/following-sibling::fieldset//label")
	private WebElement costCentreLable;
	
	@FindBy(xpath = "//*[@key='btnCancel'][@disabled]")
	private List<WebElement> cancelBtnSize;

	@FindBy(xpath = "//*[@key='btnCancel']")
	private WebElement cancelBtn;
	
	@FindBy(id="txtEstimatedHours_1")
	private WebElement estimatedHoursT;
	
	@FindBy(xpath="//*[@value=\"Don't Save\"]")
	private WebElement dontsaveB;
	
	@FindBy(xpath="//*[@class=\"modal-content modal-sm\"]")
	private List<WebElement> warningPopUp;
	
	@FindBy(id="JPCProjectID")
	private WebElement jpcProjectID;
	
	
	@FindBy(xpath="//*[@id=\"_FromDate\" and not(@disabled)]")
	private WebElement fromDateEnabled;
	
	public static List<Map<String, String>> jobDataForJOBScheduler= new ArrayList<Map<String,String>>();
	// Functions
	// By Mayank
	public String createJob(String code, String name, String jobStartDate, String jobEndDate, String estimatedHours, String jobSchedulerType)
			throws Exception {
		waitForElementVisible(codetext);
		Map<String, String> detailsForJObSch=new HashMap<String, String>();
		String val;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, code);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(500);
			if (jobCodes.size() > 0) {
				for (int j = 0; j < jobCodes.size(); j++) {
					String jobCode = jobCodes.get(j).getText();
					if (jobCode.equalsIgnoreCase(code)) {
						jobCodes.get(j).click();
						waitForElementDisable(addButton);
						Thread.sleep(250);
						break;
					}
				}
			}
			// logger.debug(ar);
		}
		Thread.sleep(250);
		// Main Code
		if (addButton.isEnabled()) {
			Thread.sleep(250);
			waitForElementVisible(addButton);
			addButtonClick();
			waitForElementVisible(fromDateEnabled);
			element_InputTextUsingActionClass(codetext, code);
		}
		Thread.sleep(250);
		if (name != null) {
			element_Clear(nametext);
			Thread.sleep(250);
			element_InputTextUsingActionClass(nametext, name);
			element_Click(estimatedHoursT);
		}
		if(jobSchedulerType != null) {
			if (jobSchedulerType.equalsIgnoreCase("Monthly") || jobSchedulerType.equalsIgnoreCase("Daily") || jobSchedulerType.equalsIgnoreCase("Weekly")) {
				String currentMonth = integerMonthSelected("0");
				String currentYear = integerYearSelected("0");
				if (jobStartDate != null) {
					int startDateValue = Integer.parseInt(jobStartDate);
					if (startDateValue < 1) {
						String sdate = staticDateOrPlusMinusFromCurrentDate(jobStartDate);
						element_Clear(fromDatetext);
						element_InputTextUsingActionClass(fromDatetext, sdate);
					}else {
						if (jobStartDate.length() == 1) {
							String startDt = "0" + jobStartDate + "/" + currentMonth + "/" + currentYear;
							element_Clear(fromDatetext);
							element_InputTextUsingActionClass(fromDatetext, startDt);
						} else {
							String startDt = jobStartDate + "/" + currentMonth + "/" + currentYear;
							element_Clear(fromDatetext);
							element_InputTextUsingActionClass(fromDatetext, startDt);
						}
					}
				}
				if (jobEndDate != null) {
					int endDateValue = Integer.parseInt(jobEndDate);
					if (endDateValue > 31) {
							String edate = staticDateOrPlusMinusFromCurrentDate(jobEndDate);
							element_Clear(toDatetext);
							element_InputTextUsingActionClass(toDatetext, edate);
					}else if(endDateValue == 31){
						DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
						LocalDate lt = LocalDate.now();
						LocalDate currentMonthLastDate=LocalDate.of(lt.getYear(), lt.getMonthValue(), lt.lengthOfMonth());
						element_Clear(toDatetext);
						element_InputTextUsingActionClass(toDatetext, currentMonthLastDate.format(formatter));
					}else {
						if (jobEndDate.length() == 1) {
							String endDt = "0" + jobEndDate + "/" + currentMonth + "/" + currentYear;
							element_Clear(toDatetext);
							element_InputTextUsingActionClass(toDatetext, endDt);
						} else {
							String endDt = jobEndDate + "/" + currentMonth + "/" + currentYear;
							element_Clear(toDatetext);
							element_InputTextUsingActionClass(toDatetext, endDt);
						}
					}
				}
			}
		}else {
			if (jobStartDate != null) {
				Thread.sleep(1200);
				String sdate = staticDateOrPlusMinusFromCurrentDate(jobStartDate);
				element_Clear(fromDatetext);
				element_InputTextUsingActionClass(fromDatetext, sdate);
			}
			if (jobEndDate != null) {
				Thread.sleep(1200);
				String edate = staticDateOrPlusMinusFromCurrentDate(jobEndDate);
				element_Clear(toDatetext);
				element_InputTextUsingActionClass(toDatetext, edate);
			}
		}
		detailsForJObSch.put("JobCode", code);
		detailsForJObSch.put("JobStartDate", element_getInputControlValue(fromDatetext));
		detailsForJObSch.put("JobEndDate", element_getInputControlValue(toDatetext));
		jobDataForJOBScheduler.add(detailsForJObSch);
		if (estimatedHours != null) {
			String eHrs = estimatedHours.substring(0, 5);
			String eMin = estimatedHours.substring(5, 7);
			for (int j = 0; j < estimatedHrs.size(); j++) {
				WebElement ele = estimatedHrs.get(j);
				if (j == 0) {
					element_Clear(ele);
					element_InputTextUsingActionClass(ele, eHrs);
				} else if (j == 1) {
					element_Clear(ele);
					element_InputTextUsingActionClass(ele, eMin);
				}
			}
		}
		saveButtonClick();
		val = validationMessage();
		Thread.sleep(250);
		if(cancelBtnSize.size() == 0) {
			element_Click(cancelBtn);
			Thread.sleep(250);
		}
		return val;
	}

	// Delete Job
	// Mayank
	public void deleteJob(String code) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			Thread.sleep(500);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, code);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allJobeCode = new ArrayList<>();
			if (jobCodes.size() > 0) {
				for (int j = 0; j < jobCodes.size(); j++) {
					String jobCode = jobCodes.get(j).getText();
					allJobeCode.add(jobCode);
					if (jobCode.equalsIgnoreCase(code)) {
						jobCodes.get(j).click();
						waitForElementClickable(deleteButton);
						deleteButtonClick();
						if (element_AlertIsPresent()) {
							driver.switchTo().alert().accept();
						}
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			if (!allJobeCode.contains(code)) {
				logger.debug("Job is not exist.");
			}
		} else {
			logger.debug("Job is not exist.");
		}
	}

	// by Chhaya
	public void verifyJobFieldName(String fieldName) throws InterruptedException {
		logger.info("fieldName: "+fieldName);
		pageLoadWaitng();
		String lableName = costCentreLable.getText();
		Assert.assertEquals(lableName, fieldName);
	}
	
	public void createJobAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data) {
		if(columnHeader.contains("job-code")) {
			if(data.get("job-code") != null) {
				apiParameter.add("job-code="+data.get("job-code"));
			}
		}
		if(columnHeader.contains("job-name")) {
			if(data.get("job-name") != null) {
				apiParameter.add("job-name="+data.get("job-name"));
			}
		}
		if(columnHeader.contains("start-date")) {
			if(data.get("start-date") != null) {
				String sDate = staticDateOrPlusMinusFromCurrentDate(data.get("start-date"));
				//String sDateRange = sDate.replace("/","");
				apiParameter.add("start-date="+sDate);
			}
		}
		if(columnHeader.contains("end-date")) {
			if(data.get("end-date") != null) {
				String eDate = staticDateOrPlusMinusFromCurrentDate(data.get("end-date"));
			//	String eDateRange = eDate.replace("/", "");
				apiParameter.add("end-date="+eDate);
			}
		}
		if(columnHeader.contains("cost-centre-id")) {
			if(data.get("cost-centre-id") != null) {
				apiParameter.add("cost-centre-id="+data.get("cost-centre-id"));
			}
		}
		if(columnHeader.contains("estimated-hours")) {
			if(data.get("estimated-hours") != null) {
				apiParameter.add("estimated-hours="+data.get("estimated-hours"));
			}
		}
	}
	
	public void verifyJob(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(codetext);
		if(element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("JobCode"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if(jobCodes.size() > 0) {
				for(int i=0; i<jobCodes.size(); i++) {
					String jobCode1 = jobCodes.get(i).getText();
					if(jobCode1.equalsIgnoreCase(data.get("JobCode"))) {
						jobCodes.get(i).click();
						Thread.sleep(700);
						break;
					}
				}
				if(data.get("StartDate") != null) {
					String expStartDate = staticDateOrPlusMinusFromCurrentDate(data.get("StartDate"));
					String actStartDate = fromDatetext.getAttribute("value");
					Thread.sleep(500);
					Assert.assertEquals(actStartDate, expStartDate);
				}
				if(data.get("EndDate") != null) {
					String expEndDate = staticDateOrPlusMinusFromCurrentDate(data.get("EndDate"));
					String actEndDate = toDatetext.getAttribute("value");
					Thread.sleep(500);
					Assert.assertEquals(actEndDate, expEndDate);
				}
			}else{
				logger.debug("Job not exist.");
				Assert.assertEquals("Job Not Found", data.get("JobCode"));
			}
		}
	}
	
	public void warningPopUp() throws InterruptedException {
		Thread.sleep(1000);
		if(warningPopUp.size()>0) {
			element_Click(dontsaveB);
			Thread.sleep(1000);
		}
	}
}
