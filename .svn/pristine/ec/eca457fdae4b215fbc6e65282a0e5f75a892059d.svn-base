package PageObject.TimeAndAttendance;

import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class AbsenteePolicyPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger = LogManager.getLogger(AbsenteePolicyPO.class);

	public AbsenteePolicyPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	
	// Elements
	@FindBy(xpath = "//*[@key='Search']")
	private WebElement searchTxtBox;

	@FindBy(id = "AbPolicyName")
	private WebElement absenteePlcNameTxt;

	@FindBy(xpath = "(//*[@type='checkbox'])[2]")
	private WebElement wOAlwSinglSidAbChk;

	@FindBy(xpath = "(//*[@type='checkbox'])[3]")
	private WebElement wOAlwBothSidAbChk;

	@FindBy(xpath = "(//*[@type='checkbox'])[4]")
	private WebElement wOAtLstFullDayAbChk;

	@FindBy(xpath = "(//*[@type='checkbox'])[5]")
	private WebElement hldAlwSinglSidAbChk;

	@FindBy(xpath = "(//*[@type='checkbox'])[6]")
	private WebElement hldAlwBothSidAbChk;

	@FindBy(xpath = "(//*[@type='checkbox'])[7]")
	private WebElement hldAtLstFullDayAbChk;

	/////////////////
	public void createAbsenteePolicy(DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(absenteePlcNameTxt);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("PlcName: " + data.get("PlcName"));
			String plcName = data.get("PlcName");
			String wOAlwOnSnglSidAb = data.get("WOAlwOnSnglSidAb");
			String wOAlwOnBothSidAb = data.get("WOAlwOnBothSidAb");
			String wOAtlstFullDayAbForClbCvr = data.get("WOAtlstFullDayAbForClbCvr");
			String hldAlwOnSnglSidAb = data.get("HldAlwOnSnglSidAb");
			String hldAlwOnBothSidAb = data.get("HldAlwOnBothSidAb");
			String hldAtLstFullDayAbForClbCvr = data.get("HldAtLstFullDayAbForClbCvr");
			String validation = data.get("Validation");
			element_Clear(absenteePlcNameTxt);
			element_InputTextUsingActionClass(absenteePlcNameTxt, plcName);
			element_TextBoxToClickOnTab(absenteePlcNameTxt);
			Thread.sleep(1000);
			if (!element_getInputControlValue(absenteePlcNameTxt).isBlank()
					|| !element_getInputControlValue(absenteePlcNameTxt).isEmpty()) {
				deleteButtonClick();
				Thread.sleep(1000);
				driver.switchTo().alert().accept();
				Thread.sleep(1000);
				String valMsg = validationMessage();
				Thread.sleep(1000);
				Assert.assertEquals(valMsg, "Deleted Successfully");
				Thread.sleep(1000);
			}
			addButtonClick();
			Thread.sleep(2000);
			element_Clear(absenteePlcNameTxt);
			element_InputTextUsingActionClass(absenteePlcNameTxt, plcName);
			Thread.sleep(1000);
			if (element_isSelected(wOAlwSinglSidAbChk) == true) {
				element_Click(wOAlwSinglSidAbChk);
			}
			Thread.sleep(1000);
			if (element_isSelected(hldAlwSinglSidAbChk) == true) {
				element_Click(hldAlwSinglSidAbChk);
			}
			Thread.sleep(1000);
			if (wOAlwOnSnglSidAb != null) {
				boolean wOAlwOnSnglSidAbBool = Boolean.parseBoolean(wOAlwOnSnglSidAb);
				if (wOAlwOnSnglSidAbBool == true) {
					if (element_isSelected(wOAlwSinglSidAbChk) != true) {
						element_Click(wOAlwSinglSidAbChk);
					}
				} else {
					if (element_isSelected(wOAlwSinglSidAbChk) == true) {
						element_Click(wOAlwSinglSidAbChk);
					}
				}
				Thread.sleep(1000);
			}
			if (wOAlwOnBothSidAb != null && element_isEnabled(wOAlwBothSidAbChk) == true) {
				boolean wOAlwOnBothSidAbBool = Boolean.parseBoolean(wOAlwOnBothSidAb);
				if (wOAlwOnBothSidAbBool == true) {
					if (element_isSelected(wOAlwBothSidAbChk) != true) {
						element_Click(wOAlwBothSidAbChk);
					}
				} else {
					if (element_isSelected(wOAlwBothSidAbChk) == true) {
						element_Click(wOAlwBothSidAbChk);
					}
				}
				Thread.sleep(1000);
			}
			if (wOAtlstFullDayAbForClbCvr != null) {
				boolean wOAtlstFullDayAbForClbCvrBool = Boolean.parseBoolean(wOAtlstFullDayAbForClbCvr);
				if (wOAtlstFullDayAbForClbCvrBool == true) {
					if (element_isSelected(wOAtLstFullDayAbChk) != true) {
						element_Click(wOAtLstFullDayAbChk);
					}
				} else {
					if (element_isSelected(wOAtLstFullDayAbChk) == true) {
						element_Click(wOAtLstFullDayAbChk);
					}
				}
				Thread.sleep(1000);
			}
			if (hldAlwOnSnglSidAb != null) {
				boolean hldAlwOnSnglSidAbBool = Boolean.parseBoolean(hldAlwOnSnglSidAb);
				if (hldAlwOnSnglSidAbBool == true) {
					if (element_isSelected(hldAlwSinglSidAbChk) != true) {
						element_Click(hldAlwSinglSidAbChk);
					}
				} else {
					if (element_isSelected(hldAlwSinglSidAbChk) == true) {
						element_Click(hldAlwSinglSidAbChk);
					}
				}
				Thread.sleep(1000);
			}
			if (hldAlwOnBothSidAb != null && element_isEnabled(hldAlwBothSidAbChk) == true) {
				boolean hldAlwOnBothSidAbBool = Boolean.parseBoolean(hldAlwOnBothSidAb);
				if (hldAlwOnBothSidAbBool == true) {
					if (element_isSelected(hldAlwBothSidAbChk) != true) {
						element_Click(hldAlwBothSidAbChk);
					}
				} else {
					if (element_isSelected(hldAlwBothSidAbChk) == true) {
						element_Click(hldAlwBothSidAbChk);
					}
				}
				Thread.sleep(1000);
			}
			if (hldAtLstFullDayAbForClbCvr != null) {
				boolean hldAtLstFullDayAbForClbCvrBool = Boolean.parseBoolean(hldAtLstFullDayAbForClbCvr);
				if (hldAtLstFullDayAbForClbCvrBool == true) {
					if (element_isSelected(hldAtLstFullDayAbChk) != true) {
						element_Click(hldAtLstFullDayAbChk);
					}
				} else {
					if (element_isSelected(hldAtLstFullDayAbChk) == true) {
						element_Click(hldAtLstFullDayAbChk);
					}
				}
				Thread.sleep(1000);
			}
			saveButtonClick();
			Thread.sleep(1000);
			String validationMsg = validationMessage();
			Thread.sleep(1000);
			Assert.assertEquals(validationMsg, validation);
			Thread.sleep(1000);
			reloadPageButtonClick();
			Thread.sleep(1000);
		}
	}
}
