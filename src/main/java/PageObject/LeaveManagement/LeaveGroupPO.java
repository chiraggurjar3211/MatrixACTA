package PageObject.LeaveManagement;

import java.time.Duration;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class LeaveGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LeaveGroupPO.class);
	public LeaveGroupPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);

	}

	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> lgnames;

	@FindBy(id = "LeaveGroupID")
	private WebElement leaveGroupID;

	@FindBy(id = "LeaveGroupName")
	private WebElement leaveGroupName;

	@FindBy(id = "chkProRata")
	private WebElement enableProRata;

	@FindBy(id = "LeaveID")
	private WebElement picklistLvID;

	@FindBy(id = "LeaveName")
	private WebElement leaveName;
	
	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessages;

	@FindBy(xpath = "//*[@class='col-xs-12 col-sm-12 col-lg-12']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][5]")
	private List<WebElement> groupMembersGridTbl;
	
	@FindBy(xpath="//*[@class='col-xs-12 col-sm-12 col-lg-12']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][1]/input")
	private List<WebElement> autoAdjustmentCheckB;
	
	public void createLeaveGroup(String lgName, String proRata, List<Map<String, String>> data)
			throws InterruptedException {
		waitForElementVisible(leaveGroupName);
		String val = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, lgName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(750);
			ArrayList<String> allLvGrpName = new ArrayList<>();
			if (lgnames.size() > 0) {
				for (int j = 0; j < lgnames.size(); j++) {
					String lgpnames = lgnames.get(j).getText();
					allLvGrpName.add(lgpnames);
					if (lgpnames.equalsIgnoreCase(lgName)) {
						lgnames.get(j).click();
						break;
					}
				}
			}
			// logger.debug(ar); 
			if (!allLvGrpName.contains(lgName)) {
				addButtonClick();
				element_Clear(leaveGroupName);
				element_InputTextUsingActionClass(leaveGroupName, lgName);
			}
		}
		// Main Part
		boolean proRata1 = Boolean.parseBoolean(proRata);
		if (proRata1 == true) {
			if (!enableProRata.isSelected()) {
				element_Click(enableProRata);
			}
		} else {
			if (enableProRata.isSelected()) {
				element_Click(enableProRata);
			}
		}
		// Add components in grid
		for (int i = 0; i < data.size(); i++) {
			logger.info("Leave Group Name: "+lgName+" LeaveID: "+data.get(i).get("LeaveID"));
			String lvID = data.get(i).get("LeaveID");
			String tourID = data.get(i).get("TourID");
			String autoAdjst = data.get(i).get("AutoAdjustment");//
			if(lvID != null) {
				element_Click(picklistLvID);
				Thread.sleep(250);
				element_dynamicDDSelect(picklistLvID, lvID);
//				element_TextBoxToClickOnTab(picklistLvID);
				
			}
			if(tourID != null) {
				element_Click(picklistLvID);
				Thread.sleep(250);
				element_dynamicDDSelect(picklistLvID, tourID);
//				element_TextBoxToClickOnTab(picklistLvID);
				
			}
			Thread.sleep(250);
			// Auto Adjustment Checkbox in the Grid
			if (autoAdjst != null) {
				for (int j = 0; j < groupMembersGridTbl.size(); j++) {
					String code = groupMembersGridTbl.get(j).getText().toUpperCase();
					if (code.equalsIgnoreCase(lvID.toUpperCase())) {
						for (int k = 0; k < autoAdjustmentCheckB.size(); k++) { 
							boolean autoAdjst1 = Boolean.parseBoolean(autoAdjst);
							if (autoAdjst1 == true) {
								if (autoAdjustmentCheckB.get(j).isSelected() != true) {
									autoAdjustmentCheckB.get(j).click();
								}
							} else {
								if (autoAdjustmentCheckB.get(j).isSelected() == true) {
									autoAdjustmentCheckB.get(j).click();
								}
							}
							break;
						}
						Thread.sleep(500);
					}
				}
			}
			if (validationMessages.size() > 0) {
				element_Click(validationMessageCloseButton);
			}
		}
		saveButtonClick();
		Thread.sleep(500);
		val = validationMessage();
		Assert.assertEquals(val, "Saved Successfully");
		
	}
}
