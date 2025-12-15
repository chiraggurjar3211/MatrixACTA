package PageObject.JobProcessingCosting;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class UserJobDetailsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(UserJobDetailsPO.class);
	
	public UserJobDetailsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameterPanel;

	@FindBy(id = "cboGrpLvl")
	private WebElement dropClick;

	@FindBy(xpath = "//*[@id='cboGrpLvl']//option")
	private List<WebElement> groupByDropdownValues;

	public void verifyDropdownValue(String dropValue) throws InterruptedException {
		logger.info("DropdownValue: "+dropValue);
		String actualRes = null;
		Thread.sleep(2000);
		element_Click(optionalParameterPanel);
		Thread.sleep(1000);
		element_Click(dropClick);
		Thread.sleep(1000);
		for (WebElement dropVal : groupByDropdownValues) {
			String dropdownValue = dropVal.getText();
			if (dropdownValue.equalsIgnoreCase(dropValue)) {
				actualRes = dropVal.getText();
			}
		}
		Assert.assertEquals(actualRes, dropValue);
	}

}
