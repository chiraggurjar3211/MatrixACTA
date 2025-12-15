package CommonTestAbstract;

import static io.restassured.RestAssured.given;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

//import javax.activation.DataHandler;
//import javax.activation.DataSource;
//import javax.activation.FileDataSource;
//import javax.mail.Authenticator;
//import javax.mail.BodyPart;
//import javax.mail.Flags;
//import javax.mail.Folder;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.Multipart;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Store;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeBodyPart;
//import javax.mail.internet.MimeMessage;
//import javax.mail.internet.MimeMultipart;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.SystemUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.edge.EdgeDriver;
import org.openqa.selenium.edge.EdgeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.openqa.selenium.firefox.ProfilesIni;
import org.testng.Assert;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.opencsv.CSVWriter;

import CommonAbstract.AbstractMethod;
import io.cucumber.datatable.DataTable;
import io.github.bonigarcia.wdm.WebDriverManager;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import stepDefinations.LeaveManagementSD;

public class BaseTest extends GmailReader {
	public static Properties prop;
	public WebDriver driver;
	public String deviceUrl = null;
	private static Logger logger = LogManager.getLogger(LeaveManagementSD.class);
	public String browserName;

	public WebDriver intializeBrowser() throws IOException {
		String downloadPath = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports";
		String globalPropertiesFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\global.properties";
		FileInputStream fis = new FileInputStream(globalPropertiesFilePath);
		prop = new Properties();
		prop.load(fis);
		browserName = System.getProperty("browser") != null ? System.getProperty("browser")
				: prop.getProperty("browser");

		if (driver == null) {
			if (browserName.contains("chrome")) {
//				 WebDriverManager.chromedriver().setup();
				chromeBrowser();
				ChromeOptions options = new ChromeOptions();
				options.setAcceptInsecureCerts(true);
				Map<String, Object> prefs = new HashMap<String, Object>();
				prefs.put("download.default_directory", downloadPath);
				prefs.put("credentials_enable_service", false);
				prefs.put("profile.password_manager_enabled", false);
				options.setExperimentalOption("prefs", prefs);
				if (browserName.contains("headless")) {
					options.addArguments("headless");
				} else if (browserName.contains("incognito")) {
					options.addArguments("incognito");
				}
				driver = new ChromeDriver(options);
			} else if (browserName.contains("firefox")) {
				// WebDriverManager.firefoxdriver().driverVersion("90.0.2").setup();
				System.setProperty("webdriver.gecko.driver", System.getProperty("user.dir")
						+ "\\src\\test\\resources\\Driver\\FirefoxDriver\\132.0.2\\geckodriver.exe");

				FirefoxProfile profile = new FirefoxProfile();
				profile.setPreference("browser.download.folderList", 2);
				profile.setPreference("browser.download.manager.showWhenStrating", true);
				profile.setPreference("browser.download.dir", downloadPath);
				profile.setPreference("browser.helperApps.neverAsk.saveToDisk", "application/octet-stream");

				FirefoxOptions options = new FirefoxOptions();
				options.setAcceptInsecureCerts(true);
				if (browserName.contains("headless")) {
					options.addArguments("-headless");
				}
				options.setProfile(profile);
				driver = new FirefoxDriver(options);
			} else if (browserName.contains("edge")) {
//				WebDriverManager.edgedriver().setup();
				edgeBrowser();
				EdgeOptions options = new EdgeOptions();
				options.setAcceptInsecureCerts(true);
				Map<String, Object> prefs = new HashMap<String, Object>();
				prefs.put("download.default_directory", downloadPath);
				options.setExperimentalOption("prefs", prefs);
				if (browserName.contains("headless")) {
					options.addArguments("headless");
				}
				driver = new EdgeDriver(options);
			}
			driver.manage().window().setSize(new Dimension(1400, 900));
			driver.manage().window().maximize();
			driver.manage().deleteAllCookies();
			driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

		}
		return driver;
	}

	public void goTo() {
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		driver.get(baseUrl);
		String[] baseUrlSplitWithDoubleSlash = baseUrl.split("//");
		String[] baseUrlSplitWithSingleSlash = baseUrlSplitWithDoubleSlash[1].split("/");
		AbstractMethod.ipaddress = baseUrlSplitWithSingleSlash[0];
	}

	// Visitor Portal
	public void goToVisitorPortal() throws InterruptedException {
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			driver.get(serverIP + "/COSECVISITOR/Login");
		} else {
			driver.get(serverIP + "/EVERTECTVISITOR/Login");
		}
		Thread.sleep(1000);
	}

	// Created by Mayank
	public void goToDeviceURL() {
		deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
				: prop.getProperty("deviceurl");
		driver.get(deviceUrl);

	}

//	public String goToDeviceURLLink() {
//		String deviceUrl = System.getProperty("deviceurl") != null ? System.getProperty("deviceurl")
//				: prop.getProperty("deviceurl");
//		return deviceUrl;
//	}

	// ******************************************************************************************************
	// *******************System Chrome,FireFox & Edge version check
	// function**********************************
	// *******************Driver Version Switch case
	// function****************************************
	// Check System Chrome version
	public String checkChromeVersion() throws IOException {
		String version = null;
		String installPath = "";
		Process userProcess;
		BufferedReader usersReader;
		if (SystemUtils.IS_OS_WINDOWS) {
			installPath = "reg query \"HKEY_CURRENT_USER\\Software\\Google\\Chrome\\BLBeacon\" /v version";
			System.out.println(installPath);
			userProcess = Runtime.getRuntime().exec(installPath);
			usersReader = new BufferedReader(new InputStreamReader(userProcess.getInputStream()));
			String p;
			List<String> name = new ArrayList<>();
			while ((p = usersReader.readLine()) != null) {
				// logger.debug(p);
				name.add(p);
			}
			String[] browserVersion = name.get(2).split(" ");
			version = browserVersion[12];
		}
		return version;
	}

	public void chromeBrowser() throws IOException {
		String chromeVer = checkChromeVersion();
		System.out.println("Version" + chromeVer);
		switch (chromeVer) {
		case "114.0.5735.110":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\114.0.5735.90\\chromedriver.exe");
			break;

		case "114.0.5735.134":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\114.0.5735.134\\chromedriver.exe");
			break;

		case "115.0.5790.171":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\115.0.5790.171\\chromedriver.exe");
			break;

		case "121.0.6167.86":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\121.0.6167.86\\chromedriver.exe");
			break;

		case "126.0.6478.127":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\126.0.6478.127\\chromedriver.exe");
			break;

		case "128.0.6613.113":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\128.0.6613.113\\chromedriver.exe");
			break;

		case "128.0.6613.138":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\128.0.6613.113\\chromedriver.exe");
			break;

		case "129.0.6668.90":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\129.0.6668.90\\chromedriver.exe");
			break;

		case "130.0.6723.117":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\130.0.6723.117\\chromedriver.exe");
			break;

		case "133.0.6943.60":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\133.0.6943.60\\chromedriver.exe");
			break;

		case "134.0.3124.83":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\134.0.6998.89\\chromedriver.exe");
			break;

		case "135.0.7049.96":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\135.0.7049.42\\chromedriver.exe");
			break;

		case "136.0.7103.114":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\136.0.7103.93\\chromedriver.exe");
			break;
		case "137.0.7151.120":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\137.0.7151.69\\chromedriver.exe");
			break;

		case "138.0.7204.97":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\138.0.7204.97\\chromedriver.exe");
			break;

		case "138.0.7204.169":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\138.0.7204.169\\chromedriver.exe");
			break;

		case "138.0.7204.98":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\138.0.7204.97\\chromedriver.exe");
			break;

		case "139.0.7258.155":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\139.0.7258.155\\chromedriver.exe");
			break;

		case "140.0.7339.81":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\140.0.7339.81\\chromedriver.exe");
			break;

		case "142.0.7444.60":
			System.setProperty("webdriver.chrome.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\ChromeDriver\\142.0.7444.60\\chromedriver.exe");
			break;

		default:
			logger.debug("Set driver 1st");
			break;
		}
	}

	// check system edge version
	public String checkEdgeVersion() throws IOException {
		String browserVer = null;
		String installPath = "";
		Process userProcess;
		BufferedReader usersReader;
		if (SystemUtils.IS_OS_WINDOWS) {
			installPath = "reg query \"HKEY_CURRENT_USER\\Software\\Microsoft\\Edge\\BLBeacon\" /v version";
			userProcess = Runtime.getRuntime().exec(installPath);
			usersReader = new BufferedReader(new InputStreamReader(userProcess.getInputStream()));
			String p;
			List<String> name = new ArrayList<>();
			while ((p = usersReader.readLine()) != null) {
				// logger.debug(p);
				name.add(p);
			}
			String[] browserVersion = name.get(2).split(" ");
			browserVer = browserVersion[12];
		}
		return browserVer;
	}

	public void edgeBrowser() throws IOException {
		String edgeVer = checkEdgeVersion();
		System.out.println("hello " + edgeVer);
		switch (edgeVer) {
		case "114.0.1823.41":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\114.0.1823.41\\msedgedriver.exe");
			break;

		case "114.0.1823.51":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\114.0.1823.41\\msedgedriver.exe");
			break;

		case "115.0.1901.188":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\115.0.1901.188\\msedgedriver.exe");
			break;

		case "118.0.2088.61":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\118.0.2088.61\\msedgedriver.exe");
			break;

		case "120.0.2210.61":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\120.0.2210.61\\msedgedriver.exe");
			break;

		case "121.0.2277.83":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\121.0.2277.83\\msedgedriver.exe");
			break;

		case "126.0.2592.68":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\126.0.2592.68\\msedgedriver.exe");
			break;

		case "126.0.2592.81":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\126.0.2592.68\\msedgedriver.exe");
			break;

		case "128.0.2739.67":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\128.0.2739.67\\msedgedriver.exe");
			break;

		case "129.0.2792.89":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\129.0.2792.89\\msedgedriver.exe");
			break;

		case "129.0.2792.79":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\129.0.2792.79\\msedgedriver.exe");
			break;

		case "130.0.2849.52":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\130.0.2849.52\\msedgedriver.exe");
			break;

		case "131.0.2903.112":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\131.0.2903.112\\msedgedriver.exe");
			break;
		case "132.0.2957.115":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\132.0.2957.115\\msedgedriver.exe");
			break;

		case "132.0.2957.140":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\132.0.2957.140\\msedgedriver.exe");
			break;

		case "138.0.3351.95":
			System.setProperty("webdriver.edge.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\EdgeDriver\\138.0.3351.77\\msedgedriver.exe");
			break;

		default:
			logger.debug("Set driver 1st");
			break;
		}
	}

	// Check System FireFOX version
	public String checkFireFoxVersion() throws IOException {
		String version = null;
		String installPath = "";
		Process userProcess;
		BufferedReader usersReader;
		if (SystemUtils.IS_OS_WINDOWS) {
			installPath = "reg query \"HKEY_CURRENT_USER\\SOFTWARE\\Mozilla\\Mozilla Firefox\" /v CurrentVersion";
			userProcess = Runtime.getRuntime().exec(installPath);
			usersReader = new BufferedReader(new InputStreamReader(userProcess.getInputStream()));
			String p;
			List<String> name = new ArrayList<>();
			while ((p = usersReader.readLine()) != null) {
				// logger.debug(p);
				name.add(p);
			}
			String[] browserVersion = name.get(2).split(" ");
			version = browserVersion[12];
		}
		return version;
	}

	public void firefoxBrowser() throws IOException {
		String fireFOXVer = checkFireFoxVersion();
		System.out.println("FireFox Versiodrivewrn" + fireFOXVer);
		switch (fireFOXVer) {
		case "132.0.2":
			System.setProperty("webdriver.gecko.driver", System.getProperty("user.dir")
					+ "\\src\\test\\resources\\Driver\\FirefoxDriver\\132.0.2\\geckodriver.exe");
			break;

		default:
			logger.debug("Set driver 1st");
			break;
		}
	}

	// ******************************************************************************************************
	// *******************Json file data fetching
	// function***************************************
	// ******************************************************************************************************

	public List<Map<String, String>> getJSONdata(String filePath) throws IOException {
		String jsonContent = FileUtils.readFileToString(new File(filePath), StandardCharsets.UTF_8);
		ObjectMapper mapper = new ObjectMapper();
		List<Map<String, String>> data = mapper.readValue(jsonContent, new TypeReference<List<Map<String, String>>>() {
		});
		return data;
	}

	// ******************************************************************************************************
	// *******************Switch Tab or window code
	// function***************************************
	// ******************************************************************************************************

	// Created by Mayank
	public void openNewTab() throws InterruptedException {
		Thread.sleep(1000);
		driver.switchTo().newWindow(WindowType.TAB);
		Thread.sleep(1000);
		ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
		driver.switchTo().window(tabs.get(1));
	}

	// Created by Mayank
	public void goToPreviousTab() throws InterruptedException {
		ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
		driver.switchTo().window(tabs.get(0));
		Thread.sleep(1000);
	}

	// Created by Mayank
	public void goToNextTab() throws InterruptedException {
		ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
		driver.switchTo().window(tabs.get(1));
		Thread.sleep(1000);
	}

	public void closeOneTab() throws InterruptedException {
		Thread.sleep(1000);
		ArrayList<String> tabs = new ArrayList<>(driver.getWindowHandles());
		driver.switchTo().window(tabs.get(1));
		driver.close();
		driver.switchTo().window(tabs.get(0));
	}

	// ******************************************************************************************************
	// *******************Database Related
	// Function***************************************
	// ******************************************************************************************************

	public String oracleInstanceCheck(String userN, String pass) {
		String username = userN;
		String password = pass;
		String instant = null;
		String sqlplusCommand = "echo SELECT NAME FROM V$SERVICES; | sqlplus " + username + "/" + password;

		try {
			ProcessBuilder processBuilder = new ProcessBuilder("cmd", "/c", sqlplusCommand);
			processBuilder.redirectErrorStream(true);

			Process process = processBuilder.start();
			BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));

			String line;

			while ((line = reader.readLine()) != null) {
				if (line.contains("xe")) {
					instant = "xe";
					break;
				} else {
					instant = "orcl";

				}
			}

			int exitCode = process.waitFor();
			logger.debug("Exited with error code " + exitCode);

		} catch (IOException | InterruptedException e) {
			e.printStackTrace();
		}
		return instant;
	}

	public String dataBaseConnectionURL() {
		String connectionUrl = null;
		String database = System.getProperty("database") != null ? System.getProperty("database")
				: prop.getProperty("database");
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[2];
		if (database.equalsIgnoreCase("MSSQL")) {
			connectionUrl = "jdbc:sqlserver://" + serverIP + ";"
			// + "instanceName=SQLEXPRESS;"
					+ "database=matrix;" + "user=sa;" + "password=matrix_1;" + "encrypt=true;"
					+ "trustServerCertificate=true;" + "loginTimeout=30;";
		} else {
			String username = "matrix";
			String password = "admin";
			// String instance = "/xe";
			String instance = "/" + oracleInstanceCheck(username, password);
			String server = serverIP + ":1521";
			connectionUrl = "jdbc:oracle:thin:" + username + "/" + password + "@" + server + instance;
			// logger.debug(connectionUrl);
		}
		return connectionUrl;
	}

	public int updateORDeleteDatabase(String dataBaseQuery) {
		int rs = 0;
		String database = System.getProperty("database") != null ? System.getProperty("database")
				: prop.getProperty("database");
		String connectionUrl = dataBaseConnectionURL();
		if (database.equalsIgnoreCase("MSSQL")) {
			try (Connection connection = DriverManager.getConnection(connectionUrl);) {
				// Code here.
				logger.info("Database connection successfully");
				Statement st = connection.createStatement();

				String Sql = dataBaseQuery;
				rs = st.executeUpdate(Sql);
				logger.info("Number of records affected : " + rs);
				// logger.debug(rs);
				connection.close();
			}
			// Handle any errors that may have occurred.
			catch (SQLException e) {
				logger.info("Database connection not successfully");
				e.printStackTrace();
			}
		} else {
			try (Connection connection = DriverManager.getConnection(connectionUrl);) {
				// Code here.
				logger.info("Database connection successfully");
				Statement st = connection.createStatement();
				connection.setAutoCommit(false);
				String Sql = dataBaseQuery;
				rs = st.executeUpdate(Sql);
				connection.commit();
				logger.info("Number of records affected : " + rs);
				// logger.debug(rs);
				connection.close();
			}
			// Handle any errors that may have occurred.
			catch (SQLException e) {
				logger.info("Database connection not successfully");
				e.printStackTrace();
			}
		}
		return rs;
	}

	// getdata from database only return 1 value
	public String getDataFDatabase(String dataBaseQuery) {
		String name = null;
		String connectionUrl = dataBaseConnectionURL();
		try (Connection connection = DriverManager.getConnection(connectionUrl);) {
			// Code here.

			// logger.debug("connection successfully");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(dataBaseQuery);
			while (rs.next()) {
				name = rs.getString(1);
			}
			connection.close();
		}
		// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
		return name;
	}

	// getmultiple data in database and set in map
	public Map<String, String> getMultipleDataFromDatabaseforDashboard(String dataBaseQuery) {
//		System.out.println("query is :"+dataBaseQuery);
		Map<String, String> data = new HashMap<String, String>();
		String connectionUrl = dataBaseConnectionURL();
		try (Connection connection = DriverManager.getConnection(connectionUrl);) {
			// Code here.
			// logger.debug("connection successfully");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(dataBaseQuery);
			while (rs.next()) {
				data.put(rs.getString(1), rs.getString(2));
			}
			connection.close();
		}
		// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}

	// getmultiple data in database and set in map
	public List<String> getMultipleDataFromSameRowforDashboard(String dataBaseQuery, String type) {
//		System.out.println("Database query is :"+dataBaseQuery);
		List<String> data = new ArrayList<String>();
		data.clear();
		String connectionUrl = dataBaseConnectionURL();
		try (Connection connection = DriverManager.getConnection(connectionUrl);) {
			// Code here.
			// logger.debug("connection successfully");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(dataBaseQuery);
			if (type.equalsIgnoreCase("Device Summary")) {
				while (rs.next()) {
					data.add(rs.getString(1));
					data.add(rs.getString(2));
					data.add(rs.getString(3));
				}
			} else if (type.equalsIgnoreCase("Attendance Summary")) {
				while (rs.next()) {
					data.add(rs.getString(1));
					data.add(rs.getString(2));
					data.add(rs.getString(3));
					data.add(rs.getString(4));
					data.add(rs.getString(5));
					data.add(rs.getString(6));
				}
			} else if (type.equalsIgnoreCase("User Enrollment")) {
				while (rs.next()) {
					data.add(rs.getString(1));
					data.add(rs.getString(2));
				}
			} else if (type.equalsIgnoreCase("Attendance Authorization")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "@" + rs.getString(2) + "@" + rs.getString(3));
				}
			} else if (type.equalsIgnoreCase("Leave")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "@" + rs.getString(2));
				}
			} else if (type.equalsIgnoreCase("User Statistics")) {
				while (rs.next()) {
					data.add(rs.getString(3));
				}
			}

			connection.close();
		}
		// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}

	// getmultiple data in database and set in map
	public List<String> getDashboardFilterD(String dataBaseQuery, String type) {
		System.out.println("Query Is : " + dataBaseQuery);
		List<String> data = new ArrayList<String>();
		String connectionUrl = dataBaseConnectionURL();
		try (Connection connection = DriverManager.getConnection(connectionUrl);) {
			// Code here.
			// logger.debug("connection successfully");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(dataBaseQuery);
			if (type.equalsIgnoreCase("User Statistics")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(8) + "|" + rs.getString(5));
				}
			} else if (type.equalsIgnoreCase("Device Summary")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(4) + "|" + rs.getString(3) + "|" + rs.getString(6)
							+ "|" + rs.getString(7) + "|" + rs.getString(8));
				}
			} else if (type.equalsIgnoreCase("Attendance Summary")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(6)
							+ "|" + rs.getString(7) + "|" + rs.getString(4) + "|" + rs.getString(5));
				}
			} else if (type.equalsIgnoreCase("User Enrollment")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4)
							+ "|" + rs.getString(5) + "|" + rs.getString(6) + "|" + rs.getString(7) + "|"
							+ rs.getString(8));
				}
			} else if (type.equalsIgnoreCase("Attendance Exception")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4));
				}
			} else if (type.equalsIgnoreCase("Attendance Authorization")) {
				while (rs.next()) {
					data.add(rs.getString(1) + "|" + rs.getString(2) + "|" + rs.getString(3) + "|" + rs.getString(4)
							+ "|" + rs.getString(6));
				}
			}
			connection.close();
		}
		// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
		return data;
	}

	// Get all data from database , Stored in List and return list
	public ArrayList<String> getAllDataFDatabase(String dataBaseQuery) {
		String name = null;
		String connectionUrl = dataBaseConnectionURL();
		logger.debug(connectionUrl);
		ArrayList<String> allData = new ArrayList<>();
		try (Connection connection = DriverManager.getConnection(connectionUrl);) {
			// Code here.

			// logger.debug("connection successfully");
			Statement st = connection.createStatement();
			ResultSet rs = st.executeQuery(dataBaseQuery);
			while (rs.next()) {
				name = rs.getString(1);
				allData.add(name);
			}
			connection.close();
		}
		// Handle any errors that may have occurred.
		catch (SQLException e) {
			e.printStackTrace();
		}
		return allData;
	}

	public void updateDefaultPolicy(String default1) throws InterruptedException {
		if (default1.equalsIgnoreCase("Password Policy")) {
			int updaterow = updateORDeleteDatabase("\r\n" + "update  Mx_GSYSPLCMst set \r\n"
					+ "PasswordPLCFLG='0',		--Password Security Policy\r\n"
					+ "PasswordCHGDAY='0',		--Password Reset Period (Days)\r\n"
					+ "PwdMinChars='5',		--Minimum Required Characters\r\n"
					+ "ESSCSSPwdMinChars='5',		--Minimum Required Characters\r\n"
					+ "PwdLevel='0',			--Security Level\r\n"
					+ "ESSCSSPwdLevel='0',			--Security Level\r\n"
					+ "PwdLgnAttemFlg='0',		--Lock Account for Invalid Attempts\r\n"
					+ "PwdLgnAttemCount='3',	--Maximum Invalid Attempts\r\n"
					+ "PwdUnlockTimer='60',	--Auto Unlock Timer (Min)\r\n"
					+ "MaxOTPGenretionCNT='10',--Maximum OTP Generation Attempts\r\n"
					+ "ResetOTPAfterMin='15',	--Resend OTP After (Min)\r\n"
					+ "PwdDenyReUseFlg='0',	--Deny Password Reuse\r\n"
					+ "PwdReUseSys='0',		--Reuse Count For System Account Users\r\n"
					+ "PwdReUseEss='0',		--Reuse Count For ESS Users\r\n"
					+ "OTPValidity_Min='3',		--OTP Validity Count\r\n"
					+ "OTPAuthPwdFlg='0'		--OTP Authentication For Setting Password\r\n" + "");
			Assert.assertEquals(updaterow, 1);
		} else if (default1.equalsIgnoreCase("Login")) {
			int updaterow = updateORDeleteDatabase("\r\n" + "update  Mx_GSYSPLCMst set \r\n"
					+ "LoginPLCFLG='0',		--Login Policy\r\n"
					+ "RestrictESSLocalLgn='0',		--Restrict ESS Local Login\r\n"
					+ "LoginViaSSO='0',		--Login Via SSO\r\n"
					+ "ActDirFlg='0',			--Login Via Active Directory\r\n"
					+ "ESSNotificationEnbl='1',		--Enable Notification\r\n" + "RSAKeySize='512',	--RSA Key Size\r\n"
					+ "LoginAuthntctnMd='1'	--Login Authentication Mode\r\n" + "");
			Assert.assertEquals(updaterow, 1);

			// Password then OTP mode changed to PasswordOROTP but need to try login and
			// then refresh page so below code written - Mayank Vishnoriya
			try {
				Thread.sleep(1000);
				if (driver.findElement(By.xpath("//*[@default=\"Logout\"]")).isDisplayed() == true) {
					driver.findElement(By.xpath("//*[@default=\"Logout\"]")).click();
					Thread.sleep(1000);
					driver.findElement(By.id("loginid")).sendKeys("sa");
					driver.findElement(By.id("pwd")).sendKeys("admin");
					driver.findElement(By.id("btnlogin")).click();
					Thread.sleep(1000);
				}

			} catch (Exception e) {
				Thread.sleep(1000);
				driver.navigate().refresh();
				Thread.sleep(1000);
				driver.findElement(By.id("loginid")).sendKeys("sa");
				driver.findElement(By.id("pwd")).sendKeys("admin");
				driver.findElement(By.id("btnlogin")).click();
				Thread.sleep(1000);
			}
			driver.navigate().refresh();
			Thread.sleep(1000);

		} else if (default1.equalsIgnoreCase("Visitor Management")) {
			int updaterow = updateORDeleteDatabase("\r\n" + "update  Mx_GSYSPLCMst set \r\n"
					+ "AuthVisPreReg='0',		--Authorization For Visitor Pre-Registration\r\n"
					+ "AuthVisitorInitiatedVisit='0',		--Authorization For Visitor Initiated Visit\r\n"
					+ "ChkVstrOTPVerfctn='0',		--Send OTP For Verification\r\n"
					+ "EPassSecurityApprv='0',			--Security Approval For Visitor E-Pass\r\n"
					+ "VisAccepReq='0',		--Required Visitor Acceptance\r\n"
					+ "EPassGenDur=NULL,	--Allow E-Pass Generation Before Duration\r\n"
					+ "ExpirePassDurAlert=NULL,	--Alert for Pass Expiration After Duration\r\n"
					+ "DefaultHost='',--Host User\r\n"
					+ "DynamicPINOnPassCreation='0',	--Dynamic PIN On Pass Creation\r\n"
					+ "PinLength='4',	--PIN Length\r\n"
					+ "MinDaysPreRegistration=NULL,		--Minimum Days Before Allowing Visit\r\n"
					+ "MaxDaysPreRegistration=NULL,		--Maximum Days Before Allowing Visit\r\n"
					+ "ApplyRestrictionOn='0',		--Apply Restriction On\r\n"
					+ "AutoProfileAsnmnt='0',		--Auto Profile Assignment\r\n"
					+ "MatchingLevel=''	,	--Matching Level\r\n"
					+ "AutoDeviceAsnmnt='0'	,	--Auto Device Assignment\r\n"
					+ "VisAccessViaQR='0'		--Access via QR\r\n" + "");
			Assert.assertEquals(updaterow, 1);
		}

		else {
			logger.debug("Page not found for set default");
		}

	}

	// Created by Mayank
	// ********************************************************************************************************************
	// *********************************API Related
	// Functions*********************************
	// ********************************************************************************************************************

	// Example
//		String serverIP = "http://191.168.11.10";
//		String url1 = "set;Userid=Mayank;Mid=13;Dtype=20;Did=1;Credentials=4;Event_src=0;event-datetime=05072023120000;in-out=0;";
//		String username = "sa";
//		String password = "admin";
//		String apiName1 = "events";
//		String exResponse1 = "success: 0210200001 : successful";

	// GET API and return Response
	public String getAPI(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			res = given()// .log().all()
					.queryParams("action", url).auth().basic(username, password).urlEncodingEnabled(false).when()
					.get("cosec/api.svc/v2/" + apiName).then()// .log().all()
					.assertThat().statusCode(statusCode).extract().asString();
			// logger.debug(res);
		} else {
			res = given()// .log().all()
					.queryParams("action", url).auth().basic(username, password).urlEncodingEnabled(false).when()
					.get("evertect/api.svc/v2/" + apiName).then()// .log().all()
					.assertThat().statusCode(statusCode).extract().asString();
			// logger.debug(res);
		}
		return res;
	}

	// SET API and return Response
	public String setAPI(String url, String username, String password, String apiName, int statusCode) {
		String res = null;
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		RestAssured.baseURI = serverIP;
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			res = given() // .log().all()
					.queryParams("action", url).auth().basic(username, password).urlEncodingEnabled(false).when()
					.post("cosec/api.svc/v2/" + apiName).then()// .log().all()
					.assertThat().statusCode(statusCode).extract().response().asString();
			// logger.debug(res);
		} else {
			res = given() // .log().all()
					.queryParams("action", url).auth().basic(username, password).urlEncodingEnabled(false).when()
					.post("evertect/api.svc/v2/" + apiName).then()// .log().all()
					.assertThat().statusCode(statusCode).extract().response().asString();
			// logger.debug(res);
		}
		return res;
	}

	// Created by Mayank
	// ********************************************************************************************************************
	// *********************************Service Start and
	// stop*********************************
	// ********************************************************************************************************************

	public int startStopService(String service, String status) throws Exception {
		Thread.sleep(2000);
		int exitCode = 0;
		try {
			String command = "sc " + status + " " + service; // Example: "sc start AlertService"
			ProcessBuilder processBuilder = new ProcessBuilder(command.split(" "));
			processBuilder.redirectErrorStream(true); // Redirects stderr to stdout
			Process process = processBuilder.start();

			BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line;
			while ((line = reader.readLine()) != null) {
				// You can log or print the output here
				System.out.println(line);
			}
			exitCode = process.waitFor();
			System.out.println("Command ExitCode: " + exitCode);

		} catch (IOException e) {
			e.printStackTrace();
			exitCode = 500;
		}
		Thread.sleep(6000);
		return exitCode;
	}

	// ********************************************************************************************************************
	// ***************Import FIle Logic Start************************************
	// *********************************************************************
	// ********************************************************************************************************************
	// 1st step delete record from file except 1st row
	public void clearData(String sheetName) throws IOException {
		String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		FileInputStream fis = new FileInputStream(filePath);
		HSSFWorkbook wb = new HSSFWorkbook(fis);
		HSSFSheet sheet = wb.getSheet(sheetName);
		int lastrow = sheet.getLastRowNum();
		for (int i = 1; i < lastrow + 1; i++) {
			if (sheet.getRow(i) != null) {
				sheet.removeRow(sheet.getRow(i));
			}
		}
		FileOutputStream fos = new FileOutputStream(filePath);
		wb.write(fos);
		wb.close();
	}

	// 2nd step finding column number
	public int getUpdateColumn(String sheetName, String coulumnHeaderName) throws IOException {
		int count = 0;
		int headerCountNumber = 0;
		String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		FileInputStream fis = new FileInputStream(filePath);
		HSSFWorkbook wb = new HSSFWorkbook(fis);
		int sheetsCount = wb.getNumberOfSheets();
		for (int i = 0; i < sheetsCount; i++) {
			// logger.debug(wb.getSheetName(i));
			if (wb.getSheetName(i).equalsIgnoreCase(sheetName)) {
				HSSFSheet sheet = wb.getSheetAt(i);
				Iterator<Row> row = sheet.rowIterator();
				Row headerRow = row.next();
				Iterator<Cell> cells = headerRow.cellIterator();
				while (cells.hasNext()) {
					Cell header = cells.next();
					// logger.debug(header.getStringCellValue());
					if (header.getStringCellValue().equalsIgnoreCase(coulumnHeaderName)) {
						headerCountNumber = count;
						break;
					}
					count++;
				}
			}
		}
		return headerCountNumber;
	}

	// 3rd step: 2nd step found row and column after write data in excel
	public void writeData(String sheetName, int row, int col, String result, String coulumnHeaderName)
			throws IOException {
		String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		FileInputStream fis = new FileInputStream(filePath);
		HSSFWorkbook wb = new HSSFWorkbook(fis);
		HSSFSheet sheet = wb.getSheet(sheetName);
		// logger.debug(sheetName + " " + row + " " + col + " " + result + " " +
		// coulumnHeaderName);
		HSSFRow rowc = null;
		if (sheet.getRow(row) == null) {
			rowc = sheet.createRow(row);
		} else {
			rowc = sheet.getRow(row);
		}
		if (rowc.getCell(col) == null) {
			HSSFCell createCell = rowc.createCell(col);

			if ((coulumnHeaderName.toUpperCase().contains("DATE") || coulumnHeaderName.toUpperCase().contains("PUNCH")
					|| coulumnHeaderName.equalsIgnoreCase("ValidityStart")
					|| coulumnHeaderName.equalsIgnoreCase("ValidityEnd")) && !sheetName.equalsIgnoreCase("Purchase")) {
				if (result.contains("/")) {
					createCell.setCellValue(result);
				} else {
					if (result.contains(" ")) {
						String[] result1 = result.split(" ");
						String date = AbstractMethod.dateSelectedinddMMyyyyWithSlash(result1[0]);
						createCell.setCellValue(date + " " + result1[1]);
					} else {
						String date = AbstractMethod.dateSelectedinddMMyyyyWithSlash(result);
						createCell.setCellValue(date);
					}
				}
			} else if (sheetName.equalsIgnoreCase("Field Schedule") && coulumnHeaderName.equalsIgnoreCase("Task ID")) {
				String getTaskId = "select TaskID from Mx_FVMTaskMst where upper(Name)=upper('" + result + "')";
				String taskid = getDataFDatabase(getTaskId);
				createCell.setCellValue(taskid);
			} else if (coulumnHeaderName.equalsIgnoreCase("OrganizationID")
					|| coulumnHeaderName.equalsIgnoreCase("OrgID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "organization", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("BranchID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "branch", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("DesignationID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "designation", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("DepartmentID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "department", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("SectionID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "section", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("CategoryID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "category", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("GradeID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "grade", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("Custom Group 1ID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "custom-group-1", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("Custom Group 2ID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "custom-group-2", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("Custom Group 3ID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "custom-group-3", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("Custom Group 3ID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "custom-group-3", 200).toUpperCase();
				String findorg = "\",\"CODE\":\"" + result.toUpperCase() + "\",\"";
				String[] orgnization = response.split(findorg);
				String organ = orgnization[0].substring(orgnization[0].length() - 2).replace("\"", "");
				createCell.setCellValue(organ);
			} else if (coulumnHeaderName.equalsIgnoreCase("ReportGroupID")) {
				String reportingGroup = "select RGID from Mx_RepoGroupMst where upper(Name)=upper('" + result + "')";
				String reportingGID = getDataFDatabase(reportingGroup);
				createCell.setCellValue(reportingGID);
			} else if (coulumnHeaderName.equalsIgnoreCase("ApprovalPolicyID")) {
				String approvalPolicy = "select APID from Mx_ApprovalPolicyMst where upper(Name)=upper('" + result
						+ "')";
				String approvalPolicyID = getDataFDatabase(approvalPolicy);
				createCell.setCellValue(approvalPolicyID);
			} else if (coulumnHeaderName.equalsIgnoreCase("ScheduleGroupID")) {
				String scheduleGroup = "select SGID from Mx_ShiftSchMst where upper(SGName)=upper('" + result + "')";
				String scheduleGroupID = getDataFDatabase(scheduleGroup);
				createCell.setCellValue(scheduleGroupID);
			} else if (coulumnHeaderName.equalsIgnoreCase("LeaveGroup")) {
				String leaveGroup = "select LGID from Mx_LeaveGroupMst where upper(Name)=upper('" + result + "')";
				String leaveGroupID = getDataFDatabase(leaveGroup);
				createCell.setCellValue(leaveGroupID);
			} else if (coulumnHeaderName.equalsIgnoreCase("WeekOffGroupID")) {
				String weekOffGroup = "SELECT ID FROM Mx_WOGroupMst where upper(Name)=upper('" + result + "')";
				String weekOffGroupID = getDataFDatabase(weekOffGroup);
				createCell.setCellValue(weekOffGroupID);
			} else if (coulumnHeaderName.equalsIgnoreCase("SiteID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "site", 200).toUpperCase();
				String site = "\",\"NAME\":\"" + result.toUpperCase() + "\",\"";
				String[] siteSplit = response.split(site);
				String siteID = siteSplit[0].substring(siteSplit[0].length() - 2).replace("\"", "");
				createCell.setCellValue(siteID);
			} else if (coulumnHeaderName.equalsIgnoreCase("SkillID")) {
				String skill = "select SkillID from Mx_CWMWSkill where upper(Name)=upper('" + result + "')";
				String skillID = getDataFDatabase(skill);
				createCell.setCellValue(skillID);
			} else if (sheetName.equalsIgnoreCase("Work Orders") && coulumnHeaderName.equalsIgnoreCase("Type")) {
				String type = "select WOTID from Mx_CWMWorkOrderType where upper(Name)=upper('" + result + "')";
				String typeid = getDataFDatabase(type);
				createCell.setCellValue(typeid);
			} else if (sheetName.equalsIgnoreCase("Work Orders")
					&& coulumnHeaderName.equalsIgnoreCase("ApprovalStageID")) {
				String approvalStage = "select AprvlID from MX_CWMApprovalStages where upper(AprvlName)=upper('"
						+ result + "')";
				String approvalStageid = getDataFDatabase(approvalStage);
				createCell.setCellValue(approvalStageid);
			} else if (sheetName.equalsIgnoreCase("Contractors") && coulumnHeaderName.equalsIgnoreCase("TypeID")) {
				String type = "select ConTypeID from Mx_CWMContractorTypeMst where upper(Name)=upper('" + result + "')";
				String typeIDid = getDataFDatabase(type);
				createCell.setCellValue(typeIDid);
			} else if ((sheetName.equalsIgnoreCase("Location Master") && coulumnHeaderName.equalsIgnoreCase("MID"))
					|| (sheetName.equalsIgnoreCase("Purchase")
							&& coulumnHeaderName.equalsIgnoreCase("POS Device ID"))) {
				String response = getAPI("get;format=json;", "sa", "admin", "device", 200).toUpperCase();
				String deviceName = "\",\"NAME\":\"" + result.toUpperCase() + "\",\"";
				String[] splitwithDeviceName = response.split(deviceName);
				String[] splitwithID = splitwithDeviceName[0].split("\"ID\":\"");
				int totalsize = splitwithID.length - 1;
				String[] splitwithUnderS = splitwithID[totalsize].split("_");
				createCell.setCellValue(splitwithUnderS[1]);
			} else if (sheetName.equalsIgnoreCase("Location Master") && coulumnHeaderName.equalsIgnoreCase("DID")) {
				String response = getAPI("get;format=json;", "sa", "admin", "device", 200).toUpperCase();
				String deviceName = "\",\"NAME\":\"" + result.toUpperCase() + "\",\"";
				String[] splitwithDeviceName = response.split(deviceName);
				String[] splitwithID = splitwithDeviceName[1].split("\"DOOR-ID\":\"");
				String[] splitwithComS = splitwithID[1].split("\",\"");
				createCell.setCellValue(splitwithComS[0]);
			} else if (sheetName.equalsIgnoreCase("Location Master")
					&& coulumnHeaderName.equalsIgnoreCase("Device Type")) {
				String response = getAPI("get;format=json;", "sa", "admin", "device", 200).toUpperCase();
				String deviceName = "\",\"NAME\":\"" + result.toUpperCase() + "\",\"";
				String[] splitwithDeviceName = response.split(deviceName);
				String[] splitwithID = splitwithDeviceName[1].split("\"DEVICE-TYPE\":\"");
				String[] splitwithComS = splitwithID[1].split("\",\"");
				createCell.setCellValue(splitwithComS[0]);
			} else if (sheetName.equalsIgnoreCase("Purchase") && coulumnHeaderName.equalsIgnoreCase("Menu ID")) {
				String url = "get;format=json";
				String res = getAPI(url, "sa", "admin", "canteen-menus", 200);
				// String res, String apiName, String resToFind, String
				// resFindFromThisParameter, String resFindFromThisValue
				Object id = getValueFromAPI(res, "canteen-menus", "menu-id", "menu-name", result);
				createCell.setCellValue(String.valueOf(id));
			} else if (sheetName.equalsIgnoreCase("Purchase") && coulumnHeaderName.equalsIgnoreCase("Item ID")) {
				String item = "select ItemCode from Mx_CntnItemMst  where upper(ItemName)=upper('" + result + "')";
				String itemID = getDataFDatabase(item);
				createCell.setCellValue(itemID);
			} else if (sheetName.equalsIgnoreCase("Purchase") && coulumnHeaderName.equalsIgnoreCase("POS Device ID")) {
				String url = "get;type=door";
				String res = getAPI(url, "sa", "admin", "device", 200);
				// String res, String apiName, String resToFind, String
				// resFindFromThisParameter, String resFindFromThisValue
				Object id = getValueFromAPI(res, "device", "id", "name", result);
				createCell.setCellValue(String.valueOf(id));
			} else if (sheetName.equalsIgnoreCase("Purchase")
					&& coulumnHeaderName.equalsIgnoreCase("Transaction Date-Time")) {
				String[] saperate = result.split("&");
				String d1 = saperate[0];
				String t1 = saperate[1];
				String d2 = AbstractMethod.staticDateOrPlusMinusFromCurrentDate(d1);
				String t2 = AbstractMethod.staticTimeOrPlusMinusMinutesFromCurrentTime(t1);
				createCell.setCellValue(d2 + " " + t2);
			} else {
				createCell.setCellValue(result);
			}
		}

		FileOutputStream fos = new FileOutputStream(filePath);
		wb.write(fos);
		wb.close();
	}

	// 4th step: data fetch in datatable and update in excel
	public void updateImportSheet(String string, DataTable dataTable) throws Exception {
		int count = 1;
		clearData(string);
		List<Map<String, String>> data = dataTable.asMaps(String.class, String.class);
		for (int i = 0; i < data.size(); i++) {
			Map<String, String> data1 = data.get(i);
			Set<String> keys = data1.keySet();
			for (String k : keys) {
				int columnno = getUpdateColumn(string, k);
				writeData(string, count, columnno, data1.get(k), k);
			}
			count++;
		}
	}

	// **************************************************************
	// **************************************************************
	// Given Below code for Import file CSV logic
	// **************************************************************
	// **************************************************************
	public String[][] getSheetDataForConvertedCSV(String sheetName) throws IOException {
		String[][] data = null;
		DataFormatter formatter = new DataFormatter();
		String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\ImportData.xls";
		FileInputStream fis = new FileInputStream(filePath);
		HSSFWorkbook wb = new HSSFWorkbook(fis);
		int sheetsCount = wb.getNumberOfSheets();
		for (int i = 0; i < sheetsCount; i++) {
			// logger.debug(wb.getSheetName(i));
			if (wb.getSheetName(i).equalsIgnoreCase(sheetName)) {
				HSSFSheet sheet = wb.getSheetAt(i);
				int phyRow = sheet.getPhysicalNumberOfRows();
				HSSFRow row = sheet.getRow(0);
				int phyCell = row.getPhysicalNumberOfCells();
				data = new String[phyRow][phyCell];
				for (int j = 0; j < phyRow; j++) {
					row = sheet.getRow(j);
					for (int k = 0; k < phyCell; k++) {
						HSSFCell ce = row.getCell(k);
						data[j][k] = formatter.formatCellValue(ce);
					}
				}
			}
		}
		return data;
	}

	public void xlsFileConvertInToCSV(String sheetName) throws IOException {
		String[][] data = getSheetDataForConvertedCSV(sheetName);
		List<String[]> csvData = new ArrayList<String[]>();
		for (int i = 0; i < data.length; i++) {
			int count = 0;
			String[] line = new String[data[i].length];
			for (int j = 0; j < data[i].length; j++) {
				if (count == 0) {
					line[j] = data[i][j];
				} else {
					line[j] = data[i][j];
				}
				count++;
			}
			csvData.add(line);
		}
		String csvFilePath = System.getProperty("user.dir") + "\\src\\test\\resources\\ImportFile\\" + sheetName
				+ ".csv";
		File file = new File(csvFilePath);
		try {
			// create FileWriter object with file as parameter
			FileWriter outputfile = new FileWriter(file);
			// create CSVWriter with '|' as separator
			CSVWriter writer = new CSVWriter(outputfile, ',', CSVWriter.NO_QUOTE_CHARACTER,
					CSVWriter.DEFAULT_ESCAPE_CHARACTER, CSVWriter.DEFAULT_LINE_END);
			writer.writeAll(csvData);
			// closing writer connection
			writer.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// **************************************************************
	// **************************************************************
	// above code for Import file CSV logic
	// **************************************************************
	// **************************************************************

	public void convertXLStoXLSX(String xlsFilePath, String xlsxFilePath) throws IOException {
		DataFormatter format = new DataFormatter();
		FileInputStream fis = new FileInputStream(xlsFilePath);
		Workbook workbook = new HSSFWorkbook(fis);
		Workbook newWorkbook = new XSSFWorkbook();
		for (int i = 0; i < workbook.getNumberOfSheets(); i++) {
			Sheet oldSheet = workbook.getSheetAt(i);
			Sheet newSheet = newWorkbook.createSheet(oldSheet.getSheetName());
			for (int j = 0; j < oldSheet.getPhysicalNumberOfRows(); j++) {
				Row oldRow = oldSheet.getRow(j);
				Row newRow = newSheet.createRow(j);
				if (oldRow != null) {
					for (int k = 0; k < oldRow.getPhysicalNumberOfCells(); k++) {
						Cell oldCell = oldRow.getCell(k);
						String oldCell1 = format.formatCellValue(oldCell);
						Cell newCell = newRow.createCell(k);
						if (oldCell != null) {
							// Copy cell value and style
							newCell.setCellValue(oldCell1);
						}
					}
				}
			}
		}
		try (FileOutputStream fos = new FileOutputStream(xlsxFilePath)) {
			newWorkbook.write(fos);
		}
		fis.close();
	}

	// ********************************************************************************************************************
	// ***************Import FIle Logic End************************************
	// *********************************************************************
//	public static void sentMail(String to) throws InterruptedException {
////		  // Sender's email ID needs to be mentioned
//		String from = "chirag.gurjar@matrixrd.org";
////	      // Recipient's email ID needs to be mentioned
////	      String to = "mayank.vishnoriya@matrixrd.org";
//		String[] tospliteWithComma = to.split(",");
//
//		// Assuming you are sending email from localhost
//		String host = "192.168.103.10";
//
//		// Get system properties
//		Properties properties = System.getProperties();
//
//		// Setup mail server
//		properties.setProperty("mail.smtp.host", host);
//		properties.setProperty("mail.smtp.port", "25"); // For SSL
//		properties.setProperty("mail.smtp.auth", "true"); // Enable authentication
//		properties.setProperty("mail.smtp.starttls.enable", "true"); // Enable TLS encryption
//
//		// Get the default Session object
//		Session session = Session.getDefaultInstance(properties, new Authenticator() {
//			protected PasswordAuthentication getPasswordAuthentication() {
//				return new PasswordAuthentication("chirag.gurjar@matrixrd.org", "gurjarchirag");
//			}
//		});
//
//		try {
//			// Create a default MimeMessage object
//			MimeMessage message = new MimeMessage(session);
//
//			// Set From: header field of the header
//			message.setFrom(new InternetAddress(from));
//			for (String toReceipientAdd : tospliteWithComma) {
//				// Set To: header field of the header
//				message.addRecipient(Message.RecipientType.TO, new InternetAddress(toReceipientAdd));
//			}
//			// Set Subject: header field
//			message.setSubject("Cucumber Automation Execution Report");
//
//			// Create the message part
//			BodyPart messageBodyPart = new MimeBodyPart();
//
//			// Fill the message
//			messageBodyPart.setText("Hello,\r\n"
//					+ "I wanted to inform you theat the execution of our cucumber automation scripts has been sucessfully completed.\r\n"
//					+ "Attached to this email is the HTML report detailing the outcomes of the tests.Please review it at your earliest convenience. ");
//
//			// Create a multipart message
//			Multipart multipart = new MimeMultipart();
//
//			// Set text message part
//			multipart.addBodyPart(messageBodyPart);
//
//			// Part two is attachment
//			messageBodyPart = new MimeBodyPart();
//			String filename = System.getProperty("user.dir") + "\\ExtentReports\\cucumber-reports.json"; // Replace with
//																											// the path
//																											// to your
//																											// file
//			DataSource source = new FileDataSource(filename);
//			messageBodyPart.setDataHandler(new DataHandler(source));
//			messageBodyPart.setFileName(filename);
//			multipart.addBodyPart(messageBodyPart);
//
//			// Send the complete message parts
//			message.setContent(multipart);
//
//			// Send message
//			Transport.send(message);
//			Thread.sleep(3000);
//			logger.debug("Sent message successfully....");
//		} catch (MessagingException mex) {
//			mex.printStackTrace();
//		}
//	}
//
	// Mayank
	// Admin Portal
	public void goToAdminPortal() throws InterruptedException {
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] cosecURL1 = baseUrl.split("\\/");
		String serverIP = cosecURL1[0] + "//" + cosecURL1[2];
		if (cosecURL1[3].equalsIgnoreCase("cosec") || cosecURL1[3].equalsIgnoreCase("COSEC")
				|| cosecURL1[3].equalsIgnoreCase("Cosec")) {
			driver.get(serverIP + "/COSECADMIN/Login");
		} else {
			driver.get(serverIP + "/EVERTECTADMIN/Login");
		}
		Thread.sleep(1000);
	}

//	// For Mail
//	public String receiveEmail(String username, String password, Date currentDatetime, String alertIdentifier,
//			String AlertSubject) throws Exception {
//		String data = null;
//		Properties props = new Properties();
////		props.setProperty("mail.store.protocol", "pop3");
//		props.setProperty("mail.pop3.host", "192.168.103.10");
////		props.setProperty("mail.pop3.port", "110");
////		props.setProperty("mail.pop3.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
////		props.setProperty("mail.pop3.socketFactory.fallback", "true");
////		props.setProperty("mail.pop3.starttls.enable", "true");
//
//		Thread.sleep(10000);
//		Session session = Session.getInstance(props);
//		try {
//			Store store = session.getStore("pop3");
//			store.connect("192.168.103.10", username, password);
//
//			Folder inbox = store.getFolder("INBOX");
//			inbox.open(Folder.READ_ONLY);
//			// System.out.println(inbox.getUnreadMessageCount());
//
//			Message[] messages = inbox.getMessages();
//			// System.out.println(messages);
//			int count = 0;
//			for (Message msg : messages) {
//				if (currentDatetime.before(msg.getSentDate())) {
//					if (!msg.isSet(Flags.Flag.SEEN)) {
//						if (msg.getFrom()[0].toString().toUpperCase().contains("MAYANK.VISHNORIYA@MATRIXRD.ORG")) {
//							if (msg.getSubject().toString().toUpperCase()
//									.equalsIgnoreCase(AlertSubject.toUpperCase())) {
////								System.out.println("From: " + msg.getFrom()[0]);
////								System.out.println("Subject: " + msg.getSubject());
////								System.out.println(msg.getSentDate());
//								String body = getTextFromMessage(msg);
//								Object content = msg.getContent();
////								String body = bodyMessage(content);
//								// System.out.println(body);
//								if (alertIdentifier.equalsIgnoreCase("No Identify")) {
//									data = body;
//								} else if (body.toUpperCase().contains(alertIdentifier.toUpperCase())) {
//									data = body;
//								}
//								count++;
//							}
//						}
//					}
//				}
//			}
//			// System.out.println(count);
//			inbox.close(false);
//			store.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return data;
//	}
//
//	public String getTextFromMessage(Message message) throws Exception {
//
//		if (message.isMimeType("text/html")) {
////            String html = (String) message.getContent();
////            return org.jsoup.Jsoup.parse(html).text();
//			return message.getContent().toString();
//		} else if (message.isMimeType("text/plain")) {
//			return message.getContent().toString();
//		} else if (message.isMimeType("multipart/*")) {
//			return getTextFromMimeMultipart((MimeMultipart) message.getContent());
//		}
//		return "";
//	}
//
//	public String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws Exception {
//		StringBuilder result = new StringBuilder();
//		int count = mimeMultipart.getCount();
//		for (int i = 0; i < count; i++) {
//			BodyPart bodyPart = mimeMultipart.getBodyPart(i);
//			if (bodyPart.isMimeType("text/plain")) {
//				result.append(bodyPart.getContent());
//			} else if (bodyPart.isMimeType("text/html")) {
////                String html = (String) bodyPart.getContent();
////                result.append(org.jsoup.Jsoup.parse(html).text());
//				result.append(bodyPart.getContent());
//			} else if (bodyPart.isMimeType("image/*")) {
//				// Handle image attachments
//				System.out.println("Image attachment found.");
//				// Example: Save image to file
//				// InputStream imageStream = bodyPart.getInputStream();
//				// Code to save the image to a file or process it
//			} else if (bodyPart.isMimeType("text/calendar")) {
//				// Handle Calendar attachments
//				System.out.println("Calendar invite found.");
//				// Example: Save image to file
//				// Handle icalendar content here
//				System.out.println(bodyPart.getFileName());
//				// Write ics file read code here
////                String calendarContent = (String) bodyPart.getContent();
////                System.out.println("Calendar Content:\n" + calendarContent);
//				result.append(bodyPart.getFileName());
//			}
//
//			else if (bodyPart.getContent() instanceof MimeMultipart) {
//				result.append(getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent()));
//			}
//		}
//		return result.toString();
//	}

	// Excel
	public List<Map<String, String>> getExcelData(String sheetName, String columnId, String alertName)
			throws Exception {
		List<Map<String, String>> data = new ArrayList<Map<String, String>>();
		String filePath = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataResource\\CustomAlert.xlsx";
		File file = new File(filePath);
		XSSFWorkbook wrk = new XSSFWorkbook(file);
		int totalSheet = wrk.getNumberOfSheets();
		for (int i = 0; i < totalSheet; i++) {
			if (wrk.getSheetName(i).equalsIgnoreCase(sheetName)) {
				XSSFSheet sheet = wrk.getSheetAt(i);
				Iterator<Row> row = sheet.rowIterator();
				XSSFRow firstRow = sheet.getRow(0);
				Iterator<Cell> cells = firstRow.cellIterator();
				int count = 0;
				while (cells.hasNext()) {
					if (cells.next().getStringCellValue().equalsIgnoreCase(columnId)) {
						break;
					}
					count++;
				}
				for (int j = 0; j < sheet.getPhysicalNumberOfRows(); j++) {
					XSSFRow allRow = sheet.getRow(j);
					if (allRow.getCell(count).getStringCellValue().equalsIgnoreCase(alertName)) {
						Map<String, String> m = new HashMap<String, String>();
						Iterator<Cell> cellsF = allRow.cellIterator();
						int ind = 0;
						while (cellsF.hasNext()) {
							String cellVa = cellsF.next().getStringCellValue();
							m.put(firstRow.getCell(ind).getStringCellValue(), cellVa);
							ind++;
						}
						data.add(m);
					}
				}
			}
		}
		// wrk.close();
		return data;
	}

	public Map<String, String> getExpectedAndActualData(String alertName, String alerttype, String alertrecievedTo)
			throws Exception {
		Map<String, String> getAllData = new HashMap<String, String>();
		String mailUName = "chirag.gurjar@matrixrd.org";
		String mailPass = "gurjarchirag";
		List<Map<String, String>> data = getExcelData("Sheet1", "AlertEvent", alertName);
		for (int i = 0; i < data.size(); i++) {
			String alertIdentify = data.get(i).get("AlertIdentify");
			String alertEvent = data.get(i).get("AlertEvent");
			String alert = data.get(i).get("Alert");
			String mailRecieveTo = data.get(i).get("MailRecieveTo");
			String mailBody = data.get(i).get("MailBody");
			if (alerttype.equalsIgnoreCase(alert)) {
				if (alertrecievedTo.equalsIgnoreCase(mailRecieveTo)) {
//					String maildata = receiveEmail(mailUName, mailPass, AbstractMethod.currentDatetime, alertIdentify,
//							alertEvent);
					String maildata = readMessagesFromGmail(alertEvent, alertIdentify);
					getAllData.put("ActualResult", maildata);
					getAllData.put("ExpectedResult", mailBody);
				}
			}
		}
		return getAllData;
	}

	public Map<String, String> getSMSExpectedAndActualData(String alertName, String alerttype, String alertrecievedTo)
			throws Exception {
		Map<String, String> getAllData = new HashMap<String, String>();
		String mobileNo = "9033207186";
		List<Map<String, String>> data = getExcelData("Sheet1", "AlertEvent", alertName);
		for (int i = 0; i < data.size(); i++) {
			String alert = data.get(i).get("Alert");
			String mailRecieveTo = data.get(i).get("MailRecieveTo");
			String smsBody = data.get(i).get("SMSBody");
			if (alerttype.equalsIgnoreCase(alert)) {
				if (alertrecievedTo.equalsIgnoreCase(mailRecieveTo)) {
					String query = "select SMsg from Mx_SMSLog where SPhNo='" + mobileNo + "'";
					String smsData = getDataFDatabase(query);
					// System.out.println("qqqqqqq "+smsData);
					getAllData.put("ActualResult", smsData);
					getAllData.put("ExpectedResult", smsBody);
				}
			}
		}
		return getAllData;
	}

	public Map<String, String> getWhatsAPPExpectedAndActualData(String alertName, String alerttype,
			String alertrecievedTo) throws Exception {
		Map<String, String> getAllData = new HashMap<String, String>();
		String mobileNo = "9033207186";
		List<Map<String, String>> data = getExcelData("Sheet1", "AlertEvent", alertName);
		for (int i = 0; i < data.size(); i++) {
			String alert = data.get(i).get("Alert");
			String mailRecieveTo = data.get(i).get("MailRecieveTo");
			String whatsAppBody = data.get(i).get("WhatsApp");
			if (alerttype.equalsIgnoreCase(alert)) {
				if (alertrecievedTo.equalsIgnoreCase(mailRecieveTo)) {
					String query = "select WMsg from Mx_WhatsAppLog where WPhNo='" + mobileNo + "'";
					String whatsappData = getDataFDatabase(query);
					getAllData.put("ActualResult", whatsappData);
					getAllData.put("ExpectedResult", whatsAppBody);
				}
			}
		}
		return getAllData;
	}

	public Map<Object, List<Map<String, String>>> getJSONDataForCustomAlert(String filePath) throws Exception {
		String srcT = FileUtils.readFileToString(new File(filePath), StandardCharsets.UTF_8);
		ObjectMapper mapper = new ObjectMapper();
		Map<Object, List<Map<String, String>>> data = mapper.readValue(srcT,
				new TypeReference<Map<Object, List<Map<String, String>>>>() {
				});
		return data;
	}

	public String checkProduct() {
		String baseUrl = System.getProperty("weburl") != null ? System.getProperty("weburl")
				: prop.getProperty("weburl");
		String[] baseUrlSplitWithDoubleSlash = baseUrl.split("/");
		String product = baseUrlSplitWithDoubleSlash[3];
		return product;
	}

	public String readJSONdata(String apiName, String customField, String content) throws Exception {
		String data = null;
		ObjectMapper mapper = new ObjectMapper();
		JsonNode jsonNode = mapper.readTree(content);
		JsonNode alertNode = jsonNode.get(apiName).get(0);
		data = alertNode.get(customField).toString();
		return data;
	}

	public Object getValueFromAPI(String res, String apiName, String resToFind, String resFindFromThisParameter,
			String resFindFromThisValue) {
		JsonPath js = new JsonPath(res);
		int count = js.getInt(apiName + ".size()");
		Object resToFind1 = null;
		for (int i = 0; i < count; i++) {
			String resFindFromThisValue1 = js.get(apiName + "[" + i + "]." + resFindFromThisParameter);
			if (resFindFromThisValue1.equalsIgnoreCase(resFindFromThisValue)) {
				resToFind1 = js.get(apiName + "[" + i + "]." + resToFind);
				break;
			}
		}
		return resToFind1;
	}

	// For UI Control And Validation
	public List<Map<String, String>> getExcelDataForUIControlValidation(String sheetN) throws IOException {
		DataFormatter formatter = new DataFormatter();
		int physicalRow = 0;
		int physicalcells = 0;
		String filePath = System.getProperty("user.dir")
				+ "\\src\\test\\resources\\TestDataResource\\UiControlValidationForAutomation.xlsx";
		List<Map<String, String>> mainData = new ArrayList<Map<String, String>>();
		XSSFWorkbook wb = new XSSFWorkbook(filePath);
		for (int i = 0; i < wb.getNumberOfSheets(); i++) {
			String sheetName = wb.getSheetAt(i).getSheetName();
			if (sheetName.equalsIgnoreCase(sheetN)) {
				XSSFSheet sheet = wb.getSheetAt(i);
				physicalRow = sheet.getPhysicalNumberOfRows();
				XSSFRow firstRow = sheet.getRow(0);
				physicalcells = firstRow.getPhysicalNumberOfCells();
				List<String> firstRowData = new ArrayList<String>();
				for (int j = 0; j < physicalcells; j++) {
					firstRowData.add(firstRow.getCell(j).getStringCellValue());
				}
				for (int x = 1; x < physicalRow; x++) {
//				for (int x = 27; x < physicalRow; x++) {
					Map<String, String> data = new LinkedHashMap<String, String>();
					data.put("RowNumber", String.valueOf(x));
					XSSFRow rowe = sheet.getRow(x);
					for (int y = 0; y < physicalcells; y++) {
						XSSFCell ce = rowe.getCell(y);
						formatter.formatCellValue(ce);
						data.put(firstRowData.get(y), formatter.formatCellValue(ce));
					}
					mainData.add(data);
				}
			}
		}
//				wb.close();
		return mainData;
	}
	
	
}
