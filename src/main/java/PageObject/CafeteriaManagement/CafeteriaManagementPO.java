package PageObject.CafeteriaManagement;

import java.util.List;

import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class CafeteriaManagementPO extends AbstractMethod{
	WebDriver driver;
	public CafeteriaManagementPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(id = "6013")
	private WebElement transactionSummary;
	
	@FindBy(id="Transaction Management")
	private WebElement transactionManagement;
	
	@FindBy(id = "Reports")
	private WebElement reports;
	
	@FindBy(id = "6017")
	private WebElement itemsReport;
	
	@FindBy(id = "6018")
	private WebElement menuReport;
	
	@FindBy(id = "6019")
	private WebElement menuScheduleReport;
	
	@FindBy(xpath = "//*[@data-bs-target=\"#6020\"]")
	private WebElement usersReports;
	
    @FindBy(xpath = "//*[@data-bs-target=\"#6027\"]")
    private WebElement cafeteriaReports;
    
    @FindBy(id = "6021")
    private WebElement headCountReport;
    
    @FindBy(id = "6022")
    private WebElement userTransactionReport;
    
    @FindBy(id = "6023")
    private WebElement userAccountDetialsReport;
    
    @FindBy(id = "6024")
    private WebElement userConsumptionReport;
    
    @FindBy(id = "6025")
    private WebElement creditDebitReport;
    
    @FindBy(id = "6026")
    private WebElement blockedUserReport;
    
    @FindBy(id = "6036")
    private WebElement userPreOrderDetialReport;
    
    @FindBy(id = "6028")
    private WebElement salesReport;
    
    @FindBy(id = "6034")
    private WebElement deviceWiseConsumptionReport;
    
    @FindBy(id = "6029")
    private WebElement itemWiseConsumptionReport;
    
    @FindBy(id = "6030")
    private WebElement dailyConsumptionReport;
    
    @FindBy(id = "6031")
    private WebElement monthlyConsumptionReport;
    
    @FindBy(id = "6032")
    private WebElement cafeteriaDevicesReport;
    
    @FindBy(id = "6001")
    private WebElement itemsPage;
    
    @FindBy(id = "6002")
    private WebElement menusPage;
    
    @FindBy(id = "6003")
    private WebElement posDevicesConfigurationPage;
    
    @FindBy(id = "6006")
    private WebElement rechargePage;
    
    @FindBy(id = "Balance Management")
    private WebElement balanceManagementTab;
    
    @FindBy(id = "6007")
    private WebElement paymentPage;
    
    @FindBy(id = "6004")
    private WebElement cafeteriaSettingPage;
    
    @FindBy(id = "6037")
    private WebElement cafeUsagePolicyPage;
    
    @FindBy(id = "6012")
    private WebElement manualCorrectionPage;
    
    @FindBy(id = "6011")
    private WebElement correctionApprovalPage;
    
    @FindBy(id = "6008")
    private WebElement manualAdjustmentPage;
    
    @FindBy(id = "6035")
    private WebElement preOrderedMealsPage;
    
    @FindBy(id = "6009")
    private WebElement blockedUserPage;
    
    
    
	public void goToTransactionSummary() {
		element_Click(transactionManagement);
		element_Click(transactionSummary);
	}
	
	public void gotoReports() {
		element_Click(reports);
	}
	
	public void gotoItemsReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(itemsReport);
	}
	
	public void gotoMenuReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(menuReport);
	}
	
	public void gotoMenuScheduleReport() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(menuScheduleReport);
	}
	
	public void gotoUserReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(usersReports);
	}
	
	public void gotoCafeteriaReports() throws InterruptedException {
		gotoReports();
		Thread.sleep(1000);
		element_Click(cafeteriaReports);
	}
	
	public void gotoHeadCountReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(headCountReport);
	}
	
	public void gotoUserTransactionReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(userTransactionReport);
	}
	
	public void gotoUserAccountDetialsReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(userAccountDetialsReport);
	}
	
	public void gotoUserConsumptionReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(userConsumptionReport);
	}
	
	public void gotoCreditDebitReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(creditDebitReport);
	}
	
	public void gotoBlockedUserReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(blockedUserReport);
	}
	
	public void gotoUserPreOrderDetialReports() throws InterruptedException {
		gotoUserReports();
		Thread.sleep(1000);
		element_Click(userPreOrderDetialReport);
	}
	
	public void gotoSalesReports() throws InterruptedException {
		gotoCafeteriaReports();
		Thread.sleep(1000);
		element_Click(salesReport);
	}
	
	public void gotoDeviceWiseConsumptionReports() throws InterruptedException {
		gotoCafeteriaReports();
		Thread.sleep(1000);
		element_Click(deviceWiseConsumptionReport);
	}
	
	public void gotoItemWiseConsumptionReports() throws InterruptedException {
		gotoCafeteriaReports();
		Thread.sleep(1000);
		element_Click(itemWiseConsumptionReport);
	}
	
    public void gotoDailyConsumptionReports() throws InterruptedException {
    	gotoCafeteriaReports();
		Thread.sleep(1000);
		element_Click(dailyConsumptionReport);
    }
    
    public void gotoMonthlyConsumptionReports() throws InterruptedException {
    	gotoCafeteriaReports();
		Thread.sleep(1000);
		element_Click(monthlyConsumptionReport);
    }
    
    public void gotoCafeteriaDevicesReports() throws InterruptedException {
    	gotoCafeteriaReports();
    	Thread.sleep(1000);
    	element_Click(cafeteriaDevicesReport);
    }
    
    public void gotoItemsPage() throws InterruptedException {
    	element_Click(itemsPage);
    }
    
    public void gotoMenusPage() throws InterruptedException {
    	element_Click(menusPage);
    }
    
    public void gotoPosDevicesConfigurationPage() throws InterruptedException {
    	element_Click(posDevicesConfigurationPage);
    }
    
    public void gotoRechargePage() throws InterruptedException {
    	element_Click(balanceManagementTab);
		Thread.sleep(1000);
    	element_Click(rechargePage);
    }
    
    public void gotoPaymentPage() throws InterruptedException {
    	element_Click(balanceManagementTab);
		Thread.sleep(1000);
    	element_Click(paymentPage);
    }
    
    public void gotoCafeteriaSettingsPage() throws InterruptedException {
    	element_Click(cafeteriaSettingPage);
    }
    
    public void gotoCafeUsagePolicyPage() throws InterruptedException {
    	element_Click(cafeUsagePolicyPage);
    }
    
    public void goToManualCorrectionPage() throws InterruptedException {
		element_Click(transactionManagement);
		Thread.sleep(1000);
		element_Click(manualCorrectionPage);
	}
    
    public void goToCorrectionApprovalPage() throws InterruptedException {
		element_Click(transactionManagement);
		Thread.sleep(1000);
		element_Click(correctionApprovalPage);
	}
    
    public void gotoManualAdjustmentPage() throws InterruptedException {
    	element_Click(balanceManagementTab);
		Thread.sleep(1000);
    	element_Click(manualAdjustmentPage);
    }
    
    public void goToPreOrderedMealsPage() throws InterruptedException {
		element_Click(transactionManagement);
		Thread.sleep(1000);
		element_Click(preOrderedMealsPage);
	}
    
    public void gotoBlockedUserPage() throws InterruptedException {
    	element_Click(balanceManagementTab);
		Thread.sleep(1000);
    	element_Click(blockedUserPage);
    }
    
    
}
