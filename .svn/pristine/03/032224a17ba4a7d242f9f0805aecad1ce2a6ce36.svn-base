package CommonAbstract;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.DayOfWeek;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.Month;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.time.format.TextStyle;
import java.time.temporal.ChronoUnit;
import java.time.temporal.TemporalAdjusters;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.regex.Matcher;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Picture;
import org.apache.poi.util.Units;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.util.IOUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.OutputType;
import org.openqa.selenium.TakesScreenshot;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.google.gson.Gson;

import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.ClientAnchor;
import org.apache.poi.ss.usermodel.Picture;

import io.restassured.path.json.JsonPath;

public class AbstractMethod {
	public WebDriver driver;
	public static Properties prop;
	private static Logger logger = LogManager.getLogger(AbstractMethod.class);

	public AbstractMethod(WebDriver driver) {
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "loading-overlay")
	private WebElement pageOnLoad;

	@FindBy(id = "loading-overlay")
	private List<WebElement> pageOnLoadCount;

	@FindBy(xpath = "//*[@title='Home']")
	private WebElement homePage;

	@FindBy(xpath = "//*[@key='lnkDashBoard']")
	private WebElement essDashboardPage;

	@FindBy(xpath = "//*[@title='Reload Page']")
	public WebElement reloadPageButton;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement validationMessagexpath;

	@FindBy(xpath = "//*[@id='message']/div/label")
	public List<WebElement> validationMessagexpathsize;

	@FindBy(xpath = "//*[@id='Div1']/div/label")
	private WebElement validationMessagexpath2;

	@FindBy(xpath = "//*[@id='message']/div/button")
	public WebElement validationMessageCloseButton;

	@FindBy(id = "Link_7")
	private WebElement userM;

	@FindBy(id = "btnNew")
	public WebElement addButton;

	@FindBy(id = "btnSave")
	private WebElement saveButton;

	@FindBy(id = "btnCancel")
	public WebElement cancelButton;

	@FindBy(id = "btnDelete")
	public WebElement deleteButton;

	@FindBy(id = "btnEdit")
	public WebElement editButton;

	@FindBy(xpath = "//*[@class='row']/label[@class=\"control-label mx-input-theme\"]")
	public WebElement quickLinks;

	@FindBy(xpath = "//*[text()='Quick Links' or text()='Dashboard']")
	public WebElement quickLinksForESS;

	@FindBy(xpath = "//*[@default=\"Logout\"]")
	public WebElement logOut;

	@FindBy(id = "btnlogin")
	public WebElement loginButton;

	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//*[@name='cmnTxtSearch']")
	public WebElement searchTextBoxTitleBar;

	@FindBy(xpath = "//*[@title='Select month']")
	private WebElement monthPickerDropDown;

	@FindBy(xpath = "//*[@title='Select year']")
	private WebElement yearPickerDropDown;

	@FindBy(xpath = "//*[@class=\"ngb-dp-month\"]//*[@role=\"gridcell\"]/div[@class=\"btn-light\" or @class=\"btn-light bg-primary text-white\"]")
	private List<WebElement> datePickerRows;

	// Document Upload

	@FindBy(xpath = "//*[@key='Browse Image']")
	private WebElement browseBtnInUploadDocumentPopup;

	@FindBy(id = "btnUpdate")
	private WebElement updateBtnInUploadDocumentPopup;

	// ****************************Report related changes remaining**************
	// Report related start
	@FindBy(xpath = "//*[@class='dxrd-preview-progress' and @style='']")
	private WebElement reportDownloadOnWebPageInRepx;

	@FindBy(xpath = "//*[@class='dxrd-preview-export-toolbar-item dxrd-toolbar-item']")
	private WebElement exportToClickInRepx;

	@FindBy(xpath = "//*[@class='dxrd-preview-export-item-text']")
	private List<WebElement> exportToClickAndItsValueInRepx;

	@FindBy(xpath = "//*[@id=\"ReportViewer\" and @style=\"display: block;\"]")
	private List<WebElement> pleaseWaitImageCount;

	@FindBy(xpath = "//*[@id=\"ReportViewer\" and @style=\"display: block;\"]")
	private WebElement pleaseWaitImage;

	// All module Reports-> generate Reports Button xpath
	@FindBy(xpath = "//*[@value='Generate Report']")
	private WebElement generateReport;

	@FindBy(xpath = "//*[@class='dxrd-preview-export-item-text']")
	private WebElement exportToClickAndItsValueInRepxOnlyOne;
	// ****************************Report related changes remaining**************

	// Admin-> System Utilities->Export Data-> export button path given below
	@FindBy(xpath = "//*[@value='Export']")
	private WebElement export;

	// By Chhaya
	@FindBy(xpath = "//*[@id='accordionExample']/li/a[not(@style)]")
	private List<WebElement> allPageName;

	// By Chhaya
	@FindBy(xpath = "//*[@class='panel-collapse collapse show']/li/a[not(@style)]")
	private List<WebElement> subMenu;

	@FindBy(xpath = "//*[@class='collapse show']/li/a[not(@style)]")
	private List<WebElement> subMenu1;

	@FindBy(xpath = "//*[@href='#/LogOff']")
	public WebElement logOutAdminPortal;

	@FindBy(xpath = "//*[@title='Profile']")
	public WebElement profileIconAdminPortal;

	@FindBy(id = "Link_30")
	public WebElement reportBuilderModule;

	@FindBy(xpath = "//*[@class=\"dropdown-menu show\"]//*[contains(@class,\"dropdown-item\")]")
	public List<WebElement> visibleDDListValues;

	@FindBy(xpath = "//*[@class=\"dropdown-menu show\"]//*[contains(@class,\"dropdown-item\")]")
	public WebElement visibleDDListValuesele;

	@FindBy(xpath = "//*[@class=\"dx-item dx-menu-item\"]")
	public WebElement exportTo;

	@FindBy(xpath = "//*[contains(@class,\"dxrdp-export-to-menu dxrd-preview-export-to dxd-button-back-color dxd-state-normal dxd-icon-highlighted\") and not(@aria-disabled=\"true\")]")
	public WebElement exportToClassVisible;

	public static int countOfReportSchedulerConfiguration = 0;
	// report scheduler related parameter
	public static List<String> fi = new ArrayList<>();
	public static String reportschedulerType;
	public static String ipaddress;
	public static Date currentDatetime;
	public static String product;
	public static String taskSchedulerName;

	public String ipAddressSetInLink(String link) {
		System.out.println(link);
		String[] baseUrlSplitWithDoubleSlash = link.split("//");
		String[] baseUrlSplitWithSingleSlash = baseUrlSplitWithDoubleSlash[1].split("/");
		String changeName = baseUrlSplitWithSingleSlash[0];
		String changelink = link.replace(changeName, ipaddress);
		return changelink;
	}

	// if Page Loading is displayed then given this function
	public void pageLoadWaitng() throws InterruptedException {
		Thread.sleep(500);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		if (pageOnLoadCount.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(pageOnLoad));
		}
	}

	// if Page Loading Image is displayed when report generated then given this
	// function
	public void pleaseWaitImagePageLoadingForReport() throws InterruptedException {
		Thread.sleep(1000);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		if (pleaseWaitImageCount.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(pleaseWaitImage));
		}
	}

	// get title
	public String getTitle() {
		String title = driver.getTitle();
		return title;
	}

	// Waiting for Element visible
	public void waitForElementVisible(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(1));
		wait.until(ExpectedConditions.visibilityOf(ele));
	}

	// Waiting for Element visible
	public void waitForElementVisible_TimeinMinutes(WebElement ele, int min) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(min));
		wait.until(ExpectedConditions.visibilityOf(ele));
	}

	// Waiting for Element visible
//	public void waitForpageload() {
//		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//		wait.until(ExpectedConditions.presenceOfElementLocated(By.tagName("body")));
//	}

	// Waiting for element clickable
	public void waitForElementClickable(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.elementToBeClickable(ele));
	}

	// Waiting for element clickable
	public void waitForElementClickable(WebElement ele, int min) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(min));
		wait.until(ExpectedConditions.elementToBeClickable(ele));
	}

	// Waiting for element clickable for loaded page
	public void waitForElementClickableForLoadPage(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.elementToBeClickable(ele));
	}

	// Waiting for element visible for loaded page
	public void waitForElementVisibleForLoadPage(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.visibilityOf(ele));
	}

	// Waiting for Element not clickable check
	public void waitForElementNotToBeClickable(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.not(ExpectedConditions.elementToBeClickable(ele)));
	}

	public void waitForElementDisable(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		// Custom ExpectedCondition
		wait.until(new ExpectedCondition<Boolean>() {
			public Boolean apply(WebDriver driver) {
				return !ele.isEnabled(); // true when disabled
			}
		});
	}

	// Get Validation message and return validation message
	public String validationMessage() {
		String message = null;
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofMinutes(2));
		message = wait.until(ExpectedConditions.visibilityOf(validationMessagexpath)).getText();
		return message;
	}

	// Get Validation message and return validation message
	public String validationMessage2() {
		String message = null;
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		message = wait.until(ExpectedConditions.visibilityOf(validationMessagexpath2)).getText();
		return message;
	}

	// click on Add button
	public void addButtonClick() {
		waitForElementVisible(addButton);
		element_Click(addButton);
	}

	// click on save button
	public void saveButtonClick() {
		waitForElementClickable(saveButton, 1);
		waitForElementVisible(saveButton);
		element_Click(saveButton);
	}

	// click on save button using JS
	public void saveButtonClickUsingJS() throws InterruptedException {
		Thread.sleep(1000);
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("arguments[0].click();", saveButton);
	}

	// click on save button using JS
	public void buttonClickUsingJS(WebElement ele) throws InterruptedException {
		Thread.sleep(1000);
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("arguments[0].click();", ele);
	}

	public void cancelButtonClick() {
		waitForElementVisible(cancelButton);
		element_Click(cancelButton);
	}

	public void deleteButtonClick() {
		waitForElementVisible(deleteButton);
		element_Click(deleteButton);
	}

	public void editButtonClick() {
		waitForElementVisible(editButton);
		element_Click(editButton);
	}

	public void logOut() throws InterruptedException {
		waitForElementVisible(logOut);
		element_Click(logOut);
		waitForElementVisible(loginButton);
	}

	public void homeButtonClick() throws InterruptedException {
		waitForElementVisible(homePage);
		Thread.sleep(1000);
		element_Click(homePage);
	}

	public void reloadPageButtonClick() throws InterruptedException {
		waitForElementClickable(reloadPageButton, 1);
		waitForElementVisible(reloadPageButton);
		element_Click(reloadPageButton);
		Thread.sleep(1000);
	}

	public void essDashboardButtonClick() throws InterruptedException {
		waitForElementVisible(essDashboardPage);
		element_Click(essDashboardPage);
		waitForElementVisible(quickLinksForESS);
	}

	// Common functions Given Below:
	// Select DropDown
	public String element_DropDownFirstSelectedValue(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(5));
		wait.until(ExpectedConditions.visibilityOf(ele));
		Select select = new Select(ele);
		String selected = select.getFirstSelectedOption().getText();
		return selected;
	}

	// Select DropDown
	public void element_DropDownSelectByvisibleText(WebElement ele, String text) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele));
		Select select = new Select(ele);
		select.selectByVisibleText(text);

	}

	// Select DropDown
	public void element_DropDownSelectByValue(WebElement ele, String text) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele));
		Select select = new Select(ele);
		select.selectByValue(text);
	}

	// Select DropDown
	public String element_DropDowngetValues(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		Select select = new Select(ele);
		List<WebElement> options = select.getOptions();
		List<String> values = new ArrayList<>();
		for (WebElement option : options) {
			values.add(option.getText());
		}
		Gson gson = new Gson();
		String result = gson.toJson(values);
		return result;
	}

	// Textbox value clear
	public void element_Clear(WebElement ele) {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele)).clear();
	}

	// Textbox value clear
	public String element_GetText(WebElement ele) {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		String text = wait.until(ExpectedConditions.visibilityOf(ele)).getText();
		return text;
	}

	// Textbox value clear
	public String element_GetAttributeValue(WebElement ele, String attributename) {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		String text = wait.until(ExpectedConditions.visibilityOf(ele)).getAttribute(attributename);
		return text;
	}

	// Textbox value passed
	public void element_InputText(WebElement ele, String text) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele)).sendKeys(text);

	}

	// Input Text Tab Enter value passed
	public void element_TextBoxToClickOnTab(WebElement ele) throws InterruptedException {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele)).sendKeys(Keys.TAB);
	}

	// Enter on textbox
	public void element_TextBoxToClickOnEnter(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		wait.until(ExpectedConditions.visibilityOf(ele)).sendKeys(Keys.ENTER);
	}

	// Enter on textbox
	public void element_TextBoxToClickOnEnterusingActionClass(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		Actions actions = new Actions(driver);
		actions.sendKeys(ele, Keys.ENTER).perform();
	}

	// Click on Button
	public void element_Click(WebElement ele) {
		waitForElementVisible(ele);
		waitForElementClickable(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.visibilityOf(ele)).click();
	}

	public void element_ClickUsingJS(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		Thread.sleep(1000);
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("arguments[0].click()", ele);
	}

	// Check Element is Selected or not
	public boolean element_isSelected(WebElement ele) {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		boolean val = wait.until(ExpectedConditions.visibilityOf(ele)).isSelected();
		return val;
	}

	// Check Element is Selected or not
	public String element_isSelectedinString(WebElement ele) {
		String valS;
		waitForElementVisible(ele);
		boolean val = element_isSelected(ele);
		if (val == true) {
			valS = "Selected";
		} else {
			valS = "Unselected";
		}
		return valS;
	}

	// Check Element is Selected or not
	public boolean element_isDisplayed(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		boolean val = wait.until(ExpectedConditions.visibilityOf(ele)).isDisplayed();
		return val;
	}

	// Check Element is Selected or not
	public boolean element_isEnabled(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		boolean val = wait.until(ExpectedConditions.visibilityOf(ele)).isEnabled();
		return val;
	}

	// Check Element is Selected or not but return enable or disabled
	public String element_isEnabledOrDisabled(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		boolean val = wait.until(ExpectedConditions.visibilityOf(ele)).isEnabled();
		String vis = null;
		if (val == true) {
			vis = "enable";
		} else {
			vis = "disabled";
		}
		return vis;
	}

	// Check Element is Selected or not
	public boolean element_isEnabledDynamic(WebElement ele, int sec) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(sec));
		boolean val = wait.until(ExpectedConditions.visibilityOf(ele)).isEnabled();
		return val;
	}

	// Check Element is Selected or not
	public boolean element_isDisabled(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		WebElement visibleElement = wait.until(ExpectedConditions.visibilityOf(ele));
		String disabledAttr = visibleElement.getAttribute("disabled");
		boolean val = false;
		if (disabledAttr != null && (disabledAttr.equals("true") || disabledAttr.equals("disabled"))) {
			val = true;
		}
		return val;
	}

	// Check alert is present or not check
	public boolean element_AlertIsPresent() throws InterruptedException {
		Thread.sleep(500);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(15));
		try {
			wait.until(ExpectedConditions.alertIsPresent());
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public void pageRefresh() {
		driver.navigate().refresh();
	}

	public void element_InputDataUsingJS(WebElement ele, String value) throws InterruptedException {
		waitForElementVisible(ele);
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("arguments[0].value='" + value + "';", ele);

	}

	public void element_InputDataUsingJSInteger(WebElement ele, int value) throws InterruptedException {
		waitForElementVisible(ele);
		JavascriptExecutor jse = (JavascriptExecutor) driver;
		jse.executeScript("arguments[0].value='" + value + "';", ele);

	}

	public String element_getInputControlValue(WebElement ele) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(10));
		String val = wait.until(ExpectedConditions.visibilityOf(ele)).getAttribute("value");
		return val;
	}

	public void element_DynamicwaitPerElement(WebElement ele, int waitTimeinSecond) throws InterruptedException {
		waitForElementVisible(ele);
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(waitTimeinSecond));
		wait.until(ExpectedConditions.visibilityOf(ele));
	}

	// wait for defined time
	public void waitForDefinedMin(float timeInMin) throws InterruptedException {
		float timeInMilliSecond = (timeInMin * 1000 * 60) + 5000;
		Thread.sleep((long) timeInMilliSecond);
	}

	// *********************************************************Date Related common
	// Function given below*****************
	// get current date and month in format of (dd MMM = 23 May)
	public String getCurrentdatemonth() {
		// TODO Auto-generated method stub
		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM");
		java.util.Date date = new java.util.Date();
		String dateFind = formatter.format(date);
		return dateFind;
	}

	// get current date format in dd/MM/yyyy
	public String currentdateSpecialFormat() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		String date = dtf.format(now);
		return date;
	}

	// date plus or minus pass in integer
	public static String dateSelected(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		// logger.debug(dtf.format(nextdate));
		String dd = nextdate.format(dtf);
		return dd; // Retun in dd/MM/yyyy
	}

	// month plus or minus pass in integer and return
	public String monthSelected(String months) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int month = Integer.parseInt(months);
		LocalDateTime nextmonth = now.plusMonths(month);
		String mon = nextmonth.format(dtf);
		return mon; // Retun in MM
	}

	// month plus or minus pass in integer and return full month Name
	public static String getfullMonthName(String months) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MMMM");
		LocalDateTime now = LocalDateTime.now();
		int month = Integer.parseInt(months);
		LocalDateTime nextmonth = now.plusMonths(month);
		String mon = nextmonth.format(dtf);
		return mon; // Retun in MMMM
	}

	// Year plus or minus pass in integer and return year
	public static String getYear(String year1) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy");
		LocalDateTime now = LocalDateTime.now();
		int year = Integer.parseInt(year1);
		LocalDateTime nextmonth = now.plusYears(year);
		String ye = nextmonth.format(dtf);
		return ye; // Retun in yyyy
	}

	// Hours plus or minus pass in integer
	public String changeHours(String hours) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(hours);
		LocalDateTime nextdate = now.plusHours(dete);
		String ho = nextdate.format(dtf);
		return ho; // Retun in HH:mm
	}

	// Minutes plus or minus pass in integer
	public String changeMinutes(String minutes) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("mm");
		LocalDateTime now = LocalDateTime.now();
		int minite = Integer.parseInt(minutes);
		LocalDateTime minUpdate = now.plusMinutes(minite);
		String min = minUpdate.format(dtf);
		return min; // Retun in mm
	}

	// Minutes plus or minus pass in integer and Return HH:mm -Mayank
	public static String changeHoursMinutes(String minutes) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
		LocalDateTime now = LocalDateTime.now();
		int minite = Integer.parseInt(minutes);
		LocalDateTime minUpdate = now.plusMinutes(minite);
		String min = minUpdate.format(dtf);
		return min; // Retun in HH:mm
	}

	// Minutes plus or minus pass in integer and Return HH:mm -Mayank
	public String changeHoursMinutesAPI(String minutes) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HHmm");
		LocalDateTime now = LocalDateTime.now();
		int minite = Integer.parseInt(minutes);
		LocalDateTime minUpdate = now.plusMinutes(minite);
		String min = minUpdate.format(dtf);
		return min; // Retun in HHmm
	}

	public String dateSelectedinddMMyyyy(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyy");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		// logger.debug(dtf.format(nextdate));
		String ddMMyyyy = nextdate.format(dtf);
		return ddMMyyyy;
	}

	public static String dateSelectedinddMMyyyyWithSlash(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		// logger.debug(dtf.format(nextdate));
		String ddMMyyyy = nextdate.format(dtf);
		return ddMMyyyy;
	}

	// Days Plus or Minus and Year static 1999 for Birth date --Mayank
	public String daysMonthYear1999forDOB(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMM");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		String dateMonth = nextdate.format(dtf);
		String ddMMyyyy = dateMonth + "1999";
		return ddMMyyyy;
	}

	// Days Month Year HH:mm:ss in ddMMyyyyHHmmss and Plus minus days --Mayank
	public String daysMonthYearHHmmss(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		String ddMMyyyyHHmmss = nextdate.format(dtf);
		return ddMMyyyyHHmmss;

	}

	// get date 1-31 --Mayank
	public String getDayInD(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("d");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		String d = nextdate.format(dtf);
		return d;
	}

	// api parameter = daterange use
	public String daterangeSelectedForAPI(String days, String days2) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyy");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		// logger.debug(dtf.format(nextdate));
		String ddMMyyyy = nextdate.format(dtf);

		int dete1 = Integer.parseInt(days2);
		LocalDateTime nextdate1 = now.plusDays(dete1);
		// logger.debug(dtf.format(nextdate));
		String ddMMyyyy1 = nextdate1.format(dtf);
		String apiDateFormat = ddMMyyyy + "-" + ddMMyyyy1;
		return apiDateFormat;
	}

	// This function user for get one field data from api response
	public String getOneAPIParmeterVal(String apiResponse, String getParameterName) {
		JsonPath js = new JsonPath(apiResponse); // for parsing json
		String sus = js.getString(getParameterName);
		// logger.debug(sus);
		String value = sus.replace("[", "").replace("]", "");
		return value;
	}

	// Selected value of DropDown
	public String dropDownSelectedValue(WebElement ele) {
		Select dropdown = new Select(ele);
		String selected = dropdown.getFirstSelectedOption().getText();
		return selected;
	}

	// dates elected by datepicker
	public String dateReturnInddMMMyyyy(String days) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MMM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int dete = Integer.parseInt(days);
		LocalDateTime nextdate = now.plusDays(dete);
		String dd = nextdate.format(dtf);
		return dd;
	}

	public void dateSelectedThroughDatePicker(String days) throws InterruptedException {
		String[] date = dateReturnInddMMMyyyy(days).split("/");
		String date1 = date[0];
		String month = date[1].substring(0, 3);
		String year = date[2];
		System.out.println(date1 + " " + month + " " + year);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(monthPickerDropDown, month);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(yearPickerDropDown, year);
		Thread.sleep(1000);
		for (int i = 0; i < datePickerRows.size(); i++) {
			if (datePickerRows.get(i).getText().equalsIgnoreCase(date1)) {
				element_Click(datePickerRows.get(i));
				break;
			}
		}
		Thread.sleep(1000);
	}

	// Api related changes
	// api parameter = date use
	public static String dateSelectedForAPI(String days) {
		String ddMMyyyyWithSlash = staticDateOrPlusMinusFromCurrentDate(days);
		String ddMMyyyy = ddMMyyyyWithSlash.replace("/", "");
		return ddMMyyyy;
	}

	public static String dateddmmyyyyhhmmssForAPI(String days) {
		String ddMMyyyyHHmmss = null;
		if (!days.contains("&")) {
			if (days.length() >= 8) {
				ddMMyyyyHHmmss = days;
			} else {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyyHHmmss");
				LocalDateTime now = LocalDateTime.now();
				int dete = Integer.parseInt(days);
				LocalDateTime nextdate = now.plusDays(dete);
				// logger.debug(dtf.format(nextdate));
				ddMMyyyyHHmmss = nextdate.format(dtf);
			}
		} else {
			String[] daysconvert = days.split("&");
			String updatedDate = staticDateOrPlusMinusFromCurrentDate(daysconvert[0]);
			String finalUpdatedDate = updatedDate.replace("/", "");
			String updatedTime = staticTimeOrPlusMinusMinutesFromCurrentTime(daysconvert[1]);
			String finalUpdatedTime = updatedTime.replace(":", "").concat("00");
			ddMMyyyyHHmmss = finalUpdatedDate + finalUpdatedTime;
		}
		return ddMMyyyyHHmmss;
	}

	// this function use for ddmmyyyy-ddmmyyyy
	public static String dateddmmyyyyddmmyyyyForAPI(String days) {
		String[] daysconvert = days.split("&");

		// From Date
		String ddmmyyyyWithSlash = staticDateOrPlusMinusFromCurrentDate(daysconvert[0]);
		String ddmmyyyy = ddmmyyyyWithSlash.replace("/", "");

		// To date
		String ddmmyyyyWithSlash1 = staticDateOrPlusMinusFromCurrentDate(daysconvert[1]);
		String ddmmyyyy1 = ddmmyyyyWithSlash1.replace("/", "");

		String dateFromTO = ddmmyyyy + "-" + ddmmyyyy1;
		return dateFromTO;
	}

	// function use for mmyyyy
	public static String datedmmyyyyForAPI(String days) throws ParseException {
		String[] daysSplit = days.split("&");
		// month find
		String month = daysSplit[0];
		String month2 = staticMonthOrPlusMinusMonthFromCurrentMonth(month);
		Month monthint = Month.valueOf(month2.toUpperCase());
		int finalMonthint = monthint.getValue();
		String finalMonth = String.format("%02d", finalMonthint);
		// year find
		String year = null;
		if (daysSplit[1].equalsIgnoreCase("Current")) {
			DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("yyyy");
			LocalDateTime now = LocalDateTime.now();
			year = now.format(dtf1);
		} else {
			year = staticYearOrPlusMinusYearFromCurrentYear(null, daysSplit[1]);
		}
		// monthyear Format in MMyyyy
		String monthYear = finalMonth + year;
		return monthYear;
	}

	public static String dateddmmyyyyHHMMForAPI(String days) {
		String ddMMyyyyhhmm = null;
		LocalDateTime now = LocalDateTime.now();
		String[] daysconvert = days.split("&");
		// First ddmmyyyy
		String ddmmyyyyWithSlash = staticDateOrPlusMinusFromCurrentDate(daysconvert[0]);
		String ddmmyyyy = ddmmyyyyWithSlash.replace("/", "");
		// Second hhmm
		String hhmm = daysconvert[1];
		// Combine
		ddMMyyyyhhmm = ddmmyyyy + hhmm;
		return ddMMyyyyhhmm;
	}

	// this function use for ddmmyyyyhhmmss-ddmmyyyyhhmmss
	public static String dateddmmyyyyhhmmssddmmyyyyhhmmssForAPI(String days) {
		String ddmmyyyyhhmmss2 = null;
		LocalDateTime now = LocalDateTime.now();

		String[] daysconvert = days.split("&");

		// given below code for 1st ddmmyyyyhhmmss1
		String ddMMyyyyHHmmss1 = null;
		if (!daysconvert[0].contains("and")) {
			if (daysconvert[0].length() >= 8) {
				ddMMyyyyHHmmss1 = daysconvert[0];
			} else {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyy");
				int dete = Integer.parseInt(daysconvert[0]);
				LocalDateTime nextdate = now.plusDays(dete);
				// logger.debug(dtf.format(nextdate));
				ddMMyyyyHHmmss1 = nextdate.format(dtf) + "000000";
			}
		} else {
			String[] daysconvert2 = daysconvert[0].split("and");
			String updatedDate = staticDateOrPlusMinusFromCurrentDate(daysconvert2[0]);
			String finalUpdatedDate = updatedDate.replace("/", "");
			String updatedTime = staticTimeOrPlusMinusMinutesFromCurrentTime(daysconvert2[0]);
			String finalUpdatedTime = updatedTime.replace(":", "").concat("00");
			ddMMyyyyHHmmss1 = finalUpdatedDate + finalUpdatedTime;
		}
		// end code of 1st ddmmyyyyhhmmss1

		// given below code for 2nd ddmmyyyyhhmmss2
		String ddMMyyyyHHmmss2 = null;
		if (!daysconvert[1].contains("and")) {
			if (daysconvert[1].length() >= 8) {
				ddMMyyyyHHmmss2 = daysconvert[1];
			} else {
				DateTimeFormatter dtf = DateTimeFormatter.ofPattern("ddMMyyyy");
				int dete = Integer.parseInt(daysconvert[1]);
				LocalDateTime nextdate = now.plusDays(dete);
				// logger.debug(dtf.format(nextdate));
				ddMMyyyyHHmmss2 = nextdate.format(dtf) + "235959";
			}
		} else {
			String[] daysconvert2 = daysconvert[1].split("and");
			String updatedDate = staticDateOrPlusMinusFromCurrentDate(daysconvert2[1]);
			String finalUpdatedDate = updatedDate.replace("/", "");
			String updatedTime = staticTimeOrPlusMinusMinutesFromCurrentTime(daysconvert2[1]);
			String finalUpdatedTime = updatedTime.replace(":", "").concat("59");
			ddMMyyyyHHmmss2 = finalUpdatedDate + finalUpdatedTime;
		}
		// end code of 1st ddmmyyyyhhmmss1
//		if (daysconvert[1].equalsIgnoreCase("0")) {
//			DateTimeFormatter dtf1 = DateTimeFormatter.ofPattern("ddMMyyyyhhmmss");
//			now = LocalDateTime.now();
//			int dete1 = Integer.parseInt(daysconvert[1]);
//			LocalDateTime nextdate1 = now.plusDays(dete1);
//			// logger.debug(dtf.format(nextdate));
//			ddmmyyyyhhmmss2 = nextdate1.format(dtf1);
//		} else {
//			dtf = DateTimeFormatter.ofPattern("ddMMyyyy");
//			now = LocalDateTime.now();
//			int dete2 = Integer.parseInt(daysconvert[1]);
//			LocalDateTime nextdate2 = now.plusDays(dete2);
//			// logger.debug(dtf.format(nextdate));
//			ddmmyyyyhhmmss2 = nextdate2.format(dtf) + "235959";
//		}

		String dateFromTO = ddMMyyyyHHmmss1 + "-" + ddMMyyyyHHmmss2;
		return dateFromTO;
	}

	// Api related changes close here

	// Reports regarding changes start here
	// Generate Report button (All Modules Report)
	public void generateReportToAllModule(String reportExportFormat) throws Exception {
		element_Click(generateReport);
		Thread.sleep(1500);
//		pleaseWaitImagePageLoadingForReport();
		generateReportInSelectionFormat(reportExportFormat);
		driver.switchTo().defaultContent();
	}

	// get current date format in dd-MM-yyyy
	public String currentdateSystemDateChangeFormat() {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MM-yy");
		LocalDateTime now = LocalDateTime.now();
		logger.debug(now);
		String date = dtf.format(now);
		return date;
	}

	public void changeSyatemDateTimeAfter() throws IOException, InterruptedException {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
		LocalDateTime now = LocalDateTime.now();
		String min = now.format(dtf);
		logger.debug(min);
		String[] splittime = min.split(":");
		String hor = splittime[0];
		String tim = splittime[1];
		if (Integer.parseInt(hor) == 23 && Integer.parseInt(tim) > 30) {
			long holdtime = 10000;
			do {
				while (Integer.parseInt(hor) != 00) {
					dtf = DateTimeFormatter.ofPattern("HH");
					now = LocalDateTime.now();
					hor = now.format(dtf);
					Thread.sleep(holdtime);
				}
				dtf = DateTimeFormatter.ofPattern("mm");
				now = LocalDateTime.now();
				min = now.format(dtf);
				Thread.sleep(holdtime);
			} while (Integer.parseInt(min) != 02);
		}
	}

	// get date format in dd-MM-yyyy
	public String dateChangeFormatddMMyy(String date) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate inputdate = LocalDate.parse(date, dtf);
		DateTimeFormatter dtfo = DateTimeFormatter.ofPattern("dd-MM-yy");
		String outdate = inputdate.format(dtfo);
		return outdate;
	}

	public void deleteRSExistFileInASforReportScheduler(String reportNameDD, String schedulerName, String schedulerType)
			throws IOException {
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String path = null;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			path = "C:\\Program Files (x86)\\Matrix\\COSEC Alerts Service\\Export";
		} else {
			path = "C:\\Program Files (x86)\\EVERIT\\EVERTECT Alerts Service\\Export";
		}
		File files = new File(path);
		if (schedulerType.equalsIgnoreCase("Reports")) {
			if (reportNameDD.contains("/")) {
				reportNameDD = reportNameDD.replace("/", "_");
			}
			reportNameDD = "_" + reportNameDD + "_";
			// logger.debug(reportNameDD);
			if (files.exists() || files.isDirectory()) {
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					if (file.getName().contains(reportNameDD)) {
						file.delete();
						// logger.debug("file delete successfully"+file.getName());
					}
				}
			} else {
				logger.debug("Folder or File not available");
			}
		} else {
			if (files.exists() || files.isDirectory()) {
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					if (file.getName().contains(schedulerName)) {
						file.delete();
						// logger.debug("file delete successfully"+file.getName());
					}
				}
			} else {
				logger.debug("Folder or File not available");
			}
		}
	}

	public String findActualFileNamePathforReportScheduler(String reportDD, String formatExt) throws IOException {
		// logger.debug("File Names list : " +treeR);
		String actualFileName = "Actual File Not Found!!!";
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String path = null;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			path = "C:\\Program Files (x86)\\Matrix\\COSEC Alerts Service\\Export";
		} else {
			path = "C:\\Program Files (x86)\\EVERIT\\EVERTECT Alerts Service\\Export";
		}
		File files = new File(path);
		if (reportschedulerType.equalsIgnoreCase("Reports")) {
			if (reportDD.contains("/")) {
				reportDD = reportDD.replace("/", "_");
			}
			// logger.debug(formatExt.toLowerCase());
			Iterator<String> treefiles = treeR.iterator();
			while (treefiles.hasNext()) {
				String fileName = treefiles.next();
				logger.debug(fileName);
				if (fileName.contains(formatExt.toLowerCase())
						&& fileName.toLowerCase().contains(reportDD.toLowerCase())) {
					logger.debug("Expected File in tree :" + fileName);
					if (files.exists() || files.isDirectory()) {
						actualFileName = path + "\\" + fileName;
						break;
					} else {
						logger.debug("Folder or File not available");
					}
				}
			}
		} else {
			for (File file : files.listFiles()) {
//				logger.debug(file.getName());
//				logger.debug("_" + reportDD + "_");
//				logger.debug(formatExt.toLowerCase());
				if (file.getName().toLowerCase().contains("_" + reportDD.toLowerCase() + "_")
						&& file.getName().toLowerCase().contains(formatExt.toLowerCase())) {
					logger.debug("file Found :" + file.getName());
					actualFileName = path + "\\" + file.getName();
					break;
				}
			}
			logger.debug("helllllllllllllllllll" + actualFileName);
		}
		return actualFileName;
	}

	public String findExpectedFileNamePathforReports(String reportDD, String formatExt, String format) {
		String expectedFileName = "Expected File Not Found!!!";
		String findReportName = reportDD.toUpperCase();
		if (!findReportName.contains("RPT")) {
			if (reportDD.contains("/")) {
				reportDD = reportDD.replace("/", "_");
			}
			if (format.contains("/")) {
				format = format.replace("/", "");
			}

			if (format.equalsIgnoreCase("ddmmyyyy")) {
				File files = new File(System.getProperty("user.dir")
						+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\ddmmyyyy");
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					if (file.getName().contains("_" + reportDD + "_")
							&& file.getName().contains(formatExt.toLowerCase())) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\ddmmyyyy\\"
								+ file.getName();
						break;
					}
				}

			} else if (format.equalsIgnoreCase("mmddyyyy")) {
				File files = new File(System.getProperty("user.dir")
						+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\mmddyyyy");
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					if (file.getName().contains("_" + reportDD + "_")
							&& file.getName().contains(formatExt.toLowerCase())) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\mmddyyyy\\"
								+ file.getName();
						break;
					}
				}
			} else {
				File files = new File(System.getProperty("user.dir")
						+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\yyyymmdd");
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					if (file.getName().contains("_" + reportDD + "_")
							&& file.getName().contains(formatExt.toLowerCase())) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\ReportSchedulerExpectedData\\yyyymmdd\\"
								+ file.getName();
						break;
					}
				}
			}
		} else {
			// logger.debug("Hello find file");
			if (reportDD.contains("/")) {
				reportDD = reportDD.replace("/", "_");
			}
			if (format.contains("/")) {
				format = format.replace("/", "");
			}
//			logger.debug(reportDD);
//			logger.debug(formatExt);
//			logger.debug(format);

			if (format.equalsIgnoreCase("ddmmyyyy")) {
				File files = new File(
						System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\Reports\\ddmmyyyy");
				logger.debug("files count" + files.length());
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					String[] dotSplit = file.getName().split("\\.");
					if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\Reports\\ddmmyyyy\\" + file.getName();
						break;
					}
				}

			} else if (format.equalsIgnoreCase("mmddyyyy")) {
				File files = new File(
						System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\Reports\\mmddyyyy");
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					String[] dotSplit = file.getName().split("\\.");
					if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\Reports\\mmddyyyy\\" + file.getName();
						break;
					}
				}
			} else {
				File files = new File(
						System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\Reports\\yyyymmdd");
				for (File file : files.listFiles()) {
					// logger.debug(file.getName());
					String[] dotSplit = file.getName().split("\\.");
					if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
						// logger.debug("file Found :" + file.getName());
						expectedFileName = System.getProperty("user.dir")
								+ "\\src\\test\\resources\\TestDataResource\\Reports\\yyyymmdd\\" + file.getName();
						break;
					}
				}
			}
		}
		return expectedFileName;
	}

	public String findExpectedFileNamePathforExportReports(String reportDD, String formatExt, String format) {
		String expectedFileName = "Expected File Not Found!!!";
		String findReportName = reportDD.toUpperCase();
		if (format.contains("/")) {
			format = format.replace("/", "");
		}
		if (format.equalsIgnoreCase("ddmmyyyy")) {
			File files = new File(System.getProperty("user.dir")
					+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\ddmmyyyy");
			for (File file : files.listFiles()) {
				// logger.debug(file.getName());
				String[] dotSplit = file.getName().split("\\.");
				if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
					// logger.debug("file Found :" + file.getName());
					expectedFileName = System.getProperty("user.dir")
							+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\ddmmyyyy\\"
							+ file.getName();
					break;
				}
			}

		} else if (format.equalsIgnoreCase("mmddyyyy")) {
			File files = new File(System.getProperty("user.dir")
					+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\mmddyyyy");
			for (File file : files.listFiles()) {
				// logger.debug(file.getName());
				String[] dotSplit = file.getName().split("\\.");
				if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
					// logger.debug("file Found :" + file.getName());
					expectedFileName = System.getProperty("user.dir")
							+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\mmddyyyy\\"
							+ file.getName();
					break;
				}
			}
		} else {
			File files = new File(System.getProperty("user.dir")
					+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\yyyymmdd");
			for (File file : files.listFiles()) {
				// logger.debug(file.getName());
				String[] dotSplit = file.getName().split("\\.");
				if (dotSplit[0].equalsIgnoreCase(reportDD) && dotSplit[1].equalsIgnoreCase(formatExt)) {
					// logger.debug("file Found :" + file.getName());
					expectedFileName = System.getProperty("user.dir")
							+ "\\src\\test\\resources\\TestDataResource\\ExportDataReports\\yyyymmdd\\"
							+ file.getName();
					break;
				}
			}
		}

		return expectedFileName;
	}

	// repx files-> can publish =false value updated

	public void repxFileDatetimeFieldChange(String reportsFilePath) {
		int count = 0;
		int datecount = 0;
		File files = new File(reportsFilePath);
		for (File file : files.listFiles()) {
			String filePath = reportsFilePath + "\\" + file.getName();
			String searchString = "Name=\"txtReportTime\" PageInfo=\"DateTime\"";
			String replacementString = "Name=\"txtReportTime\" PageInfo=\"DateTime\" CanPublish=\"false\"";
			String reportDateString = "Name=\"txtReportdate\" PageInfo=\"DateTime\"";
			String replacementreportDateString = "Name=\"txtReportdate\" PageInfo=\"DateTime\" CanPublish=\"false\"";
			String reportHeaderString = "Name=\"txtTitle\" Text=\"Report Name\"";
			String replacementreportHeaderString = "Name=\"txtTitle\" Text=\"Report Name\" CanPublish=\"false\"";
			try {
				BufferedReader reader = new BufferedReader(new FileReader(filePath));
				StringBuilder content = new StringBuilder();
				String line;
				while ((line = reader.readLine()) != null) {
					content.append(line).append(System.lineSeparator());
				}
				reader.close();
				String updatedContent = content.toString();
				// logger.debug(updatedContent);
				String[] splitString = updatedContent.split("<Item");
				for (int i = 0; i < splitString.length; i++) {
					if (!splitString[i].contains(replacementString)) {
						if (splitString[i].contains(searchString) && !splitString[i].contains("CanPublish=\"false\"")) {
							Pattern pattern = Pattern.compile(searchString);
							Matcher matcher = pattern.matcher(updatedContent);
							updatedContent = matcher.replaceAll(replacementString);
							BufferedWriter writer = new BufferedWriter(new FileWriter(filePath));
							writer.write(updatedContent);
							logger.debug("String replaced successfully!");
							writer.close();
							count++;
						}
					}
					if (!splitString[i].contains(replacementreportDateString)) {
						if (splitString[i].contains(reportDateString)
								&& !splitString[i].contains("CanPublish=\"false\"")) {
							Pattern pattern = Pattern.compile(reportDateString);
							Matcher matcher = pattern.matcher(updatedContent);
							updatedContent = matcher.replaceAll(replacementreportDateString);
							BufferedWriter writer = new BufferedWriter(new FileWriter(filePath));
							writer.write(updatedContent);
							logger.debug("String replaced successfully!");
							writer.close();
							datecount++;
						}
					}
					if (file.getName().equalsIgnoreCase("rptWhosIn.repx")
							|| file.getName().equalsIgnoreCase("rptZoneWiseWhosIn.repx")
							|| file.getName().equalsIgnoreCase("rptZoneWiseWhosInDet.repx")
							|| file.getName().equalsIgnoreCase("rptWhosInSmartAccessRoute.repx")
							|| file.getName().equalsIgnoreCase("rptWhosInAccessRoute.repx")
							|| file.getName().equalsIgnoreCase("rptWhosInAccessRtSub.repx")) {
						if (!splitString[i].contains(replacementreportHeaderString)) {
							if (splitString[i].contains(reportHeaderString)
									&& !splitString[i].contains("CanPublish=\"false\"")) {
								Pattern pattern = Pattern.compile(reportHeaderString);
								Matcher matcher = pattern.matcher(updatedContent);
								updatedContent = matcher.replaceAll(replacementreportHeaderString);
								BufferedWriter writer = new BufferedWriter(new FileWriter(filePath));
								writer.write(updatedContent);
								logger.debug("String replaced successfully!");
								writer.close();
								datecount++;
							}
						}
					}
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		logger.debug("Can Publish field updated reports count : " + count);
		logger.debug("Date control Can Publish field updated reports count : " + datecount);
	}

	public String reportFromDateToDateChangeFormat(String date, String format) {
		String dateWithFormat = date;
		String[] dateSplit = date.split("/");
		String day = dateSplit[0];
		String month = dateSplit[1];
		String year = dateSplit[2];
		String[] splitwithspace = format.split(" ");
		switch (splitwithspace[splitwithspace.length - 2]) {
		case "MM/DD/YYYY":
			dateWithFormat = month + "/" + day + "/" + year;
			break;
		case "YYYY/MM/DD":
			dateWithFormat = year + "/" + month + "/" + day;
			break;
		default:
			dateWithFormat = date;
			break;
		}
		return dateWithFormat;
	}

	public void waitForElementInVisible(WebElement ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.invisibilityOf(ele));
	}

	public void waitForLocatorInVisible(By ele) {
		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.invisibilityOfElementLocated(ele));
	}

	public static File[] getFilesInDirectory(String directoryPath) {
		File directory = new File(directoryPath);
		return directory.listFiles();
	}

	List<String> previousCheckfilesAll = new ArrayList<>();
	public static List<String> downloadFileUsingTestScenario = new ArrayList<>();

	public File[] oldFileDownloadedInFolderList(String downloadPath) throws InterruptedException {
		File[] filesAfterDownload = getFilesInDirectory(downloadPath);
		for (File file : filesAfterDownload) {
			previousCheckfilesAll.add(file.getName());
		}
		return filesAfterDownload;
	}

	// if file is exist then delete
	public void deleteTempFileInFolder(String filePath) {
		File directory = new File(filePath);
		File[] files = directory.listFiles();
		for (File file : files) {
			file.delete();
//			String[] fileNameSplit = file.getName().split("\\.");
//			if (fileNameSplit[1].equalsIgnoreCase("tmp")) {
//				file.deleteOnExit();
//			}
		}
		System.out.println("File Deleted");
	}

	// Custom method to wait for a new file to appear in the download directory
	public int waitForNewFileToDownload(String downloadPath, int length, int timeoutInSeconds) {
		int sum = 0;
		int count = 0;
		int waited = 0;
//			File[] filesAfterDownload = getFilesInDirectory(downloadPath);
//			for (File file : filesAfterDownload) {
//				previousCheckfilesAll.add(file.getName());
//			}
		while (waited < timeoutInSeconds) {
			List<String> filesAll = new ArrayList<>();
			try {
				Thread.sleep(1000); // Wait for 1 second
				// Get the list of files after initiating the download
				File[] filesAfterDownload1 = getFilesInDirectory(downloadPath);
				filesAll.clear();
				for (File file : filesAfterDownload1) {
					filesAll.add(file.getName());
				}
				// logger.debug(filesAll);
				int length1 = filesAfterDownload1.length;
				if (length != length1) {
					boolean chek = true;
					System.out.println(filesAll);
					for (int x = 0; x < filesAll.size(); x++) {
						String[] fileSplitwithDot = filesAll.get(x).split("\\.");
						if (fileSplitwithDot[fileSplitwithDot.length - 1].equalsIgnoreCase("tmp")
								|| fileSplitwithDot[fileSplitwithDot.length - 1].equalsIgnoreCase("crdownload")) {
							System.out
									.println("File extension check : " + fileSplitwithDot[fileSplitwithDot.length - 1]);
							chek = false;
							Thread.sleep(1000);
							break;
						}
					}
					System.out.println("check vaklue " + chek);
					if (chek == true) {
						System.out.println("check vaklue in looooooooop" + chek);
						System.out.println(previousCheckfilesAll);
						System.out.println(filesAll);
						filesAll.removeAll(previousCheckfilesAll);
						// logger.debug(filesAll.get(0));
						System.out.println("Downloaded File Name : " + filesAll.get(0));
						downloadFileUsingTestScenario.add(filesAll.get(0));
						System.err.println("File downloaded");
						count++;
						sum = count;
						break;
					}
				}
				waited++;
			} catch (InterruptedException e) {
				System.err.println("File not downloaded within the timeout period");
			}
		}
		return sum;
	}

	public static TreeSet<String> treeR = new TreeSet<>();

	// Custom method to wait for a new file to appear in the download directory for
	// Report Scheduler
	public int waitForNewFileToDownloadForReportScheduler(int timeoutInSeconds, int files) throws IOException {
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String path = null;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			path = "C:\\Program Files (x86)\\Matrix\\COSEC Alerts Service\\Export";
		} else {
			path = "C:\\Program Files (x86)\\EVERIT\\EVERTECT Alerts Service\\Export";
		}
		File files1 = new File(path);
		int count = 0;
		int waited = 0;
		while (waited < timeoutInSeconds) {
			try {
				String folder = path;
				File directory = new File(folder);
				if (directory.exists()) {
					Thread.sleep(5000); // Wait for 5 second
					treeR.clear();
					for (File file : files1.listFiles()) {
						for (int i = 0; i < fi.size(); i++) {
							String reportschedulerNameC = fi.get(i);
							if (reportschedulerNameC.equalsIgnoreCase("Blocked Users")) {
								reportschedulerNameC = "Blocked  Users";
							}
							if (reportschedulerNameC.contains("/")) {
								reportschedulerNameC = reportschedulerNameC.replace("/", "_");
							}
							// logger.debug(file.getName());
							if (file.getName().contains("_" + reportschedulerNameC + "_")) {
								treeR.add(file.getName());
								break;
							}
						}
					}
					if (treeR.size() == files) {
						count = treeR.size();
						break;
					}
				} else {
					Thread.sleep(5000);
				}
				waited++;

			} catch (InterruptedException e) {
				System.err.println("File not downloaded within the timeout period");
			}
		}
		// logger.debug(treeR);
		return count;
	}

	public void generateReportInSelectionFormat(String exportFormat) throws Exception {

		String downloadPath = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports";
		Thread.sleep(2000);
		deleteTempFileInFolder(downloadPath);
		driver.switchTo().frame(driver.findElement(By.id("report1")));
		waitForElementVisible_TimeinMinutes(exportToClassVisible, 3);
		waitForElementClickable(exportTo);

		WebDriverWait wait = new WebDriverWait(driver, Duration.ofSeconds(60));
		wait.until(ExpectedConditions.visibilityOf(driver.findElement(By.xpath(
				"//*[@class=\"dxrd-report-preview dx-accessibility-page-item dx-accessibility-border-accented\"]/div"))));

		if (driver.findElements(By.xpath(
				"//*[@class=\"dxrd-report-preview-content-loading-wrapper dxrd-background-white\" and not(contains(@style,'display: none;'))]"))
				.size() > 0) {
			wait.until(ExpectedConditions.invisibilityOf(driver.findElement(By.xpath(
					"//*[@class=\"dxrd-report-preview-content-loading-wrapper dxrd-background-white\" and not(contains(@style,'display: none;'))]"))));
		}

		if (exportFormat.contains(",")) {
			System.out.println("*********Hello Multiple file format found in selection report");
			String[] formats = exportFormat.split(",");
			int formatsTypeCount = formats.length;
			for (int i = 0; i < formatsTypeCount; i++) {
				System.out.println("*********Hello Multiple file format found in selection report,Format type count"
						+ formatsTypeCount);
				int length = getFilesInDirectory(downloadPath).length;
				// logger.debug("1st " + length);
				// logger.debug(exportFormat);
				exportFormat = exportFormat.toUpperCase();
				System.out.println("*********Hello Export Format: " + exportFormat);
				driver.findElement(By.xpath("//*[@class=\"dx-item dx-menu-item\"]")).click();
				System.out.println("*********Hello Element Click : " + exportFormat);
				Thread.sleep(1000);
				// Get the list of files before initiating the download
				oldFileDownloadedInFolderList(downloadPath);
				List<WebElement> exportTo = driver
						.findElements(By.xpath("//*[@class=\"dxrd-preview-export-item-text\"]"));
				System.out.println("*********Hello Export to : " + exportTo);

				for (int x = 0; x < exportTo.size(); x++) {
					// logger.debug(exportTo.get(x).getText());
					if (exportTo.get(x).getText().equalsIgnoreCase(formats[i])) {
						exportTo.get(x).click();
						break;
					}
				}
				waitForNewFileToDownload(downloadPath, length, 60);

			}

			// new start
			// if subreport found then generate sub report
			if (driver.findElements(By.xpath("//*[@class=\"dxrd-report-preview-brick-navigation\"][1]")).size() > 0) {
				driver.findElement(By.xpath("//*[@class=\"dxrd-report-preview-brick-navigation\"][1]")).click();
				Thread.sleep(1000);
				if (driver.findElements(By.xpath(
						"//*[@class=\"dxrd-report-preview-content-loading-wrapper dxrd-background-white\" and not(contains(@style,'display: none;'))]"))
						.size() > 0) {
					wait.until(ExpectedConditions.invisibilityOf(driver.findElement(By.xpath(
							"//*[@class=\"dxrd-report-preview-content-loading-wrapper dxrd-background-white\" and not(contains(@style,'display: none;'))]"))));
				}

				for (int i = 0; i < formatsTypeCount; i++) {
					int length = getFilesInDirectory(downloadPath).length;
					// logger.debug("1st " + length);
					// logger.debug(exportFormat);
					exportFormat = exportFormat.toUpperCase();
					Thread.sleep(1000);
					driver.findElement(By.xpath("//*[@class=\"dx-item dx-menu-item\"]")).click();
					Thread.sleep(1000);
					List<WebElement> exportTo1 = driver
							.findElements(By.xpath("//*[@class=\"dxrd-preview-export-item-text\"]"));
					oldFileDownloadedInFolderList(downloadPath);
					for (int x = 0; x < exportTo1.size(); x++) {
						logger.debug(exportTo1.get(x).getText());
						if (exportTo1.get(x).getText().equalsIgnoreCase(formats[i])) {
							exportTo1.get(x).click();
							break;
						}
					}
					// driver.findElement(By.xpath("//*[@class=\"dxrd-report-preview-brick-navigation\"][1]")).click();
					// Thread.sleep(1500);
					waitForNewFileToDownload(downloadPath, length, 60);
				}
			}
			// new End
			Thread.sleep(2000);
			Assert.assertEquals(downloadFileUsingTestScenario.isEmpty(), false);
		} else {
			int length = getFilesInDirectory(downloadPath).length;
			// logger.debug("1st" + length);
			exportFormat = exportFormat.toUpperCase();
			Thread.sleep(1500);
			Thread.sleep(1000);
			driver.findElement(By.xpath("//*[@class=\"dxrd-preview-export-toolbar-item dxrd-toolbar-item\"]")).click();
			Thread.sleep(1000);
			oldFileDownloadedInFolderList(downloadPath);
			// Get the list of files before initiating the download
			List<WebElement> exportTo = driver.findElements(By.xpath("//*[@class=\"dxrd-preview-export-item-text\"]"));
			for (int x = 0; x < exportTo.size(); x++) {
				// logger.debug(exportTo.get(x).getText());
				if (exportTo.get(x).getText().equalsIgnoreCase(exportFormat)) {
					exportTo.get(x).click();
					break;
				}
			}
			waitForNewFileToDownload(downloadPath, length, 60);
			// if subreport found then generate sub report
			if (driver.findElements(By.xpath("//*[@class=\"dxrd-report-preview-brick-navigation\"][1]")).size() > 0) {
				driver.findElement(By.xpath("//*[@class=\"dxrd-report-preview-brick-navigation\"][1]")).click();
				Thread.sleep(1000);
				driver.findElement(By.xpath("//*[@class=\"dxrd-preview-export-toolbar-item dxrd-toolbar-item\"]"))
						.click();
				Thread.sleep(1000);
				oldFileDownloadedInFolderList(downloadPath);
				List<WebElement> exportTo1 = driver
						.findElements(By.xpath("//*[@class=\"dxrd-preview-export-item-text\"]"));
				for (int x = 0; x < exportTo1.size(); x++) {
					// logger.debug(exportTo1.get(x).getText());
					if (exportTo1.get(x).getText().equalsIgnoreCase(exportFormat)) {
						exportTo1.get(x).click();
						break;
					}
				}
				waitForNewFileToDownload(downloadPath, length, 60);
			}
			Thread.sleep(2000);

		}

	}

	public void generateExportReportInSelectionFormat() throws Exception {
		String downloadPath = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports";
		int length = getFilesInDirectory(downloadPath).length;
		oldFileDownloadedInFolderList(downloadPath);
		System.out.println(length + ":Length of exports file");
		element_Click(export);
		int count = waitForNewFileToDownload(downloadPath, length, 15);
		Assert.assertEquals(count, 1);
	}

	public void uploadDocumentUsingAutoIT() throws InterruptedException, IOException {
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		String browser = System.getProperty("browser") != null ? System.getProperty("browser")
				: prop.getProperty("browser");
		element_Click(browseBtnInUploadDocumentPopup);
		Thread.sleep(2000);
		String uploadAutoITFilePath = System.getProperty("user.dir")
				+ "\\src\\test\\resources\\AutoITFile\\Fileupload.exe";
		if (browser.equalsIgnoreCase("edge")) { // For updated Edge browser, document selection file explorer popup
												// xpath changed in edge
			uploadAutoITFilePath = System.getProperty("user.dir")
					+ "\\src\\test\\resources\\AutoITFile\\FileuploadEdgeBrowser.exe";
		}
		Runtime.getRuntime().exec(uploadAutoITFilePath);
		Thread.sleep(2000);
		element_Click(updateBtnInUploadDocumentPopup);
		Thread.sleep(1000);
	}

// By Chhaya
	public void verifyExportReportFileFormat(String fileFormat) throws InterruptedException {
		Thread.sleep(1000);
		pleaseWaitImagePageLoadingForReport();
		driver.switchTo().frame(driver.findElement(By.id("report1")));
		element_Click(exportToClickInRepx);
		Thread.sleep(1000);

		if (fileFormat.contains(",")) {
			boolean validate = false;
			String[] commaSeparatedValues = fileFormat.split(",");
			if (exportToClickAndItsValueInRepx.size() == commaSeparatedValues.length) {
				List<String> expArray = new ArrayList<String>();
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					expArray.add(commaSeparatedValues[i].trim().toUpperCase());
				}
				List<Object> expectedArraysortingList = expArray.stream().sorted().collect(Collectors.toList());
				List<String> actArray = new ArrayList<String>();
				for (int j = 0; j < exportToClickAndItsValueInRepx.size(); j++) {
					actArray.add(exportToClickAndItsValueInRepx.get(j).getText().toUpperCase());
				}
				List<Object> actualArraysortingList = actArray.stream().sorted().collect(Collectors.toList());
				Assert.assertEquals(actualArraysortingList, expectedArraysortingList);
				validate = true;
			} else {
				List<String> actArray = new ArrayList<String>();
				for (int j = 0; j < exportToClickAndItsValueInRepx.size(); j++) {
					actArray.add(exportToClickAndItsValueInRepx.get(j).getText().toUpperCase());
				}
				logger.debug("Actual: " + actArray);
				logger.debug("Expected file format length and Actual file format length miss matched");
			}
			Assert.assertEquals(validate, true);
		} else {
			boolean validate1 = false;
			if (exportToClickAndItsValueInRepx.size() == 1) {
				Assert.assertEquals(exportToClickAndItsValueInRepxOnlyOne.getText(), fileFormat.toUpperCase());
				validate1 = true;
			} else {
				List<String> actArray = new ArrayList<String>();
				for (int j = 0; j < exportToClickAndItsValueInRepx.size(); j++) {
					actArray.add(exportToClickAndItsValueInRepx.get(j).getText().toUpperCase());
				}
				logger.debug("Actual: " + actArray);
				logger.debug("Expected file format length and Actual file format length miss matched");
			}
			Assert.assertEquals(validate1, true);
		}
		driver.switchTo().defaultContent();
	}

	// By Chhaya
	public void verifyPageName(String renamedPage) throws InterruptedException {
		String actualRes = null;
		Thread.sleep(2000);

		int l = 0;

		for (int i = 0; i < allPageName.size(); i++) {
			String menuNm = allPageName.get(i).getText();
			logger.debug("Menu name :" + menuNm);
			if (menuNm.equalsIgnoreCase(renamedPage)) {
				actualRes = menuNm;
				Thread.sleep(1000);
				break;
			}
			String value = allPageName.get(i).getAttribute("data-bs-toggle");
			if (value != null) {

				allPageName.get(i).click();
				Thread.sleep(1000);

				for (int j = 0; j < subMenu.size(); j++) {
					String subMenuNm = subMenu.get(j).getText();
					if (subMenuNm.equalsIgnoreCase(renamedPage)) {
						l += 1;
						actualRes = subMenuNm;
						Thread.sleep(1000);
						allPageName.get(i).click();
						Thread.sleep(1000);
						break;
					}

					String value1 = subMenu.get(j).getAttribute("data-bs-toggle");
					if (value1 != null) {
						l += 1;
						subMenu.get(j).click();
						Thread.sleep(1000);

						for (int k = 0; k < subMenu1.size(); k++) {
							String subMenuNm1 = subMenu1.get(k).getText();

							if (subMenuNm1.equalsIgnoreCase(renamedPage)) {
								actualRes = subMenuNm1;
								Thread.sleep(1000);
								subMenu.get(j).click();
								Thread.sleep(1000);
								break;
							}
						}
						break;

					}
				}
				if (l == 1) {
					break;
				}
			}
		}
		// Thread.sleep(1000);
		Assert.assertEquals(actualRes, renamedPage);

		Thread.sleep(2000);
	}

	// Mayank
	// Select users or groups from user picklist
	public void selectUsersOrGroupFromPicklist(String ids, WebElement ele) throws InterruptedException {
		if (ids.contains(",")) {
			String[] commaSeparatedValues = ids.split(",");
			for (int i = 0; i < commaSeparatedValues.length; i++) {
				String id = commaSeparatedValues[i].trim();
				element_Clear(ele);
				element_InputText(ele, id);
				Thread.sleep(500);
				element_TextBoxToClickOnTab(ele);
				Thread.sleep(1000);
			}
		} else {
			element_Clear(ele);
			element_InputText(ele, ids);
			Thread.sleep(500);
			element_TextBoxToClickOnTab(ele);
			Thread.sleep(1000);
		}
	}

	// Mayank
	// select directly entered date or plus minus from current date
	public static String staticDateOrPlusMinusFromCurrentDate(String date) {
		String finalDate = null;
		if (date.contains("/") || date.length() >= 5) { // if date directly entered in TC
			finalDate = date;
		} else { // if date +- from current date in TC
			finalDate = dateSelected(date);
		}
		return finalDate;
	}

	// Mayank
	// Select directly Time or plus minus hours from current date
	public String staticTimeOrPlusMinusHoursFromCurrentTime(String time) {
		String finalTime = null;
		if (time.contains(":")) { // if time directly entered in TC
			finalTime = time;
		} else { // if time hours +- from current date in TC
			finalTime = changeHours(time);
		}
		return finalTime;
	}

	// Mayank
	// Select directly Time or plus minus minutes from current date
	public static String staticTimeOrPlusMinusMinutesFromCurrentTime(String time) {
		String finalTime = null;
		if (time.contains(":") || time.length() >= 4) { // if time directly entered in TC
			finalTime = time;
		} else { // if time minutes +- from current date in TC
			finalTime = changeHoursMinutes(time);
		}
		return finalTime;
	}

	// Mayank
	// Select directly Month or plus minus Month from current month
	public static String staticMonthOrPlusMinusMonthFromCurrentMonth(String month) {
		String finalMonth = null;
		if (month.matches(".*[a-zA-Z].*")) { // For if Month name is entered
			finalMonth = month;
		} else { // For if Month + or - from current month is entered
			finalMonth = getfullMonthName(month);
		}
		return finalMonth;
	}

	// Mayank
	// Select directly Year or plus minus Year from current month
	public static String staticYearOrPlusMinusYearFromCurrentYear(String month, String year) {
		String finalYear = null;
		if (month != null) {
			if (year.length() == 4) {
				finalYear = year;
			} else {
				LocalDate currentDate = LocalDate.now();
				int currentMonth = currentDate.getMonthValue();
				if (month.matches(".*[a-zA-Z].*")) { // For if Month name is entered
					finalYear = getYear(year);
				} else {
					int month1 = Integer.parseInt(month);
					int monthNumber = currentMonth + month1;
					int year1 = Integer.parseInt(getYear(year));
					if (monthNumber > 12) {
						year1 += 1;
					} else if (monthNumber <= 0) {
						year1 -= 1;
					} else {
						year1 = year1;
					}
					finalYear = String.valueOf(year1);
				}
			}
		} else {
			if (year.length() == 4) {
				finalYear = year;
			} else {
				finalYear = getYear(year);
			}
		}
		return finalYear;
	}

	// Mayank
	// Select directly year or plus minus year from current year
	public String staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(String year) {
		String finalYear = null;
		if (year.length() == 4) { // For if Year name is entered
			finalYear = year;
		} else { // For if Month + or - from current month is entered
			finalYear = getYear(year);
		}
		return finalYear;
	}

	// Chhaya
	// month plus or minus pass in integer
	public static String integerMonthSelected(String days) throws Exception {

		String dd = null;

		if (days.matches(".*[a-zA-Z].*")) { // For if Month name is entered
			Date date = new SimpleDateFormat("MMMM", Locale.ENGLISH).parse(days);
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			int month = cal.get(Calendar.MONTH) + 1;
			dd = String.valueOf(month);
		} else {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MM");
			LocalDateTime now = LocalDateTime.now();
			int dete = Integer.parseInt(days);
			LocalDateTime nextdate = now.plusMonths(dete);
			logger.debug(dtf.format(nextdate));
			dd = nextdate.format(dtf);
		}
		return dd; // Retun in MM
	}

	// Chhaya
	// year plus or minus pass in integer
	public String integerYearSelected(String days) {
		String dd = null;
		if (days.length() == 4) { // For if Year name is entered
			dd = days;
		} else {
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("YYYY");
			LocalDateTime now = LocalDateTime.now();
			int dete = Integer.parseInt(days);
			LocalDateTime nextdate = now.plusYears(dete);
			logger.debug(dtf.format(nextdate));
			dd = nextdate.format(dtf);
		}
		return dd; // Retun in yyyy
	}

	public String currentDt2minus1MonthDate(String month) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int mnth = Integer.parseInt(month);
		LocalDateTime nextdate = now.plusMonths(mnth);
		// logger.debug(dtf.format(nextdate));
		String ddMMyyyy = nextdate.format(dtf);
		return ddMMyyyy;
	}

	public String currentDt2minus1MonthDateAndDate(String month, String Date) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDateTime now = LocalDateTime.now();
		int mnth = Integer.parseInt(month);
		LocalDateTime nextdate = now.plusMonths(mnth);
		int date = Integer.parseInt(Date);
		LocalDateTime last = nextdate.plusDays(date);
		String ddMMyyyy = last.format(dtf);
		return ddMMyyyy;
	}

	public String getMonthCheckWhilePlusOrMinusDate(String month, String date) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("MMMM");
		LocalDateTime now = LocalDateTime.now();
		int dat = Integer.parseInt(date);
		LocalDateTime nextdate = now.plusDays(dat);
		String ddMMyyyy = nextdate.format(dtf);
		int mo = Integer.parseInt(month);
		LocalDateTime monthGet = now.plusDays(mo);
		String ddMonth = monthGet.format(dtf);
		if (ddMMyyyy.equalsIgnoreCase(ddMonth) == false) {
			ddMonth = ddMMyyyy;
		}
		return ddMMyyyy;
	}

	// Mayank
	public void logOutAdminPortal() {
		element_Click(profileIconAdminPortal);
		element_Click(logOutAdminPortal);

	}

	// Chirag Analysis regarding Acustom alert
	// Api Data get and update for Alert
	public String readwriteJSONdata(String readWrite, String alertName, String customField, String updateValue)
			throws Exception {
		String data = null;
		ObjectMapper mapper = new ObjectMapper();
		File file = new File(
				System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\AlertData.json");
		JsonNode jsonNode = mapper.readTree(file);
		JsonNode alertNode = jsonNode.get(alertName).get(0);
		if (readWrite.equalsIgnoreCase("write")) {
			((ObjectNode) alertNode).put(customField, updateValue);
			mapper.writeValue(file, jsonNode);
			data = "Data updated in JSON";
		} else {
			data = alertNode.get(customField).toString();
		}
		return data;
	}

	// Chirag Analysis regarding Acustom alert
	public String convertedDatetime(String datetime) throws Exception {
		String formatter2 = null;
		if (datetime.length() < 7) {
			SimpleDateFormat format = new SimpleDateFormat("HH:mm");
			SimpleDateFormat outPutformat = new SimpleDateFormat("hh:mm aa");
			formatter2 = outPutformat.format(format.parse(datetime));
			System.out.println("Format 2 " + formatter2);
		} else {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			LocalDateTime datetime1 = LocalDateTime.parse(datetime, formatter);
			System.out.println(datetime1);
			if (datetime1.getSecond() > 29) {
				datetime1 = datetime1.plusMinutes(1);
			}
			System.out.println(datetime1);
			formatter2 = datetime1.format(DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
			System.out.println(formatter2);
		}
		return formatter2;
	}

	public String convertedDatetimeDif(String datetime) throws Exception {
		String date = null;
		if (datetime.length() > 5) {
			String[] dateSplit = datetime.split(" ");
			String[] sd = dateSplit[0].substring(0, 5).split("/");
			date = sd[1] + "/" + sd[0] + dateSplit[0].substring(5, 10) + "-" + dateSplit[1];
		}
		return date;
	}

	public String getWeekstartDateEndDateForCustomAlert(String fromDt, String weekStartDay, String monthWeek) {
		String startEnd = null;
		if (monthWeek.equalsIgnoreCase("weekly")) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			LocalDate date = LocalDate.parse(fromDt, formatter);
			LocalDate weekstartdate = getWeekOfMonth(date, weekStartDay);
			LocalDate weekenddate = weekstartdate.plusDays(6);
			startEnd = weekstartdate.format(formatter) + " to " + weekenddate.format(formatter);
		} else {
			String[] month = fromDt.split("/");
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.MONTH, Integer.parseInt(month[1]));
			String startMonth = "01/" + month[1] + "/" + month[2];
			System.out.println(Calendar.DAY_OF_MONTH);
			LocalDate givenDate = LocalDate.of(Integer.parseInt(month[2]), Integer.parseInt(month[1]),
					Integer.parseInt(month[0]));
			YearMonth yearMonth = YearMonth.from(givenDate);
			LocalDate lastDate = yearMonth.atEndOfMonth();
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
			String lastDateofMonth = lastDate.format(formatter);
			startEnd = startMonth + " to " + lastDateofMonth;
		}
		return startEnd;
	}

	public LocalDate getWeekOfMonth(LocalDate date, String weekStartDay) {
		DayOfWeek startDayOfWeek = DayOfWeek.valueOf(weekStartDay.toUpperCase());
		return date.with(TemporalAdjusters.previousOrSame(startDayOfWeek));
	}

	public String convertedHHmmAddedMinites(String datetime, String min) throws Exception {
		String formatter2 = null;
		LocalTime lt = LocalTime.parse(datetime, DateTimeFormatter.ofPattern("HH:mm"));
		System.out.println(lt);
		formatter2 = lt.plusMinutes(Long.parseLong(min)).toString();
		return formatter2;
	}

	// Given below logic used to find weekly dates
	public Set<String> getFilteredDatesFromWeeklyConfig(String fromDt, String toDt, String week, String days) {
		// For Week
		System.out.println(
				"getFilteredDatesFromWeeklyConfig Pass Data : " + fromDt + "  " + toDt + "  " + week + "  " + days);
		String[] commaSeparatedWeek = week.split(",");
		ArrayList<String> weekValues = new ArrayList<String>();
		for (int i = 0; i < commaSeparatedWeek.length; i++) {
			String weekValue = commaSeparatedWeek[i].trim().toUpperCase();
			if (weekValue.contains("LAST")) {
				weekValues.add(weekValue);
			} else {
				weekValues.add(weekValue.substring(0, 1));
			}
		}
		System.out.println("weekValues = " + weekValues);
		// For Days
		String[] commaSeparatedDay = days.split(",");
		Map<String, String> daysMap = new HashMap<String, String>();
		daysMap.put("MON", "1");
		daysMap.put("TUE", "2");
		daysMap.put("WED", "3");
		daysMap.put("THU", "4");
		daysMap.put("FRI", "5");
		daysMap.put("SAT", "6");
		daysMap.put("SUN", "7");
		ArrayList<String> dayValues = new ArrayList<String>();
		for (int j = 0; j < commaSeparatedDay.length; j++) {
			String dayValue = commaSeparatedDay[j].trim().toUpperCase();
			dayValues.add(daysMap.get(dayValue));
		}
		System.out.println("dayValues = " + dayValues);
		// From and To Date1
		DateTimeFormatter format = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		LocalDate fromDate = LocalDate.parse(fromDt, format);
		LocalDate toDate = LocalDate.parse(toDt, format);

		// Main Logic
		Set<String> dateList = new HashSet<String>();
		LocalDate currentDate = fromDate;
		while (!currentDate.isAfter(toDate)) {
			String dayOfWeek = String.valueOf(currentDate.getDayOfWeek().getValue());
			String weekOfMonth = getWeekOfMonth(currentDate);
			String weekOfMonth1 = getWeekOfMonthForLast(currentDate);
			if (contains(dayValues, dayOfWeek) && contains(weekValues, weekOfMonth)
					|| contains(dayValues, dayOfWeek) && contains(weekValues, weekOfMonth1)) {
				String date1 = currentDate.format(format);
				dateList.add(date1);
			}
			currentDate = currentDate.plus(1, ChronoUnit.DAYS);
		}
		return dateList;
	}

	public boolean contains(ArrayList<String> array, String value) {
		for (String i : array) {
			if (i.equalsIgnoreCase(value)) {
				return true;
			}
		}
		return false;
	}

	public String getWeekOfMonth(LocalDate date) {
		LocalDate firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth());
		LocalDate lastDayOfMonth = date.with(TemporalAdjusters.lastDayOfMonth());
		int week = 0;
		LocalDate currentDay = firstDayOfMonth.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
		while (!currentDay.isAfter(lastDayOfMonth)) {
			week++;
			if (date.isBefore(currentDay.plusWeeks(1)) || date.equals(currentDay.plusWeeks(1).minusDays(1))) {
				WeekFields weekFields = WeekFields.of(DayOfWeek.MONDAY, 1);
				return String.valueOf(date.get(weekFields.weekOfMonth()));
			}

			currentDay = currentDay.plusWeeks(1);
		}
		return String.valueOf(week);
	}

	public String getWeekOfMonthForLast(LocalDate date) {
		LocalDate firstDayOfMonth = date.with(TemporalAdjusters.firstDayOfMonth());
		LocalDate lastDayOfMonth = date.with(TemporalAdjusters.lastDayOfMonth());
		int week = 0;
		LocalDate currentDay = firstDayOfMonth.with(TemporalAdjusters.nextOrSame(DayOfWeek.MONDAY));
		while (!currentDay.isAfter(lastDayOfMonth)) {
			week++;
			if (date.isBefore(currentDay.plusWeeks(1)) || date.equals(currentDay.plusWeeks(1).minusDays(1))) {
				if (currentDay.plusWeeks(1).isAfter(lastDayOfMonth)) {
					return "LAST";
				} else {
					WeekFields weekFields = WeekFields.of(DayOfWeek.MONDAY, 1);
					return String.valueOf(date.get(weekFields.weekOfMonth()));
				}
			}

			currentDay = currentDay.plusWeeks(1);
		}
		return String.valueOf(week);
	}

	// This function is used to check From Date and to Date is > or <
	// currentMonthStartDate or currentMonthLastDate
	public static Map<String, String> getFromDateChecked(String fromDt, String endDt, String processingPeriod) {
		Map<String, String> exDate = new HashMap<String, String>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		exDate.clear();
		LocalDate lt = LocalDate.now();
		LocalDate currentMonthStartDate;
		LocalDate currentMonthLastDate;
		if (processingPeriod.equalsIgnoreCase("Current")) {
			currentMonthStartDate = LocalDate.of(lt.getYear(), lt.getMonthValue(), 01);
			currentMonthLastDate = LocalDate.of(lt.getYear(), lt.getMonthValue(), lt.lengthOfMonth());
		} else {
			currentMonthStartDate = LocalDate.of(lt.getYear(), lt.getMonthValue() + 1, 01);
			currentMonthLastDate = LocalDate.of(lt.getYear(), lt.getMonthValue() + 1,
					currentMonthStartDate.lengthOfMonth());
		}
		LocalDate fdate = LocalDate.parse(fromDt, formatter);
		LocalDate edate = LocalDate.parse(endDt, formatter);
		if (currentMonthLastDate.isBefore(fdate) || currentMonthLastDate.isEqual(fdate)) {
			exDate.put("fromDate", fromDt);
			exDate.put("toDate", endDt);
		} else if ((currentMonthStartDate.isAfter(fdate) || currentMonthStartDate.isEqual(fdate))) {
			exDate.put("fromDate", currentMonthStartDate.format(formatter));
			if (currentMonthLastDate.isAfter(edate)) {
				exDate.put("toDate", endDt);
			} else if (currentMonthLastDate.isBefore(edate) || currentMonthLastDate.isEqual(edate)) {
				exDate.put("toDate", currentMonthLastDate.format(formatter));
			}
		} else if (currentMonthStartDate.isBefore(fdate)) {
			exDate.put("fromDate", fromDt);
			if (currentMonthLastDate.isAfter(edate)) {
				exDate.put("toDate", endDt);
			} else if (currentMonthLastDate.isBefore(edate) || currentMonthLastDate.isEqual(edate)) {
				exDate.put("toDate", currentMonthLastDate.format(formatter));
			}
		}

		return exDate;
	}

	// This method is used to get all days (dates) of given month
	public static List<String> getDays(int year, int month) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("d");
		YearMonth yearMonth = YearMonth.of(year, month);
		int daysInMonth = yearMonth.lengthOfMonth();
		List<String> daysList = new ArrayList<>();
		for (int day = 1; day <= daysInMonth; day++) {
			LocalDate date = LocalDate.of(year, month, day);
			daysList.add(date.format(formatter));
		}
		return daysList;
	}

	// Mayank
	// Select directly Month or plus minus Month from current month for API month
	// format = mm
	public static String staticMonthOrPlusMinusMonthFromCurrentMonthForAPI(String month) {
		String finalMonth = null;
		if (month.matches(".*[a-zA-Z].*")) { // For if Month name is entered
			Month month1 = Month.valueOf(month.toUpperCase());
			int monthNumber = month1.getValue();
			finalMonth = String.format("%02d", monthNumber);
		} else { // For if Month + or - from current month is entered
			String fullmonth = getfullMonthName(month);
			Month month1 = Month.valueOf(fullmonth.toUpperCase());
			int monthNumber = month1.getValue();
			finalMonth = String.format("%02d", monthNumber);
		}
		return finalMonth;
	}

	public String splitWithColan(String time) {
		String newtime = time.substring(0, time.length() - 2) + ":" + time.substring(time.length() - 2, time.length());
		return newtime;
	}

	public void element_InputTextUsingActionClass(WebElement ele, String value) throws InterruptedException {
		Actions ac = new Actions(driver);
		ac.click(ele).sendKeys(value).build().perform();
	}

	public void element_inputTextUsingActionClassCharacterOneByOne(WebElement ele, String value)
			throws InterruptedException {
		Actions ac = new Actions(driver);
		for (char character : value.toCharArray()) {
			ac.click(ele).sendKeys(String.valueOf(character)).build().perform();
//			Thread.sleep(150);
		}
	}

	public void systemDatetimeCHanged(String date) {
		ProcessBuilder processBuilder = new ProcessBuilder("cmd", "/c", "date", date);

		try {
			Process process = processBuilder.start();
			process.waitFor();
			System.out.println("Date changed successfully." + date);
		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
	}

	public void element_CleardatausingActionClass(WebElement ele) {
		Actions a = new Actions(driver);
		a.moveToElement(ele).doubleClick().sendKeys(Keys.BACK_SPACE).build().perform();
	}

	public void elemnet_dynamicDDValueSelected(WebElement ele, String data, List<WebElement> ddValues)
			throws InterruptedException {
		Thread.sleep(1000);
		element_InputTextUsingActionClass(ele, data);
		Thread.sleep(1500);
		waitForElementVisible(ddValues.get(0));
		for (int i = 0; i < ddValues.size(); i++) {
			System.out.println(ddValues.get(i).getText());
			if (ddValues.get(i).getText().equalsIgnoreCase(data)) {
				ddValues.get(i).click();
				break;
			}
		}
	}

	public void element_dynamicDDSelect(WebElement ele, String value) throws InterruptedException {
		element_InputTextUsingActionClass(ele, value);
		waitForElementVisible(visibleDDListValuesele);
		Thread.sleep(500);
		for (int i = 0; i < visibleDDListValues.size(); i++) {
			if (visibleDDListValues.get(i).getText().equalsIgnoreCase(value)) {
				visibleDDListValues.get(i).click();
				break;
			}
		}
		Thread.sleep(500);
		if (element_isEnabled(ele)) {
			element_TextBoxToClickOnTab(ele);
		}
	}

	public void element_cleardataUsingActionClass(WebElement ele) throws InterruptedException {
		Actions ac = new Actions(driver);
		ac.contextClick(ele).keyDown(Keys.CONTROL).sendKeys("a").keyUp(Keys.CONTROL).sendKeys(Keys.DELETE).build()
				.perform();

	}

	// dd/MM/yyyy to MMyyyy
	public String dateddMMyyyyToMMyyyyWithInputSlash(String date) {
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MMyyyy");
		LocalDate date1 = LocalDate.parse(date, inputFormatter);
		String monthYear = date1.format(outputFormatter);
		return monthYear;
	}

	// dd/MM/yyyy to MM/dd/yyyy
	public String dateddMMyyyyToMMddyyyyWithInputOutputSlash(String date) {
		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
		DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
		LocalDate date1 = LocalDate.parse(date, inputFormatter);
		String date2 = date1.format(outputFormatter);
		return date2;
	}

	public String staticDayOrPlusMinusFromCurrentDay(String day) {
		String newDay = null;
		if (day.matches("[a-zA-Z]+")) {
			newDay = day;
		} else {
			LocalDate today = LocalDate.now();
			int day1 = Integer.parseInt(day);
			LocalDate newDate = today.plusDays(day1);
			newDay = newDate.getDayOfWeek().getDisplayName(TextStyle.FULL, Locale.ENGLISH);
		}
		return newDay;
	}

	public String validateDateCurrentMonthLastDate(String inputDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		sdf.setLenient(false);

		try {
			Date passedDate = sdf.parse(inputDate);
			Calendar currentCal = Calendar.getInstance();
			Calendar lastDayCal = Calendar.getInstance();
			lastDayCal.set(Calendar.DAY_OF_MONTH, lastDayCal.getActualMaximum(Calendar.DAY_OF_MONTH));
			Date lastDayOfMonth = lastDayCal.getTime();
			if (passedDate.after(lastDayOfMonth)) {
				return sdf.format(lastDayOfMonth);
			} else {
				return sdf.format(passedDate);
			}

		} catch (ParseException e) {
			e.printStackTrace();
			return "Invalid Date Format!";
		}
	}

	public static boolean eachRowStatus = false;

	public void assertEquals(String actual, String expected, String message, boolean continueOnFailure, int row,
			String sheetName) throws Exception {
		try {
			Assert.assertEquals(actual, expected, message);
			System.out.println("Assertion Passed: " + message);
			if (eachRowStatus == false) {
				writeDataForUIControlValidation(sheetName, row, 0, "Pass");
				writeDataForUIControlValidation(sheetName, row, 1, "");
				writeDataForUIControlValidation(sheetName, row, 2, "");
				writeDataForUIControlValidation(sheetName, row, 3, "");
			}
		} catch (AssertionError e) {
			System.err.println("Assertion Failed: " + message);
			System.err.println("Remark: Expected [" + expected + "], but found [" + actual + "]");
			if (eachRowStatus == false) {
				writeDataForUIControlValidation(sheetName, row, 0, "Fail");
				writeDataForUIControlValidation(sheetName, row, 1, actual);
				writeDataForUIControlValidation(sheetName, row, 2, "Assertion Failed: " + message);
				captureScreenshot("AssertionFailure_" + message.replaceAll("\\s+", "_"), row, sheetName);
				eachRowStatus = true;
			}
			if (!continueOnFailure) {
				throw e; // Stop execution if strict mode
			} else {
				// Log for summary report (optional)
				logger.info("FAILED: " + message + " → Expected: [" + expected + "], Actual: [" + actual + "]");
			}
		}

	}

	private void captureScreenshot(String fileName, int row, String sheetName) throws Exception {
		try {
			if (driver != null) {
				File srcFile = ((TakesScreenshot) driver).getScreenshotAs(OutputType.FILE);
				String timestamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(new Date());
				String destPath = System.getProperty("user.dir") + "/screenshots/" + fileName + "_" + timestamp
						+ ".png";
				File destFile = new File(destPath);
				destFile.getParentFile().mkdirs();
				Files.copy(srcFile.toPath(), destFile.toPath());
				System.out.println("Screenshot captured: " + destPath);
				writeImageToExcelForUIControlValidation(sheetName, row, 3, destPath);
			} else {
				System.err.println("WebDriver is null, cannot take screenshot!");
			}
		} catch (IOException ex) {
			System.err.println("Failed to capture screenshot: " + ex.getMessage());
		}
	}

	// write data to excel data logic
	public void writeDataForUIControlValidation(String sheetName, int row, int col, String result) throws IOException {
		String filePath = System.getProperty("user.dir")
				+ "\\src\\test\\resources\\TestDataResource\\UiControlValidationForAutomation.xlsx";
		try (FileInputStream fis = new FileInputStream(filePath); XSSFWorkbook wb = new XSSFWorkbook(fis)) {
			XSSFSheet sheet = wb.getSheet(sheetName);
			XSSFRow sheetRow = sheet.getRow(row);
			if (sheetRow == null) {
				sheetRow = sheet.createRow(row);
			}
			XSSFCell cell = sheetRow.getCell(col);
			if (cell == null) {
				cell = sheetRow.createCell(col);
			}
			cell.setCellValue(result);
			try (FileOutputStream fos = new FileOutputStream(filePath)) {
				wb.write(fos);
			}
		}
	}

	public void writeImageToExcelForUIControlValidation(String sheetName, int row, int col, String imagePath)
			throws Exception {

		String excelFilePath = System.getProperty("user.dir")
				+ "\\src\\test\\resources\\TestDataResource\\UiControlValidationForAutomation.xlsx";

		FileInputStream fis = new FileInputStream(excelFilePath);
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheet(sheetName);

		// Read image file (.png)
		InputStream inputStream = new FileInputStream(imagePath);
		byte[] bytes = IOUtils.toByteArray(inputStream);
		int pictureIdx = wb.addPicture(bytes, Workbook.PICTURE_TYPE_PNG);
		inputStream.close();

		// Create helper and patriarch
		CreationHelper helper = wb.getCreationHelper();
		Drawing<?> drawing = sheet.createDrawingPatriarch();

		// Anchor of image
		ClientAnchor anchor = helper.createClientAnchor();
		anchor.setCol1(col); // starting column
		anchor.setRow1(row); // starting row

		// Set image fixed size (prevents zoom + fits cell area)
		anchor.setDx2(200 * Units.EMU_PER_PIXEL); // Width 200px
		anchor.setDy2(120 * Units.EMU_PER_PIXEL); // Height 120px

		// Insert the picture
		Picture pict = drawing.createPicture(anchor, pictureIdx);

		fis.close();

		// Save file
		FileOutputStream fos = new FileOutputStream(excelFilePath);
		wb.write(fos);
		fos.close();
		wb.close();
	}

	// UI Automation
	// Dropdown Related UI Automation
	public void dropDown_Check_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement eleLabel,
			WebElement ele, List<WebElement> elementSize, String application_label, String application_Type,
			String application_Visibility, String application_Default_Value, String application_Select_Values,
			String application_Values, String elementPresentOrNot) throws Exception {
		if (!application_label.isBlank() && !application_label.isEmpty()) {
			assertEquals(eleLabel.getText(), application_label, fieldName + " Control Label Comparision", true,
					rowNumber, sheetName);
		}
		if (!application_Type.isBlank() && !application_Type.isEmpty()) {
			System.out.println("Element Attribute :" + element_GetAttributeValue(ele, "type"));
			String dropDV = element_GetAttributeValue(ele, "type");
			if (dropDV.equalsIgnoreCase("select-one")) {
				dropDV = "dropdown";
			}
			assertEquals(dropDV, application_Type, fieldName + " DropDown Type Comparison", true, rowNumber, sheetName);
		}
		if (!application_Visibility.isBlank() && !application_Visibility.isEmpty()) {
			System.out.println("Element Visibility :" + element_isEnabledOrDisabled(ele));
			assertEquals(element_isEnabledOrDisabled(ele), application_Visibility,
					fieldName + " DropDown Enable/disabled Comparison", true, rowNumber, sheetName);
		}
		if (!application_Default_Value.isBlank() && !application_Default_Value.isEmpty()) {
			System.out.println("Element PlaceHolder :" + element_DropDownFirstSelectedValue(ele));
			assertEquals(element_DropDownFirstSelectedValue(ele), application_Default_Value,
					fieldName + " Dropdown default value Comparison", true, rowNumber, sheetName);
		}
		if (!application_Select_Values.isBlank() && !application_Select_Values.isEmpty()) {
			System.out.println("Element Value Select :" + application_Select_Values);
			element_DropDownSelectByvisibleText(ele, application_Select_Values);
		}
		if (!application_Values.isBlank() && !application_Values.isEmpty()) {
			System.out.println("Dropdown Elements Values  :" + element_DropDowngetValues(ele));
			assertEquals(element_DropDowngetValues(ele), application_Values, fieldName + " Dropdown values Comparison",
					true, rowNumber, sheetName);
		}
		if (!elementPresentOrNot.isBlank() && !elementPresentOrNot.isEmpty()) {
			System.out.println("Dropdown Elements Values  :" + elementSize.size());
			assertEquals(String.valueOf(elementSize.size()), elementPresentOrNot,
					fieldName + " Dropdown values Comparison", true, rowNumber, sheetName);
		}
	}

	// Checkbox Related UI Automation
	public void checkbox_Check_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement eleLabel,
			WebElement ele, String label, String type, String visibility, String defaultValue, String value)
			throws Exception {
		if (!label.isBlank() && !label.isEmpty()) {
			assertEquals(eleLabel.getText(), label, fieldName + " Control Label Comparision", true, rowNumber,
					sheetName);
		}

		if (!type.isBlank() && !type.isEmpty()) {
			System.out.println("Element Attribute :" + element_GetAttributeValue(ele, "type"));
			assertEquals(element_GetAttributeValue(ele, "type"), type, fieldName + " checkbox Type Comparison", true,
					rowNumber, sheetName);
		}

		if (!visibility.isBlank() && !visibility.isEmpty()) {
			System.out.println("Element Visibility :" + element_isEnabledOrDisabled(ele));
			assertEquals(element_isEnabledOrDisabled(ele), visibility,
					fieldName + " checkbox Enable/disabled Comparison", true, rowNumber, sheetName);
		}
		if (!defaultValue.isBlank() && !defaultValue.isEmpty()) {
			System.out.println("Element PlaceHolder :" + element_isSelected(ele));
			assertEquals(element_isSelectedinString(ele), defaultValue,
					fieldName + " check box default value Comparison", true, rowNumber, sheetName);
		}
		if (!value.isBlank() && !value.isEmpty()) {
			if (value.equalsIgnoreCase("check")) {
				if (ele.isSelected() != true) {
					element_Click(ele);
				}
			} else {
				if (ele.isSelected() == true) {
					element_Click(ele);
				}
			}
			Thread.sleep(250);
		}

	}

	// Tab Related UI Automation
	public void tab_Control_Check_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement label,
			WebElement eleOpenOrClose, String lab, String tabOpenOrClose, String value) throws Exception {
		if (!value.isBlank() && !value.isEmpty()) {
			element_Click(eleOpenOrClose);
		}
		if (!lab.isBlank() && !lab.isEmpty()) {
			assertEquals(label.getText(), lab, fieldName + " Label Comparision", true, rowNumber, sheetName);
		}
		if (!tabOpenOrClose.isBlank() && !tabOpenOrClose.isEmpty()) {
			System.out.println("Element Attribute :" + element_GetAttributeValue(eleOpenOrClose, "class"));
			assertEquals(element_GetAttributeValue(eleOpenOrClose, "class"), tabOpenOrClose,
					fieldName + " open or closed Comparison", true, rowNumber, sheetName);
		}

	}

	public void textBox_Control_Check_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement label,
			WebElement textBoxV, String lab, String type, String visibility, String placeHolder, String defaultV,
			String valueofText, String negativeValidationOnBox) throws Exception {
		System.out.println(lab);
		if (!lab.isBlank() && !lab.isEmpty()) {
			assertEquals(label.getText(), lab, fieldName + "  in Basic -> Optional Tab Label Comparision", true,
					rowNumber, sheetName);
		}

		if (!type.isBlank() && !type.isEmpty()) {
			System.out.println("Element Attribute :" + element_GetAttributeValue(textBoxV, "type"));
			assertEquals(element_GetAttributeValue(textBoxV, "type"), type,
					fieldName + " in Basic -> Optional Tab Type Comparison", true, rowNumber, sheetName);
		}
		if (!visibility.isBlank() && !visibility.isEmpty()) {
			System.out.println("Element Visibility :" + element_isEnabledOrDisabled(textBoxV));
			assertEquals(element_isEnabledOrDisabled(textBoxV), visibility,
					fieldName + " in Basic -> Optional Tab Enable/disabled Comparison", true, rowNumber, sheetName);
		}
		if (!placeHolder.isBlank() && !placeHolder.isEmpty()) {
			System.out.println("Element PlaceHolder :" + element_GetAttributeValue(textBoxV, "placeholder"));
			assertEquals(element_GetAttributeValue(textBoxV, "placeholder"), placeHolder,
					fieldName + " in Basic -> Optional Tab PlaceHolder Comparison", true, rowNumber, sheetName);
		}
		if (!defaultV.isBlank() && !defaultV.isEmpty()) {
			if (defaultV.equalsIgnoreCase("blank")) {
				String textBV = element_GetAttributeValue(textBoxV, "value");
				Thread.sleep(150);
				if (textBV.isBlank() && textBV.isEmpty()) {
					textBV = "blank";
				}
				System.out.println(textBV);
				assertEquals(textBV, defaultV, fieldName + " in Basic -> Optional Tab default value Comparison", true,
						rowNumber, sheetName);

			} else {
				System.out.println("Element default Value :" + element_GetAttributeValue(textBoxV, "value"));
				assertEquals(element_GetAttributeValue(textBoxV, "value"), defaultV,
						fieldName + " in Basic -> Optional Tab default value Comparison", true, rowNumber, sheetName);
			}

		}
		if (!valueofText.isBlank() && !valueofText.isEmpty()) {
			element_Clear(textBoxV);
			Thread.sleep(100);
			element_TextBoxToClickOnTab(textBoxV);
			Thread.sleep(100);
			System.out.println("Element InsertValue :" + valueofText);
			if (!valueofText.equalsIgnoreCase("clear")) {
				element_inputTextUsingActionClassCharacterOneByOne(textBoxV, valueofText);
			}
			Thread.sleep(250);
			element_TextBoxToClickOnEnterusingActionClass(textBoxV);
			Thread.sleep(250);
			if (!negativeValidationOnBox.isBlank() && !negativeValidationOnBox.isEmpty()) {
				String valMsg1 = validationMessage();
				System.out.println(valMsg1);
				assertEquals(valMsg1, negativeValidationOnBox,
						fieldName + " in Basic -> Optional Tab Validation while negative value", true, rowNumber,
						sheetName);
			}
		}
	}

	public void tableHeader_Control_Check_UIValidation(String fieldName, int rowNumber, String sheetName,
			List<WebElement> ele, String header_Value) throws Exception {
		// Table Header Value Checked
		if (!header_Value.isBlank() && !header_Value.isEmpty()) {
			List<String> header_data = new ArrayList<String>();
			for (int x = 0; x < ele.size(); x++) {
				header_data.add(ele.get(x).getText());
			}
			System.out.println("Pop Ip Header Data" + header_data);
			Gson gson = new Gson();
			String result = gson.toJson(header_data);
			System.out.println(result);
			assertEquals(result, header_Value, fieldName + "Table Header Comparison", true, rowNumber, sheetName);
		}
	}

	public void tableRow_Control_Check_UIValidation(String fieldName, int rowNumber, String sheetName,
			List<WebElement> rowElements, String labelPath, WebElement noDataEle, String rowExpectedData, String noData)
			throws Exception {
		// Normal Table Row
		Thread.sleep(250);
		System.out.println("rowExpectedData" + rowExpectedData);
		System.out.println("noData" + noData);

		if ((!rowExpectedData.isBlank() && !rowExpectedData.isEmpty()) || (!noData.isBlank() && !noData.isEmpty())) {
			if (rowElements.size() > 0) {
				List<List<String>> row_data = new ArrayList<List<String>>();
				List<WebElement> paginationSize = rowElements.get(0).findElements(By.xpath(
						"ancestor::div[@class=\"row\"]/following-sibling::div[1]//li[@class=\"pagination-next\"]"));
				int count = 0;
				do {
					if (count != 0) {
						if (paginationSize.size() > 0) {
							paginationSize.get(0).click();
						}
					}
					System.out.println("Table Row" + rowElements.size());
					for (int x = 0; x < rowElements.size(); x++) {
						List<String> rowsD = new ArrayList<String>();
						rowsD.clear();
						List<WebElement> actualRD = rowElements.get(x).findElements(By.xpath(labelPath));
						for (int y = 0; y < actualRD.size(); y++) {
							String dataV = actualRD.get(y).getText();
							System.out.println("Row Data : " + dataV);
							rowsD.add(dataV);
						}
						System.out.println("Print rows:" + rowsD);
						row_data.add(rowsD);
					}
					count++;
					System.out.println("Pagination Size :" + rowElements.get(0).findElements(By.xpath(
							"ancestor::div[@class=\"row\"]/following-sibling::div[1]//li[@class=\"pagination-next\"]"))
							.size());
				} while (rowElements.get(0).findElements(By.xpath(
						"ancestor::div[@class=\"row\"]/following-sibling::div[1]//li[@class=\"pagination-next\"]"))
						.size() > 0);
				Gson gson = new Gson();
				String result = gson.toJson(row_data);
				System.out.println("Row Data Actual Displayed :" + result);
				assertEquals(result, rowExpectedData, fieldName + " Table Row Comparison", true, rowNumber, sheetName);
			} else {
				// No Data sitePopUp_Default_Table_No_Data_Value
				if (!noData.isBlank() && !noData.isEmpty()) {
					System.out.println("Element default Value :" + element_GetText(noDataEle));
					assertEquals(element_GetText(noDataEle), noData,
							fieldName + " No Data Value default value Comparison", true, rowNumber, sheetName);
				}
			}
		}
	}

	// aagam code for info icon
	public void infoIcon_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement infoIcon,
			String expectedVisibility, String expectedTooltipText) throws Exception {
		// Visibility Check
		if (!expectedVisibility.isBlank() && !expectedVisibility.isEmpty()) {
			System.out.println("Info Icon Visibility :" + element_isDisplayed(infoIcon));
			assertEquals(String.valueOf(element_isDisplayed(infoIcon)), expectedVisibility,
					fieldName + " Info Icon Visibility Comparison", true, rowNumber, sheetName);
		}
		// Tooltip Check
		if (!expectedTooltipText.isBlank() && !expectedTooltipText.isEmpty()) {
			String actualTooltip = "";

			// Direct title attribute check
			actualTooltip = element_GetAttributeValue(infoIcon, "title");
			logger.info("Tooltip Text: " + actualTooltip);

			assertEquals(actualTooltip.trim(), expectedTooltipText.trim(),
					fieldName + " Info Icon Tooltip Text Comparison", true, rowNumber, sheetName);
		}
	}

	public void button_Check_UIValidation(String fieldName, int rowNumber, String sheetName, WebElement eleLabel,
			WebElement ele, String label, String type, String visibility) throws Exception {
		if (!label.isBlank()) {
			assertEquals(eleLabel.getText(), label, fieldName + " Button Label Comparison", true, rowNumber, sheetName);
		}
		if (!type.isBlank()) {
			assertEquals(element_GetAttributeValue(ele, "type"), type, fieldName + " Button Type Comparison", true,
					rowNumber, sheetName);
		}
		if (!visibility.isBlank()) {
			assertEquals(element_isEnabledOrDisabled(ele), visibility, fieldName + " Button Visibility Comparison",
					true, rowNumber, sheetName);
		}
	}

	public void fetching_default_TableData_multipleType(String fieldName, int rowNumber, String sheetName,
			List<WebElement> ele, String rowRelatedXpath, String rows_Value) throws Exception {
		if (!rows_Value.isBlank() && !rows_Value.isEmpty()) {
			List<List<String>> actualRow_data = new ArrayList<List<String>>();
			for (int x = 0; x < ele.size(); x++) {
				List<String> rowData = new ArrayList<String>();
				rowData.clear();
				List<WebElement> rowRelatedAnotherData = ele.get(x).findElements(By.xpath(rowRelatedXpath));
				for (int i = 0; i < rowRelatedAnotherData.size(); i++) {
					String fieldType = rowRelatedAnotherData.get(i).getAttribute("type");
					if (fieldType.equalsIgnoreCase("label")) {
						String valueOfLabel = rowRelatedAnotherData.get(i).getText();
						rowData.add(valueOfLabel);
					} else if (fieldType.equalsIgnoreCase("checkbox")) {
						String checkboxSelectedV = null;
						if (rowRelatedAnotherData.get(i).isSelected()) {
							checkboxSelectedV = "Checked";
							rowData.add(checkboxSelectedV);
						} else {
							checkboxSelectedV = "Unchecked";
							rowData.add(checkboxSelectedV);
						}
					} else if (fieldType.equalsIgnoreCase("select-one") || fieldType.equalsIgnoreCase("dropdown")) {
						Select select = new Select(rowRelatedAnotherData.get(i));
						String selected = select.getFirstSelectedOption().getText();
						rowData.add(selected);
					}
				}
				System.out.println("Row Data of " + x + " : " + rowData);
				actualRow_data.add(rowData);
				System.out.println("Actual data " + actualRow_data);
			}
			System.out.println(fieldName + " " + actualRow_data);
			Gson gson = new Gson();
			String result = gson.toJson(actualRow_data);
			System.out.println(result);
			assertEquals(result, rows_Value, fieldName + " Default table Comparison", true, rowNumber, sheetName);
		}

	}

	public void tableData_Updated(String fieldName, int rowNumber, String sheetName, List<WebElement> ele,
			String identifierpath, String rowRelatedXpath, String selectedRowValue, String updatedData)
			throws Exception {
		if (!selectedRowValue.isBlank() && !selectedRowValue.isEmpty()) {
			ObjectMapper mapper = new ObjectMapper();
			List<String> selectedlist = mapper.readValue(selectedRowValue, new TypeReference<List<String>>() {
			});
			System.out.println(selectedlist);
			List<List<String>> listData = mapper.readValue(updatedData, new TypeReference<List<List<String>>>() {
			});
			for (int i = 0; i < selectedlist.size(); i++) {
				String identified = selectedlist.get(i);
				System.out.println("Identifier :" + identified);
				List<String> updateDatalist = listData.get(i);
				int updateRecordSize = updateDatalist.size();
				System.out.println("update Data list :" + updateRecordSize);
				for (int x = 0; x < ele.size(); x++) {
					if (ele.get(x).getText().equalsIgnoreCase(identified)) {
						for (int y = 0; y < updateRecordSize; y++) {
							String xpathofOtherEle = "((" + identifierpath + ")[" + (x + 1) + "]/following-sibling::"
									+ rowRelatedXpath + ")[" + (y + 1) + "]";
							System.out.println("Xpath of " + xpathofOtherEle);
							String updateeDataV = updateDatalist.get(y);
							System.out.println("Update Value of " + updateeDataV);
							if (!updateeDataV.isBlank() && !updateeDataV.isEmpty()) {
								String fieldType = driver.findElement(By.xpath(xpathofOtherEle)).getAttribute("type");
								if (fieldType.equalsIgnoreCase("checkbox")) {
									if (updateeDataV.equalsIgnoreCase("Checked")) {
										if (!driver.findElement(By.xpath(xpathofOtherEle)).isSelected()) {
											driver.findElement(By.xpath(xpathofOtherEle)).click();
											Thread.sleep(250);
										}
									} else {
										if (driver.findElement(By.xpath(xpathofOtherEle)).isSelected()) {
											driver.findElement(By.xpath(xpathofOtherEle)).click();
											Thread.sleep(250);
										}
									}
								} else if (fieldType.equalsIgnoreCase("select-one")
										|| fieldType.equalsIgnoreCase("dropdown")) {
									element_DropDownSelectByvisibleText(driver.findElement(By.xpath(xpathofOtherEle)),
											updateeDataV);
									Thread.sleep(500);
								}
							}

						}
					}
				}
				Thread.sleep(250);
			}
		}
	}

	public String tableData_Elements_TypeAndDefaultAndValues(List<WebElement> ele) throws InterruptedException {
		Thread.sleep(250);
		List<String> actualData = new ArrayList<String>();
		for (int i = 0; i < ele.size(); i++) {
			String tag = ele.get(i).getAttribute("type");
			System.out.println("Control type: " + tag);
			switch (tag) {
			case "input":
				
				break;

			case "dropdown":
			case "select-one":
				String dropDV = element_GetAttributeValue(ele.get(i), "type");
				if (dropDV.equalsIgnoreCase("select-one")) {
					dropDV = "dropdown";
				} // checked type
				actualData.add(element_GetAttributeValue(ele.get(i), "type"));
				actualData.add(element_isEnabledOrDisabled(ele.get(i))); // checked visibility
				actualData.add(element_DropDownFirstSelectedValue(ele.get(i))); // checked default value selected
				actualData.add(element_DropDowngetValues(ele.get(i))); // checked all values
				break;

			case "label":
				actualData.add(ele.get(i).getText());// checked label value
				break;

			case "checkbox":
				actualData.add(element_GetAttributeValue(ele.get(i), "type")); // checked Type
				actualData.add(element_isEnabledOrDisabled(ele.get(i))); // Checked visibility
				actualData.add(element_isSelectedinString(ele.get(i))); // checked default selected or not
				break;

			default:
				System.out.println("Unknown control: " + tag);
			}

			System.out.println("-----------------------------");
		}
		String actual=String.valueOf(actualData);
		return actual;
	}
}
