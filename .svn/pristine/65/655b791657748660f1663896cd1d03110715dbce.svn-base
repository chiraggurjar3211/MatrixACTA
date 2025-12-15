package PageObject.CafeteriaManagement;

import java.util.Map;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;
import CommonAbstract.AbstractMethod;

public class CafeteriaSettingsPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(CafeteriaSettingsPO.class);
	
	public CafeteriaSettingsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	// Elements
	@FindBy(xpath = "//*[@key='Prepaid']")
	private WebElement prepaidTab;
	
	@FindBy(id = "chkMaxRecharge")
	private WebElement preLimitRechargeAmountFlag;
	
	@FindBy(id = "txtMaxRechargeAmt")
	private WebElement preMaxRechargeAmountTxt;
	
	@FindBy(id = "chkPreBlkOnMaxLimitPerMonth")
	private WebElement preMonthlyLimitBlkFlg;
	
	@FindBy(id = "txtPreMaxUsageLimitPerMon")
	private WebElement preMonthlyMaxLimitBlkTxt;
	
	@FindBy(id = "chkPreBlkOnMaxLimitPerDay")
	private WebElement preDailyLimitBlkFlg;
	
	@FindBy(id = "txtPreMaxUsageLimitPerDay")
	private WebElement preDailyMaxLimitBlkTxt;
	
	@FindBy(xpath = "//*[@key='Postpaid']")
	private WebElement postpaidTab;
	
	@FindBy(id = "txtAllowedUsg")
	private WebElement postAlwdUsagePerMonthTxt;
	
	@FindBy(id = "chkMaxBlkUsr")
	private WebElement postMonthlyBlockUserOnMaxUsageLimitFlg;
	
	@FindBy(id = "txtMaxUsglimit")
	private WebElement postMaxUsageLmtPerMonthTxt;
	
	@FindBy(id = "ChkPostBlockOnMaxDailLimit")
	private WebElement postDailyBlockUserOnMaxUsageLimitFlg;
	
	@FindBy(id = "txtPostMaxUsageLimitPerDay")
	private WebElement postMaxUsageLmtPerDayTxt;
	
	@FindBy(xpath = "//*[@key='Other Settings']")
	private WebElement otherSettingsTab;
	
	@FindBy(id = "chkPreOrdering")
	private WebElement preOrderingEnableFlg;
	
	@FindBy(id = "txtAllowInAdvncDays")
	private WebElement allowedInAdvanceTxt;
	
	@FindBy(id = "cboRestrictBeforeMenuStart")
	private WebElement restrictBeforeMenuStartDDele;
	
	@FindBy(id = "txtRestrictDaysHours")
	private WebElement restrictBeforeMenuStartTxt;
	
	
	// Code
	public void CafeteriaSetting(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		// PrePaid
		if (data.get("PreLimitRechargeAmount") != null || data.get("PreMaxRechargeAmount") != null || data.get("PreMonthlyBlockUserOnMaxUsageLimit") != null || data.get("PreMaxUsageLmtPerMonth") != null || data.get("PreDailyBlockUserOnMaxUsageLimit") != null || data.get("PreMaxUsageLmtPerDay") != null || data.get("PreMaxUsageLmtPerDay") != null) {
			element_Click(prepaidTab);
			Thread.sleep(1000);
			// Max Recharge Limit check
			if (data.get("PreLimitRechargeAmount") != null) {
				boolean preLimitRechargeAmount = Boolean.parseBoolean(data.get("PreLimitRechargeAmount"));
				if (preLimitRechargeAmount==true) {
					if (!preLimitRechargeAmountFlag.isSelected()) {
						element_Click(preLimitRechargeAmountFlag);
					}
				} else {
					if (preLimitRechargeAmountFlag.isSelected()) {
						element_Click(preLimitRechargeAmountFlag);
					}
				}
			}
			if (data.get("PreMaxRechargeAmount") != null) {
				if (preLimitRechargeAmountFlag.isSelected()) {
					element_cleardataUsingActionClass(preMaxRechargeAmountTxt);
					element_InputTextUsingActionClass(preMaxRechargeAmountTxt, data.get("PreMaxRechargeAmount"));
				}
			}
			// Monthly Check
			if (data.get("PreMonthlyBlockUserOnMaxUsageLimit") != null) {
				boolean preMonthlyBlockUserOnMaxUsageLimit = Boolean.parseBoolean(data.get("PreMonthlyBlockUserOnMaxUsageLimit"));
				if (preMonthlyBlockUserOnMaxUsageLimit==true) {
					if (!preMonthlyLimitBlkFlg.isSelected()) {
						element_Click(preMonthlyLimitBlkFlg);
					}
				} else {
					if (preMonthlyLimitBlkFlg.isSelected()) {
						element_Click(preMonthlyLimitBlkFlg);
					}
				}
			}
			if (data.get("PreMaxUsageLmtPerMonth") != null) {
				if (preMonthlyLimitBlkFlg.isSelected()) {
					element_cleardataUsingActionClass(preMonthlyMaxLimitBlkTxt);
					element_InputTextUsingActionClass(preMonthlyMaxLimitBlkTxt, data.get("PreMaxUsageLmtPerMonth"));
				}
			}
			// Daily Check
			if (data.get("PreDailyBlockUserOnMaxUsageLimit") != null) {
				boolean preDailyBlockUserOnMaxUsageLimit = Boolean.parseBoolean(data.get("PreDailyBlockUserOnMaxUsageLimit"));
				if (preDailyBlockUserOnMaxUsageLimit == true) {
					if (!preDailyLimitBlkFlg.isSelected()) {
						element_Click(preDailyLimitBlkFlg);
					}
				} else {
					if (preDailyLimitBlkFlg.isSelected()) {
						element_Click(preDailyLimitBlkFlg);
					}
				}
			}
			if (data.get("PreMaxUsageLmtPerDay") != null) {
				if (preDailyLimitBlkFlg.isSelected()) {
					element_cleardataUsingActionClass(preDailyMaxLimitBlkTxt);
					element_InputTextUsingActionClass(preDailyMaxLimitBlkTxt, data.get("PreMaxUsageLmtPerDay"));
				}
			}
		}
		Thread.sleep(1000);
		// PostPaid
		if (data.get("PostAlwdUsagePerMonth") != null || data.get("PostMonthlyBlockUserOnMaxUsageLimit") != null || data.get("PostMaxUsageLmtPerMonth") != null || data.get("PostDailyBlockUserOnMaxUsageLimit") != null || data.get("PostMaxUsageLmtPerDay") != null) {
			element_Click(postpaidTab);
			Thread.sleep(1000);
			if (data.get("PostAlwdUsagePerMonth") != null) {
				element_cleardataUsingActionClass(postAlwdUsagePerMonthTxt);
				element_InputTextUsingActionClass(postAlwdUsagePerMonthTxt, data.get("PostAlwdUsagePerMonth"));	
			}
			// Monthly Check
			if (data.get("PostMonthlyBlockUserOnMaxUsageLimit") != null) {
				boolean postMonthlyBlockUserOnMaxUsageLimit = Boolean
						.parseBoolean(data.get("PostMonthlyBlockUserOnMaxUsageLimit"));
				if (postMonthlyBlockUserOnMaxUsageLimit == true) {
					if (!postMonthlyBlockUserOnMaxUsageLimitFlg.isSelected()) {
						element_Click(postMonthlyBlockUserOnMaxUsageLimitFlg);
					}
				} else {
					if (postMonthlyBlockUserOnMaxUsageLimitFlg.isSelected()) {
						element_Click(postMonthlyBlockUserOnMaxUsageLimitFlg);
					}
				}
			}
			if (data.get("PostMaxUsageLmtPerMonth") != null) {
				if (postMonthlyBlockUserOnMaxUsageLimitFlg.isSelected()) {
					element_cleardataUsingActionClass(postMaxUsageLmtPerMonthTxt);
					element_InputTextUsingActionClass(postMaxUsageLmtPerMonthTxt, data.get("PostMaxUsageLmtPerMonth"));
				}
			}
			// Daily Check
			if (data.get("PostDailyBlockUserOnMaxUsageLimit") != null) {
				boolean postDailyBlockUserOnMaxUsageLimit = Boolean
						.parseBoolean(data.get("PostDailyBlockUserOnMaxUsageLimit"));
				if (postDailyBlockUserOnMaxUsageLimit == true) {
					if (!postDailyBlockUserOnMaxUsageLimitFlg.isSelected()) {
						element_Click(postDailyBlockUserOnMaxUsageLimitFlg);
					}
				} else {
					if (postDailyBlockUserOnMaxUsageLimitFlg.isSelected()) {
						element_Click(postDailyBlockUserOnMaxUsageLimitFlg);
					}
				}
			}
			if (data.get("PostMaxUsageLmtPerDay") != null) {
				if (postDailyBlockUserOnMaxUsageLimitFlg.isSelected()) {
					element_cleardataUsingActionClass(postMaxUsageLmtPerDayTxt);
					element_InputTextUsingActionClass(postMaxUsageLmtPerDayTxt, data.get("PostMaxUsageLmtPerDay"));
				}
			}
		}
		Thread.sleep(1000);
		// Other Settings
		if (data.get("PreOrderingEnable") != null || data.get("AllowedInAdvance") != null || data.get("RestrictBeforeMenuStartDD") != null || data.get("RestrictBeforeMenuStart") != null) {
			element_Click(otherSettingsTab);
			Thread.sleep(1000);
			if (data.get("PreOrderingEnable") != null) {
				boolean preOrderingEnable = Boolean.parseBoolean(data.get("PreOrderingEnable"));
				if (preOrderingEnable==true) {
					if (!preOrderingEnableFlg.isSelected()) {
						element_Click(preOrderingEnableFlg);
					}
				} else {
					if (preOrderingEnableFlg.isSelected()) {
						element_Click(preOrderingEnableFlg);
					}
				}
			}
			if (data.get("AllowedInAdvance") != null) {
				if (preOrderingEnableFlg.isSelected()) {
					element_Clear(allowedInAdvanceTxt);
					element_InputTextUsingActionClass(allowedInAdvanceTxt, data.get("AllowedInAdvance"));
				}
			}
			if (data.get("RestrictBeforeMenuStartDD") != null) {
				if (preOrderingEnableFlg.isSelected()) {
					element_DropDownSelectByvisibleText(restrictBeforeMenuStartDDele, data.get("RestrictBeforeMenuStartDD"));
				}
			}
			if (data.get("RestrictBeforeMenuStart") != null) {
				if (preOrderingEnableFlg.isSelected()) {
					element_Clear(restrictBeforeMenuStartTxt);
					element_inputTextUsingActionClassCharacterOneByOne(restrictBeforeMenuStartTxt, data.get("RestrictBeforeMenuStart"));
				}
			}
		}
		Thread.sleep(1000);
		saveButtonClick();
		Assert.assertEquals(validationMessage(), "Saved Successfully");
		
		
	}

}
