package PageObject.UserModule;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class UserModuleConfigurationPO extends AbstractMethod {
	WebDriver driver;

	public UserModuleConfigurationPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	// Elements
	

	@FindBy(xpath = "//*[@name='cmnTxtSearch']")
	private WebElement searchBar;

	@FindBy(xpath = "//table/tbody/tr[not(@hidden)]/td[not(@hidden)][1]")
	private List<WebElement> userIDCol;

	public void setUserModuleConfiguration(String userID, String module, String value1) throws InterruptedException {
		pageLoadWaitng();
		Thread.sleep(1000);
		if (element_isEnabled(searchBar) == true) {
			element_Clear(searchBar);
			element_InputTextUsingActionClass(searchBar, userID);
			Thread.sleep(2000);
			element_TextBoxToClickOnEnter(searchBar);
			Thread.sleep(2000);
			List<String> list = new ArrayList<String>();
			Thread.sleep(1000);
			for (int i = 0; i < userIDCol.size(); i++) {
				list.add(userIDCol.get(i).getText());
				if (userIDCol.get(i).getText().toUpperCase().equalsIgnoreCase(userID.toUpperCase())) {
					if (module.equalsIgnoreCase("Active")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement activeCheck = userIDCol.get(i)
								.findElement(By.xpath("following-sibling::td[3]//input"));
						if (value2 == true) {
							if (element_isSelected(activeCheck) != true) {
								element_Click(activeCheck);
							}
						} else {
							if (element_isSelected(activeCheck) == true) {
								element_Click(activeCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("TAM")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement tAMCheck = userIDCol.get(i).findElement(By.xpath("following-sibling::td[6]//input"));
						if (value2 == true) {
							if (element_isSelected(tAMCheck) != true) {
								element_Click(tAMCheck);
							}
						} else {
							if (element_isSelected(tAMCheck) == true) {
								element_Click(tAMCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("ACM")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement aCMCheck = userIDCol.get(i).findElement(By.xpath("following-sibling::td[9]//input"));
						if (value2 == true) {
							if (element_isSelected(aCMCheck) != true) {
								element_Click(aCMCheck);
							}
						} else {
							if (element_isSelected(aCMCheck) == true) {
								element_Click(aCMCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("FVM")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement tAMCheck = userIDCol.get(i).findElement(By.xpath("following-sibling::td[6]//input"));
						WebElement fVMCheck = userIDCol.get(i)
								.findElement(By.xpath("following-sibling::td[12]//input"));
						if (value2 == true) {
							if (element_isSelected(tAMCheck) != true) {
								element_Click(tAMCheck);
							}
							if (element_isSelected(fVMCheck) != true) {
								element_Click(fVMCheck);
							}
						} else {
							if (element_isSelected(tAMCheck) != true) {
								element_Click(tAMCheck);
							}
							if (element_isSelected(fVMCheck) == true) {
								element_Click(fVMCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("CMM")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement cMMCheck = userIDCol.get(i)
								.findElement(By.xpath("following-sibling::td[17]//input"));
						if (value2 == true) {
							if (element_isSelected(cMMCheck) != true) {
								element_Click(cMMCheck);
							}
						} else {
							if (element_isSelected(cMMCheck) == true) {
								element_Click(cMMCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("JPC")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement tAMCheck = userIDCol.get(i).findElement(By.xpath("following-sibling::td[6]//input"));
						WebElement jPCCheck = userIDCol.get(i)
								.findElement(By.xpath("following-sibling::td[20]//input"));
						if (value2 == true) {
							if (element_isSelected(tAMCheck) != true) {
								element_Click(tAMCheck);
							}
							if (element_isSelected(jPCCheck) != true) {
								element_Click(jPCCheck);
							}
						} else {
							if (element_isSelected(tAMCheck) != true) {
								element_Click(tAMCheck);
							}
							if (element_isSelected(jPCCheck) == true) {
								element_Click(jPCCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("ESS")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement eSSCheck = userIDCol.get(i)
								.findElement(By.xpath("following-sibling::td[23]//input"));
						if (value2 == true) {
							if (element_isSelected(eSSCheck) != true) {
								element_Click(eSSCheck);
							}
						} else {
							if (element_isSelected(eSSCheck) == true) {
								element_Click(eSSCheck);
							}
						}
					}
					if (module.equalsIgnoreCase("FR")) {
						boolean value2 = Boolean.parseBoolean(value1);
						WebElement fRCheck = userIDCol.get(i).findElement(By.xpath("following-sibling::td[26]//input"));
						if (value2 == true) {
							if (element_isSelected(fRCheck) != true) {
								element_Click(fRCheck);
							}
						} else {
							if (element_isSelected(fRCheck) == true) {
								element_Click(fRCheck);
							}
						}
					}
					Thread.sleep(3000);
					break;
				}
			}
		} 
		Thread.sleep(2000);
		saveButtonClick();
		String msg = validationMessage();
		Assert.assertEquals(msg, "Saved Successfully");
	}
	

}
