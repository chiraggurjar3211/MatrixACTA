package PageObject.ContractorWorkerManagement;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.java.it.Ma;

public class WorkOrderProgressPO extends AbstractMethod{
	WebDriver driver;
	public WorkOrderProgressPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver=driver;
		PageFactory.initElements(driver, this);
	}
	
	//*************************************************************************
	//********** Elements *****************************************************
	//*************************************************************************
	@FindBy(id = "AutoContractorID")
	private WebElement contractorIDTxt;
	
	@FindBy(xpath = "//*[@key='btnView']")
	private WebElement viewBtn;
	
	@FindBy(xpath = "//*[@name='cmnTxtSearch']")
	private WebElement searchBar;
	
	@FindBy(xpath = "//table/tbody/tr/td[2]")
	private List<WebElement> workOrderRows;
	
	
	
	//****************************************************************************
	// FUnctions
	//***************************************************************************
	
	public void verifyWorkOrderProgress(Map<String, String> data) throws InterruptedException {
		pageLoadWaitng();
		String val= null;
		if (data.get("Contractor") != null) {
			element_Clear(contractorIDTxt);
			element_InputTextUsingActionClass(contractorIDTxt, data.get("Contractor"));
//			element_TextBoxToClickOnTab(contractorIDTxt);
		}
		Thread.sleep(1000);
		element_Click(viewBtn);
		if (element_isEnabled(searchBar)) {
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, data.get("WorkOrder"));
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(1000);
			if (workOrderRows.size()>0) {
				ArrayList<String> rowsData = new ArrayList<>();
				for (WebElement row : workOrderRows) {
					String name = row.getText();
					rowsData.add(name);
					if (name.equalsIgnoreCase(data.get("WorkOrder"))) {
						if (data.get("DefinedStartDate") != null) {
							String definedStartDate = row.findElement(By.xpath("following-sibling::td[3]")).getText();
							String expected = staticDateOrPlusMinusFromCurrentDate(data.get("DefinedStartDate"));
							Assert.assertEquals(definedStartDate, expected);
						}
						if (data.get("DefinedEndDate") != null) {
							String definedEndDate = row.findElement(By.xpath("following-sibling::td[4]")).getText();
							String expected = staticDateOrPlusMinusFromCurrentDate(data.get("DefinedEndDate"));
							Assert.assertEquals(definedEndDate, expected);
						}
						if (data.get("WorkerLimit") != null) {
							String workerLimit = row.findElement(By.xpath("following-sibling::td[5]")).getText();
							String expected = data.get("WorkerLimit");
							Assert.assertEquals(workerLimit, expected);
						}
						if (data.get("AssignedWorkers") != null) {
							String assignedWorkers = row.findElement(By.xpath("following-sibling::td[6]")).getText();
							String expected = data.get("AssignedWorkers");
							Assert.assertEquals(assignedWorkers, expected);
						}
						if (data.get("ManDays") != null) {
							String manDays = row.findElement(By.xpath("following-sibling::td[7]")).getText();
							String expected = data.get("ManDays");
							Assert.assertEquals(manDays, expected);
						}
						if (data.get("ProgressStatus") != null) {
							String progressStatus = row.findElement(By.xpath("following-sibling::td[8]")).getText();
							String expected = data.get("ProgressStatus");
							Assert.assertEquals(progressStatus, expected);
						}
						break;
					}
				}
				if (!rowsData.contains(data.get("WorkOrder"))) {
					val = "Defined Work Order is not found";
				}
			}
			else {
				val = "Defined Work Order is not found";
			}
		}else {
			val = "Workorder doesn't exist";
		}
	}

}
