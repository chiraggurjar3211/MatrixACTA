package PageObject.AdminModule;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class RenameGroupPO extends AbstractMethod
{
	WebDriver driver;
	public RenameGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//input[@name='cmnTxtSearch']")
	private WebElement searchTextBoxTitleBar;
	
//	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[2]")
//	private List<WebElement> defaultGroupNames;
	
	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[3]")
	private List<WebElement> renamedAsGroupNames;
	
	@FindBy(xpath = "//*[@class='table-responsive']//table/tbody/tr/td[2]")
	private List<WebElement> groupNamesPagination;
	
	@FindBy(xpath = "//input[@name='txtGrpAlias']")
	private WebElement renameAsTxt;
	
	public String renameGroup(String groupName, String renameAs) throws InterruptedException
	{
		pageLoadWaitng();
		String valMsg=null;
		if (element_isEnabled(searchTextBoxTitleBar) == true) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, groupName);
			Thread.sleep(2000);
			searchTextBoxTitleBar.sendKeys(Keys.ENTER);
			Thread.sleep(2000);
			
			List<String> list = new ArrayList<String>();
			for (int i = 0; i < renamedAsGroupNames.size(); i++) {
				list.add(renamedAsGroupNames.get(i).getText());
				if (renamedAsGroupNames.get(i).getText().equalsIgnoreCase(groupName)) {
					renamedAsGroupNames.get(i).click();
					Thread.sleep(2000);
				}
			}
			
			element_Clear(renameAsTxt);
			element_InputTextUsingActionClass(renameAsTxt, renameAs);
			Thread.sleep(2000);	
			
			saveButtonClick();
			valMsg = validationMessage();
		}

		return valMsg;
	}
	
}
