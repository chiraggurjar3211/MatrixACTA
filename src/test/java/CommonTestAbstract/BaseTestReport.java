package CommonTestAbstract;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.opencsv.CSVReader;

import de.redsix.pdfcompare.CompareResult;
import de.redsix.pdfcompare.PdfComparator;
import stepDefinations.LeaveManagementSD;

public class BaseTestReport {
	private static Logger logger=LogManager.getLogger(BaseTestReport.class);

	private String getCellValueAsString(Cell cell) {
		if (cell == null) {
			return "";
		}
		switch (cell.getCellType()) {
		case STRING:
			return cell.getStringCellValue();
		case NUMERIC:
			if (DateUtil.isCellDateFormatted(cell)) {
				return cell.getDateCellValue().toString();
			} else {
				return Double.toString(cell.getNumericCellValue());
			}
		case BOOLEAN:
			return Boolean.toString(cell.getBooleanCellValue());
		default:
			return "";
		}
	}

	public void xlsOrXlsxFileConvertIntoTXT(String filePath, String txtFilePath, int sheeetNo) {
		try {
			Workbook workbook;
			FileInputStream excelFile = new FileInputStream(new File(filePath));
			//String[] splitwithdot = filePath.split("\\.");
			String splitwithdot = filePath.substring(filePath.length() - 3);
			if ("xls".equalsIgnoreCase(splitwithdot)) {
				workbook = new HSSFWorkbook(excelFile);
			} else {
				workbook = new XSSFWorkbook(excelFile);
			}
			// Create a FileWriter to write to the output text file
			FileWriter textFileWriter = new FileWriter(txtFilePath);

			// Iterate through each sheet in the Excel file
			Sheet sheet = workbook.getSheetAt(sheeetNo);

			for (Row row : sheet) {
				// Iterate through each cell in the row
				for (Cell cell : row) {

					// Get the cell value and write it to the text file
					String cellValue = getCellValueAsString(cell);
					textFileWriter.write(cellValue + "\t");
				}
				// Write a newline character to separate rows
				textFileWriter.write("\n");
			}
			// Close the FileWriter
			textFileWriter.close();
			// Close the Excel workbook
			workbook.close();
			logger.info("Excel file to text conversion completed. File Name : " + filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String compareTwoTxtFile(String expectedResult, String actualResult) throws IOException {
		String result = null;
		BufferedReader reader1 = new BufferedReader(new FileReader(expectedResult));
		BufferedReader reader2 = new BufferedReader(new FileReader(actualResult));
		String line1 = reader1.readLine();
		String line2 = reader2.readLine();
		boolean areEqual = true;
		int lineNum = 1;
		while (line1 != null || line2 != null) {
			if (line1 == null || line2 == null) {
				areEqual = false;
				break;
			} else if (!line1.equalsIgnoreCase(line2)) {
				areEqual = false;
				break;
			}
			line1 = reader1.readLine();
			line2 = reader2.readLine();
			lineNum++;
		}
		if (areEqual) {
			logger.info("Two files have same content.");
			result = "Compared";
		} else {
			logger.info("Two files have different content. They differ at line " + lineNum);
			logger.info("Expected FIle : " + line1);
			logger.info("Actual FIle : " + line2);
			result = "Differentiate";
		}
		reader1.close();
		reader2.close();
		return result;
	}

	public String compareExcelFile(String expected, String actual) throws IOException, InterruptedException {
		logger.info("Expected File Name : "+expected);
		logger.info("Actual File Name : "+actual);
		// expected Data File
		String expectedDataExportFolder = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports";
		String expectedtxtFile = "Expectedoutput.txt";
		String expectedtxtFilePath = expectedDataExportFolder + "\\" + expectedtxtFile;
		// deleteExistingFile(expectedDataExportFolder, expectedtxtFile);
		Thread.sleep(1000);
		xlsOrXlsxFileConvertIntoTXT(expected, expectedtxtFilePath, 0);
		// Actual Data File
		String actualDataExportFolder = System.getProperty("user.dir") + "\\src\\test\\resources\\TestDataExports";
		String actualtxtFile = "ActualOutput.txt";
		String actualFilePath = actualDataExportFolder + "\\" + actualtxtFile;
		// deleteExistingFile(actualDataExportFolder, actualtxtFile);
		Thread.sleep(2000);
		xlsOrXlsxFileConvertIntoTXT(actual, actualFilePath, 0);
		// compare two txt file
		logger.info("File Compare Start.....");
		String result = compareTwoTxtFile(expectedtxtFilePath, actualFilePath);
		logger.info("File Compare End.....");
		Thread.sleep(2000);
		return result;
	}

	// Read CSV file
	public List<String[]> readCSVFileDATA(String filePath) throws Exception {
		FileReader file = new FileReader(filePath);
		CSVReader reader = new CSVReader(file);
		List<String[]> data = reader.readAll();
		return data;
	}

	// pdf compare code start here
	public String extractTextFromPDF(String pdfPath) throws IOException {
		try (PDDocument document = PDDocument.load(new File(pdfPath))) {
			PDFTextStripper stripper = new PDFTextStripper();
			return stripper.getText(document);
		}
	}

	public String comparePDFs(String pdfPath1, String pdfPath2, String outputPath) {
		String compared = null;
		try {
			String text1 = extractTextFromPDF(pdfPath1);
			String text2 = extractTextFromPDF(pdfPath2);
			// Compare text and find mismatches
			String[] lines1 = text1.split("\n");
			String[] lines2 = text2.split("\n");
			try (PrintWriter writer = new PrintWriter(new FileWriter(outputPath))) {
				for (int i = 0; i < Math.min(lines1.length, lines2.length); i++) {
					if (!lines1[i].equals(lines2[i])) {
						writer.println("Line " + (i + 1) + " mismatch:");
						writer.println("   " + lines1[i]);
						writer.println("   " + lines2[i]);
						writer.println();
					}
				}
			}
			BufferedReader br = new BufferedReader(new FileReader(outputPath));
			if (br.readLine() == null) {
				logger.info("Comparison completed.No mismatch found");
				compared = "match";
			} else {
				logger.info("Comparison completed. Mismatch details written to " + outputPath);
				compared = "mismatch";
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return compared;
	}
	// pdf compare code end here

	// if merging row and column value fetch and displayed
	public List<String> mergingRowANDColValueInexcelFile(String filePath, int sheetNo) throws IOException {
		List<String> data = new ArrayList<>();
		// TODO Auto-generated method stub
		FileInputStream fis = new FileInputStream(filePath);
		String extension = filePath.substring(filePath.length() - 3);
		if (extension.equalsIgnoreCase("xls")) {
			HSSFWorkbook wb = new HSSFWorkbook(fis);
			HSSFSheet sheet = wb.getSheetAt(sheetNo);
			int merge = sheet.getNumMergedRegions();
			// System.out.println(merge);
			for (int i = 0; i < merge; i++) {
				CellRangeAddress mergedRegion = sheet.getMergedRegion(i);
				int firstrow = mergedRegion.getFirstRow();
				int firstCol = mergedRegion.getFirstColumn();
				// get the value of first cell in the merged region
				String rowANDCOL = "Row number" + (firstrow + 1) + " and Column number:" + (firstCol + 1);
				data.add(rowANDCOL);
			}
		} else {
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFSheet sheet = wb.getSheetAt(sheetNo);
			int merge = sheet.getNumMergedRegions();
			// System.out.println(merge);
			for (int i = 0; i < merge; i++) {
				CellRangeAddress mergedRegion = sheet.getMergedRegion(i);
				int firstrow = mergedRegion.getFirstRow();
				int firstCol = mergedRegion.getFirstColumn();
				// get the value of first cell in the merged region
				String rowANDCOL = "Row number" + (firstrow + 1) + " and Column number:" + (firstCol + 1);
				data.add(rowANDCOL);
			}
		}
		return data;
	}

	// merging cell value fetch and stored in list
	public List<String> mergingCellValueCheckedInExcel(String filePath, int sheetNo) throws IOException {
		List<String> data = new ArrayList<>();
		// TODO Auto-generated method stub
		FileInputStream fis = new FileInputStream(filePath);
		String extension = filePath.substring(filePath.length() - 3);
		if (extension.equalsIgnoreCase("xls")) {
			HSSFWorkbook wb = new HSSFWorkbook(fis);
			HSSFSheet sheet = wb.getSheetAt(sheetNo);
			int merge = sheet.getNumMergedRegions();
			for (int i = 0; i < merge; i++) {
				CellRangeAddress mergedRegion = sheet.getMergedRegion(i);
				int firstrow = mergedRegion.getFirstRow();
				int firstCol = mergedRegion.getFirstColumn();
				// get the value of first cell in the merged region
				Row row = sheet.getRow(firstrow);
				Cell cell = row.getCell(firstCol);
				// System.out.println(cell.getCellType().toString());
				if (cell.getCellType().toString().equalsIgnoreCase("NUMERIC")) {
					String mergedValue = String.valueOf(cell.getNumericCellValue());
					// System.out.println(mergedValue);
					data.add(mergedValue);
				} else {
					String mergedValue = cell.getStringCellValue();
					// System.out.println(mergedValue);
					data.add(mergedValue);
				}
			}
		} else {
			XSSFWorkbook wb = new XSSFWorkbook(fis);
			XSSFSheet sheet = wb.getSheetAt(sheetNo);
			int merge = sheet.getNumMergedRegions();
			// System.out.println(merge);
			for (int i = 0; i < merge; i++) {
				CellRangeAddress mergedRegion = sheet.getMergedRegion(i);
				int firstrow = mergedRegion.getFirstRow();
				int firstCol = mergedRegion.getFirstColumn();
				// get the value of first cell in the merged region
				Row row = sheet.getRow(firstrow);
				Cell cell = row.getCell(firstCol);
				if (cell.getCellType().toString().equalsIgnoreCase("NUMERIC")) {
					String mergedValue = String.valueOf(cell.getNumericCellValue());
					// System.out.println(mergedValue);
					data.add(mergedValue);
				} else {
					String mergedValue = cell.getStringCellValue();
					// System.out.println(mergedValue);
					data.add(mergedValue);
				}
			}
		}
		return data;
	}

	public String compareFiles(String expected, String actual) throws Exception {
		String result = null;
		String extension = expected.substring(expected.length() - 3);
		List<String> actualResult = new ArrayList<>();

		if (extension.equalsIgnoreCase("csv")) {
			List<String[]> expectedData = readCSVFileDATA(expected);
			List<String[]> actualData = readCSVFileDATA(actual);
			for (int i = 0; i < expectedData.size(); i++) {
				for (int j = 0; j < expectedData.get(i).length; j++) {
					if (!expectedData.get(i)[j].equalsIgnoreCase(actualData.get(i)[j])) {
						logger.info("CSV File mismatched folund below.");
						logger.info("Expected Data :" + expectedData.get(i)[j]);
						logger.info("Actual Data :" + actualData.get(i)[j]);
						logger.info("Row Number :" + (i + 1) + " And Column Number :" + (j + 1));
						actualResult.add(actualData.get(i)[j]);
					}
				}
			}
		} else if (extension.equalsIgnoreCase("pdf")) {
			String resultFile = System.getProperty("user.dir") + "\\mismatchesInPDF.txt";
			String compare = comparePDFs(expected, actual, resultFile);

			if (compare.equalsIgnoreCase("mismatch")) {
				logger.info("Differences found in PDF!");
				actualResult.add("Fail");
			} else {
				logger.info("No Differences found in PDF!");
			}
		} else if (extension.equalsIgnoreCase("txt")) {
			String resultofTwoFile = compareTwoTxtFile(expected, actual);
			if (resultofTwoFile.equalsIgnoreCase("Differentiate")) {
				actualResult.add(resultofTwoFile);
			}
		} else {

			String resultofTwoFile = compareExcelFile(expected, actual);
			if (resultofTwoFile.equalsIgnoreCase("Differentiate")) {
				actualResult.add(resultofTwoFile);
			}
		}
		if (actualResult.isEmpty() && actualResult.isEmpty()) {
			result = "Compared";
		} else {
			result = "Differentiate";
		}
		return result;
	}
}
