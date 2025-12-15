package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssDailyAttendence_TemplatePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssDailyAttendence_TemplatePO.class);
	
	public EssDailyAttendence_TemplatePO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@gridname='gridTemplateList']//tbody/tr/td[not (@hidden)][2]")
	private List<WebElement> listoftemplate;

	@FindBy(id = "cmnBtnTxtSearch")
	private WebElement search;
	
	@FindBy(xpath = "//*[@class='cursor iconsize fa fa-search']")
	private WebElement searchIcon;
	
	@FindBy(id = "chkDefault")
	private WebElement defaultTemplate;

	@FindBy(id = "btnSave")
	private WebElement saveBtn;

	@FindBy(xpath = "//*[@class=\"overlay_success\"]/label")
	private WebElement alert;

	public void validationoftemplate(DataTable dataTable) throws Exception {
		pageLoadWaitng();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Name: "+data.get("Name"));
			String name = data.get("Name");
			String defaultS = data.get("default");
			String validate = data.get("Validate");
			element_Click(search);
			element_Clear(search);
			element_InputTextUsingActionClass(search, name);
			Thread.sleep(1000);
			element_TextBoxToClickOnEnter(search);
			Thread.sleep(1000);
			List<String> listName = new ArrayList<>();
			for (int i = 0; i < listoftemplate.size(); i++) {
				listName.add(listoftemplate.get(i).getText().toUpperCase());
			}
			System.out.println(listName);
			if (listName.contains(name.toUpperCase())) {
				Assert.assertEquals("Displayed", validate );
				for (int i = 0; i < listoftemplate.size(); i++) {
					if (listoftemplate.get(i).getText().equalsIgnoreCase(name)) {
						element_Click(listoftemplate.get(i));
						Thread.sleep(1000);
						if (defaultS != null) {
							if (defaultS.equalsIgnoreCase("true")) {
								if (defaultTemplate.isSelected() != true) {
									element_Click(defaultTemplate);
								}
							} else {
								if (defaultTemplate.isSelected() == true) {
									element_Click(defaultTemplate);
								}
							}
						}
						Thread.sleep(1000);
						element_Click(saveBtn);
						Thread.sleep(1000);
						Assert.assertEquals(validationMessage(), "Saved Successfully");
					}
					break;
				}
			} else {
				Assert.assertEquals("Not Displayed", validate );
			}

		}

	}

}
