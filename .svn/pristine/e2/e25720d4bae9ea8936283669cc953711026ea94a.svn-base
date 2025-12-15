package PageObject;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.Panel200.Panel200HomePO;
import io.cucumber.datatable.DataTable;

public class DeviceWebpagePO extends AbstractMethod {
	WebDriver driver;
	static String uNameForLogin;
	static int login = 0;

	public DeviceWebpagePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "standAloneUsername")
	private WebElement usernameSAP;

	@FindBy(id = "dashBoardHome")
	private WebElement dashBoardHomeSAP;

	@FindBy(id = "password")
	private WebElement pwdSAP;

	@FindBy(id = "pswd")
	private WebElement pwdDirectDoor;

	@FindBy(id = "btnlogin")
	private WebElement lgnButtonSAP;

	@FindBy(id = "submit")
	private WebElement submitDirectDoor;

	@FindBy(id = "standAloneUsername")
	private List<WebElement> standAloneUsernamecount;

	@FindBy(xpath = "//*[@id=\"standAloneUserId\" and @class=\"none\"]//*[@id=\"standAloneUsername\"]")
	private List<WebElement> checkStandaAloneOrServer;

	@FindBy(id = "serverUsername")
	private WebElement serverUsernameForPanel;

	@FindBy(id = "userLevel")
	private WebElement userLevelDirectDoor;

//	@FindBy(xpath = "//*[@id='settings_li']/a")
//	private WebElement panelConfigHeader;
	
	//Mayank
	@FindBy(xpath = "//*[(@id='settings_li' or @id='manage_li') and @class='headnode no-top-border active activenode']/a")
	private WebElement panelConfigHeader;

	@FindBy(id = "panel-frame")
	private WebElement directdoorFrame;

	@FindBy(xpath = "/html/body/h2")
	private WebElement accessError;

	@FindBy(xpath = "/html/body/h2")
	private List<WebElement> accessErrorCount;

	public String cosecDeviceLogin(String uName, String passwd) throws InterruptedException {
		login=0;
//		WebElement u1 = driver.findElement(By.id("standAloneUsername")).isDisplayed();
//		System.out.println(u1);
		uNameForLogin = uName;
		String val = null;
		if (passwd != null) {
			if (standAloneUsernamecount.size() > 0) {
				if (checkStandaAloneOrServer.size() == 0) {
					System.out.println("Device is Standalone panel200");
					element_InputText(usernameSAP, uName);
					element_InputText(pwdSAP, passwd);
					element_Click(lgnButtonSAP);
					Thread.sleep(500);
					waitForElementVisible(dashBoardHomeSAP);
					val = dashBoardHomeSAP.getText();
					System.out.println("Login successfully for Standalone mode Panel200");
					login = 1;

				} else {
					System.out.println("Device is Server Mode panel200");
					element_DropDownSelectByvisibleText(serverUsernameForPanel, uName);
					element_InputText(pwdSAP, passwd);
					element_Click(lgnButtonSAP);
					Thread.sleep(500);
					waitForElementVisible(dashBoardHomeSAP);
					val = dashBoardHomeSAP.getText();
					System.out.println("Login successfully for Server mode Panel200");
					login = 1;
				}
			} else {
				System.out.println("Device is Direct Door ");
				element_DropDownSelectByvisibleText(userLevelDirectDoor, uName);
				element_InputText(pwdDirectDoor, passwd);
				element_Click(submitDirectDoor);
				waitForElementVisible(driver.findElement(By.id("logout")));
				driver.switchTo().frame(directdoorFrame);
				waitForElementVisible(panelConfigHeader);
				System.out.println(panelConfigHeader.getText());
				val = panelConfigHeader.getText();
				if(val.equalsIgnoreCase("Manage")) {
					val="Settings";
				}
				System.out.println("Login successfully for Direct door");
				login = 1;
			}
		}
		return val;
	}

	public void vapt(String urllink, String sheetName, DataTable data) throws IOException, InterruptedException {
		String[][] getExcelsheetData = Panel200HomePO.excelData(sheetName);
		for (Map<String, String> datatableD : data.asMaps(String.class, String.class)) {
			int unam = Integer.parseInt(datatableD.get("UserName"));
			int url = Integer.parseInt(datatableD.get("URL Request"));
			int expectedwithLogin = Integer.parseInt(datatableD.get("Expectedwithlogin"));
			int expectedwithoutLogin = Integer.parseInt(datatableD.get("Expectedwithoutlogin"));
			int status = Integer.parseInt(datatableD.get("Status"));

			for (int i = 1; i < getExcelsheetData.length; i++) {
				if (getExcelsheetData[i][unam].equalsIgnoreCase(uNameForLogin)) {
					String createUrl = urllink + "/" + getExcelsheetData[i][url];
					System.out.println(createUrl);
					// open new tab
					driver.switchTo().newWindow(WindowType.TAB);
					Set<String> tab = driver.getWindowHandles();
					Iterator<String> tabName = tab.iterator();
					String parent = tabName.next();
					String child = tabName.next();
					driver.switchTo().window(child);
					driver.get(createUrl);
					Thread.sleep(4000);
					if (login == 1) {
						System.out.println("Login found"+" "+ login +"  "+uNameForLogin);
						if (accessErrorCount.size() > 0) {
							System.out.println(accessError.getText());
							if(getExcelsheetData[i][expectedwithLogin].isBlank()!=true && getExcelsheetData[i][expectedwithLogin].isEmpty()!=true) {
								if(accessError.getText().equalsIgnoreCase(getExcelsheetData[i][expectedwithLogin])) {
									System.out.println("Result Pass");
									Panel200HomePO.writeData(sheetName, i, status, "Pass");
								}
								else {
									System.out.println("Result Fail");
									Panel200HomePO.writeData(sheetName, i, status, "Fail");
								}
							}
							else {
								System.out.println("Result Fail");
								Panel200HomePO.writeData(sheetName, i, status, "Fail");
							}
						} else {
							if(getExcelsheetData[i][expectedwithLogin].isBlank()!=true && getExcelsheetData[i][expectedwithLogin].isEmpty()!=true) {
									System.out.println("Result Fail");
									Panel200HomePO.writeData(sheetName, i, status, "Fail");
							}
							else {
								System.out.println("Result Pass");
								Panel200HomePO.writeData(sheetName, i, status, "Pass");
							}
						}
					}
					else {
						System.out.println("Login Not found"+" "+ login +"  "+uNameForLogin);
						if (accessErrorCount.size() > 0) {
							System.out.println(accessError.getText());
							if(getExcelsheetData[i][expectedwithoutLogin].isBlank()!=true && getExcelsheetData[i][expectedwithoutLogin].isEmpty()!=true) {
								if(accessError.getText().equalsIgnoreCase(getExcelsheetData[i][expectedwithoutLogin])) {
									System.out.println("Result Pass");
									Panel200HomePO.writeData(sheetName, i, status, "Pass");
								}
								else {
									System.out.println("Result Fail");
									Panel200HomePO.writeData(sheetName, i, status, "Fail");
								}
							}
							else {
								System.out.println("Result Fail");
								Panel200HomePO.writeData(sheetName, i, status, "Fail");
							}
						} else {
							if(getExcelsheetData[i][expectedwithoutLogin].isBlank()!=true && getExcelsheetData[i][expectedwithoutLogin].isEmpty()!=true) {
									System.out.println("Result Fail");
									Panel200HomePO.writeData(sheetName, i, status, "Fail");
							}
							else {
								System.out.println("Result Pass");
								Panel200HomePO.writeData(sheetName, i, status, "Pass");
							}
						}
					}
					driver.close();
					driver.switchTo().window(parent);
				}
			}
		}

	}

}
