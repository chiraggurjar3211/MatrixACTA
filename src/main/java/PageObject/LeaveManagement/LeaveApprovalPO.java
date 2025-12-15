package PageObject.LeaveManagement;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class LeaveApprovalPO extends AbstractMethod {
	WebDriver driver;

	public LeaveApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	
	@FindBy(id = "filtered")
	private WebElement dateFilterBtn;

	@FindBy(id = "_FromDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_ToDate")
	private WebElement toDateTxt;

	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;

	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;

	// Pending Collapsible Panel
	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> pendingPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Pending')]/ancestor::a")
	private WebElement pendingPanel;

	@FindBy(xpath = "//*[@id='collapseOne']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTableUserIdXpath;

	@FindBy(xpath = "//*[@id='collapseOne']//*[@name='cmnTxtSearch']")
	private WebElement searchBoxPendingPanel;

	// Approved Collapsible Panel
	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Approved')]/ancestor::a")
	private WebElement approvedPanel;

	@FindBy(xpath = "//*[@id='collapseTwo']//*[@name='cmnTxtSearch']")
	private WebElement searchBoxApprovedPanel;

	@FindBy(xpath = "//*[@id='collapseTwo']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> approvedTableUserIdXpath;

	// Rejected Collapsible Panel
	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]/ancestor::a")
	private WebElement rejectedPanel;

	@FindBy(xpath = "//*[@id='collapseThree']//*[@name='cmnTxtSearch']")
	private WebElement searchBoxRejectedPanel;

	@FindBy(xpath = "//*[@id='collapseThree']//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> rejectedTableUserIdXpath;
	
	
	
	
	
	// Created by Mayank
	// Leave Approval/Rejection via API
		public String leaveApprovalAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data, String tid) {
			String apiPar=null;

					if (columnHeader.contains("Action")) {
						if (data.get("Action")!=null) {
							apiParameter.add("Action="+data.get("Action"));
						}
					}
					apiParameter.add("tid="+tid);
					if (columnHeader.contains("approved")) {
						if (data.get("approved")!=null) {
						apiParameter.add("approved="+data.get("approved"));
						}
					}
					if (columnHeader.contains("remark")) {
						if (data.get("remark")!=null) {
						apiParameter.add("remark="+data.get("remark"));
						}
					}
					
			return apiPar;
		}
		
		public void approvalOfLeave(String fromDtHeader, String toDtHeader, String user, String fromDate, String toDate, String approve, String reject,
				String panelName, String validation) throws InterruptedException {
			waitForElementVisible(fromDateTxt);
			element_Click(dateFilterBtn);
			String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDtHeader);
			String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDtHeader);
			element_Clear(fromDateTxt);
			element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
			element_TextBoxToClickOnTab(fromDateTxt);
			element_Clear(toDateTxt);
			element_InputTextUsingActionClass(toDateTxt, convertToDt);
			element_TextBoxToClickOnTab(toDateTxt);
			element_Click(viewBtn);
			Thread.sleep(1000);
			String convertedFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
			String convertedToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
			String valMsg = null;
			if (panelName != null) {
				if (panelName.equalsIgnoreCase("Approved")) {
					if (approvedPanelOpenOrNot.size() > 0) {
						element_Click(approvedPanel);
					}
					if (element_isEnabled(searchBoxApprovedPanel)) {
						element_Clear(searchBoxApprovedPanel);
						element_InputTextUsingActionClass(searchBoxApprovedPanel, user);
						element_TextBoxToClickOnEnter(searchBoxApprovedPanel);
						Thread.sleep(1000);
					}

				} else if (panelName.equalsIgnoreCase("Rejected")) {
					if (rejectedPanelOpenOrNot.size() > 0) {
						element_Click(rejectedPanel);
					}
					if (element_isEnabled(searchBoxRejectedPanel)) {
						element_Clear(searchBoxRejectedPanel);
						element_InputTextUsingActionClass(searchBoxRejectedPanel, user);
						element_TextBoxToClickOnEnter(searchBoxRejectedPanel);
						Thread.sleep(1000);
					}
				}

			} else {
				element_Clear(searchBoxPendingPanel);
				// Thread.sleep(500);
				element_InputTextUsingActionClass(searchBoxPendingPanel, user);
				element_TextBoxToClickOnEnter(searchBoxPendingPanel);
				Thread.sleep(1000);
			}
			for (int i = 0; i < allPanelTableUserIdXpath.size(); i++) {
				String getUserID = allPanelTableUserIdXpath.get(i).getText();
				String getFromDate = allPanelTableUserIdXpath.get(i)
						.findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][2]")).getText();
				if (getFromDate.length() > 10) {
					String[] splitGetFromDate = getFromDate.split(" ");
					getFromDate = splitGetFromDate[0];
				}
				String getToDate = allPanelTableUserIdXpath.get(i)
						.findElement(By.xpath("following-sibling::td[4]")).getText();
				if (getToDate.length() > 10) {
					String[] splitGetToDate = getToDate.split(" ");
					getToDate = splitGetToDate[0];
				}
				if (getUserID.equalsIgnoreCase(user) && getFromDate.equalsIgnoreCase(convertedFromDate)
						&& getToDate.equalsIgnoreCase(convertedToDate)) {
					if (panelName != null) {
						if (panelName.equalsIgnoreCase("Approved") || panelName.equalsIgnoreCase("Rejected")) {
							if (approve != null) {
								boolean approve1 = Boolean.parseBoolean(approve);
								WebElement approveChk1 = allPanelTableUserIdXpath.get(i).findElement(
										By.xpath("following-sibling::td[11]//input"));
								if (approve1 == true) {
									if (element_isSelected(approveChk1) != true) {
										element_Click(approveChk1);
									}
								} else {
									if (element_isSelected(approveChk1) == true) {
										element_Click(approveChk1);
									}
								}
							}
							if (reject != null) {
								boolean reject1 = Boolean.parseBoolean(reject);
								WebElement rejectChk1 = allPanelTableUserIdXpath.get(i).findElement(
										By.xpath("following-sibling::td[12]//input"));
								if (reject1 == true) {
									if (element_isSelected(rejectChk1) != true) {
										element_Click(rejectChk1);
									}
								} else {
									if (element_isSelected(rejectChk1) == true) {
										element_Click(rejectChk1);
									}
								}
							}
						}
					} else {
						if (approve != null) {
							boolean approve1 = Boolean.parseBoolean(approve);
							WebElement approveChk1 = allPanelTableUserIdXpath.get(i).findElement(
									By.xpath("following-sibling::td[13]//input"));
							if (approve1 == true) {
								if (element_isSelected(approveChk1) != true) {
									element_Click(approveChk1);
								}
							} else {
								if (element_isSelected(approveChk1) == true) {
									element_Click(approveChk1);
								}
							}
						}
						if (reject != null) {
							boolean reject1 = Boolean.parseBoolean(reject);
							WebElement rejectChk1 = allPanelTableUserIdXpath.get(i).findElement(
									By.xpath("following-sibling::td[14]//input"));
							if (reject1 == true) {
								if (element_isSelected(rejectChk1) != true) {
									element_Click(rejectChk1);
								}
							} else {
								if (element_isSelected(rejectChk1) == true) {
									element_Click(rejectChk1);
								}
							}
						}
					}
					Thread.sleep(1000);
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, "Saved Successfully");
			reloadPageButtonClick();
			
		}
	
}
