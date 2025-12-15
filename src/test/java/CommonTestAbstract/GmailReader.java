package CommonTestAbstract;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import jakarta.mail.*;
import jakarta.mail.internet.*;
import java.util.Properties;
import java.io.File;
import jakarta.mail.Address;
import jakarta.mail.FetchProfile;
import jakarta.mail.Folder;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.Multipart;
import jakarta.mail.Part;
import jakarta.mail.Session;
import jakarta.mail.Store;
import jakarta.mail.UIDFolder.FetchProfileItem;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.search.ComparisonTerm;
import jakarta.mail.search.ReceivedDateTerm;
import jakarta.mail.search.SearchTerm;
import stepDefinations.CustomAlertSD;

public class GmailReader {
	private static Logger logger = LogManager.getLogger(GmailReader.class);
	public String readMessagesFromGmail(String alertEvent, String identifier) {
		logger.info("6th I am in Validate");
		Store store = null;
		Folder folder = null;
		String getmMessage = null;

		try {
			store = getImapStore();
			folder = getFolderFromStore(store, "Automation");
			Message[] messages = folder.search(getMessagesSearchTerm());
			folder.fetch(messages, getFetchProfile());
			for (int i = 0; i < messages.length; i++) {
				getmMessage = printMessage(messages[i], alertEvent, identifier);
				System.out.println("I am here " + getmMessage);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeFolder(folder);
			closeStore(store);
		}
		return getmMessage;
	}

	public Store getImapStore() throws Exception {
		Session session = Session.getInstance(getImapProperties());
		Store store = session.getStore("imaps");
		store.connect("imap.gmail.com", "matrixautomationreceiver@gmail.com", "jntd gdwc imsl tkyr");
		return store;
	}

	public Properties getImapProperties() {
		Properties props = new Properties();
		props.put("mail.imaps.host", "imap.gmail.com");
		props.put("mail.imaps.ssl.trust", "imap.gmail.com");
		props.put("mail.imaps.port", "993");
		props.put("mail.imaps.starttls.enable", "true");
		props.put("mail.imaps.connectiontimeout", "10000");
		props.put("mail.imaps.timeout", "10000");
		return props;
	}

	public void listAllFolders(Store store) throws MessagingException {
		Folder defaultFolder = store.getDefaultFolder(); // usually root
		listFoldersRecursively(defaultFolder, "");
	}

	public void listFoldersRecursively(Folder folder, String indent) throws MessagingException {
		Folder[] folders = folder.list(); // get subfolders

		for (Folder f : folders) {
			if ((f.getType() & Folder.HOLDS_FOLDERS) != 0) {
				listFoldersRecursively(f, indent + "  ");
			}
		}
	}

	public Folder getFolderFromStore(Store store, String folderName) throws MessagingException {
		listAllFolders(store);
		Folder folder = store.getFolder(folderName);
		folder.open(Folder.READ_ONLY);
		return folder;
	}

	public SearchTerm getMessagesSearchTerm() {
		final long cutoffTime = System.currentTimeMillis() - (10 * 60 * 1000); // last 15 minutes
		return new SearchTerm() {
			@Override
			public boolean match(Message message) {
				try {
					Date receivedDate = message.getReceivedDate();
					if (receivedDate == null)
						return false;

					return receivedDate.getTime() > cutoffTime;
				} catch (MessagingException e) {
					e.printStackTrace();
					return false;
				}
			}
		};
		
	}

	public FetchProfile getFetchProfile() {
		FetchProfile fetchProfile = new FetchProfile();
		fetchProfile.add(FetchProfileItem.ENVELOPE);
		fetchProfile.add(FetchProfileItem.CONTENT_INFO);
		fetchProfile.add("X-mailer");
		return fetchProfile;
	}

	public String printMessage(Message message, String subjectName, String identifier)
			throws MessagingException, IOException {
		String body = null;
		StringBuilder messageBuilder = new StringBuilder();
//		messageBuilder.append("RECEIVED ON: ").append(message.getReceivedDate()).append("\n");

		Address[] addressesFrom = message.getFrom();
		String from = addressesFrom != null ? ((InternetAddress) addressesFrom[0]).getAddress() : null;
//		messageBuilder.append("FROM: ").append(from).append("\n");
		if (message.getSubject().toString().trim().equalsIgnoreCase(subjectName)) {
//			messageBuilder.append("SUBJECT: ").append(message.getSubject()).append("\n");

			StringBuilder textCollector = new StringBuilder();
			collectTextFromMessage(textCollector, message);
			String data = messageBuilder.append(textCollector.toString()).toString();
			if (identifier.equalsIgnoreCase("No Identify")) {
				body = data;
			} else if (data.toUpperCase().contains(identifier.toUpperCase())) {
				body = data;
			}
		}
		return body;

	}

//	public static String stripHtmlTags(String html) {
//		return html.replaceAll("<[^>]*>", "") // Remove HTML tags
//				.replaceAll("&nbsp;", " ") // Optional: decode common entities
//				.replaceAll("&amp;", "&");
//	}

	public void collectTextFromMessage(StringBuilder textCollector, Part part) throws MessagingException, IOException {
		if (part.isMimeType("text/plain")) {
			textCollector.append((String) part.getContent());
		} else if (part.isMimeType("text/html")) {
			String html = (String) part.getContent();
			textCollector.append(html);
//			textCollector.append(stripHtmlTags(html)); // Convert HTML to plain text
		} else if (
	               part.getFileName() != null && part.getFileName().toLowerCase().endsWith(".ics")) {
			System.out.println("File Name :"+part.getFileName());
	        String filename = part.getFileName();
	        textCollector.append(filename);
	        
	    }else if (part.isMimeType("multipart/*") && part.getContent() instanceof Multipart) {
			Multipart multiPart = (Multipart) part.getContent();
			for (int i = 0; i < multiPart.getCount(); i++) {
				collectTextFromMessage(textCollector, multiPart.getBodyPart(i));
			}
		}
	}

	public void closeFolder(Folder folder) {
		if (folder != null && folder.isOpen()) {
			try {
				folder.close(true);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}

	public void closeStore(Store store) {
		if (store != null && store.isConnected()) {
			try {
				store.close();
			} catch (MessagingException e) {
				e.printStackTrace();
			}
		}
	}

	public static void mailSent() {

		final String fromEmail = "matrixautomationreceiver@gmail.com";
		final String password = "jntd gdwc imsl tkyr";
		final String toEmails = "chirag.gurjar@matrixcomsec.com,mayank.vishnoriya@matrixcomsec.com";

		// Optional: CC and BCC
		final String ccEmails = "aagam.shah@matrixcomsec.com";

		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");

		Session session = Session.getInstance(props, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(fromEmail, password);
			}
		});

		try {
			// Create a new message
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail));

			// Set TO recipients
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmails));

			// Optional: Set CC and BCC
			message.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccEmails));

			message.setSubject("Automation result");

			// Create message body part
			BodyPart messageBodyPart = new MimeBodyPart();
			messageBodyPart.setText("Hi Automation team,Automation script is done ");

			// Create attachment part
			MimeBodyPart attachmentPart = new MimeBodyPart();

			String filePath = System.getProperty("user.dir") + "\\ExtentReports\\cucumber-reports.html"; // Update this
																											// to your
																											// file path
			attachmentPart.attachFile(new File(filePath));

			// Combine parts
			Multipart multipart = new MimeMultipart();
			multipart.addBodyPart(messageBodyPart);
			multipart.addBodyPart(attachmentPart);

			// Set the full message content
			message.setContent(multipart);

			// Send the message
			Transport.send(message);
			System.out.println("Email sent successfully with attachment to multiple recipients!");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}