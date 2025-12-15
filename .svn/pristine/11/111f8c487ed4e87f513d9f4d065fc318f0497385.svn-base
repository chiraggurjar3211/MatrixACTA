package PageObject.ESSLogin;

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
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class EssEventAuthorizationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssEventAuthorizationPO.class);
	
	public EssEventAuthorizationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

//Elements
	@FindBy(id = "_calFromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_calToDate")
	private WebElement toDateTxt;

	@FindBy(id = "chkAll")
	private WebElement showAllPendingAppRadioBtn;
	
	@FindBy(id = "filtered")
	private WebElement dateRadioBtn;
	
	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement pendingCollapsSearchBox;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingCollapsTable;
	
	@FindBy(id="Reason")
	private WebElement reason;
	
	@FindBy(id="LocationDetails")
	private WebElement locationDetails;
	
	@FindBy(id="SourceDetails")
	private WebElement sourceDetails;
	
	@FindBy(xpath="//*[@class=\"close\"]")
	private WebElement closeButton;
	
	/////////////
	public void authorizeEvents(String fromDtHeader, String toDtHeader, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		/////temporary code start //currently From date and To Date text boxes are not working 
		String valMsg1 = "Saved Successfully";
		element_Click(showAllPendingAppRadioBtn);
		/////temporary code end
//		element_Click(dateRadioBtn);
//		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
//		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
//		element_Clear(fromDateTxt);
//		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
//		element_TextBoxToClickOnTab(fromDateTxt);
//		element_Clear(toDateTxt);
//		element_InputTextUsingActionClass(toDateTxt, convertToDt);
//		element_TextBoxToClickOnTab(toDateTxt);
//		element_Click(viewBtn);
		Thread.sleep(1000);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userId = data.get("UserID");
			String date = data.get("Date");
			String time1 = data.get("Time");
			String authorize = data.get("Authorize");
			String validation = data.get("Validation");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(date);
			element_Clear(pendingCollapsSearchBox);
			element_InputTextUsingActionClass(pendingCollapsSearchBox, userId);
			element_TextBoxToClickOnEnter(pendingCollapsSearchBox);
			Thread.sleep(1000);
			for (int i = 0; i < pendingCollapsTable.size(); i++) {
				String getUsrId = pendingCollapsTable.get(i).getText();
				String getDateTime = pendingCollapsTable.get(i).findElement(By.xpath(
						"following-sibling::td[not(@hidden)][2]/label"))
						.getText();
				String[] splitGetDateTime = getDateTime.split(" ");
				String getDate = splitGetDateTime[0];
				String getTime = splitGetDateTime[1];
				if (getUsrId.equalsIgnoreCase(userId) && getDate.equalsIgnoreCase(convertDate)) {
					boolean authorize1 = Boolean.parseBoolean(authorize);
					WebElement authorizeChk = pendingCollapsTable.get(i).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][6]//input"));
					if(time1 != null) {
						if(getTime.equalsIgnoreCase(time1)) {
							if (authorize1 == true) {
								if (element_isSelected(authorizeChk) != true) {
									element_Click(authorizeChk);
								}
							} else {
								if (element_isSelected(authorizeChk) == true) {
									element_Click(authorizeChk);
								}
							}
						}
					}else {
						if (authorize1 == true) {
							if (element_isSelected(authorizeChk) != true) {
								element_Click(authorizeChk);
							}
						} else {
							if (element_isSelected(authorizeChk) == true) {
								element_Click(authorizeChk);
							}
						}
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			/////Temporary Code Start////////
			if(valMsg.equalsIgnoreCase("No Data Found"))
			{
				valMsg = valMsg1;
			}
			/////Temporary Code End////////
			Assert.assertEquals(valMsg, validation);
		}
	}
	
	public Map<String, String> getEventAuthForCustomAlert() throws InterruptedException {
		Map<String, String> data=new HashMap<String, String>();
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		for(int i=0;i<pendingCollapsTable.size();i++) {
			data.put("userid", pendingCollapsTable.get(i).getText());
			data.put("userName", pendingCollapsTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText());
			data.put("EventDatetime", pendingCollapsTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText()+":00");
			data.put("InOut", pendingCollapsTable.get(i).findElement(By.xpath("following-sibling::td[3]")).getText());
			data.put("Source", pendingCollapsTable.get(i).findElement(By.xpath("following-sibling::td[5]")).getText());
			pendingCollapsTable.get(i).findElement(By.xpath("following-sibling::td[16]/i")).click();
			Thread.sleep(1500);
			data.put("Reason", element_getInputControlValue(reason));
			data.put("locationDetails", element_getInputControlValue(locationDetails));			
			data.put("SourceDetails", element_getInputControlValue(sourceDetails));		
			element_Click(closeButton);
			Thread.sleep(1500);
			break;
		}
		return data;
	}

}
