package PageObject.AdminModule;

import static org.testng.AssertJUnit.assertEquals;

import java.util.ArrayList;
import java.util.Iterator;
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
import org.openqa.selenium.support.ui.Select;
import org.testng.Assert;

import com.google.inject.Key;

import CommonAbstract.AbstractMethod;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;
import io.cucumber.datatable.DataTable;
import net.bytebuddy.asm.Advice.Enter;

public class RolesAndRigthsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(RolesAndRigthsPO.class);

	public RolesAndRigthsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@default=\"Roles And Rights Configuration\"]")
	private WebElement rolesAndRightsTab;

	@FindBy(xpath = "//*[@name='txtRoleName']")
	private WebElement role;

	@FindBy(id = "cmbModuleID")
	private WebElement moduleName;

	@FindBy(xpath = "//*[@id='cmbModuleID']/option")
	private List<WebElement> modulenames;

	@FindBy(xpath = "//*[@class='tab-items']//*[@name='cmnTxtSearch']")
	private WebElement searchBox;

	@FindBy(xpath = "//a[@ng-init=\"roletab\"]")
	private List<WebElement> roleNameGrid;

	@FindBy(xpath = "//table[@id='grdRoleConfig']/tbody/tr/td[1]")
	private List<WebElement> rightAssignTable;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private WebElement valMsg;

	@FindBy(xpath = "//*[@class=\"input-group-btn iconpkname\"]/button")
	private WebElement copyRightAsPer;

	@FindBy(xpath = "//*[@class='table table-hover table-striped table-condensed table-bordered table-responsive master-table']/tbody/tr/td[3]")
	private List<WebElement> copyRightAsPicklist;

	@FindBy(xpath = "//*[@name='roleConfig']//*[@class='form-group']//*[@class='col-md-2 col-sm-4 col-xs-4']//*[@class='col-md-3 col-sm-3']//*[@default='Module Rights']")
	private WebElement moduleRights;

	@FindBy(id = "btnModuleRight")
	private WebElement moduleRightsBtn;

	@FindBy(xpath = "//table[@id='grdRoleModuleConfig']/tbody/tr/td[2]")
	private List<WebElement> moduleNameTable;

	@FindBy(xpath = "//a[@ng-init='roletab']/i")
	private WebElement deleteRoleButton;

	public String createRolesAndRights(String roleName, String module, String menu, String view, String add,
			String edit, String delete, String copyRight, String hide, String autoApprove) throws InterruptedException {
		pageLoadWaitng();
		String msg = null;
		waitForElementVisible(rolesAndRightsTab);
		element_Click(rolesAndRightsTab);
		Thread.sleep(1000);
		waitForElementClickable(searchBox);
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, roleName);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (roleNameGrid.size() > 0) {
				for (int j = 0; j < roleNameGrid.size(); j++) {
					String plcname1 = roleNameGrid.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(roleName)) {
						roleNameGrid.get(j).click();
						break;
					}
				}
			}
			if (!ar.contains(roleName)) {
				Thread.sleep(1000);
				addButtonClick();
				waitForElementClickable(role);
				element_Clear(role);
				element_InputText(role, roleName);
				// element_InputTextUsingActionClass (role, roleName);

			}
			// Copy Right As Per
			Thread.sleep(1000);
			if (copyRight != null) {
				element_Click(copyRightAsPer);
				Thread.sleep(1000);
				for (WebElement colnm : copyRightAsPicklist) {
					if (colnm.getText().equalsIgnoreCase(copyRight)) {
						Thread.sleep(500);
						element_Click(colnm);
						Thread.sleep(1000);
						break;
					}
				}
			} else if (hide != null) {
				Thread.sleep(2000);
				waitForElementClickable(moduleRightsBtn);
				logger.debug(moduleRightsBtn);
				element_ClickUsingJS(moduleRightsBtn);

				Thread.sleep(3000);
				// Select Checkbox code First Page and Pagination
				int count = 0;
				do {
					// int j=0;
					Thread.sleep(250);
					if (count != 0) {
						if (driver
								.findElements(
										By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[2]"))
								.size() > 0) {
							driver.findElement(
									By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[2]"))
									.click();
							Thread.sleep(250);
							logger.debug("Pagination");
						}
					}

					int j = 0;
					Thread.sleep(1000);
					for (int i = 0; i < moduleNameTable.size(); i++) {
						String modNm = moduleNameTable.get(i).getText();
						logger.debug(modNm);
						if (modNm.equalsIgnoreCase(module)) {
							j += 1;
							// logger.debug(j);
							if (hide != null) {
								boolean hide1 = Boolean.parseBoolean(hide);
								WebElement hideChk1 = moduleNameTable.get(i)
										.findElement(By.xpath("following-sibling::td[1]/input"));
								logger.debug(hideChk1);
								if (hide1 == true) {
									if (element_isSelected(hideChk1) != true) {
										element_Click(hideChk1);
									}
								} else {
									if (element_isSelected(hideChk1) == true) {
										element_Click(hideChk1);
									}
								}
							}

							if (view != null) {
								boolean view1 = Boolean.parseBoolean(view);
								WebElement viewChk1 = moduleNameTable.get(i)
										.findElement(By.xpath("following-sibling::td[2]/input"));
								// logger.debug(viewChk1);
								if (view1 == true) {
									if (element_isSelected(viewChk1) != true) {
										element_Click(viewChk1);
									}
								} else {
									if (element_isSelected(viewChk1) == true) {
										element_Click(viewChk1);
									}
								}
							}
							if (add != null) {
								boolean add1 = Boolean.parseBoolean(add);
								WebElement addChk1 = moduleNameTable.get(i)
										.findElement(By.xpath("following-sibling::td[3]/input"));
								// logger.debug(addChk1);
								if (add1 == true) {
									if (element_isSelected(addChk1) != true) {
										element_Click(addChk1);
									}
								} else {
									if (element_isSelected(addChk1) == true) {
										element_Click(addChk1);
									}
								}
							}
							if (edit != null) {
								boolean edit1 = Boolean.parseBoolean(edit);
								WebElement editChk1 = moduleNameTable.get(i)
										.findElement(By.xpath("following-sibling::td[4]/input"));
								// logger.debug(editChk1);
								if (edit1 == true) {
									if (element_isSelected(editChk1) != true) {
										element_Click(editChk1);
									}
								} else {
									if (element_isSelected(editChk1) == true) {
										element_Click(editChk1);
									}
								}
							}
							if (delete != null) {
								boolean delete1 = Boolean.parseBoolean(delete);
								WebElement deleteChk1 = moduleNameTable.get(i)
										.findElement(By.xpath("following-sibling::td[5]/input"));
								// logger.debug(deleteChk1);
								if (delete1 == true) {
									if (element_isSelected(deleteChk1) != true) {
										element_Click(deleteChk1);
									}
								} else {
									if (element_isSelected(deleteChk1) == true) {
										element_Click(deleteChk1);
									}
								}
							}
							Thread.sleep(3000);
							break;
						}
					}
					if (j == 1) {
						break;
					}
					count++;
					Thread.sleep(2000);

				} while (driver
						.findElements(By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[1]"))
						.size() != 0);
			} else {
				element_DropDownSelectByvisibleText(moduleName, module);
//				element_Click(moduleName);
//				for (WebElement mn : modulenames) {
//					if (mn.getText().contains(module)) {
//						element_Click(mn);
//						Thread.sleep(1000);
//						break;
//					}
//				}
				// logger.debug("Module name = "+module);
				Thread.sleep(1500);
				// Select Checkbox code First Page and Pagination
				int count = 0;
				do {
					Thread.sleep(2000);

					if (count != 0) {
						driver.findElement(By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[1]"))
								.click();
						Thread.sleep(2000);
					}
					int j = 0;
					Thread.sleep(2000);
					for (int i = 0; i < rightAssignTable.size(); i++) {

						String colnm = rightAssignTable.get(i).getText();
						logger.debug(colnm);
						if (colnm.equalsIgnoreCase(menu)) {
							j += 1;
							// logger.debug(j);
							if (view != null) {
								boolean view1 = Boolean.parseBoolean(view);
								WebElement viewChk1 = rightAssignTable.get(i)
										.findElement(By.xpath("following-sibling::td[2]/input"));
								// logger.debug(viewChk1);
								if (view1 == true) {
									if (element_isSelected(viewChk1) != true) {
										element_Click(viewChk1);
									}
								} else {
									if (element_isSelected(viewChk1) == true) {
										element_Click(viewChk1);
									}
								}
							}

							if (add != null) {
								boolean add1 = Boolean.parseBoolean(add);

								List<WebElement> addFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[3]/input"));
								if (addFlagCheck.size() > 0) {
									WebElement addChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[3]/input"));
									if (add1 == true) {
										if (element_isSelected(addChk1) != true) {
											element_Click(addChk1);
										}
									} else {
										if (element_isSelected(addChk1) == true) {
											element_Click(addChk1);
										}
									}
								} else {
									logger.debug("Add option is not applicable in " + menu);
								}
							}

							if (edit != null) {
								boolean edit1 = Boolean.parseBoolean(edit);

								List<WebElement> editFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[4]/input"));
								if (editFlagCheck.size() > 0) {
									WebElement editChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[4]/input"));
									if (edit1 == true) {
										if (element_isSelected(editChk1) != true) {
											element_Click(editChk1);
										}
									} else {
										if (element_isSelected(editChk1) == true) {
											element_Click(editChk1);
										}
									}
								} else {
									logger.debug("Edit option is not applicable in " + menu);
								}
							}

							if (delete != null) {
								boolean delete1 = Boolean.parseBoolean(delete);

								List<WebElement> delFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[5]/input"));
								if (delFlagCheck.size() > 0) {
									WebElement deleteChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[5]/input"));
									if (delete1 == true) {
										if (element_isSelected(deleteChk1) != true) {
											element_Click(deleteChk1);
										}
									} else {
										if (element_isSelected(deleteChk1) == true) {
											element_Click(deleteChk1);
										}
									}
								} else {
									logger.debug("Delete option is not applicable in " + menu);
								}
							}
							if (autoApprove != null) {
								boolean autoApprove1 = Boolean.parseBoolean(autoApprove);

								List<WebElement> autoApFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[7]/input"));
								if (autoApFlagCheck.size() > 0) {
									WebElement autoApChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[7]/input"));
									if (autoApprove1 == true) {
										if (element_isSelected(autoApChk1) != true) {
											element_Click(autoApChk1);
										}
									} else {
										if (element_isSelected(autoApChk1) == true) {
											element_Click(autoApChk1);
										}
									}
								} else {
									logger.debug("Auto Approve option is not applicable in " + menu);
								}
							}
							Thread.sleep(3000);
							break;
						}
					}
					if (j == 1) {
						break;
					}
					count++;
					Thread.sleep(2000);
				} while (driver.findElements(By.xpath("(//*[@class=\"pagination-next\"])[1]")).size() != 0);
			}
			Thread.sleep(2000);
			saveButtonClick();
			msg = validationMessage();
		}
		return msg;
	}

	// By Chhaya
	public void deleteRoleAndRight(String deleteRoleID) throws InterruptedException {
		pageLoadWaitng();
		String valMsg = null;
		waitForElementVisible(rolesAndRightsTab);
		element_Click(rolesAndRightsTab);
		waitForElementClickable(searchBox);
		Thread.sleep(500);
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, deleteRoleID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(500);
			for (int j = 0; j < roleNameGrid.size(); j++) {
				String plcname1 = roleNameGrid.get(j).getText();
				if (plcname1.equalsIgnoreCase(deleteRoleID)) {
					roleNameGrid.get(j).click();
					waitForElementClickable(deleteRoleButton);
					element_Click(deleteRoleButton);
					Thread.sleep(500);
					if (element_AlertIsPresent()) {
						driver.switchTo().alert().accept();
					}
					valMsg = validationMessage();
					Assert.assertEquals(valMsg, "Deleted Successfully");
					break;
				} else {
					element_Clear(searchBox);
					Thread.sleep(1000);
					break;
				}
			}
		} else {
			logger.debug("Role And Right Searchbox is disabled");
		}
	}

	public void verifyRoleRights(String roleName, String module, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		// String msg = null;
		waitForElementVisible(rolesAndRightsTab);
		element_Click(rolesAndRightsTab);
		Thread.sleep(1000);
		waitForElementClickable(searchBox);
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, roleName);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (roleNameGrid.size() > 0) {
				for (int j = 0; j < roleNameGrid.size(); j++) {
					String plcname1 = roleNameGrid.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(roleName)) {
						roleNameGrid.get(j).click();
						Thread.sleep(1500);
						break;
					}
				}
			} else {
				logger.info(roleName + " Not Found");
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Menu: " + data.get("Menu"));
				String menu = data.get("Menu");
				String view = data.get("View");
				String add = data.get("Add");
				String edit = data.get("Edit");
				String delete = data.get("Delete");
				Thread.sleep(500);
				element_DropDownSelectByvisibleText(moduleName, module);

//				element_Click(moduleName);
//				for (WebElement mn : modulenames) {
//					if (mn.getText().contains(module)) {
//						element_Click(mn);
//						Thread.sleep(1000);
//						break;
//					}
//				}
				Thread.sleep(500);
				// Verify Checkbox code First Page and Pagination
				int count = 0;
				do {
					Thread.sleep(2000);
					if (count != 0) {
						if (driver
								.findElements(
										By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[1]"))
								.size() > 0) {
							driver.findElement(
									By.xpath("(//*[@name=\"roleConfig\"]//*[@class=\"pagination-next\"][1])[1]"))
									.click();
							Thread.sleep(2000);
						}
					}
					int j = 0;
					Thread.sleep(1500);
					for (int i = 0; i < rightAssignTable.size(); i++) {
						String actualMenu = rightAssignTable.get(i).getText();
						if (actualMenu.equalsIgnoreCase(menu)) {
							j += 1;
							if (view != null) {
								boolean view1 = Boolean.parseBoolean(view);
								WebElement viewChk1 = rightAssignTable.get(i)
										.findElement(By.xpath("following-sibling::td[2]/input"));
								Assert.assertEquals(element_isSelected(viewChk1), view1);
							}
							if (add != null) {
								boolean add1 = Boolean.parseBoolean(add);
								List<WebElement> addFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[3]/input"));
								if (addFlagCheck.size() > 0) {
									WebElement addChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[3]/input"));
									Assert.assertEquals(element_isSelected(addChk1), add1);
								} else {
									logger.debug("Add option is not applicable in " + menu);
								}
							}
							if (edit != null) {
								boolean edit1 = Boolean.parseBoolean(edit);
								List<WebElement> editFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[4]/input"));
								if (editFlagCheck.size() > 0) {
									WebElement editChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[4]/input"));
									Assert.assertEquals(element_isSelected(editChk1), edit1);
								} else {
									logger.debug("Edit option is not applicable in " + menu);
								}
							}
							if (delete != null) {
								boolean delete1 = Boolean.parseBoolean(delete);
								List<WebElement> delFlagCheck = rightAssignTable.get(i)
										.findElements(By.xpath("following-sibling::td[5]/input"));
								if (delFlagCheck.size() > 0) {
									WebElement deleteChk1 = rightAssignTable.get(i)
											.findElement(By.xpath("following-sibling::td[5]/input"));
									Assert.assertEquals(element_isSelected(deleteChk1), delete1);
								} else {
									logger.debug("Delete option is not applicable in " + menu);
								}
							}
							Thread.sleep(3000);
							break;
						}
					}
					if (j == 1) {
						break;
					}
					count++;
					Thread.sleep(1500);
				} while (driver.findElements(By.xpath("(//*[@class=\"pagination-next\"])[1]")).size() != 0);
			}
		}
	}
}
