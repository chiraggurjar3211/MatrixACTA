package PageObject.ESSLogin;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class EssLeaveApplicationApprovalPO extends AbstractMethod {
	WebDriver driver;

	public EssLeaveApplicationApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
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

	//////////////////

	public void leaveApplicationApproval(String fromDtHeader, String toDtHeader, String user, String fromDate, String toDate, String approve, String reject,
			String panelName, String validation) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
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

	public void validateLeaveApplicationApproval(String fromDate, String toDate, String panelName, String userId, String fromDt, String toDt, String status) throws InterruptedException {
		waitForElementVisible(fromDateTxt);
		String convertedFromDate = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertedToDate = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertedFromDate);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertedToDate);
		element_TextBoxToClickOnTab(toDateTxt);
		Thread.sleep(500);
		element_Click(viewBtn);
		Thread.sleep(500);
		String actStatus = null;
		String fDate = staticDateOrPlusMinusFromCurrentDate(fromDt);
		String tDate = staticDateOrPlusMinusFromCurrentDate(toDt);
		switch (panelName) {
		case "Pending":
			if (pendingPanelOpenOrNot.size() > 0) {
				element_Click(pendingPanel);
			}
			if (element_isEnabled(searchBoxPendingPanel)) {
				element_Clear(searchBoxPendingPanel);
				element_InputTextUsingActionClass(searchBoxPendingPanel, userId);
				element_TextBoxToClickOnEnter(searchBoxPendingPanel);
				Thread.sleep(1000);
				if (pendingTableUserIdXpath.size() > 0) {
					for (int i = 0; i < pendingTableUserIdXpath.size(); i++) {
						// actStatus = null;
						String getUserID = pendingTableUserIdXpath.get(i).getText();
						String getFromDate = pendingTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not(@hidden)][2]"))
								.getText();
						if (getFromDate.length() > 10) {
							String[] splitGetFromDate = getFromDate.split(" ");
							getFromDate = splitGetFromDate[0];
						}
						WebElement toDateCol = pendingTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not(@hidden)][3]"));
						String getToDate = toDateCol.getText();
						if (getToDate.length() > 10) {
							String[] splitGetToDate = getToDate.split(" ");
							getToDate = splitGetToDate[0];
						}
						if (getUserID.equalsIgnoreCase(userId) && getFromDate.equalsIgnoreCase(fDate)
								&& getToDate.equalsIgnoreCase(tDate)) {
							actStatus = "Pending";
							break;
						} else {
							actStatus = "No Authorization";
						}
					}
				} else {
					actStatus = "No Authorization";
				}

			} else {
				actStatus = "No Authorization";
			}
			break;
		case "Approved":
			if (approvedPanelOpenOrNot.size() > 0) {
				element_Click(approvedPanel);
			}
			if (element_isEnabled(searchBoxApprovedPanel)) {
				element_Clear(searchBoxApprovedPanel);
				element_InputTextUsingActionClass(searchBoxApprovedPanel, userId);
				element_TextBoxToClickOnEnter(searchBoxApprovedPanel);
				Thread.sleep(1000);
				if (approvedTableUserIdXpath.size() > 0) {
					for (int i = 0; i < approvedTableUserIdXpath.size(); i++) {
						// actStatus = null;
						String getUserID = approvedTableUserIdXpath.get(i).getText();
						String getFromDate = approvedTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not (@hidden)][2]"))
								.getText();
						if (getFromDate.length() > 10) {
							String[] splitGetFromDate = getFromDate.split(" ");
							getFromDate = splitGetFromDate[0];
						}
						WebElement toDateCol = approvedTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not (@hidden)][3]"));
						String getToDate = toDateCol.getText();
						if (getToDate.length() > 10) {
							String[] splitGetToDate = getToDate.split(" ");
							getToDate = splitGetToDate[0];
						}
						if (getUserID.equalsIgnoreCase(userId) && getFromDate.equalsIgnoreCase(fDate)
								&& getToDate.equalsIgnoreCase(tDate)) {
							actStatus = "Approved";
							break;
						} else {
							actStatus = "No Authorization";
						}
					}
				} else {
					actStatus = "No Authorization";
				}
			} else {
				actStatus = "No Authorization";
			}
			break;
		case "Rejected":
			if (rejectedPanelOpenOrNot.size() > 0) {
				element_Click(rejectedPanel);
			}
			if (element_isEnabled(searchBoxRejectedPanel)) {
				element_Clear(searchBoxRejectedPanel);
				element_InputTextUsingActionClass(searchBoxRejectedPanel, userId);
				element_TextBoxToClickOnEnter(searchBoxRejectedPanel);
				Thread.sleep(1000);
				if (rejectedTableUserIdXpath.size() > 0) {
					for (int i = 0; i < rejectedTableUserIdXpath.size(); i++) {
						// actStatus = null;
						String getUserID = rejectedTableUserIdXpath.get(i).getText();
						String getFromDate = rejectedTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not(@hidden)][2]"))
								.getText();
						if (getFromDate.length() > 10) {
							String[] splitGetFromDate = getFromDate.split(" ");
							getFromDate = splitGetFromDate[0];
						}
						WebElement toDateCol = rejectedTableUserIdXpath.get(i)
								.findElement(By.xpath("following-sibling::td[not (@hidden)][3]"));
						String getToDate = toDateCol.getText();
						if (getToDate.length() > 10) {
							String[] splitGetToDate = getToDate.split(" ");
							getToDate = splitGetToDate[0];
						}
						if (getUserID.equalsIgnoreCase(userId) && getFromDate.equalsIgnoreCase(fDate)
								&& getToDate.equalsIgnoreCase(tDate)) {
							actStatus = "Rejected";
							break;
						} else {
							actStatus = "No Authorization";
						}
					}
				} else {
					actStatus = "No Authorization";
				}
			} else {
				actStatus = "No Authorization";
			}
			break;
		default:
			break;
		}
		Assert.assertEquals(actStatus, status);
	}
}
