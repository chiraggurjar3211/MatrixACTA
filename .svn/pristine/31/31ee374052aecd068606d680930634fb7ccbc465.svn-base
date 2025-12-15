package PageObject.ShiftAndSchedule;

import java.util.List;
import java.util.Map;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;

public class ManageShiftsPO extends AbstractMethod{
	WebDriver driver;
	public ManageShiftsPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	@FindBy(xpath = "(//*[@class=\"control-label mx-input-theme isrequire\"])[2]")
	private WebElement userLabel;
	
	// Created by Mayank
		public String changeShiftAPI(List<String> columnHeader,List<String> apiParameter,Map<String, String> data) {
			String apiPar=null;
					if (columnHeader.contains("userid")) {
						if( data.get("userid") != null) {
						apiParameter.add("userid="+data.get("userid"));
						}
					}
					if (columnHeader.contains("FromDt")) {
						if( data.get("FromDt") != null) {
						String fDate=staticDateOrPlusMinusFromCurrentDate(data.get("FromDt"));
						String fDate1 = fDate.replace("/", "");
						String tDate=staticDateOrPlusMinusFromCurrentDate(data.get("ToDt"));
						String tDate1 = tDate.replace("/", "");
						apiParameter.add("date-range="+fDate1+"-"+tDate1);
						}
					}
					if (columnHeader.contains("shift-id")) {
						if( data.get("shift-id") != null) {
							apiParameter.add("shift-id="+data.get("shift-id"));
						}
					}
					if (columnHeader.contains("week-off")) {
						if( data.get("week-off") != null) {
							apiParameter.add("week-off="+data.get("week-off"));
						}
					}
					if (columnHeader.contains("public-holiday")) {
						if( data.get("public-holiday") != null) {
							apiParameter.add("public-holiday="+data.get("public-holiday"));
						}
					}
			return apiPar;
		}
		public void verifyFieldName(String fieldName) throws InterruptedException
		{
			Thread.sleep(2000);
			String lableName = userLabel.getText();
			Assert.assertEquals(lableName, fieldName);
		}
}
