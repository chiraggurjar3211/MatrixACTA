package PageObject.ShiftAndSchedule;

import java.util.HashMap;
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


public class ShiftChangeApplicationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ShiftChangeApplicationPO.class);

	public ShiftChangeApplicationPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
		// TODO Auto-generated constructor stub
	}

	@FindBy(id = "AutoAllUsersID")
	private WebElement userid;
	
	@FindBy(id = "AutoAllUsersName")
	private WebElement userName;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> applicationFromdateInTable;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/thead//th//label[text()='Shift Change Date']/ancestor::table/tbody/tr[not(@hidden)]/td[not(@hidden)]")
	private List<WebElement> shiftchangeDetails;

	@FindBy(xpath = "//*[@class=\"close\"]")
	private WebElement closeButton;

	public static Map<String, String> pendingshiftAppData = new HashMap<String, String>();

	public void getPendingApplicationDataForCustomMail(String user, String fdate) throws InterruptedException {
		String fromdateActual=null;
		pageLoadWaitng();
		waitForElementVisible(userid);
		element_InputTextUsingActionClass(userid, user);
		element_TextBoxToClickOnTab(userid);
		Thread.sleep(3000);
		pendingshiftAppData.put("UserName", element_getInputControlValue(userName));
		for (int i = 0; i < applicationFromdateInTable.size(); i++) {
			System.out.println(applicationFromdateInTable.get(i).getText());
			if (applicationFromdateInTable.get(i).getText().equalsIgnoreCase(fdate)) {
				String to=applicationFromdateInTable.get(i).findElement(By.xpath(
						"following-sibling::td[1]"))
						.getText();
				pendingshiftAppData.put("FromDate", fdate);
				pendingshiftAppData.put("Todate", to);
				fromdateActual=applicationFromdateInTable.get(i).getText();
				applicationFromdateInTable.get(i).click();
				Thread.sleep(1000);
				String applicatioDate = applicationFromdateInTable.get(i).findElement(By.xpath(
						"following-sibling::td[3]"))
						.getText();
				pendingshiftAppData.put("ApplicationDate", applicatioDate);
				applicationFromdateInTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][5]/i"))
						.click();
				Thread.sleep(2000);
				for (int j = 0; j < shiftchangeDetails.size(); j++) {
					if (j == 0) {
						pendingshiftAppData.put("ShiftChangeDate", shiftchangeDetails.get(j).getText());
					} else if (j == 1) {
						pendingshiftAppData.put("PreviousShift", shiftchangeDetails.get(j).getText());
					} else if (j == 2) {
						pendingshiftAppData.put("NewShift", shiftchangeDetails.get(j).getText());
					}
				}
				element_Click(closeButton);
				Thread.sleep(1000);
				break;
			}
		}
		if(fdate.equalsIgnoreCase(fromdateActual)) {
			Assert.assertEquals(fromdateActual, fdate);
		}
		else {
			logger.info("Shift Change Application From date not found!!!!!!!");
			Assert.assertEquals(fromdateActual, fdate);
		}
		
	}

}
