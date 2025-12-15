package PageObject.ShiftAndSchedule;

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


public class WeekOffGroupPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(WeekOffGroupPO.class);
	
	public WeekOffGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// *****************************************
	//***********ELEMENTS***********************
	//*****************************************
	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allWONames;
	
	@FindBy(id = "WeekOffName")
	private WebElement wONameTxt;
	
	@FindBy(id = "Off1")
	private WebElement wOff1DD;
	
	@FindBy(id = "Off2")
	private WebElement wOff2DD;
	
	@FindBy(xpath = "//*[@class='checkbox-inline checkbox-inline-width']")
	private List<WebElement> offDay2OnWeeks;
	
	@FindBy(name = "OffChangeEnbl")
	private WebElement wRotaionFlag;
	
	@FindBy(id = "OffChangeCnt")
	private WebElement wRotaionCountTxt;
	
	@FindBy(xpath = "//*[@name=\"AutoWOAssign\"]")
	private WebElement autoWeekOffAssignmentFlag;
	
	@FindBy(id = "AutoWOWeeklyMonthly")
	private WebElement autoWeekOffAssignmentBasisDD;
	
	//***************************************************
	//**********************FUNCTIONS******************
	//**************************************************
	
	public void createWeekOffGroup(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("WOName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allWO = new ArrayList<>();
			if (allWONames.size() > 0) {
				for (int j = 0; j < allWONames.size(); j++) {
					String WOName = allWONames.get(j).getText();
					allWO.add(WOName);
					if (WOName.equalsIgnoreCase(data.get("WOName"))) {
						allWONames.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!allWO.contains(data.get("WOName"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(wONameTxt);
				element_InputTextUsingActionClass(wONameTxt, data.get("WOName"));
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(wONameTxt);
			element_InputTextUsingActionClass(wONameTxt, data.get("WOName"));
		}
		// Main Code
		if (data.get("OffDay1") != null) {
			element_DropDownSelectByvisibleText(wOff1DD, data.get("OffDay1"));
		}
		if (data.get("OffDay2") != null) {
			element_DropDownSelectByvisibleText(wOff2DD, data.get("OffDay2"));
		}
		if (data.get("AutoWeekOffAssignment") != null) {
			Boolean autoWeekOffAssignment = Boolean.parseBoolean(data.get("AutoWeekOffAssignment"));
			if (autoWeekOffAssignment==true) {
				if (!autoWeekOffAssignmentFlag.isSelected()) {
					element_Click(autoWeekOffAssignmentFlag);
				}
				if (data.get("AutoWeekOffAssignmentBasis") != null) { // Depends on aboce flag so
					element_DropDownSelectByvisibleText(autoWeekOffAssignmentBasisDD, data.get("AutoWeekOffAssignmentBasis"));
				}
			}
			else {
				if (autoWeekOffAssignmentFlag.isSelected()) {
					element_Click(autoWeekOffAssignmentFlag);
				}
			}
		}
		if (data.get("OffDay2OnWeeks") != null) {
			if (data.get("OffDay2OnWeeks").equalsIgnoreCase("ALL") || data.get("OffDay2OnWeeks").equalsIgnoreCase("All")) {
				for (int i = 0; i < offDay2OnWeeks.size(); i++) {
					if (offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).isEnabled()) {
						if (!offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).isSelected()) {
							offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).click();
							Thread.sleep(700);
						}
					}
				}
			} else {
				String[] offDay2OnWeeksSplitwithcomma = data.get("OffDay2OnWeeks").split(",");
				for (int j = 0; j < offDay2OnWeeksSplitwithcomma.length; j++) {
					for (int i = 0; i < offDay2OnWeeks.size(); i++) {
						String week = offDay2OnWeeksSplitwithcomma[j].toUpperCase();
						if (offDay2OnWeeks.get(i).getText().toUpperCase().equalsIgnoreCase(week)) {
							if (offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).isEnabled()) {
								if (!offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).isSelected()) {
									offDay2OnWeeks.get(i).findElement(By.xpath("child::input")).click();
								}
							}
							break;
						}
						Thread.sleep(700);
					}
				}
			}
		}
		if (data.get("WeekOffRotation") != null) {
			Boolean weekoffr = Boolean.parseBoolean(data.get("WeekOffRotation"));
			if (weekoffr == true) {
				if (!wRotaionFlag.isSelected()) {
					element_Click(wRotaionFlag);
				}
				if (data.get("RotationCount") != null) { // Depends on aboce flag so
					element_Clear(wRotaionCountTxt);
					element_InputTextUsingActionClass(wRotaionCountTxt, data.get("RotationCount"));
				}
			} else {
				if (wRotaionFlag.isSelected()) {
					element_Click(wRotaionFlag);
				}
			}
		}
		
		Thread.sleep(5000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), data.get("validation"));
	}
	
	// Mayank
	public void deleteWeekOffGroup(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("WOName"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allWO = new ArrayList<>();
			if (allWONames.size() > 0) {
				for (int j = 0; j < allWONames.size(); j++) {
					String WOName = allWONames.get(j).getText();
					allWO.add(WOName);
					if (WOName.equalsIgnoreCase(data.get("WOName"))) {
						allWONames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
						logger.debug("WO Group Deleted Succcessfully");
					}
				}
			}
		} else {
			logger.debug("WO Group Not Found");
		}
	}
}
