package PageObject.ShiftAndSchedule;

import java.util.ArrayList;
import java.util.Iterator;
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

public class ShiftChangeApprovalPO extends AbstractMethod {
	WebDriver driver;

	public ShiftChangeApprovalPO(WebDriver driver) {
		super(driver);
		// TODO Auto-generated constructor stub
		this.driver = driver;
		PageFactory.initElements(driver, this);
	}
	
	// Created by Mayank
	// Shift Approval/Rejection via API
	public String shiftApprovalAPI(List<String> columnHeader, List<String> apiParameter, Map<String, String> data, String tid) {
		String apiPar = null;
		apiParameter.add("tid=" + tid);
		if (columnHeader.contains("approved")) {
			if (data.get("approved") != null) {
				apiParameter.add("approved=" + data.get("approved"));
			}
		}
		if (columnHeader.contains("remark")) {
			if (data.get("remark") != null) {
				apiParameter.add("remark=" + data.get("remark"));
			}
		}

		return apiPar;
	}
	
	

}
