package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
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

public class ManageWorkersPO extends AbstractMethod{
	WebDriver driver;
	private static Logger logger=LogManager.getLogger(ManageWorkersPO.class);
	
	public ManageWorkersPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//*************************************************************************
	//********** Elements *****************************************************
	//*************************************************************************
	@FindBy(id = "CWMContractorID")
	private WebElement oldContractoridTxt;
	
	@FindBy(id = "CWMWorkOrderID")
	private WebElement oldWorkOrderidTxt;
	
	@FindBy(xpath = "//*[@default='View']")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@gridname='grdDetail']//*[@name='cmnTxtSearch']")
	private WebElement workerSearchbar;
	
	@FindBy(xpath = "//*[@gridname='grdDetail']//*[@class='row']//table/tbody/tr/td[1]")
	private List<WebElement> workerRows;
	
	@FindBy(id = "newCWMValidContractorsID")
	private WebElement newContractoridTxt;
	
	@FindBy(id = "newCWMWorkOrderID")
	private WebElement newWorkOrderidTxt;	
	
	@FindBy(id = "_SDate")
	private WebElement assStartDtTxt;	
	
	@FindBy(id = "_EDate")
	private WebElement assEndDtTxt;	
	
	@FindBy(xpath = "//*[@default='Update']")
	private WebElement updateBtn;
	
	
	//*************************************************************************
	//********** Functions *****************************************************
	//*************************************************************************
	
	public void manageWorkers(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val = null;
		if (data.get("OldContractorID") != null) {
			element_Clear(oldContractoridTxt);
			element_dynamicDDSelect(oldContractoridTxt, data.get("OldContractorID"));
			element_TextBoxToClickOnTab(oldContractoridTxt);
		}
		Thread.sleep(1000);
		if (data.get("OldWorkOrderID") != null) {
			element_Clear(oldWorkOrderidTxt);
			element_dynamicDDSelect(oldWorkOrderidTxt, data.get("OldWorkOrderID"));
			element_TextBoxToClickOnTab(oldWorkOrderidTxt);
		}
		Thread.sleep(1000);
		element_Click(viewBtn);
		Thread.sleep(1000);
		if (workerSearchbar.isEnabled()) {
			String workers = data.get("WorkerList");
			if (workers.contains(",")) {
				String[] commaSeparatedValues = workers.split(",");
				for (int i = 0; i < commaSeparatedValues.length; i++) {
					String worker = commaSeparatedValues[i].trim();
					element_Clear(workerSearchbar);
					element_InputTextUsingActionClass(workerSearchbar, worker);
					element_TextBoxToClickOnEnter(workerSearchbar);
					if (workerRows.size()>0) {
						ArrayList<String> rowsData = new ArrayList<>();
						for (WebElement row : workerRows) {
							String name = row.findElement(By.xpath("following-sibling::td[3]")).getText();
							rowsData.add(name);
							if (name.equalsIgnoreCase(worker)) {
								WebElement ele = row.findElement(By.xpath("input"));
								element_Click(ele);
								logger.debug("Worker selected");
								break;
							}
						}
						if (!rowsData.contains(worker)) {
							logger.debug("Defined Worker is not found");
						}
					}
					else {
						logger.debug("Defined Worker is not found");
					}
					Thread.sleep(1000);
				}
				
			}
			else {
				element_Clear(workerSearchbar);
				element_dynamicDDSelect(workerSearchbar, data.get("WorkerList"));
				element_TextBoxToClickOnEnter(workerSearchbar);
				if (workerRows.size()>0) {
					ArrayList<String> rowsData = new ArrayList<>();
					for (WebElement row : workerRows) {
						String name = row.findElement(By.xpath("following-sibling::td[3]")).getText();
						rowsData.add(name);
						if (name.equalsIgnoreCase(data.get("WorkerList"))) {
							WebElement ele = row.findElement(By.xpath("input"));
							element_Click(ele);
							logger.debug("Worker selected");
							break;
						}
					}
					if (!rowsData.contains(data.get("WorkerList"))) {
						logger.debug("Defined Worker is not found");
					}
				}
				else {
					logger.debug("Defined Worker is not found");
				}
				Thread.sleep(1000);
			}
			if (data.get("NewContractorID") != null) {
				element_Clear(newContractoridTxt);
				element_dynamicDDSelect(newContractoridTxt, data.get("NewContractorID"));
				element_TextBoxToClickOnTab(newContractoridTxt);
			}
			Thread.sleep(1000);
			if (data.get("NewWorkOrderID") != null) {
				element_Clear(newWorkOrderidTxt);
				element_dynamicDDSelect(newWorkOrderidTxt, data.get("NewWorkOrderID"));
				element_TextBoxToClickOnTab(newWorkOrderidTxt);
			}
			Thread.sleep(1000);
			if (data.get("NewAssStartDt") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("NewAssStartDt"));
				Thread.sleep(1000);
				element_Click(assStartDtTxt);
				element_Clear(assStartDtTxt);
				element_InputTextUsingActionClass(assStartDtTxt, date);
			}
			if (data.get("NewAssEndDt") != null) {
				String date = staticDateOrPlusMinusFromCurrentDate(data.get("NewAssEndDt"));
				element_Clear(assEndDtTxt);
				element_InputTextUsingActionClass(assEndDtTxt, date);
			}
			Thread.sleep(1000);
			element_Click(updateBtn);
			val = validationMessage();
		}
		else {
			val = "No any workers are exist for this workorder";
		}
		Assert.assertEquals(val, "Saved Successfully");
	}

}
