package PageObject.ESSLogin;

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
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class EssEventPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssEventPO.class);
	
	public EssEventPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "_txtFrmDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_txtToDate")
	private WebElement toDateTxt;

	@FindBy(id = "btnView")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='div_grd_gvATD']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> atdEventsPanelTableXpath;

	@FindBy(xpath = "//*[contains(text(),'Attendance Events')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> attendanceEventsPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Attendance Events')]/ancestor::a")
	private WebElement attendanceEventsPanel;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement atdEventsCollapsSearchBox;
	
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class=\"pagination-next\"]")
	private WebElement paginationClickCollapsAtdEvents;
	
	@FindBy(xpath = "//*[@id='collapseOne']//*[@class=\"pagination-next\"]")
	private List<WebElement> paginationXpathCollapsAtdEvents;

	/////////////
	public void validateEvents(String panelName, String fromDate, String toDate, DataTable dataTable)
			throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDate);
		element_TextBoxToClickOnTab(toDateTxt);
		Thread.sleep(700);
		element_Click(viewBtn);
		Thread.sleep(1000);
		switch (panelName) {
		case "Attendance Events":
			if (attendanceEventsPanelOpenOrNot.size() > 0) {
				element_Click(attendanceEventsPanel);
				Thread.sleep(1000);
			}
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("Date: "+data.get("Date")+" Time: "+data.get("Time"));
				String date = data.get("Date");
				String time = data.get("Time");
				String io = data.get("I/O");
				String source = data.get("Source");
				String expStatus = data.get("Status");
				String convertedDate = staticDateOrPlusMinusFromCurrentDate(date);
				String convertedTime = null;
				String actStatus = null;
				if (time != null) {
					convertedTime = staticTimeOrPlusMinusMinutesFromCurrentTime(time);
				}
				element_Clear(atdEventsCollapsSearchBox);
				element_InputTextUsingActionClass(atdEventsCollapsSearchBox, convertedDate);
				element_TextBoxToClickOnEnter(atdEventsCollapsSearchBox);
				Thread.sleep(500);
				// code for pagination and all checkbox deselect
				int count = 0;
				int k = 0;
				do {
					Thread.sleep(1000);
					if (count != 0) {
						element_Click(paginationClickCollapsAtdEvents);
						Thread.sleep(1000);
					}
					///////////
					for (int i = 0; i < atdEventsPanelTableXpath.size(); i++) {
						String getDateTime = atdEventsPanelTableXpath.get(i).getText();
						String[] splitGetDateTime = getDateTime.split(" ");
						String getDate = splitGetDateTime[0];
						String getTime = splitGetDateTime[1];
						String getIO = atdEventsPanelTableXpath.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][1]/label"))
								.getText();
						String getSource = atdEventsPanelTableXpath.get(i).findElement(By.xpath(
								"following-sibling::td[not(@hidden)][3]/label"))
								.getText();
						if (convertedDate.equalsIgnoreCase(getDate) && io.equalsIgnoreCase(getIO)
								&& source.equalsIgnoreCase(getSource)) {
							k = k + 1;
							if (time != null) {
								if (convertedTime.equalsIgnoreCase(getTime)) {
									actStatus = atdEventsPanelTableXpath.get(i).findElement(By.xpath(
											"following-sibling::td[not(@hidden)][4]/label"))
											.getText();
									break;
								}
							} else {
								actStatus = atdEventsPanelTableXpath.get(i).findElement(By.xpath(
										"following-sibling::td[not(@hidden)][4]/label"))
										.getText();
								break;
							}
						}

					}
					/////////////
					Thread.sleep(500);
					if(k==1) {
						break;
					}
					count++;
					Thread.sleep(1000);
				} while (paginationXpathCollapsAtdEvents.size() != 0);
				Thread.sleep(1000);
				Assert.assertEquals(actStatus, expStatus);
			}
			break;
		default:
			break;
		}
	}
}
