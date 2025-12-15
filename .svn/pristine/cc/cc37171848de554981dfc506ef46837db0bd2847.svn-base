package PageObject.UserModule;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class HealthDeclarationPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(HealthDeclarationPO.class);

	public HealthDeclarationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// elements
	@FindBy(id = "PLSelfDeclareUserID")
	private WebElement userIdTxt;

	@FindBy(id = "PLSelfDeclareUserName")
	private WebElement nameTxt;

	@FindBy(id = "_txtDeclarationDate")
	private WebElement dateTxt;

	@FindBy(id = "txtTemperature")
	private WebElement temperatureTxt;

	@FindBy(id = "sym_+1")
	private WebElement feverChk;

	@FindBy(xpath = "//*[@key='btnSubmit']")
	private WebElement submitBtn;

	///////////////

	public void healthDeclaration(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(userIdTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserId: " + data.get("UserId"));
			String userId = data.get("UserId");
			String date = data.get("Date");
			String temperature = data.get("Temperature");
			String fever = data.get("Fever");
			String validation = data.get("Validation");
			String date1 = dateSelected(date);
			element_Clear(userIdTxt);
			element_InputTextUsingActionClass(userIdTxt, userId);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(500);
			if (!element_getInputControlValue(nameTxt).isBlank() || !element_getInputControlValue(nameTxt).isEmpty()) {
				element_Clear(dateTxt);
				element_InputTextUsingActionClass(dateTxt, date1);
				Thread.sleep(1000);
				System.out.println(date1);
				element_TextBoxToClickOnTab(dateTxt);
				element_Clear(temperatureTxt);
				element_InputTextUsingActionClass(temperatureTxt, temperature);
				element_TextBoxToClickOnTab(temperatureTxt);
				if (fever != null) {
					boolean fever1 = Boolean.parseBoolean(fever);
					if (fever1 == true) {
						if (element_isSelected(feverChk) != true) {
							element_Click(feverChk);
						}
					} else {
						if (element_isSelected(feverChk) == true) {
							element_Click(feverChk);
						}
					}
				}
				element_Click(submitBtn);
				String actValMsg = validationMessage();
				Assert.assertEquals(actValMsg, validation);
			} else {
				cancelButtonClick();
				Thread.sleep(1000);
			}
		}

	}
}
