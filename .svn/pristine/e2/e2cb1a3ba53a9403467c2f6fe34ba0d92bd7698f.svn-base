package PageObject.TimeAndAttendance;

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

public class ShortLvOfficialAppApprovalPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ShortLvOfficialAppApprovalPO.class);
	
	public ShortLvOfficialAppApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	//Element
	@FindBy(id = "_txtFrmDate")
	private WebElement fromDateTxt;

	@FindBy(id = "_txtToDate")
	private WebElement toDateTxt;
	
	@FindBy(id = "btnView")
	private WebElement btnView;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> pendingTable;
	
	@FindBy(xpath = "//label[contains(text(),'Approved')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> approvedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Approved')]")
	private WebElement approvedPanel;
	
	@FindBy(xpath = "//label[contains(text(),'Rejected')]/ancestor::a[@class=\"collapsed\"][1]")
	private List<WebElement> rejectedPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Rejected')]")
	private WebElement rejectedPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//*[@name=\"cmnTxtSearch\"]")
	private WebElement searchBox;
	
	@FindBy(xpath = "//*[@class=\"panel-collapse collapse panel-collapse-custom show\"]//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> allPanelTableUserIdXpath;
	
	
	// Created by Mayank
		public String shortLvOfficialApplicationAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
			String apiPar=null;
					if (columnHeader.contains("Userid")) {
						if(data.get("Userid") != null) {
							apiParameter.add("Userid="+data.get("Userid"));
						}
					}
					if (columnHeader.contains("Attendance-date")) {
						if(data.get("Attendance-date") != null) {
							String date= staticDateOrPlusMinusFromCurrentDate(data.get("Attendance-date"));
							String date1 = date.replace("/", "");
							apiParameter.add("Attendance-date="+date1);
						}
					}
					if (columnHeader.contains("spfid1")) {
						if(data.get("spfid1") != null) {
							apiParameter.add("spfid1="+data.get("spfid1"));
						}
					}
					if (columnHeader.contains("reason-1")) {
						if(data.get("reason-1") != null) {
							apiParameter.add("reason-1="+data.get("reason-1"));
						}
					}
					if (columnHeader.contains("spfid2")) {
						if(data.get("spfid2") != null) {
							apiParameter.add("spfid2="+data.get("spfid2"));
						}
					}
					if (columnHeader.contains("reason-2")) {
						if(data.get("reason-2") != null) {
							apiParameter.add("reason-2="+data.get("reason-2"));
						}
					}
					if (columnHeader.contains("spfid3")) {
						if(data.get("spfid3") != null) {
							apiParameter.add("spfid3="+data.get("spfid3"));
						}
					}
					if (columnHeader.contains("reason-3")) {
						if(data.get("reason-3") != null) {
							apiParameter.add("reason-3="+data.get("reason-3"));
						}
					}
					if (columnHeader.contains("spfid4")) {
						if(data.get("spfid4") != null) {
							apiParameter.add("spfid4="+data.get("spfid4"));
						}
					}
					if (columnHeader.contains("reason-4")) {
						if(data.get("reason-4") != null) {
							apiParameter.add("reason-4="+data.get("reason-4"));
						}
					}
			return apiPar;
		}
		
	// Created by Mayank
	public String shortLvOfficialAppApprovalAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
			String apiPar=null;

			if (columnHeader.contains("Action")) {
				if(data.get("Action") != null) {
					apiParameter.add("Action="+data.get("Action"));
				}
			}
			if (columnHeader.contains("Userid")) {
				if(data.get("Userid") != null) {
					apiParameter.add("Userid="+data.get("Userid"));
				}
			}
			if (columnHeader.contains("Attendance-date")) {
				if(data.get("Attendance-date") != null) {
					String date=staticDateOrPlusMinusFromCurrentDate(data.get("Attendance-date"));
					String date1 = date.replace("/", "");
				apiParameter.add("Attendance-date="+date1);
				}
			}
			if (columnHeader.contains("Authorization-for")) {
				if(data.get("Authorization-for") != null) {
					apiParameter.add("Authorization-for="+data.get("Authorization-for"));
				}
			}
			if (columnHeader.contains("Verdict")) {
				if(data.get("Verdict") != null) {
					apiParameter.add("Verdict="+data.get("Verdict"));
				}
			}
			if (columnHeader.contains("remark")) {
				if(data.get("remark") != null) {
					apiParameter.add("remark="+data.get("remark"));
				}
			}
			return apiPar;
	}
	
	public void shortLvOfficialInOutApprovalFromSA(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(btnView);
		Thread.sleep(1000);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String userID = data.get("UserID");
			String Date = data.get("Date");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(Date);
			String specialFunction = data.get("SpecialFunction");
			String startTime = data.get("Start");
			String endTime = data.get("End");
			String approve = data.get("Approve");
			String reject = data.get("Reject");
			String validation = data.get("Validation");
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			for(int i=0; i<pendingTable.size(); i++) {
				String getUsrId = pendingTable.get(i).getText();
				String getDate = pendingTable.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
				String getSpecialFunction = pendingTable.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
				String getStartTime = pendingTable.get(i).findElement(By.xpath("following-sibling::td[6]")).getText();
				String getEndTime = pendingTable.get(i).findElement(By.xpath("following-sibling::td[7]")).getText();
				if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate) && getSpecialFunction.equalsIgnoreCase(specialFunction) && getStartTime.equalsIgnoreCase(startTime) && getEndTime.equalsIgnoreCase(endTime)){
					Thread.sleep(1000);
					if (approve != null) {
						boolean approve1 = Boolean.parseBoolean(approve);
						WebElement approveChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[11]//input"));
						if (approve1 == true) {
							if (element_isSelected(approveChk) != true) {
								element_Click(approveChk);
							}
						} else {
							if (element_isSelected(approveChk) == true) {
								element_Click(approveChk);
							}
						}
					}
					if (reject != null) {
						boolean reject1 = Boolean.parseBoolean(reject);
						WebElement rejectChk = pendingTable.get(i).findElement(By.xpath("following-sibling::td[12]//input"));
						if (reject1 == true) {
							if (element_isSelected(rejectChk) != true) {
								element_Click(rejectChk);
							}
						} else {
							if (element_isSelected(rejectChk) == true) {
								element_Click(rejectChk);
							}
						}
					}
				}
			}
			saveButtonClick();
			Thread.sleep(1000);
			String valMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(valMsg, validation);
		}
	}
	
	public void validateShortLvOffInOutAppApproval(String fromDate, String toDate, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(fromDateTxt);
		String convertFromDt = staticDateOrPlusMinusFromCurrentDate(fromDate);
		String convertToDt = staticDateOrPlusMinusFromCurrentDate(toDate);
		element_Clear(fromDateTxt);
		element_InputTextUsingActionClass(fromDateTxt, convertFromDt);
		element_TextBoxToClickOnTab(fromDateTxt);
		element_Clear(toDateTxt);
		element_InputTextUsingActionClass(toDateTxt, convertToDt);
		element_TextBoxToClickOnTab(toDateTxt);
		element_Click(btnView);
		Thread.sleep(1000);
		for(Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("UserID: "+data.get("UserID")+" Date: "+data.get("Date"));
			String panelName = data.get("PanelName");
			String userID = data.get("UserID");
			String Date = data.get("Date");
			String convertDate = staticDateOrPlusMinusFromCurrentDate(Date);
			String specialFunction = data.get("SpecialFunction");
			String startTime = data.get("Start");
			String endTime = data.get("End");
			String expStatus = data.get("Status");
			String actStatus = null;
			if (panelName.equalsIgnoreCase("Approved")) {
				if (approvedPanelOpenOrNot.size() >0) {
					element_Click(approvedPanel);
					Thread.sleep(1000);
				}
			}else if(panelName.equalsIgnoreCase("Rejected")) {
				if (rejectedPanelOpenOrNot.size() >0) {
					element_Click(rejectedPanel);
					Thread.sleep(1000);
				}
			}
			Thread.sleep(1500);
			element_Clear(searchBox);
			element_InputTextUsingActionClass(searchBox, userID);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(1000);
			if (allPanelTableUserIdXpath.size() > 0) {
				for (int i = 0; i < allPanelTableUserIdXpath.size(); i++) {
					String getUsrId = allPanelTableUserIdXpath.get(i).getText();
					String getDate = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[2]")).getText();
					String getSpecialFunction = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[5]")).getText();
					String getStartTime = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[6]")).getText();
					String getEndTime = allPanelTableUserIdXpath.get(i).findElement(By.xpath("following-sibling::td[7]")).getText();
					if (getUsrId.equalsIgnoreCase(userID) && getDate.equalsIgnoreCase(convertDate) && getSpecialFunction.equalsIgnoreCase(specialFunction) && getStartTime.equalsIgnoreCase(startTime) && getEndTime.equalsIgnoreCase(endTime)) {
						actStatus = expStatus;
					}
				}
			}
			Assert.assertEquals(actStatus, expStatus);
		}
	}
}
