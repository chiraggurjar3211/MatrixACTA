package PageObject.UserModule;

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
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ReportingGroupPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(ReportingGroupPO.class);

	public ReportingGroupPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class='col-md-4 col-sm-4 col-xs-12 grid']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> grpnames;

	@FindBy(id = "ReportingGroupName")
	private WebElement reportingGroupName;

	@FindBy(id = "ApprovalPolicyID")
	private WebElement approvalPolicyID;

	@FindBy(id = "ApprovalPolicyName")
	private WebElement approvalPolicyName;

	@FindBy(id = "AutoIncharge1ID")
	private WebElement ric1;

	@FindBy(id = "AutoIncharge2ID")
	private WebElement ric2;

	@FindBy(id = "AutoIncharge3ID")
	private WebElement ric3;

	@FindBy(id = "AutoIncharge4ID")
	private WebElement ric4;

	@FindBy(id = "AutoIncharge5ID")
	private WebElement ric5;

	@FindBy(xpath = "//*[@id='message']/div/label")
	private List<WebElement> validationMessages;

	@FindBy(xpath = "//*[contains(@title,'Authorization mode irrespective')]")
	private WebElement infoIcon;

	@FindBy(xpath = "//*[@id=\"ApprovalPolicyName\"]/ancestor::div[@class=\"input-group input-group-sm\"]/span")
	private WebElement approvalPolicyPickListOpen;

	@FindBy(xpath = "//*[text()='Picklist For Approval Policy']")
	private WebElement policyPicklistOpen;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchbarPick;

	@FindBy(xpath = "//*[@class=\"modal-content\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> policyTable;

	public String createReportingGroup(String grpName, String policyID, String policyName, String r1, String r2,
			String r3, String r4, String r5) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		String val = null;
		waitForElementVisible(approvalPolicyID);
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_InputTextUsingActionClass(searchTextBoxTitleBar, grpName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (grpnames.size() > 0) {
				for (int j = 0; j < grpnames.size(); j++) {
					String plcname1 = grpnames.get(j).getText();
					if (plcname1.equalsIgnoreCase(grpName)) {
						grpnames.get(j).click();
						break;
					}
				}
			}
		}
		Thread.sleep(1500);
		if (addButton.isEnabled()) {
			Thread.sleep(1000);
			addButtonClick();
			Thread.sleep(1000);
			element_InputTextUsingActionClass(reportingGroupName, grpName);
		}
		if (policyID != null || policyName != null) {
			element_Click(approvalPolicyPickListOpen);
			Thread.sleep(1000);
			waitForElementVisible(policyPicklistOpen);
			Thread.sleep(700);
			if (policyID != null) {
				element_InputTextUsingActionClass(searchbarPick, policyID);
				Thread.sleep(500);
				element_TextBoxToClickOnEnter(searchbarPick);
				Thread.sleep(1000);
				for (int i = 0; i < policyTable.size(); i++) {
					if (policyTable.get(i).getText().equalsIgnoreCase(policyID)) {
						policyTable.get(i).click();
						break;
					}
				}
			} else {
				element_InputTextUsingActionClass(searchbarPick, policyName);
				Thread.sleep(500);
				element_TextBoxToClickOnEnter(searchbarPick);
				Thread.sleep(1000);
				for (int i = 0; i < policyTable.size(); i++) {
					if (policyTable.get(i).findElement(By.xpath("following-sibling::td[1]")).getText()
							.equalsIgnoreCase(policyName)) {
						policyTable.get(i).click();
						break;
					}
				}
			}
			Thread.sleep(1500);

		} else {
			element_Clear(approvalPolicyID);
			element_TextBoxToClickOnTab(approvalPolicyID);
			element_Clear(approvalPolicyName);
			element_TextBoxToClickOnTab(approvalPolicyID);
			element_Click(infoIcon);
		}
		Thread.sleep(1000);
		// for reporting incharge 1
		if (r1 != null) {
			element_Clear(ric1);
			element_InputTextUsingActionClass(ric1, r1);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		} else {
			element_Clear(ric1);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		}
		// if (r2!=null || !r2.isEmpty()) {
		if (r2 != null) {
			element_Clear(ric2);
			element_InputTextUsingActionClass(ric2, r2);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		} else {
			element_Clear(ric2);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		}
		if (r3 != null) {
			element_Clear(ric3);
			element_InputTextUsingActionClass(ric3, r3);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		} else {
			element_Clear(ric3);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		}
		if (r4 != null) {
			element_Clear(ric4);
			element_InputTextUsingActionClass(ric4, r4);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		} else {
			element_Clear(ric4);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		}
		if (r5 != null) {
			element_Clear(ric5);
			element_InputTextUsingActionClass(ric5, r5);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		} else {
			element_Clear(ric5);
			Thread.sleep(1000);
			element_Click(infoIcon);
			Thread.sleep(1000);
		}
		saveButtonClick();
		Thread.sleep(1000);
		if (validationMessages.size() == 0) {
			saveButtonClick();
		}
		val = validationMessage();
		return val;
	}

	public void verifyGroupName(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(reportingGroupName);
		boolean expRes = true;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("GroupName: " + data.get("GroupName"));
				String groupName = data.get("GroupName");
				boolean actRes = false;
				element_Clear(searchTextBoxTitleBar);
				element_InputTextUsingActionClass(searchTextBoxTitleBar, groupName);
				element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
				Thread.sleep(1000);
				if (grpnames.size() > 0) {
					for (int i = 0; i < grpnames.size(); i++) {
						String rGName = grpnames.get(i).getText();
						if (rGName.toUpperCase().equalsIgnoreCase(groupName.toUpperCase())) {
							actRes = true;
							break;
						}
					}
				}
				Assert.assertEquals(actRes, expRes);
			}
		}
	}

	// Chhaya
	public void deleteReportingGroup(String groupName) throws InterruptedException {
		pageLoadWaitng();
		// waitForElementVisible(reportingGroupName);
		String valmsg = null;
		if (element_isEnabled(searchTextBoxTitleBar)) {
			element_Clear(searchTextBoxTitleBar);
			element_InputTextUsingActionClass(searchTextBoxTitleBar, groupName);
			element_TextBoxToClickOnEnter(searchTextBoxTitleBar);
			Thread.sleep(1000);
			if (grpnames.size() > 0) {
				for (int i = 0; i < grpnames.size(); i++) {
					String rGName = grpnames.get(i).getText();
					if (rGName.toUpperCase().equalsIgnoreCase(groupName.toUpperCase())) {
						grpnames.get(i).click();
						deleteButtonClick();
						Thread.sleep(1000);
						driver.switchTo().alert().accept();
						Thread.sleep(1000);
						valmsg = validationMessage();
						break;
					}
				}
				Assert.assertEquals(valmsg, "Deleted Successfully");
			} else {
				element_Clear(searchTextBoxTitleBar);
				Thread.sleep(500);
			}
		}
	}
	
	
	// Mayank
	public void createUpdateReportingGroupViaAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data, String apid, Object rgid) {
		// if rgid null then we need to create RG and RGID is not null then we need to update
		if (rgid != null) {
			apiParameter.add("update");
			apiParameter.add("rg_id=" + rgid);
		} else {
			apiParameter.add("set");
		}
		if (columnHeader.contains("rg_name")) {
			if (data.get("rg_name") != null) {
				apiParameter.add("rg_name=" + data.get("rg_name"));
			}
		}
		if (columnHeader.contains("approval-policy-name")) {
			if (apid != null) {
				apiParameter.add("approval-policy-id=" + apid);
			}
		}
		if (columnHeader.contains("rg_incharge_1")) {
			if (data.get("rg_incharge_1") != null) {
				apiParameter.add("rg_incharge_1=" + data.get("rg_incharge_1"));
			} else {
				apiParameter.add("rg_incharge_1=");
			}
		}
		if (columnHeader.contains("rg_incharge_2")) {
			if (data.get("rg_incharge_2") != null) {
				apiParameter.add("rg_incharge_2=" + data.get("rg_incharge_2"));
			} else {
				apiParameter.add("rg_incharge_2=");
			}
		}
		if (columnHeader.contains("rg_incharge_3")) {
			if (data.get("rg_incharge_3") != null) {
				apiParameter.add("rg_incharge_3=" + data.get("rg_incharge_3"));
			} else {
				apiParameter.add("rg_incharge_3=");
			}
		}
		if (columnHeader.contains("rg_incharge_4")) {
			if (data.get("rg_incharge_4") != null) {
				apiParameter.add("rg_incharge_4=" + data.get("rg_incharge_4"));
			} else {
				apiParameter.add("rg_incharge_4=");
			}
		}
		if (columnHeader.contains("rg_incharge_5")) {
			if (data.get("rg_incharge_5") != null) {
				apiParameter.add("rg_incharge_5=" + data.get("rg_incharge_5"));
			} else {
				apiParameter.add("rg_incharge_5=");
			}
		}
		
	}
}
