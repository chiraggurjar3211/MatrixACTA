package PageObject.CafeteriaManagement;

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
import io.cucumber.datatable.DataTable;


public class PosDevicesConfigurationPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PosDevicesConfigurationPO.class);
	
	public PosDevicesConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "autoCntnDoorName")
	private WebElement deviceNameTxt;
	
	@FindBy(id = "autoMenuName")
	private WebElement menuNameTxt;
	
	@FindBy(xpath = "//*[@class='collapsed']//*[@key='Assign Menus']")
	private List<WebElement> assignMenuPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Assign Menus']")
	private WebElement assignMenuPanel;
	
	@FindBy(xpath = "//*[@class='collapsed']//*[@key='Schedule Menus']")
	private List<WebElement> scheduleMenusPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@key='Schedule Menus']")
	private WebElement scheduleMenusPanel;
	
	@FindBy(xpath = "//*[@title='Add']")
	private WebElement gridAddbutton;
	
	@FindBy(id = "autoSelectedMenuName")
	private WebElement gridMenuName;
	
	@FindBy(id = "ST")
	private WebElement gridStartTime;
	
	@FindBy(id = "ET")
	private WebElement gridEndTime;
	
	@FindBy(id = "Days")
	private WebElement gridScheduleDays;
	
	@FindBy(xpath = "//*[@aria-labelledby='dropdownMenu']/li[not(@class=\"divider\")]")
	private List<WebElement> appDaysSelection;
	
	@FindBy(id = "savebtn")
	private WebElement gridSaveBtn;
	
	
	
	public void posDevicesConfiguration(String deviceName, String menuNames, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(deviceNameTxt);
		element_InputTextUsingActionClass(deviceNameTxt, deviceName);
		element_Click(driver.findElement(By.xpath("//html")));
		Thread.sleep(1000);
		// Assign Menu panel
		if (assignMenuPanelOpenOrNot.size()>0) {
			element_Click(assignMenuPanel);
			Thread.sleep(500);
		}
		String[] commaSeparatedValues = menuNames.split(",");
		for (int i = 0; i < commaSeparatedValues.length; i++) {
			String menuName = commaSeparatedValues[i].trim();
			element_Clear(menuNameTxt);
			element_InputTextUsingActionClass(menuNameTxt, menuName);
			Thread.sleep(500);
			element_Click(driver.findElement(By.xpath("//html")));
			Thread.sleep(1000);
		}
		if (assignMenuPanelOpenOrNot.size()==0) {
			element_Click(assignMenuPanel);
			Thread.sleep(500);
		}
		//Schedule Menus
		if (scheduleMenusPanelOpenOrNot.size()>0) {
			element_Click(scheduleMenusPanel);
			Thread.sleep(500);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			element_Click(gridAddbutton);
			Thread.sleep(1000);
			element_Clear(gridMenuName);
			element_InputTextUsingActionClass(gridMenuName, data.get("Menu"));
			element_Click(driver.findElement(By.xpath("//html")));
			Thread.sleep(500);
			element_Clear(gridStartTime);
			element_inputTextUsingActionClassCharacterOneByOne(gridStartTime, data.get("StartTime"));
			Thread.sleep(500);
			element_Clear(gridEndTime);
			element_inputTextUsingActionClassCharacterOneByOne(gridEndTime, data.get("EndTime"));
			Thread.sleep(500);
			if (data.get("ScheduleDays") != null) {
				element_Click(gridScheduleDays);
				String[] scheduleDays = data.get("ScheduleDays").toUpperCase().split(",");
				for (int j = 0; j < scheduleDays.length; j++) {
					for (int k = 0; k < appDaysSelection.size(); k++) {
						if (appDaysSelection.get(k).getText().toUpperCase().equalsIgnoreCase(scheduleDays[j])) {
							appDaysSelection.get(k).click();
							break;
						}
					}
				}
			}
			Thread.sleep(500);
			element_Click(gridSaveBtn);
			Thread.sleep(500);
		}
		if (scheduleMenusPanelOpenOrNot.size()==0) {
			element_Click(scheduleMenusPanel);
			Thread.sleep(500);
		}
		//Main'
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	

}
