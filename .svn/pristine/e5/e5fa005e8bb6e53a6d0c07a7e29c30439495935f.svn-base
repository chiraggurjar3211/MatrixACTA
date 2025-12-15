package PageObject.LeaveManagement;

import java.util.List;

import org.apache.commons.math3.geometry.spherical.oned.ArcsSet.Split;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;

import CommonAbstract.AbstractMethod;

public class FormQReportPO extends AbstractMethod {
	WebDriver driver;

	public FormQReportPO(WebDriver driver) {
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(id = "cntFromMonth")
	private WebElement month;

	@FindBy(id = "cntFromYear")
	private WebElement year;

	@FindBy(id = "header")
	private WebElement header;

	@FindBy(id = "LAUpLabel")
	private WebElement subHeader;

	@FindBy(id = "LALowLabel")
	private WebElement leftAlginlabel;

	@FindBy(id = "footer")
	private WebElement footer;

	@FindBy(id = "leaveTypeID")
	private WebElement leaveID;

	@FindBy(xpath = "//*[@key='btnSave']")
	private WebElement saveBtn;

	@FindBy(id = "grpddl")
	private WebElement selectUsers;

	@FindBy(xpath = "//*[@default='Optional Parameters']")
	private WebElement optionalParameter;

	@FindBy(xpath = "//*[@ng-repeat=\"value in ::orderByData\"]/following-sibling::td[4]//following-sibling::a[1]")
	private WebElement tick;

	@FindBy(id = "grdStatFormLeaveaddBtn")
	private WebElement add;

	@FindBy(xpath = "//*[@id='grid1']/tbody/tr[not (@hidden)]")
	private List<WebElement> table;

	@FindBy(xpath = "//*[@id='grid1']/tbody/tr/td[not (@hidden)][4]/i[@title='Delete']")
	private WebElement delete;

	public void formQReport(String month1, String year1, String head, String subHead, String leftAlginLabel,
			String footer1, String leaveId, String selectUser, String reportExportFormat) throws Exception {
		pageLoadWaitng();
		element_DropDownSelectByvisibleText(month, month1);
		element_DropDownSelectByvisibleText(year, year1);
		element_Click(optionalParameter);
		Thread.sleep(1000);
		element_Clear(header);
		element_InputTextUsingActionClass(header, head);
		element_Clear(subHeader);
		element_InputTextUsingActionClass(subHeader, subHead);
		element_Clear(leftAlginlabel);
		element_InputTextUsingActionClass(leftAlginlabel, leftAlginLabel);
		element_Clear(footer);
		element_InputTextUsingActionClass(footer, footer1);
		Thread.sleep(1000);
		while (table.size() > 0) {
			Thread.sleep(1000);
			element_Click(delete);
			driver.switchTo().alert().accept();
			Thread.sleep(1000);
		}
		if (leaveId != null) {
			if (leaveId.contains(",")) {
				String[] str = leaveId.split(",");
				for (int i = 0; i < str.length; i++) {
					element_Click(add);
					Thread.sleep(1000);
					element_InputTextUsingActionClass(leaveID, str[i]);
					leaveID.sendKeys(Keys.TAB);
					element_Click(tick);
				}
			} else {
				element_Click(add);
				element_InputTextUsingActionClass(leaveID, leaveId);
				leaveID.sendKeys(Keys.TAB);
				element_Click(tick);
			}
		}

		element_Click(saveBtn);
		element_DropDownSelectByvisibleText(selectUsers, selectUser);
		Thread.sleep(1000);
		generateReportToAllModule(reportExportFormat);
	}

}
