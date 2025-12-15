package PageObject.Dashboard;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.PageFactory;
import org.testng.Assert;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;

public class DashboardPO extends AbstractMethod {
	WebDriver driver;
	public static int chartposition;
	public static String additionalDataForDB = null;
	public static Map<String, String> checkedVal = null;

	public DashboardPO(WebDriver driver) {
		// TODO Auto-generated constructor stub
		super(driver);
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}

	@FindBy(xpath = "//*[@class=\"chart-title-label ellipsis-label\"]")
	private List<WebElement> chartName;

	@FindBy(id = "btnAddNewWidget")
	private WebElement widget;

	@FindBy(id = "Filter")
	private WebElement filter;

	@FindBy(id = "Widget_Name")
	private WebElement widgetName;

	@FindBy(xpath = "//*[@class=\"close\"]")
	private WebElement close;

	@FindBy(xpath = "//*[@default=\"No Data\"]")
	private List<WebElement> nodata;

	@FindBy(xpath = "//*[@class=\"table-responsive\"]//tbody//tr")
	private List<WebElement> tableData;

	@FindBy(xpath = "//*[@class=\"pagination-next\"]")
	private List<WebElement> pginationCount;

	@FindBy(xpath = "//*[@class=\"pagination-next\" or @class=\"pagination-next disabled\"]")
	private WebElement nextPage;

	@FindBy(xpath = "//*[@class=\"nav navbar-nav panel-group accordion\"]/li[2]")
	private WebElement fiterTab;

	@FindBy(name = "grpddl")
	private WebElement selectUserFilter;

	@FindBy(name = "grpdd2")
	private WebElement selectGroupFilter;

	@FindBy(id = "grpid")
	private WebElement groupId;

	@FindBy(id = "save")
	private WebElement saveButton;

	public void dashboardVerify(String chartN, String chart, Map<String, String> expectDataV,
			Map<String, String> expectDataC) throws InterruptedException {
		checkedVal = null;
		pageLoadWaitng();
		waitForElementVisible(widget);
		if (!chartN.equalsIgnoreCase("User Statistics")) {
			switch (chart) {
			case "Pie":
				// given below code check chart present or not
				boolean chartPresent = false;
				int valueofPosition = 0;
				for (int i = 0; i < chartName.size(); i++) {
					String name = chartName.get(i).getText();
					if (name.equalsIgnoreCase(chartN)) {
						chartPresent = true;
						String chartV = chartName.get(i).findElement(By.xpath("ancestor::mx-chart-shell[1]"))
								.getAttribute("id");
						String[] chartVSp = chartV.split("_");
						System.out.println(chartVSp[1]);
						valueofPosition = Integer.parseInt(chartVSp[1]);
						break;
					}
				}
				Assert.assertEquals(chartPresent, true);
				chartposition = valueofPosition;
				// Now chart is present then get actual data
				// Actual Data Get
				// css selector create for colour and value get
				String userCSSSelector = "#chart-" + valueofPosition + " .dxc-legend text[style=\"white-space: pre;\"]";
				String colourCSSSelector = "#chart-" + valueofPosition + " g.dxl-marker rect";
				List<WebElement> userCSSSelectorEle = driver.findElements(By.cssSelector(userCSSSelector));
				List<WebElement> colourCSSSelectorEle = driver.findElements(By.cssSelector(colourCSSSelector));
				// Css selector created
				Map<String, String> actualDataValue = new HashMap<String, String>();
				Map<String, String> actualDataColour = new HashMap<String, String>();
				for (int i = 0; i < userCSSSelectorEle.size(); i++) {
					String[] dataofUser = userCSSSelectorEle.get(i).getText().split("\\(");
					String dataV = dataofUser[1].replaceAll("\\)", "").trim();
					String usr = dataofUser[0].trim();
					String colour = colourCSSSelectorEle.get(i).getAttribute("fill");
					actualDataValue.put(usr, dataV);
					actualDataColour.put(usr, colour);

				}
				// Actual Data End
				// Table form Data Compare
				System.out.println(actualDataValue + " " + expectDataV);
				Assert.assertEquals(actualDataValue, expectDataV);
				Assert.assertEquals(actualDataColour, expectDataC);
				// Table form Data Compare End
				// Now Check Pi chart value plus colour
				List<String> expChrtVC = new ArrayList<String>();
				for (int i = 0; i < userCSSSelectorEle.size(); i++) {
					String[] dataofUser = userCSSSelectorEle.get(i).getText().split("\\(");
					String dataV = dataofUser[1].replaceAll("\\)", "").trim();
					String usr = dataofUser[0].trim();
					String colour = colourCSSSelectorEle.get(i).getAttribute("fill");
					expChrtVC.add(usr + " & " + dataV + " & " + colour);

				}
				if (expChrtVC.size() > 0) {
					int a = 0;
					for (int i = 0; i < expChrtVC.size(); i++) {
						String[] va = expChrtVC.get(i).split("&");
						String userS = va[0].trim();
						String value = va[1].trim();
						String colour = va[2].trim();
						String cssChartColour = "#chart-" + valueofPosition + " svg path";
						String cssChartValue = "#chart-" + valueofPosition + " svg [visibility=\"visible\"] text";
						List<WebElement> col = driver.findElements(By.cssSelector(cssChartColour));
						List<WebElement> colText = driver.findElements(By.cssSelector(cssChartValue));
						System.out.println("Expected :" + colour + " " + "Actual :" + col.get(i).getAttribute("fill"));
						Assert.assertEquals(col.get(i).getAttribute("fill"), colour);
						if (!value.equals("0")) {
							String actualV = colText.get(a).getText();
							System.out.println("Expected :" + value + " " + "Actual :" + actualV);
							a++;
							Assert.assertEquals(actualV, value);
						}
					}
				}
				if (chartN.equalsIgnoreCase("Attendance Exception") || chartN.equalsIgnoreCase("Device Summary")) {
					String cssCenterChartValue = "#chart-" + valueofPosition + " .dx-template-wrapper";
					String actualValue = driver.findElement(By.cssSelector(cssCenterChartValue)).getText();
					int i = 0;
					for (String value : expectDataV.values()) {
						i = i + Integer.parseInt(value);
					}
					System.out.println("Expected :" + String.valueOf(i) + " " + "Actual :" + actualValue);
					Assert.assertEquals(actualValue, String.valueOf(i));
				}
				// End Now Check Pi chart value plus colour Done
				// Now Check Filter Data

				break;

			case "Chart":
				// given below code check chart present or not
				boolean chartP = false;
				int valueofP = 0;
				for (int i = 0; i < chartName.size(); i++) {
					String name = chartName.get(i).getText();
					if (name.equalsIgnoreCase(chartN)) {
						chartP = true;
						String chartV = chartName.get(i).findElement(By.xpath("ancestor::mx-chart-shell[1]"))
								.getAttribute("id");
						String[] chartVSp = chartV.split("_");
						System.out.println(chartVSp[1]);
						valueofP = Integer.parseInt(chartVSp[1]);
						break;
					}
				}
				Assert.assertEquals(chartP, true);
				chartposition = valueofP;
				String userCSS = "#chart-" + valueofP + " .dxc-legend text";
				String colourCSS = "#chart-" + valueofP + " g.dxl-marker rect";
				List<WebElement> userCSSW = driver.findElements(By.cssSelector(userCSS));
				List<WebElement> colourCSSW = driver.findElements(By.cssSelector(colourCSS));
				Map<String, String> actualDataC = new HashMap<String, String>();
				for (int i = 0; i < userCSSW.size(); i++) {
					String dataofUser = userCSSW.get(i).getText();
					String colour = colourCSSW.get(i).getAttribute("fill");
					actualDataC.put(dataofUser, colour);
				}
				System.out.println("Actual Data :" + actualDataC + " Expected Data : " + expectDataC);
				Assert.assertEquals(actualDataC, expectDataC);
				System.out.println(expectDataV);

				// Now expected data set on sequential data
				List<String> groupOrder = Arrays.asList("Short Leave / Official In-Out", "Overtime / C-OFF",
						"Daily Attendance", "Attendance Correction", "Event Authorization", "Advance OT Approval");

				List<String> statusOrder = Arrays.asList("Pending", "Approved", "Rejected");
				List<String> expectedoutputList = new ArrayList<>();
				for (String status : statusOrder) {
					for (String group : groupOrder) {
						String key = group + " " + status;
						if (expectDataV.containsKey(key)) {
							String value = expectDataV.get(key);
							expectedoutputList.add(key + " = " + value);
						}
					}
				}
				System.out.println(expectedoutputList);
				// Now expected data set on sequential data Done

				// Now check expected Data and Actual Data

				String cssPending = "//*[@id='chart-" + valueofP
						+ "']//*[@class='dxc-labels'][1]//*[@visibility='visible']";
				List<WebElement> cssPendingxpath = driver.findElements(By.xpath(cssPending));
				String cssApproved = "//*[@id='chart-" + valueofP
						+ "']//*[@class='dxc-labels'][2]//*[@visibility='visible']";
				List<WebElement> cssAppxpath = driver.findElements(By.xpath(cssApproved));
				String cssRej = "//*[@id='chart-" + valueofP
						+ "']//*[@class='dxc-labels'][3]//*[@visibility='visible']";
				List<WebElement> cssRejectedxpath = driver.findElements(By.xpath(cssRej));

				int cssPendingV = 0;
				int cssAV = 0;
				int cssRV = 0;
				for (int i = 0; i < expectedoutputList.size(); i++) {
					String[] splitwithe = expectedoutputList.get(i).split("=");
					if (expectedoutputList.get(i).contains("Pending")) {
						if (!splitwithe[1].trim().equalsIgnoreCase("0")) {
//						System.out.println(splitwithe[0]);
//						System.out.println(splitwithe[1].trim());
							String axctualValue = cssPendingxpath.get(cssPendingV).getText();
							System.out.println("Pending Actual Value : " + axctualValue + " Expected Value "
									+ splitwithe[1].trim());
							cssPendingV++;
							Assert.assertEquals(axctualValue, splitwithe[1].trim());
						}
					} else if (expectedoutputList.get(i).contains("Approved")) {
						if (!splitwithe[1].trim().equalsIgnoreCase("0")) {
//						System.out.println(splitwithe[0]);
//						System.out.println(splitwithe[1].trim());
							String axctualValue = cssAppxpath.get(cssAV).getText();
							System.out.println("Approved Actual Value : " + axctualValue + " Expected Value "
									+ splitwithe[1].trim());
							cssAV++;
							Assert.assertEquals(axctualValue, splitwithe[1].trim());
						}
					} else if (expectedoutputList.get(i).contains("Rejected")) {
						if (!splitwithe[1].trim().equalsIgnoreCase("0")) {
//						System.out.println(splitwithe[0]);
//						System.out.println(splitwithe[1].trim());
							String axctualValue = cssRejectedxpath.get(cssRV).getText();
							System.out.println("Rejected Actual Value : " + axctualValue + " Expected Value "
									+ splitwithe[1].trim());
							cssRV++;
							Assert.assertEquals(axctualValue, splitwithe[1].trim());
						}
					}

				}

				break;

			default:
				break;
			}
		} else {
			// given below code only for user statistics
			// given below code check chart present or not
			boolean chartPresent = false;
			int valueofPosition = 0;
			for (int i = 0; i < chartName.size(); i++) {
				String name = chartName.get(i).getText();
				if (name.equalsIgnoreCase(chartN)) {
					chartPresent = true;
					String chartV = chartName.get(i).findElement(By.xpath("ancestor::mx-chart-shell[1]"))
							.getAttribute("id");
					String[] chartVSp = chartV.split("_");
					System.out.println(chartVSp[1]);
					valueofPosition = Integer.parseInt(chartVSp[1]);
					break;
				}
			}
			Assert.assertEquals(chartPresent, true);
			chartposition = valueofPosition;
			// Now chart is present then get actual data
			// Actual Data Get
			// css selector create for colour and value get
			String userCSSSelector = "#chart-" + valueofPosition + " .dxc-legend text";
			String colourCSSSelector = "#chart-" + valueofPosition + " g.dxl-marker rect";
			List<WebElement> userCSSSelectorEle = driver.findElements(By.cssSelector(userCSSSelector));
			List<WebElement> colourCSSSelectorEle = driver.findElements(By.cssSelector(colourCSSSelector));
			// Css selector created
			Map<String, String> actualDataValue = new HashMap<String, String>();
			Map<String, String> actualDataColour = new HashMap<String, String>();
			for (int i = 0; i < colourCSSSelectorEle.size(); i++) {
				String[] dataofUser = userCSSSelectorEle.get(i + 1).getText().split("\\(");
				String dataV = dataofUser[1].replaceAll("\\)", "").trim();
				String usr = dataofUser[0].trim();
				String colour = colourCSSSelectorEle.get(i).getAttribute("fill");
				if (actualDataValue.size() > 0) {
					Set<String> keys = actualDataValue.keySet();
					for (String key : keys) {
						if (key.equalsIgnoreCase(usr)) {
							usr = "Inactive " + usr;
							break;
						}
					}
				}
				actualDataValue.put(usr, dataV);
				actualDataColour.put(usr, colour);

			}
			System.out.println(actualDataValue + " " + expectDataV);
			Assert.assertEquals(actualDataValue, expectDataV);
			Assert.assertEquals(actualDataColour, expectDataC);
			// Table form Data Compare End
			// Now Check Pi chart value plus colour
			List<String> actChrtVC = new ArrayList<String>();
			List<String> actChrtVCActandInAct=new ArrayList<String>();
			for (int i = 0; i < colourCSSSelectorEle.size(); i++) {
				String[] dataofUser = userCSSSelectorEle.get(i + 1).getText().split("\\(");
				String dataV = dataofUser[1].replaceAll("\\)", "").trim();
				String usr = dataofUser[0].trim();
				String colour = colourCSSSelectorEle.get(i).getAttribute("fill");
				if (!usr.equalsIgnoreCase("Active Users") && !usr.equalsIgnoreCase("Inactive Users")) {
					actChrtVC.add(usr + " & " + dataV + " & " + colour);
				}else {
					actChrtVCActandInAct.add(usr + " & " + dataV + " & " + colour);
				}
			}
			System.out.println(actChrtVC);
			System.out.println(actChrtVCActandInAct);
			actChrtVC.addAll(actChrtVCActandInAct);
			System.out.println("Updated List of expected value : "+actChrtVC);
			if (actChrtVC.size() > 0) {
				int a = 0;
				for (int i = 0; i < actChrtVC.size(); i++) {
					String[] va = actChrtVC.get(i).split("&");
					String userS = va[0].trim();
					String value = va[1].trim();
					String colour = va[2].trim();
					String cssChartColour = "#chart-" + valueofPosition + " svg path";
					String cssChartValue = "#chart-" + valueofPosition + " svg [visibility=\"visible\"] text";
					List<WebElement> col = driver.findElements(By.cssSelector(cssChartColour));
					List<WebElement> colText = driver.findElements(By.cssSelector(cssChartValue));
					System.out.println("Expected :" + colour + " " + "Actual :" + col.get(i).getAttribute("fill"));
					Assert.assertEquals(col.get(i).getAttribute("fill"), colour);
					if (!value.equals("0")) {
						String actualV = colText.get(a).getText();
						System.out.println("Expected :" + value + " " + "Actual :" + actualV);
						a++;
						Assert.assertEquals(actualV, value);
					}
				}
			}

		}
		checkedVal = expectDataV;
	}

	public void openFilterData(String filterBy, List<String> expectedResult, String cName) throws InterruptedException {
		pageLoadWaitng();
		waitForElementVisible(widget);
		String clickthreedots = "//*[@id='widget_" + chartposition + "']//*[@class='pull-left']";
		driver.findElement(By.xpath(clickthreedots)).click();
		Thread.sleep(1000);
		driver.findElement(By.xpath("(//*[@class=\"dx-overlay-wrapper\"]//span[@class=\"dx-menu-item-text\"])[1]"))
				.click();
		waitForElementVisible(filter);
		if (!filterBy.equalsIgnoreCase("Select All")) {
			element_Click(filter);
			List<WebElement> filters = driver
					.findElements(By.xpath("//*[@class=\"dx-template-wrapper dx-item-content dx-menu-item-content\"]"));
			for (int i = 0; i < filters.size(); i++) {
				System.out.println(filters.get(i).getText().trim());
				if (filters.get(i).getText().trim().equalsIgnoreCase(filterBy)) {
					filters.get(i).click();
					Thread.sleep(1000);
					break;
				}
			}
		}

		List<String> actualData = new ArrayList<String>();
		if (nodata.size() == 0) {
			int size = 0;
			do {
				if (size > 0) {
					if (nextPage.isEnabled()) {
						element_Click(nextPage);
						Thread.sleep(1000);
					}
				}
				for (int i = 0; i < tableData.size(); i++) {
					String act = null;
					List<WebElement> eV = tableData.get(i).findElements(By.xpath("td[not(@hidden)]"));
					for (int j = 0; j < eV.size(); j++) {
						if (eV.get(j).getText().isBlank() || eV.get(j).getText().isEmpty()) {
							act = act + "|" + "null";
						} else {
							if (act == null) {
								act = eV.get(j).getText();
							} else {
								act = act + "|" + eV.get(j).getText();
							}
						}
					}
					actualData.add(act);
				}
				size++;
			} while (pginationCount.size() > 0);

		}
		if (!cName.equalsIgnoreCase("User Statistics") && !filterBy.equalsIgnoreCase("Select All")) {
			System.out.println(checkedVal);
			String expectedTotalOfcount = checkedVal.get(filterBy);
			System.out.println("Ecpected Total of Count :" + expectedTotalOfcount + " Actual Count : "
					+ actualData.size() + " Filter of :" + filterBy);
		}
		System.out.println("Hello Actual" + actualData);
		System.out.println("Hello Expected" + expectedResult);

		Assert.assertEquals(actualData, expectedResult);

		element_Click(close);

	}

	public void editAndFilter(String chart, DataTable dataTable, List<String> keyValueOfMapOfEnterprise)
			throws InterruptedException {
		additionalDataForDB = null;
		Map<String, String> query = new HashMap<String, String>();
		query.put("Organization", "AND Mx_UserMst.ORGID IN (");
		query.put("Branch", "AND Mx_UserMst.BRCID IN (");
		query.put("Department", "AND Mx_UserMst.DPTID IN (");
		query.put("Designation", "AND Mx_UserMst.DSGID IN (");
		query.put("Section", "AND Mx_UserMst.SECID IN (");
		query.put("Category", "AND Mx_UserMst.CTGID IN (");
		query.put("Grade", "AND Mx_UserMst.GRDID IN (");
		query.put("Custom Group 1", "AND Mx_UserMst.CG1ID IN (");
		query.put("Custom Group 2", "AND Mx_UserMst.CG2ID IN (");
		query.put("Custom Group 3", "AND Mx_UserMst.CG3ID IN (");
		pageLoadWaitng();
		waitForElementVisible(widget);
		boolean chartPresent = false;
		int valueofPosition = 0;
		for (int i = 0; i < chartName.size(); i++) {
			String name = chartName.get(i).getText();
			if (name.equalsIgnoreCase(chart)) {
				chartPresent = true;
				String chartV = chartName.get(i).findElement(By.xpath("ancestor::mx-chart-shell[1]"))
						.getAttribute("id");
				String[] chartVSp = chartV.split("_");
				System.out.println(chartVSp[1]);
				valueofPosition = Integer.parseInt(chartVSp[1]);
				break;
			}
		}
		Assert.assertEquals(chartPresent, true);
		chartposition = valueofPosition;
		System.out.println(valueofPosition);
		String clickthreedots = "//*[@id='widget_" + chartposition + "']//*[@class='pull-left']";
		driver.findElement(By.xpath(clickthreedots)).click();
		Thread.sleep(1000);
		driver.findElement(By.xpath("(//*[@class=\"dx-overlay-wrapper\"]//span[@class=\"dx-menu-item-text\"])[2]"))
				.click();
		waitForElementVisible(widgetName);
		element_Click(fiterTab);
		if (!chart.equalsIgnoreCase("Device Summary")) {
			for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
				String selectUsers = data.get("Select Users");
				if (!selectUsers.equalsIgnoreCase("All")) {
					element_DropDownSelectByvisibleText(selectUserFilter, selectUsers);
					Thread.sleep(1000);
					String foradd = null;
					for (int i = 1; i < keyValueOfMapOfEnterprise.size(); i++) {
						String[] keyValueOfMapSplit = keyValueOfMapOfEnterprise.get(i).split("\\|");
						String groupName = keyValueOfMapSplit[0].trim();
						element_DropDownSelectByvisibleText(selectGroupFilter, groupName);
						Thread.sleep(1000);
						String[] valueOfEnterprise;
						System.out.println(keyValueOfMapSplit[1].length());
						System.out.println(keyValueOfMapSplit[1].trim().length());
						if (!keyValueOfMapSplit[1].equalsIgnoreCase("null")) {
							if (foradd == null) {
								foradd = query.get(groupName) + keyValueOfMapSplit[1] + ")";
							} else {
								foradd = foradd + query.get(groupName) + keyValueOfMapSplit[1] + ")";
							}
							System.out.println(groupName + "       " + keyValueOfMapSplit[1]);
							valueOfEnterprise = keyValueOfMapSplit[1].split(",");
							for (int j = 0; j < valueOfEnterprise.length; j++) {
								Thread.sleep(1000);
								element_inputTextUsingActionClassCharacterOneByOne(groupId, valueOfEnterprise[j]);
								Thread.sleep(1500);
								element_TextBoxToClickOnTab(groupId);

							}
						}

					}
					System.out.println("Hello query Param " + foradd);
					additionalDataForDB = foradd;
				} else {
					element_DropDownSelectByvisibleText(selectUserFilter, selectUsers);
					Thread.sleep(1000);
				}
				element_Click(saveButton);
			}

		}

	}

}
