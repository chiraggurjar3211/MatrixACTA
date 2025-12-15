package CommonTestAbstract;

import static io.restassured.RestAssured.given;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import CommonAbstract.AbstractMethod;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;

public class BaseTestDeviceAPI extends BaseTestWebAPI {
	/// API related changes here
	// API AUTOMATION TESTING
	public String getDeviceAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
				: BaseTest.prop.getProperty("deviceurl");
		RestAssured.baseURI = deviceUrl;
		res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
				.basic(username, password).urlEncodingEnabled(false).when().get("device.cgi/" + apiName).then().log()
				.all().assertThat().statusCode(statusCode).extract().asString();
		// System.out.println(res);

		return res;
	}

	// SET API and return Response
	public String setDeviceAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
				: BaseTest.prop.getProperty("deviceurl");
		RestAssured.baseURI = deviceUrl;
		res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
				.basic(username, password).urlEncodingEnabled(false).when().post("device.cgi/" + apiName).then().log()
				.all().assertThat().statusCode(statusCode).extract().asString();
		// System.out.println(res);

		return res;
	}

	// Update API and return Response
	public String updateDeviceAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
				: BaseTest.prop.getProperty("deviceurl");
		RestAssured.baseURI = deviceUrl;
		res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
				.basic(username, password).urlEncodingEnabled(false).when().put("device.cgi/" + apiName).then().log()
				.all().assertThat().statusCode(statusCode).extract().asString();
		// System.out.println(res);

		return res;
	}

	// Delete API and return Response
	public String deleteDeviceAPITest(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
				: BaseTest.prop.getProperty("deviceurl");
		RestAssured.baseURI = deviceUrl;
		res = given().log().all().queryParams("action", url).header("Connection", "keep-alive").auth()
				.basic(username, password).urlEncodingEnabled(false).when().delete("device.cgi/" + apiName).then().log()
				.all().assertThat().statusCode(statusCode).extract().asString();
		// System.out.println(res);

		return res;
	}

	//////////////////////////// device API Common
	//////////////////////////// Function//////////////////////////////
	public void deviceAPITest(String sheetName) throws IOException {
		String[][] data = excelData(sheetName);

		
		// get header from excel code and store in extraParameterHeader and format close
		for (int i = 1; i < data.length; i++) {

			List<String> extraParameter = new ArrayList<>();
			String testResult = data[i][0];
			String action = data[i][1];
			String getField = data[i][2].trim();
			String requestSenderOption = data[i][3];
			String queryParameterACTION = data[i][4];
			String username = data[i][5];
			String password = data[i][6];
			String statusCode1 = data[i][7];
			int statusCode = Integer.parseInt(statusCode1);
			String expectedresult = data[i][8];
			
			
			
			// check which action is perform code start
			// check set API
			if (action.equalsIgnoreCase("set")) {
				String actualR = setDeviceAPITest(queryParameterACTION, username, password, requestSenderOption,
						statusCode);
				if (expectedresult.equalsIgnoreCase(actualR)) {
					writeData(sheetName, i, 0, "Pass");
					writeData(sheetName, i, 9, " ");
				} else {
					writeData(sheetName, i, 0, "Fail");
					writeData(sheetName, i, 9, actualR);
				}

			}
			// CHeck Get api
			else if (action.equalsIgnoreCase("get")) {
				String actualR = getDeviceAPITest(queryParameterACTION, username, password, requestSenderOption, statusCode);
				if (actualR.length() > 32767) {
						String act = (String) actualR.subSequence(0, 32767);
						if (expectedresult.equalsIgnoreCase(act)) {
							writeData(sheetName, i, 0, "Pass");
							writeData(sheetName, i, 9, " ");
						} else {
							writeData(sheetName, i, 0, "Fail");
							writeData(sheetName, i, 9, act);
						}

					} else {
						// result update in XLS
						if (expectedresult.equalsIgnoreCase(actualR)) {
							writeData(sheetName, i, 0, "Pass");
							writeData(sheetName, i, 9, " ");
						} else {
							writeData(sheetName, i, 0, "Fail");
							writeData(sheetName, i, 9, actualR);
						}
					}
			
			} else if (action.equalsIgnoreCase("update")) {
					String actualR = updateDeviceAPITest(queryParameterACTION, username, password, requestSenderOption, statusCode);
					if (expectedresult.equalsIgnoreCase(actualR)) {
						writeData(sheetName, i, 0, "Pass");
						writeData(sheetName, i, 9, " ");
					} else {
						writeData(sheetName, i, 0, "Fail");
						writeData(sheetName, i, 9, actualR);
					}
					// Assert.assertEquals(actualR, expectedresult);
				
			} else if (action.equalsIgnoreCase("delete")) {
					String actualR = setDeviceAPITest(queryParameterACTION, username, password, requestSenderOption, statusCode);
					System.out.println(actualR);
					if (expectedresult.equalsIgnoreCase(actualR)) {
						writeData(sheetName, i, 0, "Pass");
						writeData(sheetName, i, 9, " ");
					} else {
						writeData(sheetName, i, 0, "Fail");
						writeData(sheetName, i, 9, actualR);
					}
				
			} else {
				
					String actualR = setDeviceAPITest(queryParameterACTION, username, password, requestSenderOption,
							statusCode);
					System.out.println(actualR);
					if (expectedresult.equalsIgnoreCase(actualR)) {
						writeData(sheetName, i, 0, "Pass");
						writeData(sheetName, i, 9, " ");
					} else {
						writeData(sheetName, i, 0, "Fail");
						writeData(sheetName, i, 9, actualR);
					}
					
				
			}
		}

	}
}
