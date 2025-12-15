package PageObject.CafeteriaManagement;

import java.util.ArrayList;
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
import groovy.transform.Final;
import groovyjarjarantlr4.v4.parse.ANTLRParser.throwsSpec_return;
import io.cucumber.datatable.DataTable;

public class TransactionSummaryPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(TransactionSummaryPO.class);
	
	public TransactionSummaryPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//***************************ELEMENTS******************************************
	@FindBy(id = "cboUser")
	private WebElement filterUserDD;
	
	@FindBy(id = "AutoUserID")
	private WebElement userIDTxt;
	
	@FindBy(id = "btnView")
	private WebElement viewBtn;
	
	//*****************Recharge Panel*****************
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Recharge')]/ancestor::a")
	private WebElement rechargePanel;
	
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Recharge')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> rechargePanelOpenOrNot;
	
	@FindBy(xpath = "//*[@gridname='grdRecharge']//*[@default='Search']")
	private WebElement searchBarRecharge;
	
	@FindBy(xpath = "//*[@gridname='grdRecharge']//*[not(@hidden)]/td[not(@hidden)]")
	private List<WebElement> rechargeRow1data;
	
	//*****************Payment Panel*****************
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Payment')]/ancestor::a")
	private WebElement paymentPanel;
	
	@FindBy(xpath = "//*[@class=\"panel-heading accordion-heading\"]//*[contains(text(),'Payment')]/ancestor::a[@class=\"collapsed\"]")
	private List<WebElement> paymentPanelOpenOrNot;
		
	@FindBy(xpath = "//*[@gridname='grdPayment']//*[@default='Search']")
	private WebElement searchBarpayment;
		
	@FindBy(xpath = "//*[@gridname='grdPayment']//*[not(@hidden)]/td[not(@hidden)]")
	private List<WebElement> paymentRow1data;
	
	//*****************Manual Credit/Debit Panel*****************
	@FindBy(xpath = "//*[contains(text(),'Manual Credit/Debit')]")
	private WebElement manualCreditDebitPanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Manual Credit/Debit')]")
	private List<WebElement> manualCreditDebitPanelOpenOrNot;
	
	@FindBy(xpath = "//*[@gridname='grdCreditDebit']//*[@default='Search']")
	private WebElement searchBarManualCreditDebit;
		
	@FindBy(xpath = "//*[@gridname='grdCreditDebit']//*[not(@hidden)][1]/td[not(@hidden)]")
	private List<WebElement> manualCreditDebitRow1data;
	
	//*****************Reset Panel*****************
	@FindBy(xpath = "//*[contains(text(),'Reset')]")
	private WebElement resetPanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Reset')]")
	private List<WebElement> resetPanelOpenOrNot;		
	
	@FindBy(xpath = "//*[@gridname='grdReset']//*[not(@hidden)][1]/td[not(@hidden)]")
	private List<WebElement> resetRow1data;
	
	//*****************Import*****************
	@FindBy(id = "btnImport")
	private WebElement importBtn;
	
	@FindBy(id = "cmbTableList")
	private WebElement importDataFor;
	
	@FindBy(id = "cboFileFrmt")
	private WebElement fileFormatDropdown;

	@FindBy(xpath = "//*[@name='importfile']")
	private WebElement chooseFile;

	@FindBy(id = "Upload")
	private WebElement uploadBtn;
	
	@FindBy(xpath = "//*[@id='message1']/div/label")
	private WebElement valMsg;

	@FindBy(xpath = "//*[@class='modal-content']//*[@id='Process']")
	private WebElement processBtn;

	@FindBy(xpath = "//*[@gridname='gvViewData1']//table/tbody/tr/td[not (@hidden)][1]")
	private List<WebElement> resultTable;
	
	@FindBy(xpath = "//*[@class='modal-header']//*[@class='close']")
	private WebElement importPageClose;
	
	//*****************Purchase Panel*****************
	@FindBy(xpath = "//*[contains(text(),'Purchase')]")
	private WebElement purchasePanel;

	@FindBy(xpath = "//*[@class='collapsed']//*[contains(text(),'Purchase')]")
	private List<WebElement> purchasePanelOpenOrNot;
	
	@FindBy(xpath = "//*[@gridname='grdPurchase']//*[@default='Search']")
	private WebElement searchBarPurchase;
	
	@FindBy(xpath = "//*[@gridname='grdPurchase']//*[not(@hidden)][1]/td[not(@hidden)]")
	private List<WebElement> purchaseRow1data;
	
	
	//******************************FUNCTIONS*************************************************
	
	// Mayank
	public void transactionSummaryMainMethod(String transactionType, DataTable dataTable) throws InterruptedException {
		switch (transactionType) {
		//Mayank
		case "Recharge":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info(data.get("UserID"));
				ArrayList<String> actualRechargeData = transactionTypeRecharge(transactionType, data);
				System.out.println(actualRechargeData);
				if (actualRechargeData.size()==1) {
					logger.debug("Recharge Data Not Found");
					Assert.assertEquals("Failed", "Pass");
				}
				else {
					String actualOpeningBalance = actualRechargeData.get(3);
					if (data.get("OpeningBalance") != null) {
						Assert.assertEquals(actualOpeningBalance, data.get("OpeningBalance"));
					}
					String actualRechargeAmount = actualRechargeData.get(4);
					if (data.get("RechargeAmount") != null) {
						Assert.assertEquals(actualRechargeAmount, data.get("RechargeAmount"));
					}
					String actualClosingBalance = actualRechargeData.get(5);
					if (data.get("ClosingBalance") != null) {
						Assert.assertEquals(actualClosingBalance, data.get("ClosingBalance"));
					}
				}
			}
			break;
			
		
		//Mayank
		case "Payment":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info(data.get("UserID"));
				ArrayList<String> actualPaymentData = transactionTypePayment(transactionType, data);
				if (actualPaymentData.size()==1) {
					logger.debug("Payment Data Not Found");
					Assert.assertEquals("Failed", "Pass");
				}
				else {
					String actualOpeningBalance = actualPaymentData.get(3);
					if (data.get("OpeningBalance") != null) {
						Assert.assertEquals(actualOpeningBalance, data.get("OpeningBalance"));
					}
					String actualAmountPaid = actualPaymentData.get(4);
					if (data.get("AmountPaid") != null) {
						Assert.assertEquals(actualAmountPaid, data.get("AmountPaid"));
					}
					String actualClosingBalance = actualPaymentData.get(5);
					if (data.get("ClosingBalance") != null) {
						Assert.assertEquals(actualClosingBalance, data.get("ClosingBalance"));
					}
					String actualRemark = actualPaymentData.get(6);
					if (data.get("Remark") != null) {
						Assert.assertEquals(actualRemark, data.get("Remark"));
					}
				}
			}
			break;
			
			
		// Mayank
		case "Manual Credit/Debit":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info(data.get("UserID"));
				ArrayList<String> actualManualCreditDebitData = transactionTypeManualCreditDebit(transactionType, data);
				if (actualManualCreditDebitData.size() == 1) {
					logger.debug("Manual Credit/Debit Data Not Found");
					Assert.assertEquals("Failed", "Pass");
				} else {
					String actualAdjustmentType = actualManualCreditDebitData.get(3);
					if (data.get("Adjustment Type") != null) {
						Assert.assertEquals(actualAdjustmentType, data.get("Adjustment Type"));
					}
					String actualOpeningBalance = actualManualCreditDebitData.get(4);
					if (data.get("Opening Balance") != null) {
						Assert.assertEquals(actualOpeningBalance, data.get("Opening Balance"));
					}
					String actualAdjustAmount = actualManualCreditDebitData.get(5);
					if (data.get("Adjustment Amount") != null) {
						Assert.assertEquals(actualAdjustAmount, data.get("Adjustment Amount"));
					}
					String actualClosing = actualManualCreditDebitData.get(6);
					if (data.get("Closing Balance") != null) {
						Assert.assertEquals(actualClosing, data.get("Closing Balance"));
					}
					String actualRemark = actualManualCreditDebitData.get(7);
					if (data.get("Remark") != null) {
						Assert.assertEquals(actualRemark, data.get("Remark"));
					}
				}
			}
			break;
			
		// Mayank
		case "Reset":
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				logger.info(data.get("UserID"));
				ArrayList<String> actualResetData = transactionTypeReset(transactionType, data);
				if (actualResetData.size() == 1) {
					logger.debug("Reset Data Not Found");
					Assert.assertEquals("Failed", "Pass");
				} else {
					String actualOpeningBalance = actualResetData.get(3);
					if (data.get("OpeningBalance") != null) {
						Assert.assertEquals(actualOpeningBalance, data.get("OpeningBalance"));
					}
					String actualResetAmount = actualResetData.get(4);
					if (data.get("ResetAmount") != null) {
						Assert.assertEquals(actualResetAmount, data.get("ResetAmount"));
					}
					String actualClosingBalance = actualResetData.get(5);
					if (data.get("ClosingBalance") != null) {
						Assert.assertEquals(actualClosingBalance, data.get("ClosingBalance"));
					}
				}
			}
			break;
			
		case "Purchase":
			transactionTypePurchase(dataTable);
			break;
		
		default:
			logger.debug("Transaction Type is not valid --Mayank");
			break;
		}
	}
	
	// Mayank
	public ArrayList<String> transactionTypeRecharge(String transactionType, Map<String, String> data) throws InterruptedException {
		waitForElementVisible(filterUserDD);
		element_DropDownSelectByvisibleText(filterUserDD, "Individual");
		element_Clear(userIDTxt);
		element_dynamicDDSelect(userIDTxt, data.get("UserID"));
//		element_TextBoxToClickOnTab(userIDTxt);
		pageLoadWaitng();
		element_Click(viewBtn);
		pageLoadWaitng();
		//Code
		if (rechargePanelOpenOrNot.size()>0) {
			element_Click(rechargePanel);
		}
		Thread.sleep(1000);
		ArrayList<String> rechargeData = new ArrayList<>();
		if (rechargeRow1data.size()>0) {
			for (WebElement recharge : rechargeRow1data) {
				String recharge1 = recharge.getText();
				rechargeData.add(recharge1);
			}
		}
		else {
			rechargeData.add("No Data Found");
		}
		logger.debug(rechargeData);
		return rechargeData;
	}
	
	// Mayank
	public ArrayList<String> transactionTypePayment(String transactionType, Map<String, String> data) throws InterruptedException {
		waitForElementVisible(filterUserDD);
		element_DropDownSelectByvisibleText(filterUserDD, "Individual");
		element_Clear(userIDTxt);
		element_dynamicDDSelect(userIDTxt, data.get("UserID"));
//		element_TextBoxToClickOnTab(userIDTxt);
		element_Click(viewBtn);
		element_Click(viewBtn);
		Thread.sleep(2000);
		//Code
		if (paymentPanelOpenOrNot.size()>0) {
			element_Click(paymentPanel);
		}
		Thread.sleep(1000);
		ArrayList<String> paymentData = new ArrayList<>();
		if (paymentRow1data.size()>0) {
			for (WebElement payment : paymentRow1data) {
				String payment1 = payment.getText();
				paymentData.add(payment1);
			}
		}
		else {
			paymentData.add("No Data Found");
		}
		logger.debug(paymentData);
		return paymentData;
	}
	
	public ArrayList<String> transactionTypeManualCreditDebit(String transactionType, Map<String, String> data) throws InterruptedException {
		waitForElementVisible(filterUserDD);
		ArrayList<String> manualCreditDebitData = new ArrayList<>();
		element_DropDownSelectByvisibleText(filterUserDD, "Individual");
		element_Clear(userIDTxt);
		element_InputTextUsingActionClass(userIDTxt, data.get("UserID"));
		Thread.sleep(500);
		element_Click(driver.findElement(By.xpath("//html")));
		Thread.sleep(500);
		element_Click(viewBtn);
		Thread.sleep(2000);
		//Code
		if (manualCreditDebitPanelOpenOrNot.size() > 0) {
			element_Click(manualCreditDebitPanel);
		}
		Thread.sleep(1000);
		if (manualCreditDebitRow1data.size()>0) {
			element_Clear(searchBarManualCreditDebit);
			element_InputTextUsingActionClass(searchBarManualCreditDebit, data.get("Adjustment Type"));
			element_TextBoxToClickOnEnter(searchBarManualCreditDebit);
			Thread.sleep(500);
			if (manualCreditDebitRow1data.size()>0) {
				for (WebElement manualCreditDebit : manualCreditDebitRow1data) {
					String manualCreditDebit1 = manualCreditDebit.getText();
					manualCreditDebitData.add(manualCreditDebit1);
				}
			} else {
				manualCreditDebitData.add("No Data Found");
			}
		}
		else {
			manualCreditDebitData.add("No Data Found");
		}	
		return manualCreditDebitData;
	}
	
	// Mayank
	public ArrayList<String> transactionTypeReset(String transactionType, Map<String, String> data) throws InterruptedException {
		waitForElementVisible(filterUserDD);
		element_DropDownSelectByvisibleText(filterUserDD, "Individual");
		element_Clear(userIDTxt);
		element_InputTextUsingActionClass(userIDTxt, data.get("UserID"));
		element_TextBoxToClickOnTab(userIDTxt);
		element_Click(viewBtn);
		Thread.sleep(2000);
		// Code
		if (resetPanelOpenOrNot.size() > 0) {
			element_Click(resetPanel);
		}
		Thread.sleep(1000);
		ArrayList<String> resetData = new ArrayList<>();
		if (resetRow1data.size() > 0) {
			for (WebElement reset : resetRow1data) {
				String reset1 = reset.getText();
				resetData.add(reset1);
			}
		} else {
			resetData.add("No Data Found");
		}
		logger.debug(resetData);
		return resetData;
	}
	
	
	public void importPurchase(String fileFormat, DataTable dataTable) throws InterruptedException {
		pageLoadWaitng();
		element_Click(importBtn);
		waitForElementVisible(chooseFile);
		element_DropDownSelectByvisibleText(importDataFor, " Purchase");
		String filePath =null;
		element_DropDownSelectByvisibleText(fileFormatDropdown, fileFormat);
		if (fileFormat.equalsIgnoreCase("XLS")) {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		}
		else {
			filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\Purchase.csv";
		}
		element_InputText(chooseFile, filePath);
		Thread.sleep(2000);
		element_Click(uploadBtn);
		Thread.sleep(1500);
		String valMsg1 = valMsg.getText();
		Assert.assertEquals(valMsg1, "File uploaded succes...");
		Thread.sleep(1500);
		element_Click(processBtn);
		pageLoadWaitng();
		Thread.sleep(1500);
		int i = 0;
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String result = data.get("Success");
			String errorDescription = null;
			if (data.get("Error Description") != null) {
				errorDescription = data.get("Error Description");
			}else {
				errorDescription = "";
			}
			
			String actRes = null;
			String acterrorDescription=null;
			
			actRes = resultTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()-1]//label")).getText();
			acterrorDescription= resultTable.get(i).findElement(By.xpath("following-sibling::td[not (contains(@class,'ng-hide'))][last()]//label")).getText();
			Thread.sleep(1000);
			Assert.assertEquals(actRes.toUpperCase(), result.toUpperCase());
			Assert.assertEquals(acterrorDescription, errorDescription);
			i++;
		}
		Thread.sleep(1000);
		element_Click(importPageClose);
	}
	
	public void transactionTypePurchase(DataTable dataTable) throws InterruptedException {
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info(data.get("UserID")+" & "+data.get("Transaction DateTime"));
			waitForElementVisible(filterUserDD);
			element_DropDownSelectByvisibleText(filterUserDD, "Individual");
			element_Clear(userIDTxt);
			element_dynamicDDSelect(userIDTxt, data.get("UserID"));
			element_TextBoxToClickOnTab(userIDTxt);
			element_Click(viewBtn);
			Thread.sleep(2000);
			// Code
			if (purchasePanelOpenOrNot.size() > 0) {
				element_Click(purchasePanel);
			}
			Thread.sleep(1000);
			String[] datetime = data.get("Transaction DateTime").split("&");
			String d1 = staticDateOrPlusMinusFromCurrentDate(datetime[0]);
			String t1 = staticTimeOrPlusMinusMinutesFromCurrentTime(datetime[1]);
			String finaldatetime = d1+" "+t1;
			element_Clear(searchBarPurchase);
			element_InputTextUsingActionClass(searchBarPurchase, finaldatetime);
			element_TextBoxToClickOnEnter(searchBarPurchase);
			Thread.sleep(1000);
			ArrayList<String> purchaseData = new ArrayList<>();
			if (purchaseRow1data.size() > 0) {
				for (WebElement purchase : purchaseRow1data) {
					String purchase1 = purchase.getText();
					purchaseData.add(purchase1);
				}
			} else {
				purchaseData.add("No Data Found");
			}
			System.out.println(purchaseData);
			if (purchaseData.size() == 1) {
				logger.debug("Purchase Data Not Found");
				Assert.assertEquals("Failed", "Pass");
			} else {
				String actualitem = purchaseData.get(4);
				if (data.get("Item") != null) {
					Assert.assertEquals(actualitem, data.get("Item"));
				}
				String actualUnitPrice = purchaseData.get(5);
				if (data.get("Unit Price") != null) {
					Assert.assertEquals(actualUnitPrice, data.get("Unit Price"));
				}
				String actualDiscount = purchaseData.get(6);
				if (data.get("Discount") != null) {
					Assert.assertEquals(actualDiscount, data.get("Discount"));
				}
				String actualQuantity = purchaseData.get(7);
				if (data.get("Quantity") != null) {
					Assert.assertEquals(actualQuantity, data.get("Quantity"));
				}
				String actualPayable = purchaseData.get(8);
				if (data.get("Payable") != null) {
					Assert.assertEquals(actualPayable, data.get("Payable"));
				}
			}
			
			
			
		}
		
		
		
	}
		
}
