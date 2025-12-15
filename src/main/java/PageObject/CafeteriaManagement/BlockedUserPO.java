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

public class BlockedUserPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(BlockedUserPO.class);

	public BlockedUserPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "AutoBlockUserID")
	private WebElement userIdTxt;
	
	@FindBy(xpath = "//html")
	private WebElement blank;
	
	@FindBy(id = "txtBlockedFor")
	private WebElement blockedForTxt;
	
	@FindBy(id = "txtDayConsumption")
	private WebElement daysConsTxt;
	
	@FindBy(id = "TxtMaxUsagePerDay")
	private WebElement maxUsageLmtPerDayTxt;
	
	@FindBy(id = "txtMaxLmt")
	private WebElement maxUsageLmtPerMonth;
	
	@FindBy(xpath = "//*[@class='form-group' and not (@hidden)]//*[@id='txtBlockedFor']")
	private List<WebElement> dailylmtcheck;
	
	@FindBy(xpath = "//*[@class='form-group' and not (@hidden)]//*[@id='txtMaxLmt']")
	private List<WebElement> monthlylmtcheck;
	
	
	
	// COde
	public void verifyBlockedUser(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		element_Clear(userIdTxt);
		element_dynamicDDSelect(userIdTxt, data.get("Userid"));
		Thread.sleep(500);
		element_Click(blank);
		Thread.sleep(500);
		String val = null;
		if (validationMessagexpathsize.size()>0) {
			val = "No";
		} else {
			val = "Yes";
		}
		Assert.assertEquals(val, data.get("BlockedOrNot"));
		if (dailylmtcheck.size()>0) {
			Assert.assertEquals(blockedForTxt.getAttribute("value"), staticDateOrPlusMinusFromCurrentDate(data.get("BlockedFor")));
			Assert.assertEquals(daysConsTxt.getAttribute("value"), data.get("DaysConsumption"));
			Assert.assertEquals(maxUsageLmtPerDayTxt.getAttribute("value"), data.get("MaximumUsageLimitPerDay"));
		}
		if (monthlylmtcheck.size()>0) {
			Assert.assertEquals(maxUsageLmtPerMonth.getAttribute("value"), data.get("MaximumUsageLimitPerMonth"));
		}
		
	}

}
