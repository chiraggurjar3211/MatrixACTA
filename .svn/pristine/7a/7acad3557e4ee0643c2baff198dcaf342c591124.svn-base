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


public class ItemsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ItemsPO.class);
	
	public ItemsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "txtItemsName")
	private WebElement itemNameTxt;
	
	@FindBy(id = "ChkDflt")
	private WebElement priceTxt;
	
	@FindBy(id = "txtDesc")
	private WebElement descTxt;
	
	@FindBy(id = "ImagePage")
	private WebElement imageIcon;
	
	@FindBy(xpath = "//*[@class='col-md-12']//*[@name='cmnTxtSearch']")
	private WebElement searchbar;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allItemsNames;
	
	@FindBy(id = "chkDiscount")
	private WebElement discountApplyFlag;
	
	@FindBy(id = "txtPrcntgLvl1")
	private WebElement level1Txt;
	
	@FindBy(id = "txtPrcntgLvl1")
	private List<WebElement> level1TxtC;
	
	@FindBy(id = "txtPrcntgLvl2")
	private WebElement level2Txt;
	
	@FindBy(id = "txtPrcntgLvl3")
	private WebElement level3Txt;
	
	@FindBy(id = "txtPrcntgLvl4")
	private WebElement level4Txt;
	
	@FindBy(id = "txtDscntAmtLvl1")
	private WebElement level1Txt1;
	
	@FindBy(id = "txtDscntAmtLvl2")
	private WebElement level2Txt1;
	
	@FindBy(id = "txtDscntAmtLvl3")
	private WebElement level3Txt1;
	
	@FindBy(id = "txtDscntAmtLvl4")
	private WebElement level4Txt1;
	
	
	
	
	// Code
	// Max 255
	public void createMaxItems(Map<String, String> data) throws InterruptedException, IOException {
		pageLoadWaitng();
		int maxItemCount = Integer.parseInt(data.get("ItemCount"));
		for (int i = 1; i < maxItemCount+1; i++) {
			addButtonClick();
			Thread.sleep(1000);
			String formattedI = String.format("%03d", i);
			element_Clear(itemNameTxt);
			element_InputTextUsingActionClass(itemNameTxt, "Itemmm"+formattedI);
			Thread.sleep(500);
			element_Clear(priceTxt);
			element_InputTextUsingActionClass(priceTxt, "6553.50");
			Thread.sleep(500);
			element_Clear(descTxt);
			element_InputTextUsingActionClass(descTxt, "DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescript");
			Thread.sleep(500);
			Boolean imageOrNot = Boolean.parseBoolean(data.get("Image"));
			if (imageOrNot==true) {
				element_Click(imageIcon);
				Thread.sleep(500);
				uploadDocumentUsingAutoIT();
				Thread.sleep(500);
			}
			saveButtonClick();
			Assert.assertEquals(validationMessage(), "Saved Successfully");
		}
	}
	
	public void deleteItems(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allItems = new ArrayList<>();
			if (allItemsNames.size() > 0) {
				for (int j = 0; j < allItemsNames.size(); j++) {
					String itemName = allItemsNames.get(j).getText();
					allItems.add(itemName);
					if (itemName.equalsIgnoreCase(data.get("Name"))) {
						allItemsNames.get(j).click();
						Thread.sleep(1000);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Deleted Successfully");
					}
				}
			}
			// logger.debug(ar);
			if (!allItems.contains(data.get("Name"))) {
				logger.info("Item not found");
			}
		} else {
			logger.info("Item not found");
		}
	}
	
	public void createItems(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allItems = new ArrayList<>();
			if (allItemsNames.size() > 0) {
				for (int j = 0; j < allItemsNames.size(); j++) {
					String itemName = allItemsNames.get(j).getText();
					allItems.add(itemName);
					if (itemName.equalsIgnoreCase(data.get("Name"))) {
						allItemsNames.get(j).click();
						Thread.sleep(1000);
					}
				}
			}
			// logger.debug(ar);
			if (!allItems.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
		}
		// Main code
		if (data.get("Name") != null) {
			element_Clear(itemNameTxt);
			element_InputTextUsingActionClass(itemNameTxt, data.get("Name"));
		}
		if (data.get("Price") != null) {
			element_Clear(priceTxt);
			element_InputTextUsingActionClass(priceTxt, data.get("Price"));
		}
		if (data.get("Description") != null) {
			element_Clear(descTxt);
			element_InputTextUsingActionClass(descTxt, data.get("Description"));
		}
		if (data.get("DiscountApply") != null) {
			boolean discountApply = Boolean.parseBoolean(data.get("DiscountApply"));
			if (discountApply==true) {
				if (!discountApplyFlag.isSelected()) {
					element_Click(discountApplyFlag);
				}
			} else {
				if (discountApplyFlag.isSelected()) {
					element_Click(discountApplyFlag);
				}
			}
		}
		Thread.sleep(2000);
		if (data.get("Level1") != null) {
			if (discountApplyFlag.isSelected()) {
				element_cleardataUsingActionClass(level1Txt);
				Thread.sleep(500);
				element_inputTextUsingActionClassCharacterOneByOne(level1Txt, data.get("Level1"));
				Thread.sleep(500);
			}
		}
		if (data.get("Level2") != null) {
			if (discountApplyFlag.isSelected()) {
				element_cleardataUsingActionClass(level2Txt);
				Thread.sleep(500);
				element_inputTextUsingActionClassCharacterOneByOne(level2Txt, data.get("Level2"));
				Thread.sleep(500);
			}
		}
		if (data.get("Level3") != null) {
			if (discountApplyFlag.isSelected()) {
				element_cleardataUsingActionClass(level3Txt);
				Thread.sleep(500);
				element_inputTextUsingActionClassCharacterOneByOne(level3Txt, data.get("Level3"));
				Thread.sleep(500);
			}
		}
		if (data.get("Level4") != null) {
			if (discountApplyFlag.isSelected()) {
				element_cleardataUsingActionClass(level4Txt);
				Thread.sleep(500);
				element_inputTextUsingActionClassCharacterOneByOne(level4Txt, data.get("Level4"));
				Thread.sleep(500);
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
		
	}
	
	

}
