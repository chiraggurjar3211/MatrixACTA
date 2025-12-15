package PageObject.VisitorManagement;

import java.util.HashMap;
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
import groovy.transform.Final;
import io.opentelemetry.sdk.metrics.data.Data;

public class VisitApprovalPO extends AbstractMethod {
	WebDriver driver;

	public VisitApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "btnView")
	private WebElement viewButton;

	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]/*[contains(text(),'Pending')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> pendingTabOpenCount;

	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]/*[contains(text(),'Pending')]/ancestor::a")
	private WebElement pendingTab;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement pendingSearch;

	@FindBy(xpath = "//table[@id=\"grid1\"]/tbody/tr/td[not(@hidden)][3]")
	private List<WebElement> visitorsName;

	@FindBy(xpath = "//*[text()=\"Visit Application Details\"]")
	private WebElement popUpName;

	@FindBy(id = "VSTRMobile")
	private WebElement mobleNo;

	@FindBy(id = "Vdate")
	private WebElement visitSDate;

	@FindBy(id = "VisitUntillDate")
	private WebElement visitTDate;

	@FindBy(id = "cboRepeatMode")
	private List<WebElement> repeatModeSize;

	@FindBy(id = "cboRepeatMode")
	private WebElement repeatMode;

	@FindBy(id = "RepeatValueTemp")
	private WebElement repeatDays;

	@FindBy(id = "VisitStartTime")
	private WebElement visitSTime;

	@FindBy(id = "VisitEndTime")
	private WebElement visitETime;

	@FindBy(id = "STLName")
	private WebElement stName;

	@FindBy(xpath = "//*[@class=\"close\"]")
	private WebElement closeButton;

	// Mayank
	public void visitApprovalAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data,
			String appointmentid) {
		apiParameter.add("appointment-no=" + appointmentid);
		if (columnHeader.contains("user-type")) {
			if (data.get("user-type") != null) {
				apiParameter.add("user-type=" + data.get("user-type"));
			}
		}
		if (columnHeader.contains("verdict")) {
			if (data.get("verdict") != null) {
				apiParameter.add("verdict=" + data.get("verdict"));
			}
		}
		if (columnHeader.contains("transfer-host-id")) {
			if (data.get("transfer-host-id") != null) {
				apiParameter.add("transfer-host-id=" + data.get("transfer-host-id"));
			}
		}
	}

	public Map<String, String> visiotrDataGetForAlert(String visitorN) throws Exception {
		Map<String, String> data = new HashMap<String, String>();
		waitForElementClickable(viewButton);
		Thread.sleep(1500);
		element_Click(viewButton);
		Thread.sleep(1000);
		if (pendingTabOpenCount.size()>0) {
			element_Click(pendingTab);
		}
		element_InputTextUsingActionClass(pendingSearch, visitorN);
		element_TextBoxToClickOnEnter(pendingSearch);
		for (int i = 0; i < visitorsName.size(); i++) {
			if (visitorsName.get(i).getText().equalsIgnoreCase(visitorN)) {
				data.put("HostName",
						visitorsName.get(i).findElement(By.xpath("following-sibling::td[1]")).getText());
				visitorsName.get(i)
						.findElement(By.xpath("following-sibling::td[not(@hidden)]/i"))
						.click();
				Thread.sleep(1500);
				data.put("MobileNumber", element_getInputControlValue(mobleNo));
				data.put("VisitDate", element_getInputControlValue(visitSDate));
				data.put("VisitUntilDate", element_getInputControlValue(visitTDate));
				if (repeatModeSize.size() > 0) {
					String rMo = element_getInputControlValue(repeatMode);
					System.out.println("repeat mode" + rMo);
					if (rMo == null) {
						rMo = "Daily";
					}
					data.put("DailyWeekly", rMo);
					String dayss = element_getInputControlValue(repeatDays);
					System.out.println("repeat Days" + dayss);
					if (dayss != null) {
						String[] daysSplitwithComma = dayss.split(",");
						for (int j = 0; j < daysSplitwithComma.length; j++) {
							dayss = daysSplitwithComma[j].substring(0, 3);
						}
					}
					data.put("RepeatVisitDate", dayss);
				}
				else {
					data.put("DailyWeekly", "Daily");
					data.put("RepeatVisitDate", "");
				}
				data.put("VisitStartTime", element_getInputControlValue(visitSTime));
				data.put("VisitEndTime", element_getInputControlValue(visitETime));
				data.put("VisitStation", element_getInputControlValue(stName));
				Thread.sleep(1000);
				element_Click(closeButton);
				Thread.sleep(1000);
			}
		}
		return data;
	}
}
