package PageObject.VisitorManagement;

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

public class VisitTemplatePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitTemplatePO.class);
	public VisitTemplatePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> visitTemplates;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row2' and @class='cursor']")
	private WebElement visitorTypeRow;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row2' and @class='cursor']/td[3]")
	private WebElement visitorTypeRowName;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row2' and @class='cursor']/td[4]")
	private WebElement visitorTypeRowDD;
	
	@FindBy(xpath="//*[@id='GridVisitFields2row2' and @class='cursor']/td[5]")
	private WebElement visitorTypeRowDDclick;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row2' and @class='cursor']/td[5]//*[@class='dropdown-menu multiSelect MSform-hr']/li/a[not(contains(text(),'Uncheck All'))]/span/ancestor::a[1]")
	private List<WebElement> visitorTypeRowDDOptions;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row1' and @class='cursor']")
	private WebElement visitTypeRow;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row1' and @class='cursor']/td[3]")
	private WebElement visitTypeRowName;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row1' and @class='cursor']/td[4]")
	private WebElement visitTypeRowDD;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row1' and @class='cursor']/td[5]")
	private WebElement visitTypeRowDDOptionsOpen;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row1' and @class='cursor']/td[5]//*[@class='dropdown-menu multiSelect MSform-hr']/li/a[not(contains(text(),'Uncheck All'))]/span/ancestor::a[1]")
	private List<WebElement> visitTypeRowDDOptions;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row3' and @class='cursor']")
	private WebElement vehicleTypeRow;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row3' and @class='cursor']/td[3]")
	private WebElement vehicleTypeRowName;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row3' and @class='cursor']/td[4]")
	private WebElement vehicleTypeRowDD;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row3' and @class='cursor']/td[5]")
	private WebElement vehicleTypeRowDDOptionsOpen;
	
	@FindBy(xpath = "//*[@id='GridVisitFields2row3' and @class='cursor']/td[5]//*[@class='dropdown-menu multiSelect MSform-hr']/li/a[not(contains(text(),'Uncheck All'))]/span/ancestor::a[1]")
	private List<WebElement> vehicleTypeRowDDOptions;
	
	// Fields
	@FindBy(id = "VisitTemplateName")
	private WebElement visitTemplateNameTxt;
	
	@FindBy(xpath = "//*[@id='div_grd_GridVisitFields1']//tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> visitPanel;
	
	//************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void verifyVisitComponentsMainMethod(String component, Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, "Default");
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitTemplates.size() > 0) {
				for (int j = 0; j < visitTemplates.size(); j++) {
					String tName = visitTemplates.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase("Default")) {
						visitTemplates.get(j).click();
						Thread.sleep(1000);
						switch (component) {
						case "Visitor Type":
							verifyVisitComponentsVisitorType(data);
							break;
							
						case "Visit Type":
							verifyVisitComponentsVisitType(data);
							break;
							
						case "Vehicle Type":
							verifyVisitComponentsVehicleType(data);
							break;

						default:
							logger.debug("Defined components is not valid");
							break;
						}
						

					}
				}
			}
			if (!allvisit.contains("Default")) {
				val = "Default visit template not found";
			}
		}
	}
	
	public void verifyVisitComponentsVisitorType(Map<String, String> data) throws InterruptedException {
		String val = null;
		if (visitorTypeRowName.getText().equalsIgnoreCase("Visitor Type")) {
			element_Click(visitorTypeRow);
			Thread.sleep(500);
			element_Click(visitorTypeRowDD);
			Thread.sleep(500);
			element_Click(visitorTypeRowDDclick);
			Thread.sleep(500);
			
			for (WebElement ele : visitorTypeRowDDOptions) {
				String option = ele.getText();
				System.out.println(option);
				if (option.equalsIgnoreCase(data.get("Name"))) {
					val = "Visitor Type Found";
					break;
				}
				else {
					val = "Visitor Type not found";
				}
			}
			Assert.assertEquals(val, "Visitor Type Found");
		}
	}
	
	public void verifyVisitComponentsVisitType(Map<String, String> data) throws InterruptedException {
		String val = null;
		if (visitTypeRowName.getText().equalsIgnoreCase("Visit Type")) {
			element_Click(visitTypeRow);
			Thread.sleep(500);
			element_Click(visitTypeRowDD);
			Thread.sleep(500);
			element_Click(visitTypeRowDDOptionsOpen);
			Thread.sleep(500);
			for (WebElement ele : visitTypeRowDDOptions) {
				String option = ele.getText();
				if (option.equalsIgnoreCase(data.get("Name"))) {
					val = "Visit Type Found";
					break;
				}
				else {
					val = "Visit Type not found";
				}
			}
			Assert.assertEquals(val, "Visit Type Found");
		}
	}
	
	public void verifyVisitComponentsVehicleType(Map<String, String> data) throws InterruptedException {
		String val = null;
		if (vehicleTypeRowName.getText().equalsIgnoreCase("Vehicle Type")) {
			element_Click(vehicleTypeRow);
			Thread.sleep(500);
			element_Click(vehicleTypeRowDD);
			Thread.sleep(500);
			element_Click(vehicleTypeRowDDOptionsOpen);
			Thread.sleep(500);
			for (WebElement ele : vehicleTypeRowDDOptions) {
				String option = ele.getText();
				if (option.equalsIgnoreCase(data.get("Name"))) {
					val = "Vehicle Type Found";
					break;
				}
				else {
					val = "Vehicle Type not found";
				}
			}
			Assert.assertEquals(val, "Vehicle Type Found");
		}
	}
	
	// Create Visit Template
	
	public void createVisitTemplate(String templateName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, templateName);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (visitTemplates.size() > 0) {
				for (int j = 0; j < visitTemplates.size(); j++) {
					String tName = visitTemplates.get(j).getText();
					if (tName.equalsIgnoreCase(templateName)) {
						visitTemplates.get(j).click();
						Thread.sleep(1000);
						break;
					}
				}
			}
		}
		if (addButton.isEnabled()) {
			Thread.sleep(1000);
			addButtonClick();
			element_InputTextUsingActionClass(visitTemplateNameTxt, templateName);
		}
		for (Map<String, String> map : data) {
			logger.info("Field Name = "+map.get("FieldName"));
			String fieldName = map.get("FieldName");
			String mandatory = map.get("Mandatory");
			String active = map.get("Active");
			for (int i = 0; i < visitPanel.size(); i++) {
				System.out.println(visitPanel.get(i).getText());
				if (visitPanel.get(i).getText().equalsIgnoreCase(fieldName)) {
					logger.debug("Field name found "+fieldName);
					element_Click(visitPanel.get(i));
					Thread.sleep(2000);
					WebElement mandatoryEle = visitPanel.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][2]/input[@id='IsMandatory']"));
					boolean mandatory1 = Boolean.parseBoolean(mandatory);
					if (mandatory1 == true) {
						if (!mandatoryEle.isSelected()) {
							element_Click(mandatoryEle);
						}
					} else {
						if (mandatoryEle.isSelected()) {
							element_Click(mandatoryEle);
						}
					}
					WebElement activeele = visitPanel.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][3]/input[@id='IsActive']"));
					Boolean active1 = Boolean.parseBoolean(active);
					Thread.sleep(1500);
					if (active1 == true) {
						if (!activeele.isSelected()) {
							element_Click(activeele);
						}
					} else {
						if (activeele.isSelected()) {
							element_Click(activeele);
						}
					}
					Thread.sleep(1500);
					element_Click(visitPanel.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][4]/*[@id='savebtn'][not(@hidden)]")));
					Thread.sleep(1500);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage2(), "Saved Successfully");

	}
	
	public void deleteVisitTemplate(Map<String, String> data) throws InterruptedException {
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (visitTemplates.size() > 0) {
				for (int j = 0; j < visitTemplates.size(); j++) {
					String visitTemplates1 = visitTemplates.get(j).getText();
					ar.add(visitTemplates1);
					if (visitTemplates1.equalsIgnoreCase(data.get("Name"))) {
						logger.debug("Visit Template found, Name = "+data.get("Name"));
						visitTemplates.get(j).click();
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage2(), "Deleted Successfully");
					}
				}
			}
			//System.out.println(ar);
			if (!ar.contains(data.get("Name"))) {
				logger.debug("Visit Template not found, Name = "+data.get("Name"));
			}
		}
	}
}
