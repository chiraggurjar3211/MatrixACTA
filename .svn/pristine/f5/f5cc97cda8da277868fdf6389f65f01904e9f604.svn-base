package PageObject.CSSLogin;

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

public class CssWorkerAssignmentPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(CssWorkerAssignmentPO.class);
	
	public CssWorkerAssignmentPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//**********************************************************************************************
	//**************** Elements *******************************************************************
	//*********************************************************************************************
	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]")
	private List<WebElement> workorderIDs;
	
	@FindBy(id = "_FromDate")
	private WebElement ValidityFrmDt;
	
	@FindBy(id = "_AssignmentStartDatedp")
	private WebElement startDateTxt;
	
	@FindBy(id = "_AssignmentEndDatedp")
	private WebElement endDateTxt;
	
	@FindBy(id = "CWMFreeWorkersAccName")
	private WebElement workerNameTxt;
	
	@FindBy(xpath = "//*[text()=\"Current Assignment\"]/ancestor::a[@class='collapsed' ]")
	private List<WebElement> currentAssignmentPanelOpenOrNot;
	
	@FindBy(xpath = "//*[text()='Current Assignment']")
	private WebElement currentAssignmentsPanel;
	
	@FindBy(xpath = "//*[text()=\"Unregistered Workers\"]/ancestor::a[@class='collapsed' ]")
	private List<WebElement> unregisteredWorkersPanelOpenOrNot;
	
	@FindBy(xpath = "//*[text()='Unregistered Workers']")
	private WebElement unregisteredWorkersPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom collapsible-panel-display-none show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement unregisteredWorkersPanelSearchBar;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom collapsible-panel-display-none show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> unregisteredWorkerRow;
	
	//**********************************************************************************************
	//**************** Functions *******************************************************************
	//*********************************************************************************************
	public String workerAssignmentFromCSS(String workorderID, List<Map<String, String>> data) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(ValidityFrmDt);
		String msg = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, workorderID);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workorderIDs.size() > 0) {
				for (int j = 0; j < workorderIDs.size(); j++) {
					String id1 = workorderIDs.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(workorderID)) {
						workorderIDs.get(j).click();
						Thread.sleep(1000);
						
						if (currentAssignmentPanelOpenOrNot.size()==1) {
							element_Click(currentAssignmentsPanel);
						}
						
						// Assignment
						for (int i = 0; i < data.size(); i++) {
							String startDate = staticDateOrPlusMinusFromCurrentDate(data.get(i).get("StartDate"));
							String endDate = staticDateOrPlusMinusFromCurrentDate(data.get(i).get("EndDate"));
							String workerName = data.get(i).get("WorkerName");
							Thread.sleep(1000);
							if (startDate != null) {
								logger.info("StartDate: "+startDate);
								element_Clear(startDateTxt);
								element_InputTextUsingActionClass(startDateTxt, startDate);
							}
							if (endDate != null) {
								logger.info("EndDate: "+endDate);
								element_Clear(endDateTxt);
								element_InputTextUsingActionClass(endDateTxt, endDate);
							}
							if (workerName != null) {
								logger.info("WorkerName: "+workerName);
								element_Clear(workerNameTxt);
								element_InputTextUsingActionClass(workerNameTxt, workerName);
								element_TextBoxToClickOnTab(workerNameTxt);
							}
							Thread.sleep(1000);
						}
						saveButtonClick();
						msg = validationMessage();
						break;
					}
				}
			}
			//logger.debug(ar);
			if (!ar.contains(workorderID)) {
				msg = "WorkOrder doesn't exist";
			}
		}
		else {
			msg = "WorkOrder doesn't exist";
		}
		return msg;
	}
	
	// Mayank
	public void verifyUnregisteredWorkers(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String workorderID = data.get("WorkOrderID");
		String workerName = data.get("WorkerName");
		String msg = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, workorderID);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			ArrayList<String> ar = new ArrayList<>();
			if (workorderIDs.size() > 0) {
				for (int j = 0; j < workorderIDs.size(); j++) {
					String id1 = workorderIDs.get(j).getText();
					ar.add(id1);
					if (id1.equalsIgnoreCase(workorderID)) {
						workorderIDs.get(j).click();
						Thread.sleep(1000);
						// Unregistred worker check
						if (unregisteredWorkersPanelOpenOrNot.size() == 1) {
							element_Click(unregisteredWorkersPanel);
						}
						Thread.sleep(1000);
						if (!element_isEnabled(unregisteredWorkersPanelSearchBar)) {
							msg = "Worker is not displayed in Unregistered Workers";
						} else {
							element_Clear(unregisteredWorkersPanelSearchBar);
							element_InputTextUsingActionClass(unregisteredWorkersPanelSearchBar, workerName);
							element_TextBoxToClickOnEnter(unregisteredWorkersPanelSearchBar);
							Thread.sleep(1000);
							if (unregisteredWorkerRow.size() > 0) {
								msg = "Worker displayed in Unregistered Workers Panel";
							} else {
								msg = "Worker is not displayed in Unregistered Workers";
							}
						}
					}
				}
			}
			// logger.debug(ar);
			if (!ar.contains(workorderID)) {
				msg = "WorkOrder doesn't exist";
			}
		} else {
			msg = "WorkOrder doesn't exist";
		}
		Assert.assertEquals(msg, "Worker displayed in Unregistered Workers Panel");
	}
	
}
