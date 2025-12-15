package PageObject.ESSLogin;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssFieldVisitSchedulePO extends AbstractMethod {
	WebDriver driver;

	public EssFieldVisitSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "_txtPDate")
	private WebElement datetxt;

	@FindBy(xpath = "//*[@name=\"cosecForm\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> fieldVisitTable;

	public void validateEssFieldVisit(String date, String task, String locationGroup) throws InterruptedException {
		String actTask = null;
		String actLocationGroup = null;
		String actValue;
		String expValue;
		String currentDate = staticDateOrPlusMinusFromCurrentDate(date);
		waitForElementClickable(datetxt);
		String date1 = dateSelectedinddMMyyyy(date);
		// logger.debug("Date = "+date1);
		element_Clear(datetxt);
		element_InputText(datetxt, date1);
		Thread.sleep(1000);
		for (int i = 0; i < fieldVisitTable.size(); i++) {
			String colNm = fieldVisitTable.get(i).getText();
			// logger.debug("Col Value = "+colNm);
			if (colNm.contains(currentDate)) {
				WebElement scheTask = fieldVisitTable.get(i).findElement(By.xpath("following-sibling::td[1]"));
				WebElement scheLocationGroup = fieldVisitTable.get(i).findElement(By.xpath("following-sibling::td[2]"));
				actTask = scheTask.getText().toUpperCase();
				actLocationGroup = scheLocationGroup.getText().toUpperCase();
			}
		}
		Thread.sleep(1000);
		actValue = actTask + ", " + actLocationGroup;
		expValue = task.toUpperCase() + ", " + locationGroup.toUpperCase();
		Assert.assertEquals(actValue, expValue);
		Thread.sleep(1000);
	}

}
