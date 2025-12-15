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

public class VisitorTemplatePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitorTemplatePO.class);
	public VisitorTemplatePO(WebDriver driver) {
		super(driver);
		
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	// ************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[3]")
	private List<WebElement> visitorTemplates;

	@FindBy(id = "VisitorTemplateName")
	private WebElement visitorTemplateNameTxt;
	
	@FindBy(xpath = "//*[@id='div_grd_GridVisitorFields1']//tbody/tr[not(@hidden)]/td[3]")
	private List<WebElement> basicPanel;

	// ************************************************************************
	// ***************FUNCTIONS********************************************
	// ************************************************************************
	public void createVisitorTemplate(String templateName, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Click(searchTextBoxTitleBar);
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, templateName);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitorTemplates.size() > 0) {
				for (int j = 0; j < visitorTemplates.size(); j++) {
					String tName = visitorTemplates.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(templateName)) {
						visitorTemplates.get(j).click();
						Thread.sleep(1000);
					}
				}
			}
			if (!allvisit.contains(templateName)) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(750);
				element_InputTextUsingActionClass(visitorTemplateNameTxt, templateName);
			}
		}
		for (Map<String, String> map : data) {
			logger.info("Field Name = "+map.get("FieldName"));
			String fieldName = map.get("FieldName");
			String mandatory = map.get("Mandatory");
			String active = map.get("Active");
			for (int i = 0; i < basicPanel.size(); i++) {
				if (basicPanel.get(i).getText().equalsIgnoreCase(fieldName)) {
					logger.debug("Field name found "+fieldName);
					element_Click(basicPanel.get(i));
					Thread.sleep(1000);
					WebElement mandatoryEle = basicPanel.get(i).findElement(By.xpath("following-sibling::td[2]/input"));
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
					WebElement activeele = basicPanel.get(i).findElement(By.xpath("following-sibling::td[3]/input"));
					Boolean active1 = Boolean.parseBoolean(active);
					if (active1 == true) {
						if (!activeele.isSelected()) {
							element_Click(activeele);
						}
					} else {
						if (activeele.isSelected()) {
							element_Click(activeele);
						}
					}
					element_Click(basicPanel.get(i).findElement(By.xpath("following-sibling::td[6]/a/i")));
					Thread.sleep(1000);
				}
			}
		}
		Thread.sleep(1000);
		
		saveButtonClick();
		Assert.assertEquals(validationMessage2(), "Saved Successfully");
	}
	
	public void deleteVisitorTemplate(Map<String, String> data) throws InterruptedException {
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (visitorTemplates.size() > 0) {
				for (int j = 0; j < visitorTemplates.size(); j++) {
					String visitorTemplates1 = visitorTemplates.get(j).getText();
					if (visitorTemplates1.equalsIgnoreCase(data.get("Name"))) {
						logger.debug("Visitor Template found, Name = "+data.get("Name"));
						visitorTemplates.get(j).click();
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
				logger.debug("Visitor Template not found, Name = "+data.get("Name"));
			}
		}
	}
}
