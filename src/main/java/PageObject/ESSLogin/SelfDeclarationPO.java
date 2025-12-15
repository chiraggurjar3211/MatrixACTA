package PageObject.ESSLogin;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class SelfDeclarationPO extends AbstractMethod {
	WebDriver driver;

	public SelfDeclarationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_txtDeclarationDate")
	private WebElement dateTxt;

	@FindBy(id = "txtTemperature")
	private WebElement temperatureTxt;

	@FindBy(id = "sym_+1")
	private WebElement feverChk;

	@FindBy(xpath = "//*[@key='btnSubmit']")
	private WebElement submitBtn;

	@FindBy(xpath = "//*[@class='close']")
	private WebElement closeBtn;

	@FindBy(xpath = "//*[@class='close']")
	private List<WebElement> closeBtnSize;

	public void submitSelfDeclaration(String date, String temperature, String fever, String validation)
			throws InterruptedException {
		pageLoadWaitng();
		String date1 = dateSelected(date);
		Thread.sleep(500);
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, date1);
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
		Thread.sleep(1000);
		element_Click(submitBtn);
		Thread.sleep(1000);
		if (closeBtnSize.size() > 0) {
			element_Click(closeBtn);
			Thread.sleep(1000);
		}
		String actValMsg = validationMessage();
		Thread.sleep(1000);
		Assert.assertEquals(actValMsg, validation);
	}

}
