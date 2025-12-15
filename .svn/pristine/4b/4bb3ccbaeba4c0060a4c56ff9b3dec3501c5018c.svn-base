package PageObject.AdminModule;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class IdentificationServerConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public IdentificationServerConfigurationPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		// TODO Auto-generated constructor stub
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class=\"col-md-4 col-sm-4 col-xs-12 grid\"]//table/tbody/tr[1]/td")
	private List<WebElement> rightSideTableFirstData;

	@FindBy(id = "IdentificationConfigID")
	private WebElement idsID;

	public Map<String, String> getIDS1stDataGetForCustomAlert() throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(idsID);
		Map<String, String> data = new HashMap<String, String>();
		for (int i = 0; i < rightSideTableFirstData.size(); i++) {
			if (i == 0) {
				data.put("id", rightSideTableFirstData.get(i).getText());
			} else if (i == 1) {
				data.put("name", rightSideTableFirstData.get(i).getText());
			}
		}
		return data;
	}

}
