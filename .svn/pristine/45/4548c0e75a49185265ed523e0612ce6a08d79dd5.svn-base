package PageObject.LeaveManagement;

import java.util.ArrayList;
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

public class TourPO extends AbstractMethod {
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TourPO.class);
	
	public TourPO(WebDriver driver) {

		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	@FindBy(id = "LeaveID")
	private WebElement tourIDTxt;

	@FindBy(xpath = "//*[@class='table-responsive']/table/tbody/tr/td[not(@hidden)][2]")
	private List<WebElement> tourTblAftrSearch;

	@FindBy(id = "LeaveName")
	private WebElement TourNameTxt;

	@FindBy(name = "txtMinlv")
	private WebElement minAlwAtATimeTxt;

	@FindBy(id = "txtMaxlv")
	private WebElement maxAlwLimitTxt;

	@FindBy(id = "cboMaxlvfor")
	private WebElement maxAlwLimitForDropdown;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Optional Restrictions']")
	private List<WebElement> optRestriCollaps;

	@FindBy(xpath = "//*[@default='Optional Restrictions']")
	private WebElement optRestriCollapsClick;

	@FindBy(id = "cboMedicalCerty")
	private WebElement tourDocReqDrop;

	@FindBy(id = "txtMedCertLv")
	private WebElement minTourDysForDoc;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@key='cpLeaveClubRule']")
	private List<WebElement> TrClubRuleCollaps;

	@FindBy(xpath = "//*[@key='cpLeaveClubRule']")
	private WebElement TrClubRuleCollapsClick;

	@FindBy(id = "chkALWFlg")
	private WebElement alwWithOthrTourChk;

	@FindBy(xpath = "//*[@class='anchorclick']//*[@default='Week-Off/Holiday Club-Cover Rule']")
	private List<WebElement> weekOffHldCollaps;

	@FindBy(xpath = "//*[@default='Week-Off/Holiday Club-Cover Rule']")
	private WebElement weekOffHldCollapsClick;

	@FindBy(id = "chkWOClub")
	private WebElement alwSinglSidTourWOChk;

	@FindBy(id = "chkWOCover")
	private WebElement alwBothSidTourWOChk;

	@FindBy(id = "chkPHClub")
	private WebElement alwSinglSidTourPHChk;

	@FindBy(id = "chkPHCover")
	private WebElement alwBothSidTourPHChk;

	@FindBy(id = "mdadd")
	private WebElement popUPADDButton;

	@FindBy(id = "mdadd")
	private List<WebElement> popUPADDButtonSize;

	@FindBy(xpath = "//*[@id='collapseTwo']//label[@class='checkbox-label checkbox-inline']/label")
	private List<WebElement> toursWhCanNtClubCheckboxes;

	///////////////////
	public void createTour(String tourID, String tourName, String minAlwAtATime, String maxAlwLimit,
			String maxAlwLimitFor, String tourDocReq, String minTrDayForDocCom, String alwWithAllOthrTour,
			String woAlwSingleSidTr, String woAlwBothSidTr, String hldAlwSingleSidTr, String hldAlwBothSidTr,
			String validation) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(tourIDTxt);
		String valMsg = null;
		element_InputTextUsingActionClass(tourIDTxt, tourID);
		element_TextBoxToClickOnTab(tourIDTxt);
		Thread.sleep(1500);
		if (popUPADDButtonSize.size() > 0) {
			element_Click(popUPADDButton);
			Thread.sleep(500);
			element_Clear(TourNameTxt);
			Thread.sleep(500);
			element_InputDataUsingJS(TourNameTxt, tourName);
			Thread.sleep(500);
			if (minAlwAtATime != null) {
				element_Clear(minAlwAtATimeTxt);
				element_InputTextUsingActionClass(minAlwAtATimeTxt, minAlwAtATime);
			}
			if (maxAlwLimit != null) {
				element_Clear(maxAlwLimitTxt);
				element_InputTextUsingActionClass(maxAlwLimitTxt, maxAlwLimit);
			}
			if (maxAlwLimitFor != null) {
				element_DropDownSelectByvisibleText(maxAlwLimitForDropdown, maxAlwLimitFor);
			}

			////////////////// Optional Restriction Parameters/////////////////
			if (tourDocReq != null || minTrDayForDocCom != null) {
				if (optRestriCollaps.size() == 0) {
					element_Click(optRestriCollapsClick);
					Thread.sleep(1500);
				}
				if (tourDocReq != null) {
					element_DropDownSelectByvisibleText(tourDocReqDrop, tourDocReq);
				}
				if (minTrDayForDocCom != null) {
					element_Clear(minTourDysForDoc);
					element_InputTextUsingActionClass(minTourDysForDoc, minTrDayForDocCom);
				}
			}
			////////////////////////////////////////////////////

			////////////////// Tour Club Rule Parameters///////////////
			if (alwWithAllOthrTour != null) {
				if (TrClubRuleCollaps.size() == 0) {
					element_Click(TrClubRuleCollapsClick);
					Thread.sleep(1500);
				}
				if (alwWithAllOthrTour != null) {
					boolean alwWithAllOthrTour1 = Boolean.parseBoolean(alwWithAllOthrTour);
					if (alwWithAllOthrTour1 == true) {
						if (element_isSelected(alwWithOthrTourChk) != true) {
							element_Click(alwWithOthrTourChk);
						}
					} else {
						if (element_isSelected(alwWithOthrTourChk) == true) {
							element_Click(alwWithOthrTourChk);
						}
					}
					Thread.sleep(1000);
				}
			}
			/////////////////////////////////////////////////////

			////////////////// Week-Off/Holiday Club-Cover Rule Parameters///////////////
			if (woAlwSingleSidTr != null || woAlwBothSidTr != null || hldAlwSingleSidTr != null
					|| hldAlwBothSidTr != null) {
				if (weekOffHldCollaps.size() == 0) {
					element_Click(weekOffHldCollapsClick);
					Thread.sleep(1500);
				}
				if (woAlwSingleSidTr != null) {
					boolean woAlwSingleSidTr1 = Boolean.parseBoolean(woAlwSingleSidTr);
					if (woAlwSingleSidTr1 == true) {
						if (element_isSelected(alwSinglSidTourWOChk) != true) {
							element_Click(alwSinglSidTourWOChk);
						}
					} else {
						if (element_isSelected(alwSinglSidTourWOChk) == true) {
							element_Click(alwSinglSidTourWOChk);
						}
					}
					Thread.sleep(1000);
				}
				if (woAlwBothSidTr != null) {
					boolean woAlwBothSidTr1 = Boolean.parseBoolean(woAlwBothSidTr);
					if (woAlwBothSidTr1 == true) {
						if (element_isSelected(alwBothSidTourWOChk) != true) {
							element_Click(alwBothSidTourWOChk);
						}
					} else {
						if (element_isSelected(alwBothSidTourWOChk) == true) {
							element_Click(alwBothSidTourWOChk);
						}
					}
					Thread.sleep(1000);
				}
				if (hldAlwSingleSidTr != null) {
					boolean hldAlwSingleSidTr1 = Boolean.parseBoolean(hldAlwSingleSidTr);
					if (hldAlwSingleSidTr1 == true) {
						if (element_isSelected(alwSinglSidTourPHChk) != true) {
							element_Click(alwSinglSidTourPHChk);
						}
					} else {
						if (element_isSelected(alwSinglSidTourPHChk) == true) {
							element_Click(alwSinglSidTourPHChk);
						}
					}
					Thread.sleep(1000);
				}
				if (hldAlwBothSidTr != null) {
					boolean hldAlwBothSidTr1 = Boolean.parseBoolean(hldAlwBothSidTr);
					if (hldAlwBothSidTr1 == true) {
						if (element_isSelected(alwBothSidTourPHChk) != true) {
							element_Click(alwBothSidTourPHChk);
						}
					} else {
						if (element_isSelected(alwBothSidTourPHChk) == true) {
							element_Click(alwBothSidTourPHChk);
						}
					}
					Thread.sleep(1000);
				}
			}
			////////////////////////////////////////////////////////////////////////////
			Thread.sleep(500);
			saveButtonClick();
			Thread.sleep(1000);
			valMsg = validationMessage();
		} else {
			String getTourIDName = tourIDTxt.getAttribute("value");
			if (tourIDTxt.isEnabled() == false) {
				if (getTourIDName.equalsIgnoreCase(tourID)) {
					valMsg = "Saved Successfully";
				} else {
					valMsg = getTourIDName;
					logger.debug("Tour ID displayed :" + getTourIDName);
				}
			} else {
				valMsg = getTourIDName;
				logger.debug("Tour ID displayed :" + getTourIDName);
			}
		}
		Thread.sleep(1000);
		Assert.assertEquals(valMsg, validation);
		Thread.sleep(1000);
		reloadPageButtonClick();
	}

	public void configTourWhCanNtClub(String tourId, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(tourIDTxt);
		element_Clear(tourIDTxt);
		element_InputTextUsingActionClass(tourIDTxt, tourId);
		element_TextBoxToClickOnTab(tourIDTxt);
		Thread.sleep(1500);
		if (TrClubRuleCollaps.size() == 0) {
			element_Click(TrClubRuleCollapsClick);
			Thread.sleep(1500);
		}
		if (!element_getInputControlValue(TourNameTxt).isBlank()
				|| !element_getInputControlValue(TourNameTxt).isEmpty()) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info("TourID: "+data.get("TourID")+" TourName: "+data.get("TourName"));
				String tourName = data.get("TourName");
				String enable = data.get("Enable");
				for (int i = 0; i < toursWhCanNtClubCheckboxes.size(); i++) {
					String getLeaveName = toursWhCanNtClubCheckboxes.get(i).getText();
					if (getLeaveName.toUpperCase().equalsIgnoreCase(tourName.toUpperCase())) {
						WebElement getCheckbox = toursWhCanNtClubCheckboxes.get(i)
								.findElement(By.xpath("preceding::input[1]"));
						Thread.sleep(500);
						boolean enableChk = Boolean.parseBoolean(enable);
						if (enableChk == true) {
							if (element_isSelected(getCheckbox) != true) {
								element_Click(getCheckbox);
							}
						} else {
							if (element_isSelected(getCheckbox) == true) {
								element_Click(getCheckbox);
							}
						}
						break;
					}
				}
				Thread.sleep(500);
			}
			saveButtonClick();
			Thread.sleep(500);
			String valMsg = validationMessage();
			Thread.sleep(500);
			Assert.assertEquals(valMsg, "Saved Successfully");
			reloadPageButtonClick();
		} else {
			logger.debug(tourId + " Not Exist");
		}
	}
}
