package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class ShiftSchedulePO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ShiftSchedulePO.class);
	
	public ShiftSchedulePO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@gridname='grdDetail']//*[@name='cmnTxtSearch']")
	private WebElement searchBox;

	@FindBy(id = "txtScheduleName")
	private WebElement txtScheduleName;

	@FindBy(id = "_calSchStDate")
	private WebElement calSchStDate;

	@FindBy(xpath = "//table[@id='grid1']/tbody/tr[@tabindex='0']/td[1]")
	private List<WebElement> shiftAssignTable;

	@FindBy(xpath = "//*[@gridname='grdDetail']//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> scheduleName;

	@FindBy(xpath = "//*[@id='Div1']/div/label")
	private WebElement valMsg;

	@FindBy(xpath = "//*[contains(text(),'Off Day Configuration')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> offDayConfigurationPanelOpenOrNot;

	@FindBy(xpath = "//*[contains(text(),'Off Day Configuration')]/ancestor::a")
	private WebElement offDayConfigurationPanel;

	@FindBy(id = "cboOffDay1")
	private WebElement offDay1Drop;

	@FindBy(id = "cboOffDay2")
	private WebElement offDay2Drop;

	@FindBy(xpath = "//*[@class=\"checkbox-inline checkbox-inline-width\"]")
	private List<WebElement> offDay2Week;

	public void deleteSchdeule(String name) throws InterruptedException {
		logger.info("Schedule Name: "+name);
		waitForElementClickable(txtScheduleName);
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, name);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(400);
			if (scheduleName.size() > 0) {
				for (int i = 0; i < scheduleName.size(); i++) {
					String schname = scheduleName.get(i).getText();
					if (schname.equalsIgnoreCase(name)) {
						scheduleName.get(i).click();
						deleteButtonClick();
						if (element_AlertIsPresent()) {
							driver.switchTo().alert().accept();
						}
						String msg = element_GetText(valMsg);
						Assert.assertEquals(msg, "Deleted Successfully");
					}
				}
			}
		}
	}

	public String createSchedule(String schname, String startDate, List<Map<String, String>> data)
			throws InterruptedException {
		waitForElementClickable(txtScheduleName);
		String msg = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, schname);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(400);
			ArrayList<String> ar = new ArrayList<>();
			if (scheduleName.size() > 0) {
				for (int j = 0; j < scheduleName.size(); j++) {
					String plcname1 = scheduleName.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(schname)) {
						scheduleName.get(j).click();
					}
				}
			}
			// logger.debug(ar);
			if (!ar.contains(schname)) {
				addButtonClick();
			}
		}
		element_Clear(txtScheduleName);
		element_InputTextUsingActionClass(txtScheduleName, schname);
		element_Clear(calSchStDate);
		element_InputTextUsingActionClass(calSchStDate, startDate);
		for (int i = 0; i < data.size(); i++) {
			String shiftid = data.get(i).get("ShiftID");
			String repeatD = data.get(i).get("RepeatShiftDays");
			String active = data.get(i).get("Active");
			if (shiftid != null && repeatD != null) {
				logger.info("ShiftID: "+shiftid);
				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[7]/i")).click();
				if(active != null) {
					boolean active1 = Boolean.parseBoolean(active);
					WebElement activeChk = shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[1]/input[@id='SFTENBL']"));
					if (active1 == true) {
						if (element_isSelected(activeChk) != true) {
							element_Click(activeChk);
						}
					} else {
						if (element_isSelected(activeChk) == true) {
							element_Click(activeChk);
						}
					}
					Thread.sleep(1000);
				}else {
					shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[1]/input[@id='SFTENBL']")).click();
					Thread.sleep(1000);
				}
				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[2]//input[@id='SFTpkID']")).clear();
				element_dynamicDDSelect(shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[2]//input[@id='SFTpkID']")), shiftid);
//				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[2]//input[@id='SFTpkID']"))
//						.sendKeys(shiftid);
				
//				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[2]//input[@id='SFTpkID']"))
//						.sendKeys(Keys.TAB);
				element_Click(shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[6]//input[@id='SFTCnt']")));
				Thread.sleep(500);
				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[6]//input[@id='SFTCnt']")).clear();
				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[6]//input[@id='SFTCnt']"))
						.sendKeys(repeatD);
				Thread.sleep(500);
				shiftAssignTable.get(i).findElement(By.xpath("following-sibling::td[7]//a[@id='savebtn']")).click();
				Thread.sleep(500);
			}
		}
		saveButtonClick();
		msg = element_GetText(valMsg);
		return msg;
	}

	public void configureOffDay(String shiftScheduleName, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(txtScheduleName);
		String valMsg = null;
		if (element_isEnabled(searchBox)) {
			element_InputTextUsingActionClass(searchBox, shiftScheduleName);
			element_TextBoxToClickOnEnter(searchBox);
			Thread.sleep(300);
			ArrayList<String> ar = new ArrayList<>();
			if (scheduleName.size() > 0) {
				for (int j = 0; j < scheduleName.size(); j++) {
					String plcname1 = scheduleName.get(j).getText();
					ar.add(plcname1);
					if (plcname1.equalsIgnoreCase(shiftScheduleName)) {
						scheduleName.get(j).click();
					}
				}
			}
		}
		if (offDayConfigurationPanelOpenOrNot.size() > 0) {
			element_Click(offDayConfigurationPanel);
			Thread.sleep(700);
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("OffDay1: "+data.get("OffDay1"));
			String offDay1 = data.get("OffDay1");
			String offDay2 = data.get("OffDay2");
			String offDay2OnWeeks = data.get("OffDay2OnWeeks");
			if (offDay1 != null) {
				element_DropDownSelectByvisibleText(offDay1Drop, offDay1);
				Thread.sleep(700);
			}
			if (offDay2 != null) {
				element_DropDownSelectByvisibleText(offDay2Drop, offDay2);
				Thread.sleep(700);
			}
			if (offDay2OnWeeks != null) {
				if (offDay2OnWeeks.equalsIgnoreCase("All")) {
					for (int i = 0; i < offDay2Week.size(); i++) {
						offDay2Week.get(i).findElement(By.xpath("input")).click();
						Thread.sleep(700);
					}
				} else {
					String[] offDay2OnWeeksSplit = offDay2OnWeeks.split(",");
					for (int j = 0; j < offDay2OnWeeksSplit.length; j++) {
						for (int i = 0; i < offDay2Week.size(); i++) {
							if (offDay2Week.get(i).getText().equalsIgnoreCase(offDay2OnWeeksSplit[j])) {
								offDay2Week.get(i).findElement(By.xpath("input")).click();
								Thread.sleep(700);
								break;
							}
						}
					}
				}
			}

		}
		saveButtonClick();
		valMsg = validationMessage2();
		Assert.assertEquals(valMsg, "Saved Successfully");
		// reloadPageButtonClick();
	}
}
