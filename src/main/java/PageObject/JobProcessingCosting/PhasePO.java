package PageObject.JobProcessingCosting;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class PhasePO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PhasePO.class);
	
	public PhasePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> phaseNames;
	
	@FindBy(id = "JPCPhaseName")
	private WebElement nametext;
	
	@FindBy(id = "txtDesc")
	private WebElement descriptiontext;
	
	//By Mayank
	//Functions
	public String createPhase(String name, String description) throws InterruptedException {
		String val;
		waitForElementVisible(nametext);
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allPhaseName = new ArrayList<>();
			if (phaseNames.size() > 0) {
				for (int j = 0; j < phaseNames.size(); j++) {
					String phaseName = phaseNames.get(j).getText();
					allPhaseName.add(phaseName);
					if (phaseName.equalsIgnoreCase(name)) {
						phaseNames.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!allPhaseName.contains(name)) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(nametext);
				element_InputTextUsingActionClass(nametext, name);
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nametext);
			element_InputTextUsingActionClass(nametext, name);
		}
		//Main Code
		Thread.sleep(1000);
		if (description != null) {
			element_Clear(descriptiontext);
			element_InputTextUsingActionClass(descriptiontext, description);
		}
		Thread.sleep(1000);
		saveButtonClick();
		val = validationMessage();
		return val;
	}
		
	// Delete Phase
	// Mayank
	public void deletePhase(String name) throws InterruptedException {
		waitForElementVisible(nametext);
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			element_TextBoxToClickOnTab(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allPhaseName = new ArrayList<>();
			if (phaseNames.size() > 0) {
				for (int j = 0; j < phaseNames.size(); j++) {
					String phaseName = phaseNames.get(j).getText();
					allPhaseName.add(phaseName);
					if (phaseName.equalsIgnoreCase(name)) {
						phaseNames.get(j).click();
						Thread.sleep(2000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			//logger.debug(ar);
			if (!allPhaseName.contains(name)) {
				logger.debug("Phase is not exist.");
			}
		}
		else {
			logger.debug("Phase is not exist.");
		}
	}
}
