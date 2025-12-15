package CommonTestAbstract;

import static io.restassured.RestAssured.given;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.logging.log4j.Level;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.testng.Assert;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import CommonAbstract.AbstractMethod;
import io.restassured.RestAssured;
import io.restassured.builder.RequestSpecBuilder;
import io.restassured.filter.log.LogDetail;
import io.restassured.filter.log.RequestLoggingFilter;
import io.restassured.filter.log.ResponseLoggingFilter;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;
import stepDefinations.LeaveManagementSD;

public class BaseTestWebAPI extends BaseTest {
	private static Logger logger = LogManager.getLogger(BaseTestWebAPI.class);
	PrintStream logStream = new PrintStream(
	        new LoggerOutputStream(logger, Level.INFO), true);


	/// API related changes here
	// API AUTOMATION TESTING
	public String getAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: BaseTest.prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
			RequestSpecification req=given().filter(new RequestLoggingFilter(LogDetail.ALL, logStream)) 
			        .filter(new ResponseLoggingFilter(LogDetail.ALL, logStream))
			        .queryParams("action", url + ";format=json;").header("Connection", "keep-alive")
					.auth().basic(username, password).urlEncodingEnabled(false);
			// Execute request
			 res = req.when()
			        .get("cosec/api.svc/v2/" + apiName)
			        .then()
			        .statusCode(statusCode)
			        .extract().response().asString();
			
			logger.info("API Response Body: {}", res);
			
		} else {
			res = given().log().all().queryParams("action", url + ";format=json;").header("Connection", "keep-alive")
					.auth().basic(username, password).urlEncodingEnabled(false).when()
					.get("evertect/api.svc/v2/" + apiName).then()// .log().all()
					.assertThat().statusCode(statusCode).extract().asString();
			// System.out.println(res);
		}
		return res;
	}

	// SET API and return Response
	public String setAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: BaseTest.prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
			RequestSpecification req=given() .filter(new RequestLoggingFilter(LogDetail.ALL, logStream)) 
			        .filter(new ResponseLoggingFilter(LogDetail.ALL, logStream))
			        .queryParams("action", url).header("Connection", "keep-alive").auth()
			.basic(username, password).urlEncodingEnabled(false);
			// Execute request
			 res = req.when()
			        .post("cosec/api.svc/v2/" + apiName)
			        .then()
			        .statusCode(statusCode)
			        .extract().response().asString();
			
			logger.info("API Response Body: {}", res);
		} else {
			res = given()// .log().all()
					.queryParams("action", url).header("Connection", "keep-alive").auth().basic(username, password)
					.urlEncodingEnabled(false).when().post("evertect/api.svc/v2/" + apiName).then().log().all()
					.assertThat().statusCode(statusCode).extract().response().asString();
			// body("success",equalTo("0210200001:successful"));
			// System.out.println(res);
		}
		return res;
	}

	// Update API and return Response
	public String updateAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: BaseTest.prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
			RequestSpecification req=given().filter(new RequestLoggingFilter(LogDetail.ALL, logStream)) 
			        .filter(new ResponseLoggingFilter(LogDetail.ALL, logStream))
			        .queryParams("action", url).header("Connection", "keep-alive").auth()
			.basic(username, password).urlEncodingEnabled(false);
			// Execute request
			 res = req.when()
			        .post("cosec/api.svc/v2/" + apiName)
			        .then()
			        .statusCode(statusCode)
			        .extract().response().asString();
		} else {
			res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
					.basic(username, password).urlEncodingEnabled(false).when().post("evertect/api.svc/v2/" + apiName)
					.then().log().all().assertThat().statusCode(statusCode).extract().response().asString();
			// System.out.println(res);
		}
		return res;
	}

	// Delete API and return Response
	public String deleteAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: BaseTest.prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
			RequestSpecification req=given().filter(new RequestLoggingFilter(LogDetail.ALL, logStream)) 
			        .filter(new ResponseLoggingFilter(LogDetail.ALL, logStream))
			        .queryParams("action", url).header("Connection", "keep-alive").auth()
			.basic(username, password).urlEncodingEnabled(false);
			// Execute request
			 res = req.when()
			        .post("cosec/api.svc/v2/" + apiName)
			        .then()
			        .statusCode(statusCode)
			        .extract().response().asString();
		} else {
			res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
					.basic(username, password).urlEncodingEnabled(false).when().post("evertect/api.svc/v2/" + apiName)
					.then()// .log().all()
					.assertThat().statusCode(statusCode).extract().response().asString();
			// System.out.println(res);
		}
		return res;
	}

	// SET API for Data Transfer and return Response
	public String setAPITestForDataTransfer(String url, String username, String password, String apiName,
			int statusCode, String filePath) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: BaseTest.prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (filePath != null) {
			File file = new File(filePath);
			if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
				res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").body(file)
						.auth().basic(username, password).urlEncodingEnabled(false).when()
						.post("cosec/api.svc/v2/" + apiName).then()// .log().all()
						.assertThat().statusCode(statusCode).extract().response().asString();
				// body("success",equalTo("0210200001:successful"));
				// System.out.println(res);
			} else {
				res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").body(file)
						.auth().basic(username, password).urlEncodingEnabled(false).when()
						.post("evertect/api.svc/v2/" + apiName).then()// .log().all()
						.assertThat().statusCode(statusCode).extract().response().asString();
				// body("success",equalTo("0210200001:successful"));
				// System.out.println(res);
			}
		} else {
			if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")) {
				res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
						.basic(username, password).urlEncodingEnabled(false).when().post("cosec/api.svc/v2/" + apiName)
						.then()// .log().all()
						.assertThat().statusCode(statusCode).extract().response().asString();
				// body("success",equalTo("0210200001:successful"));
				// System.out.println(res);
			} else {
				res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
						.basic(username, password).urlEncodingEnabled(false).when()
						.post("evertect/api.svc/v2/" + apiName).then()// .log().all()
						.assertThat().statusCode(statusCode).extract().response().asString();
				// body("success",equalTo("0210200001:successful"));
				// System.out.println(res);
			}
		}
		String res1 = null;
		if (res.length() > 32767) {
			res1 = (String) res.subSequence(0, 32767);

		} else {
			res1 = res;
		}

		return res1;
	}

	/////////////////////// read & write Excel/////////////////////////
	// Api related changes start here
	// read from excel data logic
	public static String[][] excelData(String sheetName) throws IOException {
		DataFormatter formatter = new DataFormatter();
		FileInputStream fis = new FileInputStream(
				System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\API.xlsx");
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheet(sheetName);
		int numberofRow = sheet.getPhysicalNumberOfRows();
		XSSFRow firstrow = sheet.getRow(0);
		int numberofCell = firstrow.getPhysicalNumberOfCells();
		// System.out.println(numberofRow +" "+numberofCell);
		String[][] data = new String[numberofRow][numberofCell];
		for (int i = 0; i < numberofRow; i++) {
			XSSFRow row = sheet.getRow(i);
			for (int j = 0; j < numberofCell; j++) {
				XSSFCell cell = row.getCell(j);
				data[i][j] = formatter.formatCellValue(cell);
			}
		}
		return data;
	}

	// write data to excel data logic
	public static void writeData(String sheetName, int row, int col, String result) throws IOException {
		FileInputStream fis = new FileInputStream(
				System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\API.xlsx");
		XSSFWorkbook wb = new XSSFWorkbook(fis);
		XSSFSheet sheet = wb.getSheet(sheetName);
		XSSFCell cell = sheet.getRow(row).getCell(col);
		// System.out.println(cell);
		if (cell == null) {
			XSSFCell cell1 = sheet.getRow(row).createCell(col);
			if (result.length() > 32767) {
				String res = (String) result.subSequence(0, 32767);
				cell1.setCellValue(res);
			} else {
				cell1.setCellValue(result);
			}
		} else {
			if (result.length() > 32767) {
				String res = (String) result.subSequence(0, 32767);
				cell.setCellValue(res);
			} else {
				cell.setCellValue(result);
			}
		}
		FileOutputStream fos = new FileOutputStream(
				System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\API.xlsx");
		wb.write(fos);
		wb.close();
	}

	public String queryParameterValChangeWithDB(String qParam) {
		System.out.println(qParam);
		String[] parmetersplitwithEqual = null;
		String[] queryParSplit = qParam.split(";");
		for (int i = 0; i < queryParSplit.length; i++) {
			if (queryParSplit[i].toLowerCase().contains(("accrual-policy").toLowerCase())) {
				System.out.println("Check if case" + queryParSplit[i]);
				parmetersplitwithEqual = queryParSplit[i].split("=");
				System.out.println("Check parmetersplitwithEqual" + parmetersplitwithEqual);
				if (parmetersplitwithEqual.length != 1) {
					String databasequery = "select LCPLCID from Mx_LeaveCreditPolicyMst where upper(Name)=upper('"
							+ parmetersplitwithEqual[1] + "')";
					System.out.println("Check databasequery" + databasequery);
					String qPVal1 = getDataFDatabase(databasequery);
					System.out.println("Check qPVal1" + qPVal1);
					String qPValwithPData = "accrual-policy=" + qPVal1;
					System.out.println("Check qPValwithPData" + qPValwithPData);
					qParam = qParam.replace(queryParSplit[i], qPValwithPData);
					System.out.println("Check qParam" + qParam);
				}
			} else if (queryParSplit[i].toLowerCase().contains(("station-id").toLowerCase())
					&& queryParSplit[i].contains(("="))) {
				System.out.println("Check if case" + queryParSplit[i]);
				String[] splitwithEqual = queryParSplit[i].split("=");
				if (splitwithEqual[0].equalsIgnoreCase("station-id")) {
					parmetersplitwithEqual = queryParSplit[i].split("=");
					System.out.println("Check parmetersplitwithEqual" + parmetersplitwithEqual);
					if (parmetersplitwithEqual.length != 1) {
						String databasequery = "select STLID from Mx_VSTRSTLocationMst where upper(Name)=upper('"
								+ parmetersplitwithEqual[1] + "')";
						System.out.println("Check databasequery" + databasequery);
						String qPVal1 = getDataFDatabase(databasequery);
						System.out.println("Check qPVal1" + qPVal1);
						String qPValwithPData = "station-id=" + qPVal1;
						System.out.println("Check qPValwithPData" + qPValwithPData);
						qParam = qParam.replace(queryParSplit[i], qPValwithPData);
						System.out.println("Check qParam" + qParam);
					}
				}
			} else if (queryParSplit[i].toLowerCase().contains(("approval-stage-id").toLowerCase())) {
				System.out.println("Check if case" + queryParSplit[i]);
				parmetersplitwithEqual = queryParSplit[i].split("=");
				System.out.println("Check parmetersplitwithEqual" + parmetersplitwithEqual);
				if (parmetersplitwithEqual.length != 1) {
					String databasequery = "select AprvlID from MX_CWMApprovalStages where upper(AprvlName)=upper('"
							+ parmetersplitwithEqual[1] + "')";
					System.out.println("Check databasequery" + databasequery);
					String qPVal1 = getDataFDatabase(databasequery);
					System.out.println("Check qPVal1" + qPVal1);
					String qPValwithPData = "approval-stage-id=" + qPVal1;
					System.out.println("Check qPValwithPData" + qPValwithPData);
					qParam = qParam.replace(queryParSplit[i], qPValwithPData);
					System.out.println("Check qParam" + qParam);
				}
			} else if (queryParSplit[i].toLowerCase().contains(("approval-policy-name").toLowerCase())
					&& queryParSplit[i].contains(("="))) {
				System.out.println("Check if case" + queryParSplit[i]);
				String[] splitwithEqual = queryParSplit[i].split("=");
				if (splitwithEqual[0].equalsIgnoreCase("approval-policy-name")) {
					parmetersplitwithEqual = queryParSplit[i].split("=");
					System.out.println("Check parmetersplitwithEqual" + parmetersplitwithEqual);
					if (parmetersplitwithEqual.length != 1) {
						String databasequery = "select APID from Mx_ApprovalPolicyMst where upper(Name)=upper('"
								+ parmetersplitwithEqual[1] + "')";
						System.out.println("Check databasequery" + databasequery);
						String qPVal1 = getDataFDatabase(databasequery);
						System.out.println("Check qPVal1" + qPVal1);
						String qPValwithPData = "approval-policy-id=" + qPVal1;
						System.out.println("Check qPValwithPData" + qPValwithPData);
						qParam = qParam.replace(queryParSplit[i], qPValwithPData);
						System.out.println("Check qParam" + qParam);
					}
				}
			}
		}
		System.out.println("Check Lats qParam" + qParam);
		return qParam;
	}

	/////////////////////// read & write Excel close/////////////////////////
	//////////////////////////// WEB API Common
	/////////////////////// Function//////////////////////////////
	public void webAPITest(String scFrom, String scTo, String sheetName) throws Exception {
		String filepath = null;
		String getValue = null;
		String monthForYear = null;
		String[] scFromSplitwithScenario = scFrom.toLowerCase().trim().split("scenario ");
		int fromsc = Integer.parseInt(scFromSplitwithScenario[1]);
		String[] scToSplitwithScenario = scTo.toLowerCase().trim().split("scenario ");
		int tosc = Integer.parseInt(scToSplitwithScenario[1]);
		String[][] data = excelData(sheetName);
		List<String> extraParameterHeader = new ArrayList<>();
		List<String> format = new ArrayList<>();
		for (int i = 0; i < 1; i++) {
			if (data[i].length > 11) {
				for (int j = 11; j < data[i].length; j++) {
					String[] param = data[i][j].split("\\(");
					extraParameterHeader.add(param[0]);
					String[] formatForFOrm = param[1].split("\\)");
					format.add(formatForFOrm[0]);
				}
			}
		}
		for (int ch = fromsc; ch <= tosc; ch++) {
			for (int i = 1; i < data.length; i++) {
				List<String> extraParameter = new ArrayList<>();
				String scenario = data[i][0].toLowerCase();
				String scenariostart = "scenario " + ch;
				if (scenariostart.toLowerCase().equalsIgnoreCase(scenario)) {
					logger.info("######## sheet Name :"+sheetName+" ############## API Scenario :"+scenariostart+" ################################");
					String action = data[i][2];
					String getField = data[i][3].trim();
					String requestSenderOption = data[i][4];
					String queryParameterACTION = data[i][5];
					String username = data[i][6];
					String password = data[i][7];
					String statusCode1 = data[i][8];
					int statusCode = Integer.parseInt(statusCode1);
					String expectedresult = data[i][9];
					System.out.println("expectedresult = " + expectedresult);
					if (data[i].length > 11) {
						for (int j = 11; j < data[i].length; j++) {
							// for format ddmmyyyy
							if (format.get(j - 11).equalsIgnoreCase("ddmmyyyy")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String date = AbstractMethod.dateSelectedForAPI(data[i][j]);
									extraParameter.add(date);
								} else {
									extraParameter.add("");
								}
							}
							// for format ddmmyyyyhhmmss
							else if (format.get(j - 11).equalsIgnoreCase("ddmmyyyyhhmmss")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String dateplussecond = AbstractMethod.dateddmmyyyyhhmmssForAPI(data[i][j]);
									extraParameter.add(dateplussecond);
								} else {
									extraParameter.add("");
								}
							}
							// for format ddmmyyyy-ddmmyyyy
							else if (format.get(j - 11).equalsIgnoreCase("ddmmyyyy-ddmmyyyy")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {

									String daterangeF = AbstractMethod.dateddmmyyyyddmmyyyyForAPI(data[i][j]);
									extraParameter.add(daterangeF);
								} else {
									extraParameter.add("");
								}
							}
							// for format mmyyyy
							else if (format.get(j - 11).equalsIgnoreCase("mmyyyy")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String monthYearsF = AbstractMethod.datedmmyyyyForAPI(data[i][j]);
									extraParameter.add(monthYearsF);
								} else {
									extraParameter.add("");
								}
							}
							// for format ddmmyyyyHHMM
							else if (format.get(j - 11).equalsIgnoreCase("ddmmyyyyHHMM")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String monthYearsF = AbstractMethod.dateddmmyyyyHHMMForAPI(data[i][j]);
									extraParameter.add(monthYearsF);
								} else {
									extraParameter.add("");
								}
							}
							// for format ddmmyyyyhhmmss-ddmmyyyyhhmmss
							else if (format.get(j - 11).equalsIgnoreCase("ddmmyyyyhhmmss-ddmmyyyyhhmmss")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String monthYearsF = AbstractMethod
											.dateddmmyyyyhhmmssddmmyyyyhhmmssForAPI(data[i][j]);
									extraParameter.add(monthYearsF);
								} else {
									extraParameter.add("");
								}
							}
							// for format filepath
							else if (format.get(j - 11).equalsIgnoreCase("path")) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									filepath = data[i][j];
									// System.out.println(filepath);
									extraParameter.add("");
								} else {
									extraParameter.add("");
								}
							}
							// for format mm
							else if ((format.get(j - 11).equalsIgnoreCase("mm"))) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									monthForYear = data[i][j];
									String month = AbstractMethod.integerMonthSelected(data[i][j]);
									extraParameter.add(month);
								} else {
									extraParameter.add("");
								}
							}
							// for format yyyy
							else if ((format.get(j - 11).equalsIgnoreCase("yyyy"))) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String month = AbstractMethod.staticYearOrPlusMinusYearFromCurrentYear(monthForYear,
											data[i][j]);
									extraParameter.add(month);
								} else {
									extraParameter.add("");
								}
							}
							// for format hhmm (Minutes +- from current time)
							else if ((format.get(j - 11).equalsIgnoreCase("hhmm"))) {
								if (!data[i][j].isEmpty() && !data[i][j].contains(",")) {
									String hhmm = AbstractMethod.staticTimeOrPlusMinusMinutesFromCurrentTime(data[i][j])
											.replace(":", "");
									extraParameter.add(hhmm);
								} else {
									extraParameter.add("");
								}
							}

						}
					}
					List<String> dateWiseParameter = new ArrayList<>();
					for (int x = 0; x < extraParameter.size(); x++) {
						if (!extraParameter.get(x).isEmpty()) {
							dateWiseParameter.add(extraParameterHeader.get(x) + "=" + extraParameter.get(x));
						}
					}
					StringBuilder builder = new StringBuilder();
					for (String s : dateWiseParameter) {
						builder.append(";" + s);
					}
					String userParameter = builder.toString();
					String qParam = queryParameterACTION + userParameter;
					if (action.equalsIgnoreCase("set")) {
						if (!getField.isEmpty() || !getField.isBlank()) {
							String parmeterPlusQParameter = qParam + ";" + getField + "=" + getValue;
							parmeterPlusQParameter = queryParameterValChangeWithDB(parmeterPlusQParameter);
							String actualR = setAPITest(parmeterPlusQParameter, username, password, requestSenderOption,
									statusCode);
							if (requestSenderOption.equalsIgnoreCase("invite-visitor")
									|| requestSenderOption.equalsIgnoreCase("visitor-registration")
									|| requestSenderOption.equalsIgnoreCase("visit-state")
									|| requestSenderOption.equalsIgnoreCase("visitor")
									|| requestSenderOption.equalsIgnoreCase("reporting-group")) {
								if (expectedresult.toLowerCase().contains("saved successfully")) {
									if (expectedresult.toLowerCase().contains("saved successfully")
											&& expectedresult.toLowerCase().contains("success")
											&& actualR.toLowerCase().contains("saved successfully")
											&& actualR.toLowerCase().contains("success")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else if (expectedresult.toLowerCase().contains("new reporting group added")
										&& actualR.toLowerCase().contains("new reporting group added")) {
									if (expectedresult.toLowerCase().contains("new reporting group added")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else {
									if (expectedresult.equalsIgnoreCase(actualR)) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								}
							} else {
								if (expectedresult.equalsIgnoreCase(actualR)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, actualR);
								}
							}
						} else {
							qParam = queryParameterValChangeWithDB(qParam);
							String actualR = setAPITest(qParam, username, password, requestSenderOption, statusCode);
							if (requestSenderOption.equalsIgnoreCase("invite-visitor")
									|| requestSenderOption.equalsIgnoreCase("visitor-registration")
									|| requestSenderOption.equalsIgnoreCase("visit-state")
									|| requestSenderOption.equalsIgnoreCase("visitor")
									|| requestSenderOption.equalsIgnoreCase("reporting-group")) {

								if (expectedresult.toLowerCase().contains("saved successfully")) {
									if (expectedresult.toLowerCase().contains("saved successfully")
											&& expectedresult.toLowerCase().contains("success")
											&& actualR.toLowerCase().contains("saved successfully")
											&& actualR.toLowerCase().contains("success")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else if (expectedresult.toLowerCase().contains("new reporting group added")) {
									if (expectedresult.toLowerCase().contains("new reporting group added")
											&& actualR.toLowerCase().contains("new reporting group added")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else {
									if (expectedresult.equalsIgnoreCase(actualR)) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								}
							} else {
								if (expectedresult.equalsIgnoreCase(actualR)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, actualR);
								}
							}

						}

					} else if (action.equalsIgnoreCase("get")) {
						String actualR = getAPITest(qParam, username, password, requestSenderOption, statusCode);
						System.out.println("Actual result of api" + actualR);
						if (!getField.isEmpty() || !getField.isBlank()) {
							List<String> transactionIdRelated = new ArrayList<String>(
									Arrays.asList("application-id", "tid", "imei", "appointment-no", "transaction-id",
											"index-no", "visitor-id", "reference-code"));
							if (transactionIdRelated.contains(getField.toLowerCase())) {
								if (requestSenderOption.equalsIgnoreCase("loginuser")) {
									requestSenderOption = "loginuserdetail";
								} else if (requestSenderOption.equalsIgnoreCase("visitor-registration")) {
									requestSenderOption = "visitor";
								} else if (requestSenderOption.equalsIgnoreCase("visitor-profile")) {
									requestSenderOption = "visitor";
								}

								String getparameter = requestSenderOption + "." + getField;
								JsonPath js = new JsonPath(actualR); // for parsing json
								String sus = js.getString(getparameter);
								getValue = sus.replace("[", "").replace("]", "").replace(" ", "");
								writeData(sheetName, i, 1, "Pass");
								writeData(sheetName, i, 10, getValue);
							} else {
								ObjectMapper mapper = new ObjectMapper();
								JsonNode jsonNode = mapper.readTree(actualR);
								if (requestSenderOption.equalsIgnoreCase("visitor-registration")) {
									requestSenderOption = "visitor";
								} else if (requestSenderOption.equalsIgnoreCase("visitor-profile")) {
									requestSenderOption = "visitor";
								}
								JsonNode alertNode = jsonNode.get(requestSenderOption).get(0);
								String act = alertNode.get(getField).toString().replaceAll("\"", "");
								if (expectedresult.equalsIgnoreCase(act)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, act);
								}
							}
						} else {
							if (actualR.length() > 32767) {
								String act = (String) actualR.subSequence(0, 32767);
								if (expectedresult.equalsIgnoreCase(act)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, act);
								}

							} else {
								// result update in XLS
								if (expectedresult.equalsIgnoreCase(actualR)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, actualR);
								}
							}
						}
					} else if (action.equalsIgnoreCase("update")) {
						if (!getField.isEmpty() || !getField.isBlank()) {
							String parmeterPlusQParameter = qParam + ";" + getField + "=" + getValue;
							parmeterPlusQParameter = queryParameterValChangeWithDB(parmeterPlusQParameter);
							String actualR = updateAPITest(parmeterPlusQParameter, username, password,
									requestSenderOption, statusCode);
							if (requestSenderOption.equalsIgnoreCase("reporting-group")) {
								if (expectedresult.toLowerCase().contains("reporting group data updated")) {
									if (expectedresult.toLowerCase().contains("reporting group data updated")
											&& actualR.toLowerCase().contains("reporting group data updated")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else {
									if (expectedresult.equalsIgnoreCase(actualR)) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								}
							} else {
								if (expectedresult.equalsIgnoreCase(actualR)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, actualR);
								}
							}
						} else {
							qParam = queryParameterValChangeWithDB(qParam);
							String actualR = updateAPITest(qParam, username, password, requestSenderOption, statusCode);
							if (requestSenderOption.equalsIgnoreCase("reporting-group")) {
								if (expectedresult.toLowerCase().contains("reporting group data updated")) {
									if (expectedresult.toLowerCase().contains("reporting group data updated")
											&& actualR.toLowerCase().contains("reporting group data updated")) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								} else {
									if (expectedresult.equalsIgnoreCase(actualR)) {
										writeData(sheetName, i, 1, "Pass");
										writeData(sheetName, i, 10, " ");
									} else {
										writeData(sheetName, i, 1, "Fail");
										writeData(sheetName, i, 10, actualR);
									}
								}
							} else {
								if (expectedresult.equalsIgnoreCase(actualR)) {
									writeData(sheetName, i, 1, "Pass");
									writeData(sheetName, i, 10, " ");
								} else {
									writeData(sheetName, i, 1, "Fail");
									writeData(sheetName, i, 10, actualR);
								}
							}
						}
					} else if (action.equalsIgnoreCase("delete")) {
						if (!getField.isEmpty() || !getField.isBlank()) {
							String parmeterPlusQParameter = qParam + ";" + getField + "=" + getValue;
							String actualR = deleteAPITest(parmeterPlusQParameter, username, password,
									requestSenderOption, statusCode);
							if (expectedresult.equalsIgnoreCase(actualR)) {
								writeData(sheetName, i, 1, "Pass");
								writeData(sheetName, i, 10, " ");
							} else {
								writeData(sheetName, i, 1, "Fail");
								writeData(sheetName, i, 10, actualR);
							}
						} else {
							String actualR = deleteAPITest(qParam, username, password, requestSenderOption, statusCode);
							if (expectedresult.equalsIgnoreCase(actualR)) {
								writeData(sheetName, i, 1, "Pass");
								writeData(sheetName, i, 10, " ");
							} else {
								writeData(sheetName, i, 1, "Fail");
								writeData(sheetName, i, 10, actualR);
							}
						}
					} else if (action.equalsIgnoreCase("datatransfer")) {
						if (!getField.isEmpty() || !getField.isBlank()) {
							String parmeterPlusQParameter = qParam + ";" + getField + "=" + getValue;
							String actualR = setAPITestForDataTransfer(parmeterPlusQParameter, username, password,
									requestSenderOption, statusCode, filepath);
							if (expectedresult.equalsIgnoreCase(actualR)) {
								writeData(sheetName, i, 1, "Pass");
								writeData(sheetName, i, 10, " ");
							} else {
								writeData(sheetName, i, 1, "Fail");
								writeData(sheetName, i, 10, actualR);
							}
						} else {
							String actualR = setAPITestForDataTransfer(qParam, username, password, requestSenderOption,
									statusCode, filepath);
							if (expectedresult.equalsIgnoreCase(actualR)) {
								writeData(sheetName, i, 1, "Pass");
								writeData(sheetName, i, 10, " ");
							} else {
								writeData(sheetName, i, 1, "Fail");
								writeData(sheetName, i, 10, actualR);
							}
						}
					}
				}
			}
		}

	}

	public void executeReseltVerify(String string, String string2, String string3, String string4) throws Exception {
		String[] scFromSplitwithScenario = string2.toLowerCase().trim().split("scenario ");
		int fromsc = Integer.parseInt(scFromSplitwithScenario[1]);
		String[] scToSplitwithScenario = string3.toLowerCase().trim().split("scenario ");
		int tosc = Integer.parseInt(scToSplitwithScenario[1]);
		for (int x = fromsc; x <= tosc; x++) {
			String[][] data = excelData(string);
			for (int i = 1; i < data.length; i++) {
				String scenario = data[i][0].toLowerCase();
				String scenariostart = "scenario " + x;
				if (scenariostart.toLowerCase().equalsIgnoreCase(scenario)) {
					String testResult = data[i][1];
					Assert.assertEquals(testResult, string4);
				}
			}
		}
	}

}
