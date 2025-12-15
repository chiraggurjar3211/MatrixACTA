package PageObject.JobProcessingCosting;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ProjectSummaryPO extends AbstractMethod
{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ProjectSummaryPO.class);
	public ProjectSummaryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "//*[@class='user-selection']//*[@class='control-label mx-input-theme isrequire label-text']")
	private WebElement projectLabel;
	
	public void verifyProjectSummaryFieldName(String fieldName) throws InterruptedException
	{
		logger.info("FieldName: "+fieldName);
		pageLoadWaitng();
		String lableName = projectLabel.getText();
		Assert.assertEquals(lableName, fieldName);
	}
}
