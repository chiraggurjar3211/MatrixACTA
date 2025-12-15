package PageObject.AdminModule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class LocationMasterPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LocationMasterPO.class);
	
	public LocationMasterPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[2]")
	private List<WebElement> locationCodes;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[3]")
	private List<WebElement> locationNames;

	@FindBy(id = "txtLocationCodeID")
	private WebElement codetxt;

	@FindBy(id = "txtLocationCodeName")
	private WebElement nametxt;

	@FindBy(id = "cboLocationType")
	private WebElement typeDD;

	@FindBy(id = "txtBLECode")
	private WebElement blecodetxt;

	@FindBy(id = "txtBLEName")
	private WebElement blenametxt;

	@FindBy(id = "txtlatitute")
	private WebElement latitudetxt;

	@FindBy(id = "txtlongitute")
	private WebElement longitudetxt;

	@FindBy(id = "txtRadius")
	private WebElement radioustxt;

	@FindBy(xpath = "//*[@id='txtMACAdd']")
	private WebElement wifimactxt;

	@FindBy(xpath = "//*[@id='txtMACAdd']//input")
	private List<WebElement> wifimactxts;

	@FindBy(id = "txtAddress")
	private WebElement addresstxt;

	@FindBy(xpath = "//*[@name='cmnTxtSearch']")
	private WebElement searchTextBoxTitleBar1;

	public String createLocationMaster(String code, String name, String type, String bleCode, String bleName,
			String latitude, String longitude, String locationRadiusMeters, String wifiMAC, String address)
			throws InterruptedException {
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar1)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar1, code);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar1);
			Thread.sleep(1000);
			ArrayList<String> alllocationCode = new ArrayList<>();
			if (locationCodes.size() > 0) {
				for (int j = 0; j < locationCodes.size(); j++) {
					String locationCode = locationCodes.get(j).getText().toUpperCase();
					alllocationCode.add(locationCode);
					if (locationCode.equalsIgnoreCase(code.toUpperCase())) {
						locationCodes.get(j).click();
						break;
					}
				}
			}
			 logger.debug(alllocationCode);
			if (!alllocationCode.contains(code.toUpperCase())) {
				Thread.sleep(1000);
				addButtonClick();
				Thread.sleep(1000);
				element_Clear(codetxt);
				element_InputTextUsingActionClass(codetxt, code);
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_Clear(codetxt);
			element_InputTextUsingActionClass(codetxt, code);
		}
		Thread.sleep(2000);
		// Main Code
		if (type != null) {
			element_DropDownSelectByvisibleText(typeDD, type);
		}
		if (bleCode != null) {
			if (blecodetxt.isEnabled()) {
				element_Clear(blecodetxt);
				element_InputTextUsingActionClass(blecodetxt, bleCode);
			}
		}
		if (bleName != null) {
			if (blenametxt.isEnabled()) {
				element_Clear(blenametxt);
				element_InputTextUsingActionClass(blenametxt, bleName);
			}
		}
		if (latitude != null) {
			if (latitudetxt.isEnabled()) {
				element_Clear(latitudetxt);
				element_InputTextUsingActionClass(latitudetxt, latitude);
			}
		}
		if (longitude != null) {
			if (longitudetxt.isEnabled()) {
				element_Clear(longitudetxt);
				element_InputTextUsingActionClass(longitudetxt, longitude);
			}
		}
		if (locationRadiusMeters != null) {
			if (radioustxt.isEnabled()) {
				element_Clear(radioustxt);
				element_InputTextUsingActionClass(radioustxt, locationRadiusMeters);
			}
		}
		if (wifiMAC != null) {
			if (wifimactxt.isEnabled()) {
				String[] mac = wifiMAC.split(":");
				for (int i = 0; i < wifimactxts.size(); i++) {
					WebElement ele = wifimactxts.get(i);
					if (ele.isEnabled()) {
						element_Clear(ele);
						element_TextBoxToClickOnTab(ele);
						element_inputTextUsingActionClassCharacterOneByOne(ele, mac[i]);
					}
					Thread.sleep(1000);
				}
			}
		}
		if (address != null) {
			if (addresstxt.isEnabled()) {
				element_Clear(addresstxt);
				element_InputTextUsingActionClass(addresstxt, address);
			}
		}
		if (name != null) {
			element_Clear(nametxt);
			element_InputTextUsingActionClass(nametxt, name);
		}
		Thread.sleep(1000);
		saveButtonClick();
		String val = validationMessage2();
		return val;
	}

	public void verifyLocationName(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(nametxt);
		boolean expRes = true;
		if (element_isEnabled(searchTextBoxTitleBar1)) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Name: "+data.get("Name"));
				String name = data.get("Name");
				boolean actRes = false;
				element_Clear(searchTextBoxTitleBar1);
				element_InputTextUsingActionClass(searchTextBoxTitleBar1, name);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar1);
				Thread.sleep(1000);
				if (locationNames.size() > 0) {
					for (int i = 0; i < locationNames.size(); i++) {
						String locName = locationNames.get(i).getText().toUpperCase();
						if (locName.equalsIgnoreCase(name.toUpperCase())) {
							actRes = true;
							break;
						}
					}
				}
				reloadPageButtonClick();
				Thread.sleep(2000);
				Assert.assertEquals(actRes, expRes);
			}
		}
	}
}
