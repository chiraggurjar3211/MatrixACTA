package PageObject.ESSLogin;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class EssFieldVisitCorrectionPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(EssFieldVisitCorrectionPO.class);
	
	public EssFieldVisitCorrectionPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements

	@FindBy(id = "_txtPDate")
	private WebElement dateTxt;

	@FindBy(id = "punchcorrgridaddBtn")
	private WebElement plusButton;

	@FindBy(id = "_custEDate")
	private WebElement tableDateTxt;

	@FindBy(id = "custETime")
	private WebElement tableTimeTxt;

	@FindBy(id = "pickpunchLocationID")
	private WebElement tableLocationIdTxt;

	@FindBy(id = "comments")
	private WebElement tableCommentTxt;

	@FindBy(xpath = "//*[@id = \"savebtn\" and not(@hidden)]")
	private WebElement tableSaveBtn;

	@FindBy(xpath = "//*[@key='lblAppGridStatus']")
	private WebElement applicationDetailsTab;

	@FindBy(xpath = "//table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> applicationDetailsTable;
	
	@FindBy(id = "txtApplicationStatus")
	private WebElement statusTxt;
	
	@FindBy(id="txtApplicationReason")
	private WebElement txtApplicationReason;

	////////////
	public void essFieldVisitCorrection(DataTable dataTable,String applydate)
	throws InterruptedException {
		pageLoadWaitng();
		String date1 = dateSelectedinddMMyyyy(applydate);
		waitForElementClickable(dateTxt);
		element_inputTextUsingActionClassCharacterOneByOne(dateTxt, date1);
		element_TextBoxToClickOnTab(dateTxt);
		element_Click(txtApplicationReason);

		waitForElementDisable(dateTxt);
		element_Click(txtApplicationReason);
		waitForElementClickable(plusButton);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			Thread.sleep(2000);
			logger.info("Date: "+applydate+" Time: "+data.get("Time"));
		//String date = data.get("Date"); //verify this line
			String time = data.get("Time");
			String location = data.get("Location");
			String comment = data.get("Comment");
		//	String date2 = dateSelectedinddMMyyyy(applydate); //verify this line
			element_Click(plusButton);
			Thread.sleep(2000);
			element_Clear(tableDateTxt);
			element_InputTextUsingActionClass(tableDateTxt, date1);
			Thread.sleep(1000);

			if (tableTimeTxt.isEnabled()) {
				element_Clear(tableTimeTxt);
				element_inputTextUsingActionClassCharacterOneByOne(tableTimeTxt, time);
			}
			if (location != null) {
				if (tableLocationIdTxt.isEnabled()) {
					element_Clear(tableLocationIdTxt);
					element_InputTextUsingActionClass(tableLocationIdTxt, location);
					element_TextBoxToClickOnTab(tableLocationIdTxt);
				}
			}
			if (comment != null) {
				if (tableCommentTxt.isEnabled()) {
					element_Clear(tableCommentTxt);
					element_InputTextUsingActionClass(tableCommentTxt, comment);
				}
			}
			Thread.sleep(1000);
			element_Click(tableSaveBtn);
		}
		Thread.sleep(1000);;
		saveButtonClick();
		String val = validationMessage();
		Assert.assertEquals(val,"Saved Successfully");
	}

	public void validateEssFieldVisitCorrection(String date, String status) throws InterruptedException {
		String actualStatusValue=null;
		waitForElementClickable(dateTxt);
		String date1 = dateSelectedinddMMyyyy(date); //ddMMyyyy fomat
		element_Clear(dateTxt);
		element_InputTextUsingActionClass(dateTxt, date1);
		Thread.sleep(1000);
		waitForElementClickable(applicationDetailsTab);
		element_Click(applicationDetailsTab);
		Thread.sleep(2000);
		String currentDate = dateSelected(date); //dd/MM/yyyy format
		for (WebElement col : applicationDetailsTable) {
			String column1 = col.getText();
			if (column1.equalsIgnoreCase(currentDate)) {
				element_Click(col);
				Thread.sleep(1500);
				actualStatusValue = statusTxt.getAttribute("value");
				break;
			}
		}
		String[] actR=actualStatusValue.split(" ");
		Assert.assertEquals(actR[0].toUpperCase(), status.toUpperCase());
	}
}
