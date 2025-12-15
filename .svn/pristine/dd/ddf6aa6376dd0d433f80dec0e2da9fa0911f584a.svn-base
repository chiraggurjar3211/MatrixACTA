package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
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


public class ApprovalStagesPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ApprovalStagesPO.class);
	
	public ApprovalStagesPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************************************************************
	//********** Elements *******************************************
	//***************************************************************
	
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> approvalStagesNames;
	
//	@FindBy(xpath = "//*[@title='Delete (Alt+L)']")
//	private WebElement deleteButton;
	
	@FindBy(id = "ApprovalStagesName")
	private WebElement nameTxt;
	
	// Panel Elements ******************************************************
	
	@FindBy(xpath = "//*[@class='collapsed']//*[@default='Induction Level Assignment']")
	private List<WebElement> inductionLevelAssignmentPanelOpenOrNot;
		
	@FindBy(xpath = "//*[@default='Induction Level Assignment']")
	private WebElement inductionLevelAssignmentPanel;
	
	@FindBy(xpath = "//*[@name='cosecPicklistBtnForm']//*[contains(@id,'autoLvl') and not(@name='pickListId')]")
	private List<WebElement> inductionLevelNames;
		
	@FindBy(xpath = "//*[@name='cosecServerPicklistBtnForm']//*[@name='pickListId']")
	private List<WebElement> inchargeIDs;
	
	@FindBy(xpath = "//*[@id='message']//label")
	private WebElement validationmsg;
	
	@FindBy(xpath = "//*[@id='message']//label")
	private List<WebElement> validationmsgs;
	
	//**************************************************************
	//***** Delete ************************************************
	//*************************************************************
	public void deleteApprovalStages(String name) throws InterruptedException {
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (approvalStagesNames.size() > 0) {
				for (int j = 0; j < approvalStagesNames.size(); j++) {
					String name1 = approvalStagesNames.get(j).getText();
					ar.add(name1);
					if (name1.equalsIgnoreCase(name)) {
						approvalStagesNames.get(j).click();
						Thread.sleep(1000);
						waitForElementVisible(deleteButton);
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						String valmsg = validationMessage();
						Assert.assertEquals(valmsg, "Deleted Successfully");
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(name)) {
				logger.debug("Approval stage is deleted successfully or not exist");
			}
		}
		else {
			logger.debug("Approval stage is deleted successfully or not exist");
		}
	}
	
	//**************************************************************
	//***** Create ************************************************
	//*************************************************************
	public void createApprovalStage(String name, List<Map<String, String>> data)throws InterruptedException{
		Thread.sleep(1000);
		if (element_isEnabled(searchTextBoxTitleBar))
		{
			element_InputTextUsingActionClass(searchTextBoxTitleBar, name);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (approvalStagesNames.size() > 0) {
				for (int j = 0; j < approvalStagesNames.size(); j++) {
					String name1 = approvalStagesNames.get(j).getText();
					ar.add(name1);
					if (name1.equalsIgnoreCase(name)) {
						approvalStagesNames.get(j).click();
					}
				}
			}
			if (!ar.contains(name)) {
				addButtonClick();
			}
		}
		else {
			Thread.sleep(1000);
			addButtonClick();
		}
		// Main Part
		Thread.sleep(1000);
		element_Clear(nameTxt);
		element_InputTextUsingActionClass(nameTxt, name);
		
		//****** Panel *************************************
		Thread.sleep(1000);
		if (inductionLevelAssignmentPanelOpenOrNot.size()>0) {
			element_Click(inductionLevelAssignmentPanel);
		}
		Thread.sleep(2000);
		for (int i = 0; i < data.size(); i++) { 
			String inductionLevelName = data.get(i).get("InductionLevelName");
			String approvingInChargeID = data.get(i).get("ApprovingInChargeID");
			WebElement indLevelNameEle = inductionLevelNames.get(i);
			WebElement inchargeIDEle = inchargeIDs.get(i);
			logger.info("InductionLevelName: "+inductionLevelName);
			element_Clear(indLevelNameEle);
			element_InputTextUsingActionClass(indLevelNameEle, inductionLevelName);
			Thread.sleep(1000);
			element_TextBoxToClickOnTab(indLevelNameEle);
			Thread.sleep(1000);
			if (approvingInChargeID != null) {
				logger.info("ApprovingInChargeID: "+approvingInChargeID);
				element_Clear(inchargeIDEle);
				element_InputTextUsingActionClass(inchargeIDEle, approvingInChargeID);
				element_TextBoxToClickOnTab(inchargeIDEle);
			}
			Thread.sleep(1000);
		}
		Thread.sleep(1000);
		saveButtonClick();
		Thread.sleep(4000);
		if (validationmsgs.size()==0) {
			saveButtonClick();
		}
		String val = validationmsg.getText();	
		Assert.assertEquals(val, "Saved Successfully");
	}
	
	
}
