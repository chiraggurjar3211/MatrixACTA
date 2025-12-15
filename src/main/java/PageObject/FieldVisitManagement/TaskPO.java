package PageObject.FieldVisitManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class TaskPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TaskPO.class);
	
	public TaskPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> taskNames;
	
	@FindBy(id = "FVMTaskName")
	private WebElement taskNametxt;
	
	@FindBy(id = "txtDesc")
	private WebElement descriptiontxt;
	
	//Mayank
	//*************************************************************************************************
	//**************************** Create Task *******************************************************
	//***********************************************************************************************
	public String createTask(String taskName, String description) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, taskName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allTaskCode = new ArrayList<>();
			if (taskNames.size() > 0) {
				for (int j = 0; j < taskNames.size(); j++) {
					String tName = taskNames.get(j).getText().toUpperCase();
					allTaskCode.add(tName);
					if (tName.equalsIgnoreCase(taskName.toUpperCase())) {
						taskNames.get(j).click();
					}
				}
			}
			//logger.debug(ar);
			if (!allTaskCode.contains(taskName.toUpperCase())) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(taskNametxt);
				element_InputTextUsingActionClass(taskNametxt, taskName);
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(taskNametxt);
			element_InputTextUsingActionClass(taskNametxt, taskName);
		}
		//Main Code
		if (description != null) {
			element_Clear(descriptiontxt);
			element_InputTextUsingActionClass(descriptiontxt, description);
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage();
		return val;
	}
	
	//chhaya
	public void deleteTask(String taskName) throws InterruptedException
	{
		String valmsg = null;
		pageLoadWaitng();
		element_Clear(taskNametxt);
		element_InputTextUsingActionClass(taskNametxt, taskName);
		element_TextBoxToClickOnTab(taskNametxt); 
		Thread.sleep(3000);
		if (!element_getInputControlValue(taskNametxt).isBlank() || !element_getInputControlValue(taskNametxt).isEmpty()) {
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
			valmsg = validationMessage();
			Assert.assertEquals(valmsg, "Deleted Successfully");
		} else {
			logger.debug("Task not Exist");
			Thread.sleep(1000);
		}
	}
	
}
