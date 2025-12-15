package PageObject.LeaveManagement;

import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.hamcrest.Factory;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import groovy.transform.Final;
import io.cucumber.datatable.DataTable;

public class LeaveRegisterPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(LeaveRegisterPO.class);
	
	// Created by Mayank
	public LeaveRegisterPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	//Elements
	@FindBy(xpath = "//*[@key='Export']")
	private WebElement exportTab;
	
	@FindBy(xpath = "//*[@key='Configuration']")
	private WebElement configurationTab;
	
	@FindBy(xpath = "//*[@id='div_grd_grdConfigFieldList']//*[@class='ngx-pagination responsive']//*[@class='pagination-next']/a")
	private List<WebElement> paginationXpath;
	
	@FindBy(xpath = "//*[@id='div_grd_grdConfigFieldList']//*[@class='ngx-pagination responsive']//*[@class='pagination-next']/a")
	private WebElement paginationClick;

	@FindBy(xpath = "//*[@id='div_grd_grdConfigFieldList']//table/thead/tr/th/input")
	private WebElement tableSelectAllCheckbox;
	
	@FindBy(xpath = "//*[@value='Save']")
	private WebElement saveBtn;
	
	@FindBy(id = "ddlPeriod")
	private WebElement periodDrop;
	
	@FindBy(id = "apYear")
	private WebElement yearDrop;
	
	@FindBy(id = "apMonthFrom")
	private WebElement fromMonthDrop;
	
	@FindBy(id = "apYearFrom")
	private WebElement fromYearDrop;
	
	@FindBy(id = "apMonthTo")
	private WebElement toMonthDrop;

	@FindBy(id = "apYearTo")
	private WebElement toYearDrop;
	
	@FindBy(id = "filename")
	private WebElement fileNameTxt;
	
	@FindBy(id = "ddlGroupBy")
	private WebElement groupByDrop;
	
	@FindBy(id = "cboSelectLeave")
	private WebElement selectLeaveDrop;
	
	@FindBy(id = "grpddl")
	private WebElement selectUsersDrop;
	
	@FindBy(id = "ID")
	private WebElement userIdTxt;
	
	@FindBy(id = "btnExport")
	private WebElement exportBtn;
	
	@FindBy(xpath = "//*[@gridname='grdConfigFieldList']//table/tbody/tr/td[@class='mx-grid-edit-ww-bw'][not(@hidden)]")
	private List<WebElement> fields;
	
	/////////////////
	
	///////////Functions///////////
	public void leaveRegisterConfiguration() throws InterruptedException {
		element_Click(configurationTab);
		Thread.sleep(1000);
		int count = 0;
		do {
			Thread.sleep(1000);
			if (count != 0) {
				element_Click(paginationClick);
				Thread.sleep(1000);
			}
			Thread.sleep(500);
			for (int i = 0; i < fields.size(); i++) {
				if (fields.get(i).findElement(By.xpath("following-sibling::td//input")).isSelected()) {
						fields.get(i).findElement(By.xpath("following-sibling::td//input")).click();
					}
			}
			count++;
			Thread.sleep(500);
		} while (paginationXpath.size() != 0);
		element_Click(saveBtn);
		Thread.sleep(1000);
		String valMsg = validationMessage();
		Thread.sleep(1000);
		Assert.assertEquals(valMsg, "Saved Successfully");

	}
	
	public void exportLeaveRegister(String period, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		leaveRegisterConfiguration();
		element_Click(exportTab);
		Thread.sleep(1000);
		element_DropDownSelectByvisibleText(periodDrop, period);
		Thread.sleep(500);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("period: "+data.get("period")+" UserIDs: "+data.get("UserIDs"));
			String year = data.get("Year");
			String fMonth = data.get("FMonth");
			String fYear = data.get("FYear");
			String tMonth = data.get("TMonth");
			String tYear = data.get("TYear");
			String fileName = data.get("FileName");
			String selectUsers = data.get("SelectUsers");
			String userIDs = data.get("UserIDs");
			String convertYear = null;
			String convertFromMonth = null;
			String convertFromYear = null;
			String convertToMonth = null;
			String convertToYear = null;
			if(year != null) {
				convertYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(year);
				element_DropDownSelectByvisibleText(yearDrop, convertYear);
				Thread.sleep(500);
			}
			if(fMonth != null) {
				convertFromMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(fMonth);
				element_DropDownSelectByvisibleText(fromMonthDrop, convertFromMonth);
				Thread.sleep(500);
			}
			if(fYear != null) {
				convertFromYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(fYear);
				element_DropDownSelectByvisibleText(fromYearDrop, convertFromYear);
				Thread.sleep(500);
			}
			if(tMonth != null) {
				convertToMonth = staticMonthOrPlusMinusMonthFromCurrentMonth(tMonth);
				element_DropDownSelectByvisibleText(toMonthDrop, convertToMonth);
				Thread.sleep(500);
			}
			if(tYear != null) {
				convertToYear = staticYearOrPlusMinusYearFromCurrentYearWithoutCheckMonth(tYear);
				element_DropDownSelectByvisibleText(toYearDrop, convertToYear);
				Thread.sleep(500);
			}
			element_Clear(fileNameTxt);
			element_InputTextUsingActionClass(fileNameTxt, fileName);
			if(selectUsers != null) {
				element_DropDownSelectByvisibleText(selectUsersDrop, selectUsers);
				Thread.sleep(500);
			}
			element_InputTextUsingActionClass(userIdTxt, userIDs);
			element_TextBoxToClickOnTab(userIdTxt);
			Thread.sleep(500);
			element_Click(exportBtn);
			Thread.sleep(500);
		}
	}
}
