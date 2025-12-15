package PageObject.AdminModule;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class ExportDataPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ExportDataPO.class);
	
	public ExportDataPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li/a/mx-label/label[text()='Templates']")
	private WebElement templatesTab;

	@FindBy(id = "cmbTempType")
	private WebElement templateType;

	@FindBy(id = "cmbselectedTemp")
	private WebElement template;

	@FindBy(id = "_fromDate")
	private WebElement fromDate;

	@FindBy(id = "_toDate")
	private WebElement toDate;

	@FindBy(id = "cmbmonthList")
	private WebElement month;

	@FindBy(id = "cmbYearList")
	private WebElement year;

	@FindBy(id = "cmbrdlExpType")
	private WebElement fileFormat;

	@FindBy(id = "fileName")
	private WebElement fileName;

	@FindBy(id = "cmbrdlEvtSelctionType")
	private WebElement eventSelection;

	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	@FindBy(xpath = "//*[@value='Export']")
	private WebElement export;

	@FindBy(id = "tpId")
	private WebElement templatesTabTeplateDD;

	@FindBy(id = "txtTpname")
	private WebElement templateNameTextBox;

	@FindBy(name = "cboExFormtTypeEnble")
	private WebElement databaseView;

	@FindBy(xpath = "//*[@value='Add Field']")
	private WebElement addFieldButton;

	@FindBy(id = "cbodFieldType")
	private WebElement fieldTypeDD;

	@FindBy(xpath = "//*[contains(@id,'txtFldDisplay')]")
	private WebElement displayNameTextField;

	@FindBy(id = "field")
	private WebElement fieldsDD;

	@FindBy(id = "txtStatFName")
	private WebElement fieldName;

	@FindBy(id = "txtStatFValue")
	private WebElement fieldValue;

	@FindBy(id = "txtDataLength")
	private WebElement dataLength;

	@FindBy(id = "txtFormulaFld")
	private WebElement customField;

	@FindBy(id = "btnDbSave")
	private WebElement dbSaveButton;
	
	@FindBy(xpath="//*[@class='table-responsive']/table[@class='table table-hover table-striped table-condensed table-bordered master-table addScrolling']/tbody/tr")
	private List<WebElement> addFieldTableList;

	public void exportData(String tempType, String temp, String frmDate, String tDate, String mnth, String yr,
			String frmt, String flName, String evntSelect, String userS) throws Exception {
		waitForElementVisible(templateType);
		element_DropDownSelectByvisibleText(templateType, tempType);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(template, temp);
		Thread.sleep(1000);
		if (frmDate != null) {
			String dateFormatcheck = fromDate.getAttribute("title");
			String insertFromDate = reportFromDateToDateChangeFormat(frmDate, dateFormatcheck);
			element_Clear(fromDate);
			element_InputTextUsingActionClass(fromDate, insertFromDate);
		}
		Thread.sleep(1000);
		if (tDate != null) {
			String dateFormatcheck1 = toDate.getAttribute("title");
			String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormatcheck1);
			element_Clear(toDate);
			element_InputTextUsingActionClass(toDate, insertToDate);
		}
		Thread.sleep(1000);
		if (mnth != null) {
			element_DropDownSelectByvisibleText(month, mnth);
		}
		Thread.sleep(1000);
		if (yr != null) {
			element_DropDownSelectByvisibleText(year, yr);
		}
		Thread.sleep(1000);
		if (frmt != null) {
			element_DropDownSelectByvisibleText(fileFormat, frmt);
		}
		element_Clear(fileName);
		element_InputTextUsingActionClass(fileName, flName);
		Thread.sleep(1000);
		if (evntSelect != null) {
			element_DropDownSelectByvisibleText(eventSelection, evntSelect);
		}
		element_DropDownSelectByvisibleText(selectUserDD, userS);
		generateExportReportInSelectionFormat();

	}

	public String createTemplate(String templateName, String templateDropD, DataTable dataTable)
			throws InterruptedException {
		int datatableCount=0;
		pageLoadWaitng();
		waitForElementVisible(templateType);
		element_Click(templatesTab);
		waitForElementVisible(templatesTabTeplateDD);
		Select dropDownGetValue = new Select(templatesTabTeplateDD);
		List<WebElement> getValue = dropDownGetValue.getOptions();
		for (int i = 0; i < getValue.size(); i++) {
			String ddValue = getValue.get(i).getText();
			if (ddValue.equalsIgnoreCase(templateName)) {
				Thread.sleep(1000);
				element_DropDownSelectByvisibleText(templatesTabTeplateDD, templateName);
				deleteButtonClick();
				driver.switchTo().alert().accept();
				Assert.assertEquals("Deleted Successfully", validationMessage());
				break;
			}
		}
		Thread.sleep(1000);
		addButtonClick();
		pageLoadWaitng();
		Thread.sleep(2000);
		element_Clear(templateNameTextBox);
		element_InputTextUsingActionClass(templateNameTextBox, templateName);
		element_DropDownSelectByvisibleText(databaseView, templateDropD);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("FieldType: "+data.get("FieldType")+" DisplayName: "+data.get("DisplayName"));
			// data value get from datatable gherkin
			String fieldTypeFromData = data.get("FieldType");
			String displayNameFromData = data.get("DisplayName");
			String fieldsFromData = data.get("Fields");
			String fieldNameFromData = data.get("FieldName");
			String fieldValueFromData = data.get("FieldValue");
			String dataLengthFromData = data.get("DataLength");
			String customFieldFromData = data.get("CustomField");
			// datatable value get done
			datatableCount=data.size();
			element_Click(addFieldButton);
			Thread.sleep(2000);
			element_DropDownSelectByvisibleText(fieldTypeDD, fieldTypeFromData);
			element_Clear(displayNameTextField);
			element_InputTextUsingActionClass(displayNameTextField, displayNameFromData);
			switch (fieldTypeFromData) {
			case "Database Field":
				element_DropDownSelectByvisibleText(fieldsDD, fieldsFromData);
				element_Click(dbSaveButton);
				break;

			case "Static Field":
				element_Clear(fieldName);
				element_InputTextUsingActionClass(fieldName, fieldNameFromData);
				element_Clear(fieldValue);
				element_InputTextUsingActionClass(fieldValue, fieldValueFromData);
				element_Clear(dataLength);
				element_InputTextUsingActionClass(dataLength, dataLengthFromData);
				element_Click(dbSaveButton);
				break;

			case "Custom Field":
				element_Clear(customField);
				element_InputTextUsingActionClass(customField, customFieldFromData);
				element_Clear(dataLength);
				element_InputTextUsingActionClass(dataLength, dataLengthFromData);
				element_Click(dbSaveButton);
				break;

			default:
				logger.debug("Field Type Selection option Not Valid");
				break;
			}
		}
		logger.debug("Datatable row size"+datatableCount);
		int fieldsAddedAfterCount=addFieldTableList.size();
		logger.debug("Total row count"+fieldsAddedAfterCount);
		Assert.assertEquals(fieldsAddedAfterCount, fieldsAddedAfterCount);
		saveButtonClick();
		String validation=validationMessage();
		return validation;
	}

}
