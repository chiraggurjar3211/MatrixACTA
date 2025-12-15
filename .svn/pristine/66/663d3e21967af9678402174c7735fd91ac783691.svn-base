package PageObject.CSSLogin;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class CssPO extends AbstractMethod{
	WebDriver driver;
	public CssPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(id = "Worker")
	private WebElement workerTab;
	
	@FindBy(id = "14006")
	private WebElement workerProfile;
	
	@FindBy(id = "14008")
	private WebElement workerAssignment;
	
	// Functions
	public void goToCSSworkerProfile() throws InterruptedException {
		element_Click(workerTab);
		Thread.sleep(1000);
		element_Click(workerProfile);
	}
	
	public void clickOnWorkerTab() {
		element_Click(workerTab);
	}
	
	public void goToCSSworkerAssignment() throws InterruptedException {
		element_Click(workerTab);
		Thread.sleep(1000);
		element_Click(workerAssignment);
	}
	
}
