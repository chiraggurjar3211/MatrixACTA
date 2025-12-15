package PageObject.UserModule;

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
import io.cucumber.datatable.DataTable;

public class UserEventsPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(UserEventsPO.class);
	
	public UserEventsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	@FindBy(id = "_txtFrmDate")
	private WebElement fromDtTxt;
	
	@FindBy(id = "_txtToDate")
	private WebElement toDtTxt;
	
	@FindBy(id = "AutoUserID")
	private WebElement userIdTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@id=\"accordion_master\"]//*[@id=\"down1\"]//ancestor::div[1]//following-sibling::a[@aria-expanded=\"true\"]")
	private List<WebElement> atdEventsCollaps;
	
	@FindBy(xpath = "//*[contains(text(),'Attendance Events')]")
	private WebElement atdEventsCollapsClick;
	
	@FindBy(xpath = "//*[@id=\"div_grd_gvATD\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> atdEventsTable;
	
	@FindBy(xpath = "//*[@id=\"accordion_master\"]//*[@id=\"down3\"]//ancestor::div[1]//following-sibling::a[@aria-expanded=\"true\"]")
	private List<WebElement> acsControlCollaps;
	
	@FindBy(xpath = "//*[contains(text(),'Access Control Events')]")
	private WebElement acsControlCollapsClick;
	
	@FindBy(xpath = "//*[@id=\"div_grd_gvACS\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> acsEventsTable;
	
	/////////////
	
	public void verifyEventsFromUserEvents(String usrId, String fromDt, String toDt, DataTable dataTable) throws InterruptedException
	{
		pageLoadWaitng();
		waitForElementVisible(fromDtTxt);
		Boolean expMsg = true;
		String fDate = dateSelected(fromDt);
		String tDate = dateSelected(toDt);
		element_Clear(fromDtTxt);
		element_inputTextUsingActionClassCharacterOneByOne(fromDtTxt, fDate);
		//element_InputTextUsingActionClass(fromDtTxt, fDate);
		//element_TextBoxToClickOnTab(fromDtTxt);
		element_Clear(toDtTxt);
		element_inputTextUsingActionClassCharacterOneByOne(toDtTxt, tDate);
		//element_InputTextUsingActionClass(toDtTxt, tDate);
		//element_TextBoxToClickOnTab(toDtTxt);
		Thread.sleep(1000);
		element_Clear(userIdTxt);
		element_InputTextUsingActionClass(userIdTxt, usrId);
		element_TextBoxToClickOnTab(userIdTxt);
		Thread.sleep(1000);
		element_Click(viewBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("event-date: "+data.get("event-date")+" event-time: "+data.get("event-time"));
			String eventDate = data.get("event-date");
			String eventTime = data.get("event-time");
			String eventType = data.get("EventType");
			String eventDt = dateSelected(eventDate);
			String expDateTime = eventDt+" "+eventTime;
			String actDateTime = null;
			Boolean actMsg = false;
			String actDT = null;
			if(eventType.equalsIgnoreCase("Attendance Events"))
			{
				if (atdEventsCollaps.size() == 0) {
					element_Click(atdEventsCollapsClick);
					Thread.sleep(1000);
				}
				if(atdEventsTable.size()>0)
				{
					for(int i =0; i<atdEventsTable.size();i++)
					{
						String usrId1 = atdEventsTable.get(i).getText();
						if(usrId1.toUpperCase().equalsIgnoreCase(usrId.toUpperCase()))
						{
							WebElement dtTime = atdEventsTable.get(i)
									.findElement(By.xpath("following-sibling::td[2]"));
							String dateTime1 = dtTime.getText();
							if (dateTime1.contains(":")) {
								String[] dtTimeSplit = dateTime1.split(":");
								actDateTime = dtTimeSplit[0] + dtTimeSplit[1]+dtTimeSplit[2];
								if (actDateTime.equalsIgnoreCase(expDateTime)) {
									actDT = actDateTime;
									actMsg = true;
								}
							}
						}
					}
				}
			}
			if(eventType.equalsIgnoreCase("Access Control"))
			{
				if (acsControlCollaps.size() == 0) {
					element_Click(acsControlCollapsClick);
					Thread.sleep(1000);
				}
				if(acsEventsTable.size()>0)
				{
					for(int i =0; i<acsEventsTable.size();i++)
					{
						String usrId1 = acsEventsTable.get(i).getText();
						if(usrId1.toUpperCase().equalsIgnoreCase(usrId.toUpperCase()))
						{
							WebElement dtTime = acsEventsTable.get(i)
									.findElement(By.xpath("following-sibling::td[2]"));
							String dateTime1 = dtTime.getText();
							if (dateTime1.contains(":")) {
								String[] dtTimeSplit = dateTime1.split(":");
								actDateTime = dtTimeSplit[0] + dtTimeSplit[1]+dtTimeSplit[2];
								if (actDateTime.equalsIgnoreCase(expDateTime)) {
									actDT = actDateTime;
									actMsg = true;
								}
							}
						}
					}
				}
			}
			Thread.sleep(1000);
			Assert.assertEquals(actMsg, expMsg);
		}
	}
}
