package PageObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.tools.ant.taskdefs.Sleep;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class HomePO extends AbstractMethod {
	WebDriver driver;

	public HomePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "Link_7")
	private WebElement userModule;

	@FindBy(id = "Link_1")
	private WebElement adminModule;

	@FindBy(id = "Link_10")
	private WebElement shiftAndScheduleModule;

	@FindBy(id = "Link_3")
	private WebElement timeAndAttendanceModule;

	@FindBy(id = "Link_4")
	private WebElement leaveManagementModule;

	@FindBy(id = "Link_16")
	private WebElement jpcModule;

	@FindBy(id = "Link_17")
	private WebElement fvmModule;

	@FindBy(id = "Link_13")
	private WebElement cwmModule;

	@FindBy(id = "Link_5")
	private WebElement visitorModule;

	@FindBy(id = "Link_6")
	private WebElement cafeteriaModule;

	@FindBy(id = "Link_9")
	private WebElement deviceModule;

	@FindBy(id = "Link_11")
	private WebElement enterpriseModule;

	@FindBy(id = "Link_2")
	private WebElement accessControlModule;
	
	@FindBy(id = "Link_30")
	private WebElement reportBuilderModule;
	
	@FindBy(id="Link_31")
	private WebElement dashboard;
	
	@FindBy(id="btnAddNewWidget")
	private WebElement dashboardAddNewWidgetButton;

	// chhaya
	@FindBy(xpath = "//*[@id='accordionExample']/li/a[not(@style)]")
	private List<WebElement> moduleLeftMenuTable;

	@FindBy(xpath = "//*[@class='panel-collapse collapse show']/li/a[not(@style)]")
	private List<WebElement> subMenu;

	@FindBy(xpath = "//*[@class='collapse show']/li/a[not(@style)]")
	private List<WebElement> subMenu1;

	@FindBy(xpath = "//*[@id='accordionExample']//*[@class='panel']")
	private List<WebElement> moduleLeftMenuTable2;

	@FindBy(xpath = "//*[@title='New (Alt+N)' or @title='New (Alt+Shift+N)']")
	private List<WebElement> addButton1;

	@FindBy(xpath = "//*[@title='Delete (Alt+L)' or @title='Delete (Alt+Shift+L)']")
	private List<WebElement> deleteButton1;

	@FindBy(xpath = "//*[@title='Edit (Alt+E)' or @title='Edit (Alt+Shift+E)']")
	private List<WebElement> editButton1;

	@FindBy(xpath = "//*[@id='module-selection']/*[@class='col-sm-4 col-md-3 col-lg-2 col-xs-6']/a")
	private List<WebElement> allModules;

	@FindBy(xpath = "//label[@class='control-label mx-input-theme pageTitleInline']")
	private WebElement headerRow;

	@FindBy(xpath = "//*[@class='row']/label[@class=\"control-label mx-input-theme\"]")
	private WebElement quickLinkLabel;
	//

	public void goTOUserModule() {
		waitForElementVisible(userModule);
		element_Click(userModule);
		waitForElementVisible(quickLinks);
	}

	public void goTOAdminModule() throws InterruptedException {
		waitForElementVisible(adminModule);
		element_Click(adminModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goTOShiftAndScheduleModule() throws InterruptedException {
		waitForElementVisible(shiftAndScheduleModule);
		element_Click(shiftAndScheduleModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToTimeAndAttendanceModule() throws InterruptedException {
		waitForElementVisible(timeAndAttendanceModule);
		element_Click(timeAndAttendanceModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToLeaveManagementModule() throws InterruptedException {
		waitForElementVisible(leaveManagementModule);
		element_Click(leaveManagementModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToJPCmodule() throws InterruptedException {
		waitForElementVisible(jpcModule);
		element_Click(jpcModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToFVMmodule() throws InterruptedException {
		waitForElementVisible(fvmModule);
		waitForElementVisible(fvmModule);
		element_Click(fvmModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToCWMmodule() throws InterruptedException {
		waitForElementVisible(cwmModule);
		element_Click(cwmModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToVisitormodule() throws InterruptedException {
		waitForElementVisible(visitorModule);
		element_Click(visitorModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goToCafeteriamodule() throws InterruptedException {    
		waitForElementVisible(cafeteriaModule);
		element_Click(cafeteriaModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goTODeviceModule() throws InterruptedException {
		waitForElementClickable(deviceModule);
		element_Click(deviceModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goTOEnterpriseModule() throws InterruptedException {
		waitForElementVisible(enterpriseModule);
		element_Click(enterpriseModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}

	public void goTOAccessControlModule() throws InterruptedException {
		waitForElementVisible(accessControlModule);
		element_Click(accessControlModule);
		Thread.sleep(1000);
		waitForElementVisible(quickLinks);
	}
	
	public void goTOReportBuilderModule() throws InterruptedException{
		waitForElementVisible(reportBuilderModule);
		element_Click(reportBuilderModule);
		Thread.sleep(1000);
	}

	// Chhaya
	public void findModule(String menu, String module) throws InterruptedException {
		pageLoadWaitng();
		switch (module) {
		case "Admin":
			Thread.sleep(1000);
			goTOAdminModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Users":
			Thread.sleep(1000);
			goTOUserModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Devices":
			Thread.sleep(1000);
			goTODeviceModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Enterprise Structure":
			Thread.sleep(1000);
			goTOEnterpriseModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Shifts and Schedules":
			Thread.sleep(1000);
			goTOShiftAndScheduleModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Access Control":
			Thread.sleep(1000);
			goTOAccessControlModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Time and Attendance":
			Thread.sleep(1000);
			goToTimeAndAttendanceModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Leave Management":
			Thread.sleep(1000);
			goToLeaveManagementModule();
			Thread.sleep(1000);
			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Cafeteria Management":
			Thread.sleep(1000);
			goToCafeteriamodule();
			Thread.sleep(1000);

			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Visitor Management":
			Thread.sleep(1000);
			goToVisitormodule();
			Thread.sleep(1000);

			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Contract Worker Management":
			Thread.sleep(1000);
			goToCWMmodule();
			Thread.sleep(1000);

			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Job Processing and Costing":
			Thread.sleep(1000);
			goToJPCmodule();
			Thread.sleep(1000);

			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		case "Field Visit Management":
			Thread.sleep(1000);
			goToFVMmodule();
			Thread.sleep(1000);

			openPageInModule(menu, module);
			Thread.sleep(1000);
			break;

		default:
			System.out.println("Invalid Module Name : " + module);
			break;
		}
	}

	// Chhaya
	static List<String> getMenu = new ArrayList<String>();

	public void openPageInModule(String menu, String module) throws InterruptedException {
		getMenu.clear();
		int l = 0;
		for (int i = 0; i < moduleLeftMenuTable.size(); i++) {
			String menuNm = moduleLeftMenuTable.get(i).getText();
			// System.out.println("Menu name :" + menuNm);
//			if (menuNm.equalsIgnoreCase(menu)) {
//				element_Click(moduleLeftMenuTable.get(i));
//				Thread.sleep(1000);
//				System.out.println("1st"+menuNm);
//				getMenu.add(menuNm);
//				Thread.sleep(1000);
//				break;
//			}
			String value = moduleLeftMenuTable.get(i).getAttribute("data-bs-toggle");
			System.out.println("value"+value);
			if (value != null) {
				moduleLeftMenuTable.get(i).click();
				Thread.sleep(1000);
				for (int j = 0; j < subMenu.size(); j++) {
					String subMenuNm = subMenu.get(j).getText();
					if (subMenuNm.equalsIgnoreCase(menu)) {
						l += 1;
						getMenu.add(subMenuNm);
						Thread.sleep(1000);
						element_Click(subMenu.get(j));
						//subMenu.get(j).click();
						Thread.sleep(1000);
						moduleLeftMenuTable.get(i).click();
						Thread.sleep(1000);
						break;
					}
					String value1 = subMenu.get(j).getAttribute("data-bs-toggle");
					if (value1 != null) {
						subMenu.get(j).click();
						Thread.sleep(1000);
						for (int k = 0; k < subMenu1.size(); k++) {
							String subMenuNm1 = subMenu1.get(k).getText();
							if (subMenuNm1.equalsIgnoreCase(menu)) {
								l += 1;
								getMenu.add(subMenuNm1);
								System.out.println("2nd"+subMenuNm1);
								Thread.sleep(1000);
								subMenu1.get(k).click();
								Thread.sleep(1000);
								subMenu.get(j).click();
								Thread.sleep(1000);
								break;
							}
						}
						break;
					}
				}
				if (l == 1) {
					break;
				}
			}
			else if (menuNm.equalsIgnoreCase(menu)) {
				moduleLeftMenuTable.get(i).click();
				Thread.sleep(1000);
				System.out.println("1st"+menuNm);
				getMenu.add(menuNm);
				Thread.sleep(1000);
				break;
			}
		}
		Thread.sleep(2000);
		 System.out.println("Get Menu = "+getMenu);
	}

	// Chhaya
	public void verifyPageRights(String mainMenu, String view, String add, String edit, String delete)
			throws InterruptedException {
		System.out.println("Get Menu 2 = " + getMenu);
		// View
		Thread.sleep(2000);
		boolean view1 = Boolean.parseBoolean(view);
		boolean viewVal = HomePO.getMenu.contains(mainMenu);
		// System.out.println(viewVal);
		Assert.assertEquals(viewVal, view1);
		// return val;
		// add
		boolean add1 = Boolean.parseBoolean(add);
		int addBtnSize = addButton1.size(); // List<WebElement>.size() it returns integer value
		// System.out.println(addBtnSize);
		boolean addBtnVisible;
		if (addBtnSize > 0) {
			addBtnVisible = true;
		} else {
			addBtnVisible = false;
		}
		Assert.assertEquals(addBtnVisible, add1);

		// edit
		boolean edit1 = Boolean.parseBoolean(edit);
		int editBtnSize = editButton1.size();
		// System.out.println(editBtnSize);
		boolean editBtnVisible;
		if (editBtnSize > 0) {
			editBtnVisible = true;
		} else {
			editBtnVisible = false;
		}
		Assert.assertEquals(editBtnVisible, edit1);

		// delete
		boolean delete1 = Boolean.parseBoolean(delete);
		int deleteBtnSize = deleteButton1.size();
		System.out.println(deleteBtnSize);
		boolean deleteBtnVisible;
		if (deleteBtnSize > 0) {
			deleteBtnVisible = true;
		} else {
			deleteBtnVisible = false;
		}
		Assert.assertEquals(deleteBtnVisible, delete1);
	}

	// Chhaya
	public void verifyModuleRights(String module1, String stringValue) throws InterruptedException {
		Thread.sleep(2000);

		HashMap<String, String> data = new HashMap<>();
		data.put("Admin", "Link_1");
		data.put("User", "Link_7");
		data.put("Devices", "Link_9");
		data.put("Enterprise Structure", "Link_11");
		data.put("Access Control", "Link_2");
		data.put("Report Builder", "Link_30");
		data.put("Shifts and Schedules", "Link_10");
		data.put("Time and Attendance", "Link_3");
		data.put("Leave Management", "Link_4");
		data.put("Contract Worker Management", "Link_13");
		data.put("Job Processing and Costing", "Link_16");
		data.put("Field Visit Management", "Link_17");
		data.put("Visitor Management", "Link_5");
		data.put("Cafeteria Management", "Link_6");

		System.out.println(data);

		// List<WebElement> modules =
		// driver.findElements(By.xpath("//*[@id='module-selection']/*[@class='col-sm-4
		// col-md-3 col-lg-2 col-xs-6']/a"));

		ArrayList<String> links = new ArrayList<>();
		// allModules
		for (WebElement module : allModules) {

			String linkID = module.getAttribute("id");

			links.add(linkID);
		}

		System.out.println(links);

		boolean moduleVisible;
		boolean booleanValue = Boolean.parseBoolean(stringValue);

		String myLink = data.get(module1);
		System.out.println("myLink = " + myLink);

		if (links.contains(myLink)) {
			// System.out.println("Module Visible");
			moduleVisible = true;
		} else {
			// System.out.println("Module id Not Visible");
			moduleVisible = false;
		}

		Assert.assertEquals(moduleVisible, booleanValue);
	}

	// Created by Chhaya
	public void verifyLaunchPage(String pageName) throws InterruptedException {
		Thread.sleep(1000);
		String headerText = headerRow.getText();

		Assert.assertEquals(headerText, pageName);
	}

	// By Chhaya
	public void verifyHeaderName(String headerName) throws InterruptedException {
		Thread.sleep(1000);
		String labelText = quickLinkLabel.getText();

		Assert.assertEquals(labelText, headerName);
	}
	
	public void goToDashboard() {
		element_Click(dashboard);
		waitForElementVisible(dashboardAddNewWidgetButton);
	}
}
