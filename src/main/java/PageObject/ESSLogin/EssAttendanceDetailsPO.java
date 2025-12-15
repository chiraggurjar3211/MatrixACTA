package PageObject.ESSLogin;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssAttendanceDetailsPO extends AbstractMethod {
	WebDriver driver;

	public EssAttendanceDetailsPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);

	}

	// Elements
	@FindBy(id = "_txtPDate")
	private WebElement atdDateTxt;

	@FindBy(xpath = "//*[@class=\"fa-sharp fa-regular fa-calendar\"]")
	private WebElement modifyDate;

	@FindBy(id = "cboDateSelection")
	private WebElement customDrop;

	@FindBy(xpath = "//*[@id=\"txtAlwMonth\" and @maxlength=\"2\"]")
	private WebElement periodTxt;

	@FindBy(id = "imgbtnOTDetail")
	private WebElement imgOTDetails;

	@FindBy(xpath = "//label[contains(text(),'Overtime Details For')]")
	private WebElement otDetailsLabel;

	@FindBy(xpath = "//*[@key='Close']")
	private WebElement closeBtn;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@class=\"form-group\"]//label")
	private List<WebElement> listOfOvertimeDetails;

	///////////////
	public void verifyOvertimeDetails(String atdDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(atdDateTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(atdDateTxt, staticDateOrPlusMinusFromCurrentDate("0"));
		element_Click(modifyDate);
		Thread.sleep(500);
		element_Click(customDrop);
		element_DropDownSelectByvisibleText(customDrop, "Custom Period");
		Thread.sleep(500);
		periodTxt.sendKeys(Keys.CONTROL + "a");
		periodTxt.sendKeys(Keys.DELETE);
		element_InputTextUsingActionClass(periodTxt, "99");
		Thread.sleep(1000);
		String dt1 = staticDateOrPlusMinusFromCurrentDate(atdDate);
		element_Clear(atdDateTxt);
		Thread.sleep(1000);
		element_InputTextUsingActionClass(atdDateTxt, dt1);
		Thread.sleep(1000);
		element_TextBoxToClickOnTab(atdDateTxt);
		Thread.sleep(2000);
		element_Click(imgOTDetails);
		pageLoadWaitng();
		waitForElementVisible(otDetailsLabel);
		List<String> headerD = new ArrayList<>();
		List<List<String>> header = dataTable.asLists();
		for (int i = 0; i < 1; i++) {
			for (int j = 0; j < header.get(i).size(); j++) {
				headerD.add(header.get(i).get(j));
			}
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			for (int j = 0; j < headerD.size(); j++) {
				for (int i = 0; i < listOfOvertimeDetails.size(); i++) {
					if (headerD.get(j).equalsIgnoreCase(listOfOvertimeDetails.get(i).getText())) {
						if (data.get(headerD.get(j)) != null) {
							Assert.assertEquals(listOfOvertimeDetails.get(i).findElement(By.xpath("following::input"))
									.getAttribute("value"), data.get(headerD.get(j)));
						} else {
							String actualV = listOfOvertimeDetails.get(i).findElement(By.xpath("following::input"))
									.getAttribute("value");
							if (actualV.isEmpty() == true) {
								actualV = null;
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							} else {
								Assert.assertEquals(actualV, data.get(headerD.get(j)));
							}
						}
					}
				}
			}
		}
		Thread.sleep(1000);
		element_Click(closeBtn);
		Thread.sleep(1000);
	}
}
