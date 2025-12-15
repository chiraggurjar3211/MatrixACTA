package PageObject.ESSLogin;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class RicLeaveApplicationApprovalPO extends AbstractMethod {
	WebDriver driver;

	public RicLeaveApplicationApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elemets
	
	
	////////////////
	public void approveRejectApplication() {
		
	}
}
