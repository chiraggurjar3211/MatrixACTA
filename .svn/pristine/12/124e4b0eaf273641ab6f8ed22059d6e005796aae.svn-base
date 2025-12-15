package PageObject.VisitorManagement;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class PreRegistrationTemplatePO extends AbstractMethod{
	WebDriver driver;
	public PreRegistrationTemplatePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(xpath = "//*[@name='cosecForm ']//input[@class='chkMandatory1']")
	private List<WebElement> mandatoryCheckboxes;
	
	@FindBy(xpath = "//*[@name='cosecForm ']//input[@class='chkActive1']")
	private List<WebElement> activeCheckboxes;
	
	@FindBy(id = "btnYes")
	private WebElement confirmPopupOkBtn;
	
	// Functions
	public void updateDefaultPreRegistrationTemplate() throws InterruptedException {
		pageLoadWaitng();
		// Mandatory Checkboxes disable
		for (WebElement manEle : mandatoryCheckboxes) {
			if (element_isEnabled(manEle)) {
				if (element_isSelected(manEle)) {
					element_ClickUsingJS(manEle);
				}
			}
		}
		// Active Checkboxes enable
		for (WebElement actEle : activeCheckboxes) {
			if (element_isEnabled(actEle)) {
				if (!element_isSelected(actEle)) {
					element_ClickUsingJS(actEle);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(1000);
		element_Click(confirmPopupOkBtn);
		Assert.assertEquals(validationMessage2(), "Saved Successfully");
	}

}
