package PageObject.TimeAndAttendance;

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
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;


public class BusRoutePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(BusRoutePO.class);
	
	public BusRoutePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "BusRouteName")
	private WebElement busRouteName;
	
	@FindBy(id = "chkActive")
	private WebElement busRouteActiveFlg;
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> busRouteNames;
	
	
	//Aagam
	public void createBusRoute(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, data.get("Name"));
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (busRouteNames.size() > 0) {
				for (int j = 0; j < busRouteNames.size(); j++) {
					String plcname1 = busRouteNames.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(data.get("Name"))) {
						busRouteNames.get(j).click();
						Thread.sleep(1000);
//						deleteButtonClick();
//						Thread.sleep(1000);
//						driver.switchTo().alert().accept();
//						Thread.sleep(1000);
//						String delVal = validationMessage();
//						Assert.assertEquals(delVal, "Deleted Successfully");
//						Thread.sleep(1000);
//						addButtonClick();
					}
				}
			}
			//logger.info(ar);
			if (!ar.contains(data.get("Name"))) {
				Thread.sleep(1000);
				addButtonClick();
			}
		} else {
			Thread.sleep(1000);
			addButtonClick();
		}
		
		// main code
		if (data.get("Name") != null) {
			element_Clear(busRouteName);
			element_InputTextUsingActionClass(busRouteName, data.get("Name"));
			element_TextBoxToClickOnTab(busRouteName);
		}
		
		if (data.get("busRouteActive") != null) {
			if(data.get("busRouteActive").equalsIgnoreCase("true")) {
				if(busRouteActiveFlg.isSelected() == false) {
					element_Click(busRouteActiveFlg);
				}
			}else{
				if(busRouteActiveFlg.isSelected() == true) {
					element_Click(busRouteActiveFlg);
				}
			}
		}
		
		Thread.sleep(3000);
		saveButtonClickUsingJS();
		String validationmsg = validationMessage();
		Assert.assertEquals(validationmsg, "Saved Successfully");
		validationMessageCloseButton.click();
	}
}
