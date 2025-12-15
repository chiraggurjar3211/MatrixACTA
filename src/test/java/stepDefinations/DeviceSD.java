package stepDefinations;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.testng.Assert;

import CommonTestAbstract.TestContextObject;
import io.cucumber.datatable.DataTable;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;

public class DeviceSD {
	TestContextObject testContextObject;
	String product = null;
	String taskSchedulerName = null;
	private static Logger logger=LogManager.getLogger(DeviceSD.class);
	
	public DeviceSD(TestContextObject testContextObject) {
		this.testContextObject = testContextObject;
	}

	@Then("Verify Device from Device Configuration page")
	public void verify_device_from_device_configuration_page(DataTable dataTable) throws InterruptedException {
		logger.info("Verify Device from Device Configuration page Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceConfiguration();
		testContextObject.pom.deviceConfigurationPO().verifyDevice(dataTable);
		Thread.sleep(1000);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Delete Device via API")
	public void delete_device_via_api(DataTable dataTable) {
		logger.info("Delete Device via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			String url = "delete;device-type=" + data.get("device-type") + ";device-id=" + data.get("device-id") + ";";
			String username = "sa";
			String password = "admin";
			String apiName = "device";
			String exResponse1 = "success: 0080400002 : successful";
			String exResponse2 = "failed: 0080402004 : Invalid command: Direct Door does not exist or you do not have access";
			String res = testContextObject.baseTest.setAPI(url, username, password, apiName, 200);
			boolean val = false;
			if (res.equals(exResponse1) || res.equals(exResponse2)) {
				val = true;
			} else {
				val = false;
				System.out.println(res);
			}
			Assert.assertEquals(val, true);
		}
	}
	
	@When("{string} device module reports configuration")
	public void report_configuration(String string , DataTable datatable) throws Exception {
		logger.info("device module reports configuration Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.deviceModuleReportsPO().deviceModuleReport(string, datatable);
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Add Device from device module")
	public void add_device_from_device_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Add Device from device module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceName: "+data.get("DeviceName"));
			testContextObject.pom.deviceConfigurationPO().addDevice(data);
			}
		Thread.sleep(1000);
		testContextObject.pom.userConfigurationPO().homeButtonClick();
	}

	@Given("Delete Device from Device Configuration")
	public void delete_device_from_device_configuration(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Device from Device Configuration Started");
		testContextObject.pom.homePO().goTODeviceModule();
		Thread.sleep(2000);
		testContextObject.pom.devicePO().goToDeviceList();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceType: "+data.get("DeviceType")+"  DeviceName: "+data.get("DeviceName"));
			testContextObject.pom.devicePO().goToDeviceList();
			String deviceName = data.get("DeviceName");
			testContextObject.pom.deviceConfigurationPO().deleteDevice(deviceName);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Create Device Group from device module")
	public void create_device_group_from_device_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Create Device Group from device module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceGroupPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceGroupName: "+data.get("DeviceGroupName"));
			String deviceGroupName = data.get("DeviceGroupName");
			String type = data.get("Type");
			String deviceName = data.get("DeviceName");
			String validation = data.get("Validation");
			testContextObject.pom.deviceGroupPO().createDeviceGroup(deviceGroupName, type, deviceName, validation);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@Given("Assign users to Device Group from Device Module")
	public void assign_users_to_device_group_from_device_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign users to Device Group from Device Module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceGroupPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceGroupName: "+data.get("DeviceGroupName"));
			String deviceGroupName = data.get("DeviceGroupName");
			String selectUsers = data.get("SelectUsers");
			String userId = data.get("UserId");
			String selectGroup = data.get("SelectGroup");
			String groupName = data.get("GroupName");
			String validation = data.get("Validation");
			testContextObject.pom.deviceGroupPO().assignUsersToDeviceGroup(deviceGroupName, selectUsers, userId, selectGroup, groupName, validation);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Delete Device Group from Device Module")
	public void delete_device_group_from_device_module(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Delete Device Group from Device Module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceGroupPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceGroupName: "+data.get("DeviceGroupName"));
			String deviceGroupName = data.get("DeviceGroupName");
			String validation = data.get("Validation");
			testContextObject.pom.deviceGroupPO().deleteDeviceGroup(deviceGroupName, validation);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}

	@When("Revoke device via API")
	public void revoke_device_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Revoke device via api Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device: "+data.get("device"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("revoke");
			testContextObject.pom.deviceConfigurationPO().revokeDeviceAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String deviceParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation = "success: 0081000002 : successful";
			String res = testContextObject.baseTest.setAPI(deviceParameter, "sa", "admin", "device", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}
	
	@When("Assign device to user via API")
	public void assign_device_to_user_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Assign device to user via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device: "+data.get("device"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("assign");
			testContextObject.pom.deviceConfigurationPO().assignDeviceAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String deviceParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation = "success: 0080600002 : successful";
			String res = testContextObject.baseTest.setAPI(deviceParameter, "sa", "admin", "device", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}
	
	@Given("Assign device group to visitor profile via API")
	public void assign_device_group_to_visitor_profile_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Assign device group to visitor profile via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device: "+data.get("device"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.deviceGroupPO().assignDeviceGrpToVisitorProfileAPI(apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String deviceParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation = "success: 1080200001 : saved successfully. ID = "+data.get("id");
			String res = testContextObject.baseTest.setAPI(deviceParameter, "sa", "admin", "visitor-profile", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}

	@Given("Assign device group to user via API")
	public void assign_device_group_to_user_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Assign device group to user via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device-group: "+data.get("device-group"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.deviceGroupPO().assignDeviceGrpToUserAPI(apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String deviceParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation = "success: 0070200001 : saved successfully. User ID = "+data.get("id");
			String res = testContextObject.baseTest.setAPI(deviceParameter, "sa", "admin", "user", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}
	
	@When("Revoke Device Group via API")
	public void revoke_device_group_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Revoke Device Group via API Started");
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device-group: "+data.get("device-group"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("revoke");
			testContextObject.pom.deviceGroupPO().revokeDeviceGrpAPI(apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String deviceParameter = builder.toString();
			// logger.debug(userParameter);
			String apiResponseValidation = "success: 0081000002 : successful";
			String res = testContextObject.baseTest.setAPI(deviceParameter, "sa", "admin", "device", 200);
			Assert.assertEquals(res, apiResponseValidation);
		}
	}
	
	@When("Assign users to device from Device Configuration")
	public void assign_users_to_device_from_device_configuration(io.cucumber.datatable.DataTable dataTable) throws InterruptedException {
		logger.info("Assign users to device from Device Configuration Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().goToDeviceList();
		//testContextObject.pom.devicePO().goToDeviceConfiguration();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("DeviceName: "+data.get("DeviceName"));
			String deviceName = data.get("DeviceName");
			String userId = data.get("UserId");
			testContextObject.pom.deviceConfigurationPO().assignUsers(deviceName, userId);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Add Temporary User via API")
	public void add_temporary_user_via_api(io.cucumber.datatable.DataTable dataTable) {
		logger.info("Add Temporary User via API Started");
		List<String> columnHeader = new ArrayList<>();
		for (int i = 0; i < dataTable.width(); i++) {
			columnHeader.add(dataTable.cell(0, i));
		}
		// logger.debug(columnHeader);
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			logger.info("device-type: "+data.get("device-type"));
			List<String> apiParameter = new ArrayList<>();
			apiParameter.add("set");
			testContextObject.pom.deviceConfigurationPO().addTempUserAPI(columnHeader, apiParameter, data);
			StringBuilder builder = new StringBuilder();
			for (String s : apiParameter) {
				builder.append(s + ";");
			}
			String tempUserParameter = builder.toString();
			// logger.debug(tempUserParameter);
			String res = testContextObject.baseTest.setAPI(tempUserParameter, "sa", "admin", "temporary-user", 200);
			String val = null;
			if (res.contains("success: 1170200002 : saved successfully.")==true) {
				val = "Temporary User Worker added";
			} else {
				val = res;
			}
			Assert.assertEquals(val, "Temporary User Worker added");
		}
	}
	
	@Given("Create Maximum Time Frames in Device module")
	public void create_maximum_time_frames_in_device_module(io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Create Maximum Time Frames in Device module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().gotoTimeFramesPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.timeFramesPO().createMaxTimeframes(data);
		}
		testContextObject.pom.abstractMethod().homeButtonClick();
	}
	
	@Given("Create Maximum Access Schedules in Device module")
	public void create_maximum_access_schedules_in_device_module(io.cucumber.datatable.DataTable dataTable) throws Exception {
		logger.info("Create Maximum Access Schedules in Device module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().gotoAccessSchedulesPage();
		for (Map<String, String> data : dataTable.asMaps(String.class, String.class)) {
			testContextObject.pom.accessSchedulesPO().createMaxAccessSchedules(data);
		}
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
	@Given("Upload Audio File in Manage Voice Guidance Audio Page")
	public void upload_audio_file_in_manage_voice_guidance_audio_page() throws Exception {
		logger.info("Upload Audio File in Manage Voice Guidance Audio Page in Device module Started");
		testContextObject.pom.homePO().goTODeviceModule();
		testContextObject.pom.devicePO().gotoManageVoiceGuidanceAudioPage();
		testContextObject.pom.manageVoiceGuidanceAudioPO().uploadFile();
		testContextObject.pom.systemAccountPO().homeButtonClick();
	}
	
}
