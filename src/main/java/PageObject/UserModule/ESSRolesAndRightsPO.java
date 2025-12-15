package PageObject.UserModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ESSRolesAndRightsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ESSRolesAndRightsPO.class);

	public ESSRolesAndRightsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "ESSRoleRightsID")
	private WebElement essRolesRightsIDtext;

	@FindBy(xpath = "//*[@default='Configuration']")
	private WebElement configurationPanel;

	@FindBy(xpath = "//*[@id='div_grd_gvRoleRights']//*[@name='cmnTxtSearch']")
	private WebElement gridSearchBox;

	@FindBy(id = "AccessRights")
	private WebElement selectAllFlag;

	// Chhaya
	@FindBy(xpath = "//*[@gridname='gvRolesRights']//*[@name='cmnTxtSearch']")
	private WebElement searchBox;

	@FindBy(id = "ESSRoleRightsName")
	private WebElement essRolesRightsNameText;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[1]/a[@class=\"anchorclick\"]")
	private List<WebElement> configurationCollaps;

	@FindBy(xpath = "//*[@key='cpConfiguration']")
	private WebElement configurationCollapsClick;

	@FindBy(xpath = "//*[@id='AccessRights']")
	private WebElement gridTblHeaderEnableCheck;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[@class=\"pagination-next\"]")
	private List<WebElement> paginationXpath;

	@FindBy(xpath = "//*[@id=\"collapseOne\"]//*[contains(@class,\"pagination-next\") and not(@class=\"pagination-next-go-to-lastpage dir-pagination-next-border-radius\")]")
	private WebElement paginationClick;

	@FindBy(xpath = "//*[@id=\"div_grd_gvRoleRights\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> gridTable;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[2]/a[@class=\"anchorclick\"]")
	private List<WebElement> filterUserCollaps;

	@FindBy(xpath = "//*[@id=\"accordion_master\"]/div[2]/a[@aria-expanded]")
	private WebElement filterUserCollapsClick;

	@FindBy(id = "UserUSAdvID")
	private WebElement userIdTxt;

	@FindBy(xpath = "//*[@id='div_grd_gvRoleRights']//*[@name=\"cmnTxtSearch\"]")
	private WebElement configurationSearch;

	@FindBy(xpath = "//*[@id=\"div_grd_gvRoleRights\"]//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> configurationTable;

	@FindBy(xpath = "//*[@gridname='gvRolesRights']//table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> allRolesNames;

	//////////////

	// Created by Mayank
	public String essRolesRightsSet(String pageRights, boolean value) throws InterruptedException {
		waitForElementVisible(essRolesRightsIDtext);
		element_Clear(essRolesRightsIDtext);
		element_InputTextUsingActionClass(essRolesRightsIDtext, "1");
		element_TextBoxToClickOnTab(essRolesRightsIDtext);
		Thread.sleep(1000);
		element_Click(configurationPanel);
		element_Click(gridSearchBox);
		element_InputTextUsingActionClass(gridSearchBox, pageRights);
		Thread.sleep(500);
		if (value == true) {
			if (!selectAllFlag.isSelected()) {
				element_Click(selectAllFlag);
			}
		} else {
			if (selectAllFlag.isSelected()) {
				element_Click(selectAllFlag);
			}
		}
		saveButtonClick();
		String valmsg = validationMessage();
		element_Click(configurationPanel);
		return valmsg;
	}

	public void createEssRolesdRights(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(essRolesRightsIDtext);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("ESSRoleRights: " + data.get("ESSRoleRights"));
			String eSSRoleRights = data.get("ESSRoleRights");
			String menu = data.get("Menu");
			String enable = data.get("Enable");
			boolean enableBool = Boolean.parseBoolean(enable);
			element_InputTextUsingActionClass(essRolesRightsNameText, eSSRoleRights);
			Thread.sleep(1000);
			element_TextBoxToClickOnTab(essRolesRightsNameText);
			Thread.sleep(1000);
			if (validationMessagexpathsize.size() > 0) {
				if (validationMessage().equalsIgnoreCase("No Data Found")) {
					addButtonClick();
					element_InputTextUsingActionClass(essRolesRightsNameText, eSSRoleRights);
					// element_InputTextUsingActionClass(essRolesRightsNameText, eSSRoleRights);
					element_TextBoxToClickOnTab(essRolesRightsNameText);
					Thread.sleep(500);
					if (menu != null) {
						if (configurationCollaps.size() == 0) {
							element_Click(configurationCollapsClick);
							Thread.sleep(1000);
						}
						// code for pagination and all checkbox deselect
						int count = 0;
						do {
							Thread.sleep(1000);
							if (count != 0) {
								element_Click(paginationClick);
								Thread.sleep(1000);
							}
							if (element_isSelected(gridTblHeaderEnableCheck) == true) {
								element_Click(gridTblHeaderEnableCheck);
							}
							Thread.sleep(500);

							count++;
							Thread.sleep(1000);
						} while (paginationXpath.size() != 0);
						// Code for attendance correction checkbox
						Thread.sleep(500);
						element_Click(gridSearchBox);
						element_InputTextUsingActionClass(gridSearchBox, menu);
						Thread.sleep(500);
						for (int i = 0; i < gridTable.size(); i++) {
							WebElement colName = gridTable.get(i)
									.findElement(By.xpath("following-sibling::td[2]/input"));

							if (enableBool == true) {
								if (element_isSelected(colName) != true) {
									element_Click(colName);
								}
							} else {
								if (element_isSelected(colName) == true) {
									element_Click(colName);
								}
							}
						}
					}
					Thread.sleep(1000);
					saveButtonClick();
					String valMsg = validationMessage();
					Assert.assertEquals(valMsg, "Saved Successfully");
				}
			} else {
				cancelButtonClick();
			}
		}
	}

	public void assignEssRoleRights(String EssRRName, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(essRolesRightsNameText);
		element_Clear(essRolesRightsIDtext);
		element_InputDataUsingJS(essRolesRightsNameText, EssRRName);
		element_TextBoxToClickOnTab(essRolesRightsNameText);
		if (!element_getInputControlValue(essRolesRightsNameText).isBlank()
				|| !element_getInputControlValue(essRolesRightsNameText).isEmpty()) {
			if (filterUserCollaps.size() == 0) {
				element_Click(filterUserCollapsClick);
				Thread.sleep(1000);
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("UserId: " + data.get("UserId"));
				String userId = data.get("UserId");
				element_Clear(userIdTxt);
				element_dynamicDDSelect(userIdTxt, userId);
				element_TextBoxToClickOnTab(userIdTxt);
			}
			saveButtonClick();
			String valMsg = validationMessage();
			Assert.assertEquals(valMsg, "Saved Successfully");
		} else {
			cancelButtonClick();
			Thread.sleep(1000);
		}
	}

	public void deleteEssRolesdRights(String eSSRoleRights) throws InterruptedException {
		waitForElementVisible(essRolesRightsIDtext);
		String valmsg = null;
		element_Clear(essRolesRightsNameText);
		element_InputTextUsingActionClass(essRolesRightsNameText, eSSRoleRights);
		element_TextBoxToClickOnTab(essRolesRightsNameText);
		if (!element_getInputControlValue(essRolesRightsNameText).isBlank()
				|| !element_getInputControlValue(essRolesRightsNameText).isEmpty()) {
			deleteButtonClick();
			Thread.sleep(1000);
			driver.switchTo().alert().accept();
			valmsg = validationMessage();
			Assert.assertEquals(valmsg, "Deleted Successfully");
		} else {
			Thread.sleep(500);
			valmsg = validationMessage();
			Assert.assertEquals(valmsg, "No Data Found");
			
		}
	}

	public void updateEssRolesdRights(String eSSRoleRights, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(essRolesRightsIDtext);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, eSSRoleRights);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> allWO = new ArrayList<>();
			if (allRolesNames.size() > 0) {
				for (int j = 0; j < allRolesNames.size(); j++) {
					String WOName = allRolesNames.get(j).getText();
					allWO.add(WOName);
					if (WOName.equalsIgnoreCase(eSSRoleRights)) {
						allRolesNames.get(j).click();
						
						for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
							logger.info("Menu: " + data.get("Menu"));
							String menu = data.get("Menu");
							String enable = data.get("Enable");
							boolean enableBool = Boolean.parseBoolean(enable);
							if (configurationCollaps.size() == 0) {
								element_Click(configurationCollapsClick);
								Thread.sleep(1000);
							}
							element_Clear(configurationSearch);
							element_InputTextUsingActionClass(configurationSearch, menu);
							element_TextBoxToClickOnEnter(configurationSearch);
							for (int i = 0; i < configurationTable.size(); i++) {
								String actualMenu = configurationTable.get(i).getText();
								if (actualMenu.equalsIgnoreCase(menu)) {
									WebElement enableFlag = configurationTable.get(i)
											.findElement(By.xpath("following-sibling::td[2]/input"));
									if (enableBool == true) {
										if (!enableFlag.isSelected()) {
											element_Click(enableFlag);
										}
									} else {
										if (enableFlag.isSelected()) {
											element_Click(enableFlag);
										}
									}
									Thread.sleep(500);
									break;
								}
							}
						}
						saveButtonClick();
						String valMsg = validationMessage();
						Assert.assertEquals(valMsg, "Saved Successfully");
					}
				}
			}
			// logger.debug(ar);
			if (!allWO.contains(eSSRoleRights)) {
				Assert.assertEquals("ESS Role Right Not Found", eSSRoleRights);
				Thread.sleep(1000);
			}
		}
		

	}
}