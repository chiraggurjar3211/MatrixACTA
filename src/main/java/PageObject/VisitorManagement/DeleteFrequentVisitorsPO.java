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

public class DeleteFrequentVisitorsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(DeleteFrequentVisitorsPO.class);
	public DeleteFrequentVisitorsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	//***************************************************************
	//ELEMENTS******************************************************
	//******************************************************************
	@FindBy(id = "txtLoginID")
	private WebElement authorizeUserName;
	
	@FindBy(id = "txtPassword")
	private WebElement authorizePassword;
	
	@FindBy(xpath = "//*[@name='cmnTxtSearch']") 
	private WebElement searchbar;
	
	@FindBy(xpath = "//table/tbody/tr/td[6]") 
	private List<WebElement> vMobileList;
	
	@FindBy(xpath = "//*[@name='isMultiClick']") 
	private WebElement selectAllCheckbox;
	
	@FindBy(xpath = "//*[@default='Delete']") 
	private WebElement deleteBtn;
	
	@FindBy(id = "mdok")
	private WebElement okBtnConfirmation;
	
	
	//***************************************************************
	// FUNCTIONS******************************************************
	// ******************************************************************
	//By Mayank
	// Delete via API
	public String deletevisitorAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data, String vid) {
		String apiPar=null;
		
		apiParameter.add("visitor-id="+vid);
				
		return apiPar;
	}
	
	// Delete from Page
	public void deleteFrequentVisitors(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(authorizeUserName);
		element_InputTextUsingActionClass(authorizeUserName, "sa");
		element_Clear(authorizePassword);
		element_InputTextUsingActionClass(authorizePassword, "admin");
		Thread.sleep(1000);
		String val = null;
		if (element_isEnabled(searchbar)) {
			element_Clear(searchbar);
			element_InputTextUsingActionClass(searchbar, data.get("VMobile"));
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(searchbar);
			Thread.sleep(1000);
			ArrayList<String> allvisitor = new ArrayList<>();
			if (vMobileList.size() > 0) {
				for (int j = 0; j < vMobileList.size(); j++) {
					String tName = vMobileList.get(j).getText();
					allvisitor.add(tName);
					if (tName.equalsIgnoreCase(data.get("VMobile"))) {
						logger.debug("Visitor found, Mobile No = "+data.get("VMobile"));
						element_Click(selectAllCheckbox);
						Thread.sleep(1000);
						element_Click(deleteBtn);
						Thread.sleep(1500);
						element_Click(okBtnConfirmation);
						val = validationMessage();
						Assert.assertEquals(val, "Selected Visitors deleted successfully");
					}
				}
			}
			if (!allvisitor.contains(data.get("VMobile"))) {
				logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
			}
		}
		else {
			logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
		}
		
	}
}
