package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class InductionLevelsPO extends AbstractMethod{
	WebDriver driver;
	public InductionLevelsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************************************************
	//**************** Elements *************************
	//**************************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> inductionLevelsNames;
	
	@FindBy(id = "txtDesc")
	private WebElement descriptiontext;
	
	@FindBy(id = "InductionLevelsName")
	private WebElement nameTxt;
	
	
	
	//***************************************************
	//**************** Create function *************************
	//**************************************************
	public String createInductionLevels(String name, String description) throws InterruptedException {
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allinductionLevelsName = new ArrayList<>();
			if (inductionLevelsNames.size() > 0) {
				for (int j = 0; j < inductionLevelsNames.size(); j++) {
					String inductionLevelsName = inductionLevelsNames.get(j).getText();
					allinductionLevelsName.add(inductionLevelsName);
					if (inductionLevelsName.equalsIgnoreCase(name)) {
						inductionLevelsNames.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!allinductionLevelsName.contains(name)) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(nameTxt);
				element_InputTextUsingActionClass(nameTxt, name);
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, name);
		}
		//Main Code
		Thread.sleep(1000);
		if (description != null) {
			element_Clear(descriptiontext);
			element_InputTextUsingActionClass(descriptiontext, description);
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}
}
