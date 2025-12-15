package PageObject.VisitorManagement;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class VisitComponentsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(VisitComponentsPO.class);
	public VisitComponentsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Mayank
	//************************************************************************
	// ***************ELEMENTS********************************************
	// ************************************************************************
	// Visitor Type
	@FindBy(xpath = "//*[@key='VisitorType']")
	private WebElement visitorTypeTab;
	
	@FindBy(id = "gvVisitorTypeaddBtn")
	private WebElement visitorTypeAddBtn;
	
	@FindBy(id = "Name")
	private WebElement typeNameTxt;
	
	@FindBy(id = "HashCode")
	private WebElement visitorTypeColorTxt;
	
	@FindBy(id = "Default")
	private WebElement typeDefaultFlag;
	
	@FindBy(xpath = "//*[@id='grid1']//*[@id='savebtn'][not(@hidden)]")
	private WebElement gridSaveBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitorType']//*[@name='cmnTxtSearch']")
	private WebElement searchBarVisitorType;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitorType']//table/tbody/tr/td[2]")
	private List<WebElement> visitorTypes;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitorType']//table/tbody/tr/td[5]/i[@title='Delete']")
	private List<WebElement> visitorTypesDeleteBtns;
	
	// Visit Type
	@FindBy(xpath = "//*[@key='VisitType']")
	private WebElement visitTypeTab;
	
	@FindBy(id = "gvVisitTypeaddBtn")
	private WebElement visitTypeAddBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitType']//*[@name='cmnTxtSearch']")
	private WebElement searchBarVisitType;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitType']//table/tbody/tr/td[2]")
	private List<WebElement> visitTypes;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVisitType']//table/tbody/tr/td[4]/i[@title='Delete']")
	private List<WebElement> visitTypesDeleteBtns;
	

	// Vehicle Type
	@FindBy(xpath = "//*[@key='VehicleType']")
	private WebElement vehicleTypeTab;
	
	@FindBy(id = "gvVehicleTypeaddBtn")
	private WebElement vehicleTypeAddBtn;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVehicleType']//*[@name='cmnTxtSearch']")
	private WebElement searchBarVehicleType;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVehicleType']//table/tbody/tr/td[2]")
	private List<WebElement> vehicleTypes;
	
	@FindBy(xpath = "//*[@id='div_grd_gvVehicleType']//table/tbody/tr/td[4]/i[@title='Delete']")
	private List<WebElement> vehicleTypesDeleteBtns;

	// Reader Config
	@FindBy(xpath = "//*[@key='ReaderConfig']")
	private WebElement readerConfigTab;
	
	@FindBy(id = "gvReaderConfigaddBtn")
	private WebElement readerConfigAddBtn;
	
	@FindBy(id = "FName")
	private WebElement readerConfigFieldNameDD;
	
	@FindBy(id = "ResponseTag")
	private WebElement readerConfigResponseTag;
	
	@FindBy(xpath = "//*[@id='div_grd_gvReaderConfig']//*[@name='cmnTxtSearch']")
	private WebElement searchBarReaderConfig;
	
	@FindBy(xpath = "//*[@id='div_grd_gvReaderConfig']//table/tbody/tr/td[3]")
	private List<WebElement> readerConfigs;
	
	@FindBy(xpath = "//*[@id='div_grd_gvReaderConfig']//table/tbody/tr/td[4]/i[@title='Delete']")
	private List<WebElement> readerConfigDeleteBtn;
	
	
	//************************************************************************
	// ***************Functions********************************************
	// ************************************************************************
	public void createVisitComponentsMainMethod(String component, Map<String, String> data) throws InterruptedException {
		switch (component) {
		case "Visitor Type":
			createVisitorType(data);
			break;
			
		case "Visit Type":
			createVisitType(data);
			break;
			
		case "Vehicle Type":
			createVehicleType(data);
			break;
			
		case "Reader Configuration":
			createReaderConfiguration(data);
			break;

		default:
			logger.debug("Defined component is not valid. --Mayank");
			break;
		}
	}
	
	// Visitor Type
	public void createVisitorType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(visitorTypeTab);
		Thread.sleep(1000);
		element_Click(visitorTypeAddBtn);
		if (data.get("Name") != null) {
			element_InputTextUsingActionClass(typeNameTxt, data.get("Name"));
		}
		if (data.get("ColorCode") != null) {
			element_InputTextUsingActionClass(visitorTypeColorTxt, "#"+data.get("ColorCode"));
		}
		if (data.get("Default") != null) {
			boolean default1 = Boolean.parseBoolean(data.get("Default"));
			if (default1==true) {
				if (!typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			}
			else {
				if (typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			}
		}
		Thread.sleep(1000);
		element_Click(gridSaveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Visit Type
	public void createVisitType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(visitTypeTab);
		Thread.sleep(1000);
		element_Click(visitTypeAddBtn);
		if (data.get("Name") != null) {
			element_InputTextUsingActionClass(typeNameTxt, data.get("Name"));
		}
		if (data.get("Default") != null) {
			boolean default1 = Boolean.parseBoolean(data.get("Default"));
			if (default1==true) {
				if (!typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			}
			else {
				if (typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			}
		}
		Thread.sleep(1000);
		element_Click(gridSaveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Vehicle Type
	public void createVehicleType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(vehicleTypeTab);
		Thread.sleep(1000);
		element_Click(vehicleTypeAddBtn);
		if (data.get("Name") != null) {
			element_InputTextUsingActionClass(typeNameTxt, data.get("Name"));
		}
		if (data.get("Default") != null) {
			boolean default1 = Boolean.parseBoolean(data.get("Default"));
			if (default1 == true) {
				if (!typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			} else {
				if (typeDefaultFlag.isSelected()) {
					element_Click(typeDefaultFlag);
				}
			}
		}
		Thread.sleep(1000);
		element_Click(gridSaveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Reader Configuration
	public void createReaderConfiguration(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(readerConfigTab);
		Thread.sleep(1000);
		element_Click(readerConfigAddBtn);
		if (data.get("VMSFieldName") != null) {
			element_DropDownSelectByvisibleText(readerConfigFieldNameDD, data.get("VMSFieldName"));
		}
		if (data.get("ResponseTag") != null) {
			element_InputTextUsingActionClass(readerConfigResponseTag, data.get("ResponseTag"));
		}
		Thread.sleep(1000);
		element_Click(gridSaveBtn);
		Assert.assertEquals(validationMessage(), "Saved Successfully");
	}
	
	// Delete
	public void deleteVisitComponentsMainMethod(String component, Map<String, String> data) throws InterruptedException {
		switch (component) {
		case "Visitor Type":
			deleteVisitorType(data);
			break;
			
		case "Visit Type":
			deleteVisitType(data);
			break;
			
		case "Vehicle Type":
			deleteVehicleType(data);
			break;
			
		case "Reader Configuration":
			deleteReaderConfig(data);
			break;

		default:
			logger.debug("Defined component is not valid. --Mayank");
			break;
		}
	}
	
	// Visitor Type
	public void deleteVisitorType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(visitorTypeTab);
		Thread.sleep(1000);
		String val = null;
		if (element_isEnabled(searchBarVisitorType))
		{	
			element_Clear(searchBarVisitorType);
			element_InputTextUsingActionClass(searchBarVisitorType, data.get("Name")); 
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchBarVisitorType);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitorTypes.size() > 0) {
				for (int j = 0; j < visitorTypes.size(); j++) {
					String tName = visitorTypes.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("Name"))) {
						visitorTypesDeleteBtns.get(j).click();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						val = validationMessage();
						Assert.assertEquals(val, "Deleted Successfully");
					}
				}
			}
			if (!allvisit.contains(data.get("Name"))) {
				val = "Visitor Type not found";
			}
		}
		else {
			val = "Visitor Type not found";
		}
	}
	
	// Visit Type
	public void deleteVisitType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(visitTypeTab);
		Thread.sleep(1000);
		String val = null;
		if (element_isEnabled(searchBarVisitType)) {
			element_Clear(searchBarVisitType);
			element_InputTextUsingActionClass(searchBarVisitType, data.get("Name"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchBarVisitType);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (visitTypes.size() > 0) {
				for (int j = 0; j < visitTypes.size(); j++) {
					String tName = visitTypes.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("Name"))) {
						visitTypesDeleteBtns.get(j).click();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						val = validationMessage();
						Assert.assertEquals(val, "Deleted Successfully");
					}
				}
			}
			if (!allvisit.contains(data.get("Name"))) {
				val = "Visit Type not found";
			}
		} else {
			val = "Visit Type not found";
		}
	}
	
	// Vehicle Type
	public void deleteVehicleType(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(vehicleTypeTab);
		Thread.sleep(1000);
		String val = null;
		if (element_isEnabled(searchBarVehicleType)) {
			element_Clear(searchBarVehicleType);
			element_InputTextUsingActionClass(searchBarVehicleType, data.get("Name"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchBarVehicleType);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (vehicleTypes.size() > 0) {
				for (int j = 0; j < vehicleTypes.size(); j++) {
					String tName = vehicleTypes.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("Name"))) {
						vehicleTypesDeleteBtns.get(j).click();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						val = validationMessage();
						Assert.assertEquals(val, "Deleted Successfully");
					}
				}
			}
			if (!allvisit.contains(data.get("Name"))) {
				val = "Vehicle Type not found";
			}
		} else {
			val = "Vehicle Type not found";
		}
	}
	
	// Reader Config
	public void deleteReaderConfig(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(readerConfigTab);
		Thread.sleep(1000);
		String val = null;
		if (element_isEnabled(searchBarReaderConfig)) {
			element_Clear(searchBarReaderConfig);
			element_InputTextUsingActionClass(searchBarReaderConfig, data.get("ResponseTag"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchBarReaderConfig);
			Thread.sleep(1000);
			ArrayList<String> allvisit = new ArrayList<>();
			if (readerConfigs.size() > 0) {
				for (int j = 0; j < readerConfigs.size(); j++) {
					String tName = readerConfigs.get(j).getText();
					allvisit.add(tName);
					if (tName.equalsIgnoreCase(data.get("ResponseTag"))) {
						readerConfigDeleteBtn.get(j).click();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						val = validationMessage();
						Assert.assertEquals(val, "Deleted Successfully");
					}
				}
			}
			if (!allvisit.contains(data.get("ResponseTag"))) {
				val = "Vehicle Type not found";
			}
		} else {
			val = "Vehicle Type not found";
		}
	}
	
}
