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
import groovy.transform.Final;

public class WatchlistBlacklistPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(WatchlistBlacklistPO.class);
	public WatchlistBlacklistPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}

	// Mayank
	//****************************************************************
	//ELEMENTS
	//**************************************************************
	@FindBy(xpath = "(//*[contains(@class,'col-md-4 col-sm-4 removeRightPadding text-center activeToggleCursor')])[1]")
	private WebElement filterTotal;
	
	@FindBy(xpath = "//*[@class='col-md-4 col-sm-8 col-xs-12 grid']//table/tbody/tr/td[4]")
	private List<WebElement> allVisitors;
	
	@FindBy(id = "btnRestore")
	private WebElement restoreBtn;
	
	@FindBy(id="txtWatch")
	private WebElement listedOn;
	
	@FindBy(xpath="//*[@class='col-md-4 col-sm-8 col-xs-12 grid']//table/tbody/tr/td[3]")
	private List<WebElement> vstrNameT;
	
	
	//****************************************************************
	// FUNCTIONS
	// **************************************************************
	public void restorVisitorFromWatchlistBlacklist(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Click(filterTotal);
		ArrayList<String> allvisit = new ArrayList<>();
		if (allVisitors.size() > 0) {
			for (int j = 0; j < allVisitors.size(); j++) {
				String tName = allVisitors.get(j).getText();
				allvisit.add(tName);
				if (tName.equalsIgnoreCase(data.get("VMobile"))) {
					logger.debug("Visitor found, Mobile No = "+data.get("VMobile"));
					allVisitors.get(j).click();
					Thread.sleep(1000);
					cancelButtonClick();
					element_Click(restoreBtn);
					Assert.assertEquals(validationMessage2(), "Restored Successfully");
				}
			}
		}
		else {
			logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
			Assert.assertEquals("Visitor is not added in Watchlist or Blacklist", "Restored Successfully");
		}
		if (!allvisit.contains(data.get("VMobile"))) {
			logger.debug("Visitor not found, Mobile No = "+data.get("VMobile"));
			Assert.assertEquals("Visitor is not added in Watchlist or Blacklist", "Restored Successfully");
		}
	}
	
	public String getWatchBlackDetails(String visitorNae) throws Exception {
		pageLoadWaitng();
		String val=null;
		waitForElementVisible(listedOn);
		for(int i=0;i<vstrNameT.size();i++) {
			if(vstrNameT.get(i).getText().equalsIgnoreCase(visitorNae)) {
				vstrNameT.get(i).click();
				Thread.sleep(1000);
				String da=element_getInputControlValue(listedOn);
				val=da.substring(0, da.length()-3);

			}
		}
	return val;
	}
	
}
