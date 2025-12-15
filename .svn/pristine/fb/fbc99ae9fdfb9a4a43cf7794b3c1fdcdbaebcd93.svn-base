package PageObject.ESSLogin;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;
import PageObject.PageObjectModel;
import io.cucumber.datatable.DataTable;

public class EssShiftChangeApplicationPO extends AbstractMethod {
	WebDriver driver;
	private PageObjectModel pom;
	private static Logger logger=LogManager.getLogger(EssShiftChangeApprovalPO.class);

	public EssShiftChangeApplicationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	//Elements
	
	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;
	
	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "AutoShiftID")
	private WebElement shiftIdTxt;
	
	@FindBy(id = "btnSave")
	private WebElement submitButton;
	
	@FindBy(xpath = "//*[contains(@class,'bordercolorForLeaveinfo ')]")
	private WebElement detailGrid;
	
	@FindBy(xpath = "//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> applicationTable;
	
	@FindBy(xpath = "//*[@id='div_grd_grdApprovalDetails']//table/tbody/tr//td[not(@hidden)][1]")
	private List<WebElement> approvalDetailsTable;

	@FindBy(xpath = "//button[@class=\"close\"]")
	private WebElement closeBtnAprvalDetailsPage;
	
	@FindBy(xpath="//*[@class=\"modal-dialog modal-lg\"]//*[@default=\"Shift Change Details\"]")
	private WebElement shiftChangeDetailsPopUp;
	////////////////////////////////////
	public void shiftChangeApplication(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		addButtonClick();
		waitForElementClickable(submitButton);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
			String shiftID = data.get("ShiftID");
			String validation = data.get("Validation");
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, fromDate);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, toDate);
			element_TextBoxToClickOnTab(toDateTxt);
			element_Clear(shiftIdTxt);
			element_dynamicDDSelect(shiftIdTxt, shiftID);
			element_TextBoxToClickOnTab(shiftIdTxt);
			element_Click(submitButton);
			String valMsg = validationMessage();
			Assert.assertEquals(validation, valMsg);
		}
	}

	public void verifyShChApprovalDetails(String fromDt, String toDt, DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String fromDate = staticDateOrPlusMinusFromCurrentDate(fromDt);
		String toDate = staticDateOrPlusMinusFromCurrentDate(toDt);
		element_Click(detailGrid);
		for(int i=0; i<applicationTable.size(); i++) {
			String fDate = applicationTable.get(i).getText();
			String tDate = applicationTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][1]")).getText();
			if(fromDate.equalsIgnoreCase(fDate) && toDate.equalsIgnoreCase(tDate)) {
				WebElement apprlStatus = applicationTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)]/i")); 
				element_Click(apprlStatus);
				waitForElementVisible(shiftChangeDetailsPopUp);
			}
		}
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("Incharge: "+data.get("Incharge")+" Status: "+data.get("Status"));
			String incharge = data.get("Incharge");
			String status = data.get("Status");
			String actStatus = null;
			String statusColumnValue = null;
			waitForElementVisible(approvalDetailsTable.get(0));
			for (int j = 0; j < approvalDetailsTable.size(); j++) {
				String ricName1 = approvalDetailsTable.get(j).getText();
				if (incharge.toUpperCase().equalsIgnoreCase(ricName1.toUpperCase())) {
					WebElement statusColumn = approvalDetailsTable.get(j).findElement(By.xpath(
							"following-sibling::td[not(@hidden)][1]"));
					try {
						if (statusColumn.findElement(By.tagName("img")) != null) {
							statusColumnValue = approvalDetailsTable.get(j).findElement(By.xpath(
									"following-sibling::td[not(@hidden)][1]//img[not(@hidden)]"))
									.getAttribute("src");
							if (statusColumnValue.contains("/Approved")) {
								actStatus = "Approved";
								break;
							} else if (statusColumnValue.contains("/Rejected")) {
								actStatus = "Rejected";
								break;
							} else if (statusColumnValue.contains("/Pending")) {
								actStatus = "Pending";
								break;
							} else {
								actStatus = "No Authorization";
								break;
							}
						}
					} catch (org.openqa.selenium.NoSuchElementException e) {
						actStatus = "No Authorization";
					}
				}
			}
			Assert.assertEquals(status, actStatus);
		}
		element_Click(closeBtnAprvalDetailsPage);
	}
	
	public void verifyShiftChangeAppStatus(DataTable dataTable) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		element_Click(detailGrid);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String actualStatus = null;
			String fromDate = staticDateOrPlusMinusFromCurrentDate(data.get("FromDate"));
			String toDate = staticDateOrPlusMinusFromCurrentDate(data.get("ToDate"));
			String expSatus = data.get("Status");
			for (int i = 0; i < applicationTable.size(); i++) {
				String fDate = applicationTable.get(i).getText();
				String tDate = applicationTable.get(i).findElement(By.xpath("following-sibling::td[not(@hidden)][1]")).getText();
				if (fromDate.equalsIgnoreCase(fDate) && toDate.equalsIgnoreCase(tDate)) {
					try {
						String statusImage = applicationTable.get(i)
								.findElement(By.xpath("following-sibling::td[not(@hidden)]/img"))
								.getAttribute("src");
						if (statusImage.contains("/Pending")) {
							actualStatus = "Pending";
							break;
						} else if (statusImage.contains("/Approved")) {
							actualStatus = "Approved";
							break;
						} else if (statusImage.contains("/Rejected")) {
							actualStatus = "Rejected";
							break;
						}
					} catch (org.openqa.selenium.NoSuchElementException e) {
						actualStatus = "No Authorization";
					}
				}
			}
			Assert.assertEquals(expSatus, actualStatus);
		}
	}
}
