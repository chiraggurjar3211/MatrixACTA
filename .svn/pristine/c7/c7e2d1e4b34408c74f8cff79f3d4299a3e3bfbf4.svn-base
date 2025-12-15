package PageObject.AdminModule;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;


public class AlertViewPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(AlertViewPO.class);
	
	public AlertViewPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@default='View']")
	private WebElement viewButton;

	@FindBy(id = "_FromDate")
	private WebElement fromDate;

	@FindBy(xpath = "//*[@class='collapsed']")
	private WebElement filterPanel;

	@FindBy(id = "txtValue")
	private WebElement textBoxMailSMSEMAIL;

	@FindBy(id = "cboAlertType")
	private WebElement alertSMSorEmail;
	
	@FindBy(xpath="//table/thead/tr/th[3]")
	private WebElement datetimeClick;

	@FindBy(xpath = "//*[@id='sorting' and @class='fa fa-caret-down']")
	private WebElement sorting1;
	
	@FindBy(xpath = "//*[@id='sorting' and @class='fa fa-caret-down']")
	private List<WebElement> sorting1B;

	@FindBy(xpath = "//*[@id='sorting' and @class='fa fa-caret-up']")
	private WebElement sorting2;

	@FindBy(xpath = "//*[@default='Search']")
	private WebElement searchBar;
	
	@FindBy(id = "txtValue")
	private WebElement emailMobile;

	@FindBy(xpath = "//*[@class='table-responsive']//tbody//td[2]")
	private WebElement firstalert;

	@FindBy(id="test")
	private WebElement alertMessage;

	@FindBy(xpath = "//table/tbody/tr")
	private List<WebElement> countofSMSEMail;
	
	@FindBy(xpath="//table/tbody/tr/td[1]")
	private List<WebElement> emailIDsTable;
	
	@FindBy(xpath = "//*[@key='OK']")
	private WebElement okBtn;
	
	@FindBy(xpath = "//button[@class=\"close\"]")
	private WebElement closeB;
	
	
	@FindBy(id="test")
	private WebElement emailLogText;
	
	@FindBy(xpath="//*[@id='test']//a")
	private WebElement linkContent;
	
	// Created by Mayank
	public String getOTPFromAlertView(String credential) throws InterruptedException {
		waitForElementVisible(viewButton);
		pageLoadWaitng();
		element_ClickUsingJS(filterPanel);
		if (credential.contains("@")) {
			element_DropDownSelectByvisibleText(alertSMSorEmail, "Email");
		}
		element_InputTextUsingActionClass(emailMobile, credential);
		element_Click(viewButton);
//		Thread.sleep(1000);
//		element_Clear(searchBar);
//		element_InputTextUsingActionClass(searchBar, "your OTP for Login");
//		searchBar.sendKeys(Keys.ENTER);
		Thread.sleep(1000);
//		element_Click(sorting1);
//		element_Click(sorting2);
		while(sorting1B.size()==0) {
			element_Click(datetimeClick);
			Thread.sleep(1500);
		}
		element_Click(firstalert);
		Thread.sleep(1000);
		String alert = element_GetText(alertMessage);
		String[] alertmsg = alert.split(" ");
		String OTP = alertmsg[0];
		element_Click(okBtn);
		//int OTP = Integer.parseInt(OTP1);
		return OTP;
	}

	public void countCheckForAlert(List<Map<String, String>> data) throws InterruptedException {

		for (int i = 0; i < data.size(); i++) {
			String useridA=data.get(i).get("userid");
			String mobilenumberA=data.get(i).get("mobilenumber");
			String emailA=data.get(i).get("Email");
			String smsCountA=data.get(i).get("SMSCount");
			int expectedSMSCount=Integer.parseInt(smsCountA);
			String emailCountA=data.get(i).get("EmailCount");
			int expectedemailCountA=Integer.parseInt(emailCountA);
			
			logger.info("Userid: "+useridA);
			//Check SMS COunt
			int actualSMSCount=smsCountforAlert(mobilenumberA);
			Assert.assertEquals(actualSMSCount, expectedSMSCount);
			//Check email COunt
			int actualemailCount=emailCountforAlert(emailA);
			Assert.assertEquals(actualemailCount, expectedemailCountA);
			//Check whatsapp COunt
			if (data.get(i).get("WhatsappCount") != null) {
				String whatsappCountA=data.get(i).get("WhatsappCount");
				int expectedWhatsappCountA=Integer.parseInt(whatsappCountA);
				int actualwhatsappCount=whatsappCountforAlert(mobilenumberA);
				Assert.assertEquals(actualwhatsappCount, expectedWhatsappCountA);
			}
			
		}
	}
	
	public int smsCountforAlert(String mobileNum) throws InterruptedException {
		Thread.sleep(1000);
		reloadPageButtonClick();
		Thread.sleep(1000);
		String currentDateMinusOne = dateSelected("-1");
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, currentDateMinusOne);
		Thread.sleep(1000);
		element_Click(filterPanel);
		element_DropDownSelectByvisibleText(alertSMSorEmail, "SMS");
		Thread.sleep(1000);
		element_Clear(textBoxMailSMSEMAIL);
		element_InputTextUsingActionClass(textBoxMailSMSEMAIL,mobileNum);
		Thread.sleep(1000);
		element_Click(viewButton);
		Thread.sleep(1000);
		int size = countofSMSEMail.size();
		return size;
	}
	public int emailCountforAlert(String emal) throws InterruptedException {
		Thread.sleep(1000);
		reloadPageButtonClick();
		Thread.sleep(1000);
		String currentDateMinusOne = dateSelected("-1");
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, currentDateMinusOne);
		Thread.sleep(1000);
		element_Click(filterPanel);
		element_DropDownSelectByvisibleText(alertSMSorEmail, "Email");
		Thread.sleep(1000);
		element_Clear(textBoxMailSMSEMAIL);
		element_InputTextUsingActionClass(textBoxMailSMSEMAIL,emal);
		Thread.sleep(1000);
		element_Click(viewButton);
		Thread.sleep(1000);
		int size = countofSMSEMail.size();
		return size;
	}
	
	public int whatsappCountforAlert(String whatsapp) throws InterruptedException {
		Thread.sleep(1000);
		reloadPageButtonClick();
		Thread.sleep(1000);
		String currentDateMinusOne = dateSelected("-1");
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, currentDateMinusOne);
		Thread.sleep(1000);
		element_Click(filterPanel);
		element_DropDownSelectByvisibleText(alertSMSorEmail, "WhatsApp");
		Thread.sleep(1000);
		element_Clear(textBoxMailSMSEMAIL);
		element_InputTextUsingActionClass(textBoxMailSMSEMAIL,whatsapp);
		Thread.sleep(1000);
		element_Click(viewButton);
		Thread.sleep(1000);
		int size = countofSMSEMail.size();
		return size;
	}
	
	public String getUserEmailPasswordForCustom(String emal) throws InterruptedException {
		Thread.sleep(1000);
		reloadPageButtonClick();
		Thread.sleep(1000);
		String currentDateMinusOne = dateSelected("-1");
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, currentDateMinusOne);
		Thread.sleep(1000);
		element_Click(filterPanel);
		element_DropDownSelectByvisibleText(alertSMSorEmail, "Email");
		Thread.sleep(1000);
		element_Clear(textBoxMailSMSEMAIL);
		element_InputTextUsingActionClass(textBoxMailSMSEMAIL,emal);
		Thread.sleep(1000);
		element_Click(viewButton);
		Thread.sleep(1000);
		String mailContent=null;
		for(int i=0;i<emailIDsTable.size();i++) {
			if(emal.contains( emailIDsTable.get(i).getText().replaceAll(".", ""))) {
				emailIDsTable.get(i).findElement(By.xpath("following-sibling::td[1]")).click();
				Thread.sleep(1000);
				mailContent=element_GetText(emailLogText);
				//System.out.println(mailContent);
				element_Click(closeB);
				Thread.sleep(1000);
				break;
			}
		}
		return mailContent;
	}
	
	public String getLinkFromAlertView(String email) throws InterruptedException {
		Thread.sleep(1000);
		reloadPageButtonClick();
		Thread.sleep(1000);
		String currentDateMinusOne = dateSelected("-1");
		element_Clear(fromDate);
		element_InputTextUsingActionClass(fromDate, currentDateMinusOne);
		Thread.sleep(1000);
		element_Click(filterPanel);
		element_DropDownSelectByvisibleText(alertSMSorEmail, "Email");
		Thread.sleep(1000);
		element_Clear(textBoxMailSMSEMAIL);
		element_InputTextUsingActionClass(textBoxMailSMSEMAIL,email);
		Thread.sleep(1000);
		element_Click(viewButton);
		Thread.sleep(1000);
		String link=null;
		for(int i=0;i<emailIDsTable.size();i++) {
			if(email.contains( emailIDsTable.get(i).getText().replaceAll(".", ""))) {
				emailIDsTable.get(i).findElement(By.xpath("following-sibling::td[1]")).click();
				Thread.sleep(1000);
				link=linkContent.getAttribute("href");
				System.out.println(link);
				element_Click(closeB);
				Thread.sleep(1000);
				break;
			}
		}
		return link;
	}

}
