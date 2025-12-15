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

public class SkillPO extends AbstractMethod{
	WebDriver driver;
	public SkillPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************************************************
	//**************** Elements *******************************************************************
	//*********************************************************************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> skillNames;
	
	@FindBy(id = "SkillName")
	private WebElement skillNameTxt;
	
	@FindBy(id = "ChkDflt")
	private WebElement defaultFlag;
	
	
	//**********************************************************************************************
	// **************** Functions*******************************************************************
	// *********************************************************************************************
	public void createSkill(Map<String , String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (skillNames.size() > 0) {
				for (int j = 0; j < skillNames.size(); j++) {
					String id1 = skillNames.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(data.get("Name"))) {
						skillNames.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			
		}
		Thread.sleep(1000);
		// Main Code
		if (data.get("Name") != null) {
			element_Clear(skillNameTxt);
			element_InputTextUsingActionClass(skillNameTxt, data.get("Name"));
		}
		if (data.get("Default") != null) {
			boolean default1 = Boolean.parseBoolean(data.get("Default"));
			if (default1==true) {
				if (!defaultFlag.isSelected()) {
					element_Click(defaultFlag);
				}
			}
			else {
				if (defaultFlag.isSelected()) {
					element_Click(defaultFlag);
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
}
