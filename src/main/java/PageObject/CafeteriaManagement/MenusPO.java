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
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;

public class MenusPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(MenusPO.class);

	public MenusPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "txtMenuName")
	private WebElement menuNameTxt;

	@FindBy(id = "chkStatus")
	private WebElement activateflag;
	
	@FindBy(id = "chkDefault")
	private WebElement containsDefaultItemflag;

	@FindBy(id = "txtItemID")
	private WebElement itemIdTxt;
	
	@FindBy(id = "txtItemName")
	private WebElement itemNameTxt;

	@FindBy(xpath = "//*[@name='cosecPicklistBtnForm']//*[@class='btn pt-1']")
	private WebElement itemSelectionPicklist;

	@FindBy(xpath = "//*[@class='row isselected-grid']//input")
	private WebElement itemSelectionSelectAll;

	@FindBy(xpath = "//*[@key='OK']")
	private WebElement itemSelectionOkBtn;

	@FindBy(xpath = "//*[@class='col-md-12']//*[@name='cmnTxtSearch']")
	private WebElement searchbar;

	@FindBy(xpath = "//*[@class='col-xs-12 col-sm-8 col-md-4 grid']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allMenuNames;

	// Code
	// Max 999
	public void createMaxMenus(Map<String, String> data) throws InterruptedException, IOException {
		pageLoadWaitng();
		int maxMenuCount = Integer.parseInt(data.get("MenuCount"));
		for (int i = 1; i < maxMenuCount + 1; i++) {
			addButtonClick();
			Thread.sleep(1000);
			String formattedI = String.format("%03d", i);
			element_Clear(menuNameTxt);
			element_InputTextUsingActionClass(menuNameTxt, "MenuMenuMenu" + formattedI);
			Thread.sleep(300);
			if (!element_isSelected(activateflag)) {
				element_Click(activateflag);
			}
			Thread.sleep(500);
			if (i == 1 && i != maxMenuCount) {
				for (int j = 1; j <= 99; j++) {
					element_InputTextUsingActionClass(itemIdTxt, String.valueOf(j));
					Thread.sleep(500);
					element_Click(driver.findElement(By.xpath("//html")));
					Thread.sleep(500);
				}

			} else if (i == maxMenuCount) {
				for (int j = 157; j <= 255; j++) {
					element_InputTextUsingActionClass(itemIdTxt, String.valueOf(j));
					Thread.sleep(500);
					element_Click(driver.findElement(By.xpath("//html")));
					Thread.sleep(500);
				}
			} else {
				element_Clear(itemIdTxt);
				element_InputTextUsingActionClass(itemIdTxt, "1");
				Thread.sleep(500);
				element_Click(driver.findElement(By.xpath("//html")));
				Thread.sleep(500);
			}
			saveButtonClick();
			Assert.assertEquals(validationMessage2(), "Saved Successfully");
		}
	}

	// Delete Menu
	// Mayank
	public void deleteMenus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchbar)) {
			element_InputTextUsingActionClass(searchbar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allMenu = new ArrayList<>();
			if (allMenuNames.size() > 0) {
				for (int j = 0; j < allMenuNames.size(); j++) {
					String menuName = allMenuNames.get(j).getText();
					allMenu.add(menuName);
					if (menuName.equalsIgnoreCase(data.get("Name"))) {
						allMenuNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage2(), "Deleted Successfully");
					}
				}
			}
			// logger.debug(ar);
			if (!allMenu.contains(data.get("Name"))) {
				logger.info("Menu not found");
			}
		} else {
			logger.info("Menu not found");
		}

	}

	// Create Menu
	// Mayank
	public void createMenus(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchbar)) {
			element_InputTextUsingActionClass(searchbar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allMenu = new ArrayList<>();
			if (allMenuNames.size() > 0) {
				for (int j = 0; j < allMenuNames.size(); j++) {
					String menuName = allMenuNames.get(j).getText();
					allMenu.add(menuName);
					if (menuName.equalsIgnoreCase(data.get("Name"))) {
						allMenuNames.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!allMenu.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
		}
		// Main Code
		if (data.get("Name") != null) {
			element_Clear(menuNameTxt);
			element_InputTextUsingActionClass(menuNameTxt, data.get("Name"));
		}
		if (data.get("Activate") != null) {
			boolean activate= Boolean.parseBoolean(data.get("Activate"));
			if (activate==true) {
				if (!activateflag.isSelected()) {
					element_Click(activateflag);
				}
			} else {
				if (activateflag.isSelected()) {
					element_Click(activateflag);
				}
			}
		}
		if (data.get("ContainsDefaultItem") != null) {
			boolean containsDefaultItem= Boolean.parseBoolean(data.get("ContainsDefaultItem"));
			if (containsDefaultItem==true) {
				if (!containsDefaultItemflag.isSelected()) {
					element_Click(containsDefaultItemflag);
				}
			} else {
				if (containsDefaultItemflag.isSelected()) {
					element_Click(containsDefaultItemflag);
				}
			}
		}
		Thread.sleep(1000);
		String[] commaSeparatedValues = data.get("ItemList").split(",");
		for (int i = 0; i < commaSeparatedValues.length; i++) {
			String item = commaSeparatedValues[i].trim();
			element_Clear(itemNameTxt);
			element_InputTextUsingActionClass(itemNameTxt, item);
			Thread.sleep(500);
			element_Click(driver.findElement(By.xpath("//html")));
			Thread.sleep(1000);
		}
		saveButtonClick();
		Assert.assertEquals(validationMessage2(), "Saved Successfully");
	}

}
