package PageObject.UserModule;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class InOutEventReportPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(InOutEventReportPO.class);
	
	public InOutEventReportPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "_calFromDate")
	private WebElement fromdate;

	@FindBy(id = "_calToDate")
	private WebElement todate;

	@FindBy(xpath = "//*[text()='Optional Parameters']")
	private WebElement optionalParameter;

	@FindBy(id = "cboGroupBy")
	private WebElement groupBy1st;

	@FindBy(id = "chkGrpOpt1")
	private WebElement groupNeededInReport;

	@FindBy(id = "cboGrpLvl")
	private WebElement groupBy2nd;

	@FindBy(id = "chkNPGrp")
	private WebElement newPageForEachDateOrUser;

	@FindBy(id = "grpddl")
	private WebElement selectUserDD;

	public void inOutEventReportGenerate(String fdate, String tDate, String group1, String grpNeedinR, String grp2,
			String newPageEach, String selectDD, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		waitForElementVisible(fromdate);
		String dateFormat = fromdate.getAttribute("title");
		System.out.println(dateFormat);
		String insertFromDate = reportFromDateToDateChangeFormat(fdate, dateFormat);
		element_Clear(fromdate);
		element_InputTextUsingActionClass(fromdate, insertFromDate);
		String insertToDate = reportFromDateToDateChangeFormat(tDate, dateFormat);
		element_Clear(todate);
		element_InputTextUsingActionClass(todate, insertToDate);
		element_Click(optionalParameter);
		element_DropDownSelectByvisibleText(groupBy1st, group1);
		boolean grpNeedinRpt = Boolean.parseBoolean(grpNeedinR);
		//logger.info(grpNeedinRpt);
		if (grpNeedinRpt == true) {
			if (element_isSelected(groupNeededInReport) != true) {
				element_Click(groupNeededInReport);
			}
		} else {
			if (element_isSelected(groupNeededInReport) == true) {
				element_Click(groupNeededInReport);
			}
		}

		element_DropDownSelectByvisibleText(groupBy2nd, grp2);
		boolean newPageForEachDtOrUsr = Boolean.parseBoolean(newPageEach);
		logger.info(newPageForEachDtOrUsr);
		if (newPageForEachDtOrUsr == true) {
			if (element_isSelected(newPageForEachDateOrUser) != true) {
				element_Click(newPageForEachDateOrUser);
			}
		} else {
			if (element_isSelected(newPageForEachDateOrUser) == true) {
				element_Click(newPageForEachDateOrUser);
			}
		}
		
		element_DropDownSelectByvisibleText(selectUserDD, selectDD);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}
}