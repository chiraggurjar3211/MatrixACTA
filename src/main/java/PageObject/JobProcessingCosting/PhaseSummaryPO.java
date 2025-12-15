package PageObject.JobProcessingCosting;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;


public class PhaseSummaryPO extends AbstractMethod
{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(PhaseSummaryPO.class);
	public PhaseSummaryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@class='user-selection']//*[@class='control-label mx-input-theme isrequire label-text']")
	private WebElement phaseLabel;
	
	public void verifyPhaseSummaryFieldName(String fieldName) throws InterruptedException
	{
		logger.info("FieldName: "+fieldName);
		pageLoadWaitng();
		String lableName = phaseLabel.getText();
		Assert.assertEquals(lableName, fieldName);
	}
	
}
