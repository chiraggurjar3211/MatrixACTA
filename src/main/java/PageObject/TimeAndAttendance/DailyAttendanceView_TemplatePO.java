package PageObject.TimeAndAttendance;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;


public class DailyAttendanceView_TemplatePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DailyAttendanceView_TemplatePO.class);
	public DailyAttendanceView_TemplatePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "TemplateListName")
	private WebElement templateName;
	
	@FindBy(id = "chkDefault")
	private WebElement defaultTemplate;

	@FindBy(xpath = "//*[@default=\"Field Configuration\"]")
	private WebElement fieldconfiguration;

	@FindBy(id = "cboFieldType")
	private WebElement fieldType;

	@FindBy(id = "cboFieldValue")
	private WebElement fieldValue;

	@FindBy(id = "txtDisplayName")
	private WebElement displayName;

	@FindBy(id = "btnAdd")
	private WebElement addbtn;

	@FindBy(id = "btnSave")
	private WebElement saveBtn;

	@FindBy(xpath = "//*[@accesskey='n']")
	private WebElement newbtn;

	@FindBy(id = "cmnBtnTxtSearch")
	private WebElement search;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody//*[not(@hidden)][2]/label[not(@hidden)]")
	private List<WebElement> listoftemplate;

//	@FindBy(xpath = "//*[@title=\"Delete (Alt+L)\"]")
//	private WebElement delete;

	@FindBy(id = "txtCustomField")
	private WebElement customFieldValue;

	@FindBy(xpath = "//*[@id=\"div_grd_gridfieldsConfig\"]//tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> fields;

	@FindBy(xpath = "//*[@default=\"Share View With\"]")
	private WebElement shareviewwith;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(id = "ID")
	private WebElement userId;

	@FindBy(xpath = "(//*[@id=\"grpddl\"])[2]")
	private WebElement selectGroup;

	@FindBy(id = "grpname")
	private WebElement organizationName;

	@FindBy(id="btnUcopy")
	private WebElement copyButton;
	
	public void createTemplate(String name, DataTable dataTable) throws Exception {
		pageLoadWaitng();
		element_Clear(search);
		element_InputTextUsingActionClass(search, name);
		search.sendKeys(Keys.ENTER);
		Thread.sleep(1000);

		if (listoftemplate.size() > 0) {
			for (int i = 0; i < listoftemplate.size(); i++) {
				if (listoftemplate.get(i).getText().toUpperCase().equalsIgnoreCase(name.toUpperCase())) {
					element_Click(listoftemplate.get(i));
					Thread.sleep(1000);
					element_Click(deleteButton);
					Thread.sleep(1000);
					driver.switchTo().alert().accept();
					Thread.sleep(1000);
					break;
				}
			}
		}
		addButtonClick();
		Thread.sleep(1000);
		element_Clear(templateName);
		element_InputTextUsingActionClass(templateName, name);
		Thread.sleep(1000);
		element_Click(fieldconfiguration);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Field Type: "+data.get("Field Type")+" Field Value: "+data.get("Field Value"));
			String fieldtype = data.get("Field Type");
			String fieldvalue = data.get("Field Value");
			String displayname = data.get("Display Name");
			Thread.sleep(1000);
			if (fieldtype.equalsIgnoreCase("Database")) {
				element_DropDownSelectByvisibleText(fieldType, fieldtype);
				Thread.sleep(1000);
				element_DropDownSelectByvisibleText(fieldValue, fieldvalue);
				Thread.sleep(1000);
				element_Clear(displayName);
				element_InputTextUsingActionClass(displayName, displayname);
				Thread.sleep(1000);
				element_Click(addbtn);
				Thread.sleep(1000);
			} else {
				element_DropDownSelectByvisibleText(fieldType, fieldtype);
				Thread.sleep(1000);
				element_Clear(customFieldValue);
				element_InputTextUsingActionClass(customFieldValue, fieldvalue);
				Thread.sleep(1000);
				element_Clear(displayName);
				element_InputTextUsingActionClass(displayName, displayname);
				Thread.sleep(1000);
				element_Click(addbtn);
				Thread.sleep(1000);
			}

		}
		element_Click(saveBtn);
		Thread.sleep(1000);
		Assert.assertEquals(validationMessage(), "Saved Successfully");

	}

	public void fieldConfigurationOfTemplate(String name, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(search);
		element_InputTextUsingActionClass(search, name);
		search.sendKeys(Keys.ENTER);
		for (int i = 0; i < listoftemplate.size(); i++) {
			if (listoftemplate.get(i).getText().equalsIgnoreCase(name)) {
				element_Click(listoftemplate.get(i));
			}
		}
		Thread.sleep(1000);
		element_Click(fieldconfiguration);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Field: "+data.get("Field")+" View/Export: "+data.get("View/Export"));
			String field = data.get("Field");
			String viewexport = data.get("View/Export");
			String displaysummary = data.get("Display Summary");
			for (int i = 0; i < fields.size(); i++) {
				Thread.sleep(700);
				if (fields.get(i).getText().toUpperCase().equalsIgnoreCase(field.toUpperCase())) {
					if (fields.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][2]//input"))
							.isEnabled() == true) {
						if (viewexport != null) {
							if (viewexport.equalsIgnoreCase("true")) {
								if (fields.get(i).findElement(By.xpath(
										"following-sibling::td[not(@hidden)][2]//input"))
										.isSelected() != true) {
									fields.get(i).findElement(By.xpath(
											"following-sibling::td[not(@hidden)][2]//input"))
											.click();
								}
							} else {
								if (fields.get(i).findElement(By.xpath(
										"following-sibling::td[not(@hidden)][2]//input"))
										.isSelected() == true) {
									fields.get(i).findElement(By.xpath(
											"following-sibling::td[not(@hidden)][2]//input"))
											.click();
								}
							}

						}
					}
					if (fields.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][3]//input"))
							.isEnabled() == true) {

						if (displaysummary != null) {
							if (displaysummary.equalsIgnoreCase("true")) {
								if (fields.get(i).findElement(By.xpath(
										"following-sibling::td[not(@hidden)][3]//input"))
										.isSelected() != true) {
									fields.get(i).findElement(By.xpath(
											"following-sibling::td[not(@hidden)][3]//input"))
											.click();
								}
							} else {
								if (fields.get(i).findElement(By.xpath(
										"following-sibling::td[not(@hidden)][3]//input"))
										.isSelected() == true) {
									fields.get(i).findElement(By.xpath(
											"following-sibling::td[not(@hidden)][3]//input"))
											.click();
								}
							}

						}
					}

				}
			}
		}
		Thread.sleep(1000);
		element_Click(saveBtn);
		Thread.sleep(1000);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}

	public void selectUsers(String name, String selectuser, String selectgroup, String userorgroup) throws Exception {
		pageLoadWaitng();
		element_Clear(search);
		element_InputTextUsingActionClass(search, name);
		search.sendKeys(Keys.ENTER);
		for (int i = 0; i < listoftemplate.size(); i++) {
			if (listoftemplate.get(i).getText().equalsIgnoreCase(name)) {
				element_Click(listoftemplate.get(i));
			}
		}
		Thread.sleep(1000);
		element_Click(shareviewwith);
		if (selectuser.equalsIgnoreCase("All")) {
			Thread.sleep(500);
			element_DropDownSelectByvisibleText(selectUsers, selectuser);
		} else if (selectuser.equalsIgnoreCase("User Wise")) {
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(selectUsers, selectuser);
			String arr[] = userorgroup.split(",");
			Thread.sleep(1000);
			for (int i = 0; i < arr.length; i++) {
				Thread.sleep(1000);
				element_Clear(userId);
				element_InputTextUsingActionClass(userId, arr[i]);
				userId.sendKeys(Keys.TAB);
				Thread.sleep(1000);
			}
		} else if (selectuser.equalsIgnoreCase("Group Wise")) {
			Thread.sleep(1000);
			element_DropDownSelectByvisibleText(selectUsers, selectuser);
			element_DropDownSelectByvisibleText(selectGroup, selectgroup);
			String arr[] = userorgroup.split(",");
			Thread.sleep(1000);
			for (int i = 0; i < arr.length; i++) {
				Thread.sleep(1000);
				element_Clear(organizationName);
				element_InputTextUsingActionClass(organizationName, arr[i]);
				organizationName.sendKeys(Keys.TAB);
				Thread.sleep(1000);
			}
		}
		element_Click(saveBtn);
		Thread.sleep(1000);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	public void validateTemplate(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String defaultS = data.get("default");
			String validate = data.get("Validate");
			Thread.sleep(1000);
			element_Clear(search);
			element_InputTextUsingActionClass(search, name);
			search.sendKeys(Keys.ENTER);
			Thread.sleep(1000);
			List<String> listName = new ArrayList<>();
			for (int i = 0; i < listoftemplate.size(); i++) {
				listName.add(listoftemplate.get(i).getText().toUpperCase());
			}
			if (listName.contains(name.toUpperCase())) {
				Assert.assertEquals(validate, "Displayed");
				for (int i = 0; i < listoftemplate.size(); i++) {
					if (listoftemplate.get(i).getText().equalsIgnoreCase(name) == true) {
						element_Click(listoftemplate.get(i));
						Thread.sleep(1000);
						if (defaultS != null) {
							if (defaultS.equalsIgnoreCase("true")) {
								if (defaultTemplate.isSelected() != true) {
									element_Click(defaultTemplate);
								}
							} else {
								if (defaultTemplate.isSelected() == true) {
									element_Click(defaultTemplate);
								}
							}
						}
						Thread.sleep(1000);
						element_Click(saveBtn);
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Saved Successfully");
					}
					break;
				}
			} else {
				Assert.assertEquals(validate, "Not Displayed");
			}

		}
	}
	
	public void copyTemplate(String fromTemp,String toTemp) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(search);
		element_InputTextUsingActionClass(search, toTemp);
		search.sendKeys(Keys.ENTER);
		Thread.sleep(1000);

		if (listoftemplate.size() > 0) {
			for (int i = 0; i < listoftemplate.size(); i++) {
				if (listoftemplate.get(i).getText().toUpperCase().equalsIgnoreCase(toTemp.toUpperCase())) {
					element_Click(listoftemplate.get(i));
					Thread.sleep(1000);
					element_Click(deleteButton);
					Thread.sleep(1000);
					driver.switchTo().alert().accept();
					Thread.sleep(1000);
					break;
				}
			}
		}
		element_Clear(search);
		element_InputTextUsingActionClass(search, fromTemp);
		search.sendKeys(Keys.ENTER);
		Thread.sleep(1000);
		for (int i = 0; i < listoftemplate.size(); i++) {
			if (listoftemplate.get(i).getText().equalsIgnoreCase(fromTemp)) {
				element_Click(listoftemplate.get(i));
				Thread.sleep(1000);
				break;
			}
		}
		element_Click(copyButton);
		Thread.sleep(2000);
		element_Clear(templateName);
		element_InputTextUsingActionClass(templateName, toTemp);
		Thread.sleep(1000);
		element_Click(saveBtn);
		Thread.sleep(1000);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
		
	}

}
