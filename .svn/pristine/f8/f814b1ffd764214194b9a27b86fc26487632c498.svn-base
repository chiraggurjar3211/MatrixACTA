package PageObject.AccessControlModule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;


public class FirstInUserPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(FirstInUserPO.class);
	
	public FirstInUserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "FiGroupName")
	private WebElement nameTxt;
	
	@FindBy(id = "FIGrpAllUsersID")
	private WebElement useridTxt;
	
	@FindBy(xpath = "//*[@gridname='gvFiGroup']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allGrpNames;
	
	@FindBy(xpath = "//*[@name='cosecForm']//*[@class='btn pt-1']")
	private WebElement itemSelectionPicklist;
	
	@FindBy(xpath = "//*[@name='isMultiClick']")
	private WebElement itemSelectionColumnSelectAll;
	
	@FindBy(xpath = "//*[@key='OK']")
	private WebElement itemSelectionOkBtn;
	
	@FindBy(xpath = "//*[@class='pagination-next']")
	private WebElement itemSelectionPageNextBtn;
	
	@FindBy(xpath = "(//*[@name=\"clickCheckbox\"])[10]")
	private WebElement itemSelectionColumnLastUserFlag;
	

	// Code
	// Max 99
	public void createMaxGroups(Map<String, String> data, String formattedI) throws InterruptedException {
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(nameTxt);
			element_InputTextUsingActionClass(nameTxt, "FInUsersGroup"+formattedI);
			Thread.sleep(500);
			element_InputTextUsingActionClass(useridTxt, "FInUser"+formattedI);
			Thread.sleep(300);
			element_Click(driver.findElement(By.xpath("//html")));
			Thread.sleep(500);
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	public void assignMaxUsers(String grpName) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, grpName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allGrp = new ArrayList<>();
			if (allGrpNames.size() > 0) {
				for (int j = 0; j < allGrpNames.size(); j++) {
					String grpNames = allGrpNames.get(j).getText();
					allGrp.add(grpNames);
					if (grpNames.equalsIgnoreCase(grpName)) {
						allGrpNames.get(j).click();
						Thread.sleep(1000);
						element_Click(itemSelectionPicklist);
						Thread.sleep(1000);
						for (int i = 1; i < 101; i++) {
							Thread.sleep(300);
							element_Click(itemSelectionColumnSelectAll);
							System.out.println(i);
							if (i!=100) {
								element_Click(itemSelectionPageNextBtn);
							} else if (i==100) {
								Thread.sleep(1000);
								element_Click(itemSelectionColumnLastUserFlag);
							}
						}
						Thread.sleep(500);
						element_Click(itemSelectionOkBtn);
						pageLoadWaitng();
						saveButtonClick();
						Assert.assertEquals(validationMessage(), "Saved Successfully");	
						break;
					}
				}
			}
			// logger.debug(ar);
			if (!allGrp.contains(grpName)) {
				Assert.assertEquals("Group not found", "Group should be created");
			}
		}
		
		
		
		
		
	}
	
	

}
