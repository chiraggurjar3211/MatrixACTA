package PageObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ReportBuilderPO extends AbstractMethod {

	WebDriver driver;

	public ReportBuilderPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@key='btnNew']")
	private WebElement createReport;

	@FindBy(xpath = "//*[@key='btnCancel']")
	private WebElement cancelbtn;

	@FindBy(xpath = "//*[@key='btnImport']")
	private WebElement importbtn;

	@FindBy(id = "fileimport")
	private WebElement uploadChoosefilebtn;

	@FindBy(id = "txtReportName")
	private WebElement reportNametxtbox;

	@FindBy(id = "ImportreportType")
	private WebElement reportType;

	@FindBy(id = "TblViewNameIMP")
	private WebElement TblViewNameSelection;

	@FindBy(id = "CNT_6")
	private WebElement filteringRangeChkBox;

	@FindBy(id = "ImportFilteringRange")
	private WebElement filteringRangeSelection;

	@FindBy(id = "FilterFld1IMP")
	private WebElement filterAsPerSelection;

	@FindBy(id = "FilterFld12IMP")
	private WebElement filterAsPerSelectionMonth;

	@FindBy(id = "CNT_7")
	private WebElement optionalParaReqChkBox;

	@FindBy(id = "CNT_8")
	private WebElement userSelReqChkBox;

	@FindBy(id = "MappedUserIDIMP")
	private WebElement columnSelectionForUser;

	@FindBy(id = "MappedORGID")
	private WebElement columnSelectionForOrg;

	@FindBy(id = "MappedBRCID")
	private WebElement columnSelectionForBrc;

	@FindBy(id = "MappedDPTID")
	private WebElement columnSelectionForDpt;

	@FindBy(id = "MappedSECID")
	private WebElement columnSelectionForSec;

	@FindBy(id = "MappedCTGID")
	private WebElement columnSelectionForCat;

	@FindBy(id = "MappedGRDID")
	private WebElement columnSelectionForGrade;

	@FindBy(id = "MappedDSGID")
	private WebElement columnSelectionForDesg;

	@FindBy(id = "MappedCG1ID")
	private WebElement columnSelectionForCG1;

	@FindBy(id = "MappedCG2ID")
	private WebElement columnSelectionForCG2;

	@FindBy(id = "MappedCG3ID")
	private WebElement columnSelectionForCG3;

	@FindBy(id = "btnConfirmOK")
	private WebElement confirmBtn;

	@FindBy(id = "btnConfirmCancel")
	private WebElement cancelBtn;

	@FindBy(id = "ImportFilteringRange")
	private WebElement FilteringRange;

	@FindBy(id = "CNT_9")
	private WebElement moduleSelection;

	@FindBy(id = "CNT_10")
	private WebElement parentMentSelection;

	@FindBy(id = "cmnBtnTxtSearch")
	private WebElement searchbar;

	@FindBy(id = "mdok")
	private WebElement deleteOkBtn;

	@FindBy(xpath = "//*[@gridname=\"grdCustomizedData\"]//tbody//tr/td[not(@hidden)][2]")
	private List<WebElement> shiftIds;

	public void customReportDesign(Map<String, String> data) throws InterruptedException {

		pageLoadWaitng();
		waitForElementVisible(importbtn);

		// delete if already present
		element_Clear(searchbar);
		element_InputTextUsingActionClass(searchbar, data.get("ReportName"));
		Thread.sleep(300);
		element_TextBoxToClickOnEnter(searchbar);
		Thread.sleep(1000);

		ArrayList<String> allHS = new ArrayList<>();
		if (shiftIds.size() > 0) {
			for (int j = 0; j < shiftIds.size(); j++) {
				String hsName1 = shiftIds.get(j).getText();
				System.out.println(hsName1);
				allHS.add(hsName1);
				if (hsName1.equalsIgnoreCase(data.get("ReportName"))) {
					shiftIds.get(j).click();
					Thread.sleep(1000);
					deleteButtonClick();
					waitForElementVisible(deleteOkBtn);
					element_Click(deleteOkBtn);
//					driver.switchTo().alert().accept();
					Thread.sleep(1000);
					Assert.assertEquals(validationMessage(), "Deleted Successfully");
				}
			}
		}

		element_Click(importbtn);
		waitForElementVisible(uploadChoosefilebtn);
		String strName = data.get("FileName");

		if (data.get("FileName") != null) {
			// file upload
			String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\CustomReportSchedulerRepx\\"
					+ strName + ".repx";

			element_InputText(uploadChoosefilebtn, filePath);
			Thread.sleep(1000);
		}

		if (data.get("ReportName") != null) {
			element_InputTextUsingActionClass(reportNametxtbox, data.get("ReportName"));
		}

		if (data.get("ReportType") != null && !data.get("ReportType").isEmpty()) {
			element_DropDownSelectByvisibleText(reportType, data.get("ReportType"));
		}

		if (data.get("TableView") != null && !data.get("TableView").isEmpty()) {
			element_DropDownSelectByvisibleText(TblViewNameSelection, data.get("TableView"));
		}

		if (data.get("FilterRequired") != null) {
			// user selection
			Boolean userSelection = Boolean.parseBoolean(data.get("FilterRequired"));
			if (userSelection == true) {
				if (filteringRangeChkBox.isSelected() == false) {
					element_Click(filteringRangeChkBox);
					if (data.get("FilteringRange").equalsIgnoreCase("Date")
							|| data.get("FilteringRange").equalsIgnoreCase("Date-Range")) {
						element_DropDownSelectByvisibleText(filteringRangeSelection, data.get("FilteringRange"));
						element_DropDownSelectByvisibleText(filterAsPerSelection, data.get("ApplyFilter"));
					} else if (data.get("FilteringRange").equalsIgnoreCase("Month")
							|| data.get("FilteringRange").equalsIgnoreCase("Month-Range")) {
						element_DropDownSelectByvisibleText(filteringRangeSelection, data.get("FilteringRange"));
						element_DropDownSelectByvisibleText(filterAsPerSelectionMonth, data.get("ApplyFilter"));
					}
				}
			} else {
				if (filteringRangeChkBox.isSelected()) {
					element_Click(filteringRangeChkBox);
				}
			}

		}
		if(!element_DropDownFirstSelectedValue(reportType).equalsIgnoreCase("Custom")) {
			if (data.get("FilteringRange").equalsIgnoreCase("Date")
					|| data.get("FilteringRange").equalsIgnoreCase("Date-Range")) {
				element_DropDownSelectByvisibleText(filteringRangeSelection, data.get("FilteringRange"));
			} else if (data.get("FilteringRange").equalsIgnoreCase("Month")
					|| data.get("FilteringRange").equalsIgnoreCase("Month-Range")) {
				element_DropDownSelectByvisibleText(filteringRangeSelection, data.get("FilteringRange"));
			}
		}

		if (data.get("OptionalParameterRequired") != null) {
			// optional parameter chkbox selection
			Boolean userSelection = Boolean.parseBoolean(data.get("OptionalParameterRequired"));
			if (userSelection == true) {
				if (optionalParaReqChkBox.isSelected() == false) {
					element_Click(optionalParaReqChkBox);
				}
			} else {
				if (optionalParaReqChkBox.isSelected()) {
					element_Click(optionalParaReqChkBox);
				}
			}

		}

		if (data.get("UserSelectionRequired") != null) {
			// user selection
			Boolean userSelection = Boolean.parseBoolean(data.get("UserSelectionRequired"));
			if (userSelection == true) {
				if (userSelReqChkBox.isSelected() == false) {
					element_Click(userSelReqChkBox);
					element_DropDownSelectByvisibleText(columnSelectionForUser, data.get("UserValue"));
				}
			} else {
				if (userSelReqChkBox.isSelected()) {
					element_Click(userSelReqChkBox);
				}
			}

		}

		if (data.get("ModuleSelection") != null) {
			element_DropDownSelectByvisibleText(moduleSelection, data.get("ModuleSelection"));
		}

		if (data.get("ParentMenu") != null) {
			element_DropDownSelectByvisibleText(parentMentSelection, data.get("ParentMenu"));
		}

		element_Click(confirmBtn);
	}

}
