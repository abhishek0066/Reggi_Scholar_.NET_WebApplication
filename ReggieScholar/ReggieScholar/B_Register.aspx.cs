using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReggieScholar
{
    public partial class B_Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //------Start - Collect Register Form Data ------//
            //Personal Detail
            string enteredFirstName = txtFirstName.Text;
            string enteredLastName = txtlastName.Text;
            string enteredUsername = txtUsername.Text;
            string enteredPassword = txtPassword.Text;
            string hashedPassword = GetSHA1HashData(enteredPassword);

            string enteredUlid = txtUlid.Text + "@ilstu.com";
            string enteredSecQuestion = txtSecQuestion.Text;
            string enteredSecAnswer = txtSecAnswer.Text;
            string submissionType = "";

            //Submission Detail
            var checkProjSelected = Request.Form["projectType"];
            var checkThesisSelected = Request.Form["thesisType"];

            if (!String.IsNullOrEmpty(checkProjSelected) && checkProjSelected == "yes")
            {
                submissionType = "project";
            }

            if (!String.IsNullOrEmpty(checkThesisSelected) && checkThesisSelected == "yes")
            {
                submissionType = "thesis";
            }

            string enteredResearchName = txtResearchName.Text;

            string enteredKeywordOne = txtKeywordOne.Text;
            string enteredKeywordTwo = txtKeywordTwo.Text;
            string enteredKeywordThree = txtKeywordThree.Text;
            
            string enteredCourseNumber = hiddenCourseNumber.Value;
            string enteredSemester = hiddenSemester.Value;

            string enteredAbstract = txtAbstract.Text;
            string enteredCodeURL = txtCodeURL.Text;
            string enteredVideoURL = txtVideoURL.Text;
            
            //Committee Detail
            string enteredCommitteeOne = hiddenCommitteeOne.Value.ToLower();
            string enteredCommitteeTwo = hiddenCommitteeTwo.Value.ToLower();
            string enteredGA = hiddenGA.Value.ToLower();
            //------End - Collect Register Form Data ------//

            //------Start - Get Uploaded Files & Image ------//
            
            //Upload Profile Image
            string imagePath = ""; //To store in DB
            if (fileUploadImage.HasFiles) {
                foreach (HttpPostedFile file in fileUploadImage.PostedFiles) {
                    try {
                        string imageFolderLocation = Server.MapPath("~/UploadImage/");
                        file.SaveAs(Path.Combine(imageFolderLocation, enteredUsername + "_" + file.FileName));
                        imagePath = enteredUsername + "_" + file.FileName;
                        //string tempLabel =
                        //    "Filename: " + enteredUsername + "_" + file.FileName + "<br/>" +
                        //    "FileContentLength: " + file.ContentLength + "<br/>" +
                        //    "FileHashCode : " + file.GetHashCode() + "<br/>" +
                        //    "FileGetType : " + file.GetType() + "<br/>" +
                        //    "FileToString: " + file.ToString() + "<br/>" +
                        //    "FilePath: " + imageFolderLocation + file.FileName + "<br/>" +
                        //    "Path: " + imageFolderLocation;
                    }
                    catch (Exception exp) {
                        Console.WriteLine("Error occured: " + exp.Message);
                        break;
                    }
                }
            }
            else { //Use Default Image
                string defaultImage = "stormTrooper.jpg";
                imagePath = defaultImage;
            }//End Profile Image
            
            //Upload PDF File
            string pdfPath = "";
            if (fileUploadPDF.HasFiles)
            {
                string path = Server.MapPath("~/UploadPDF/");
                foreach (HttpPostedFile file in fileUploadPDF.PostedFiles)
                {
                    try
                    {
                        file.SaveAs(Path.Combine(path, enteredUsername + "_" + file.FileName));
                        pdfPath = enteredUsername + "_" + file.FileName;
                        //string tempLabel =
                        //    "Filename: " + enteredUsername + "_" + file.FileName + "<br/>" +
                        //    "FileContentLength: " + file.ContentLength + "<br/>" +
                        //    "FileHashCode : " + file.GetHashCode() + "<br/>" +
                        //    "FileGetType : " + file.GetType() + "<br/>" +
                        //    "FileToString: " + file.ToString() + "<br/>" +
                        //    "FilePath: " + path + file.FileName;
                    }
                    catch (Exception exp)
                    {
                        Console.WriteLine("Error occured: " + exp.Message);
                        break;
                    }
                }
            } //End Upload PDF File

            //Upload ZIP File
            string zipPath = "";
            if (fileUploadZIP.HasFiles) {
                string path = Server.MapPath("~/UploadZIP/");
                foreach(HttpPostedFile file in fileUploadZIP.PostedFiles) {
                    try {
                        file.SaveAs(Path.Combine(path, enteredUsername + "_" + file.FileName));
                        zipPath = enteredUsername + "_" + file.FileName;
                        //string tempLabel =
                        //    "Filename: " + enteredUsername + "_" + file.FileName + "<br/>" +
                        //    "FileContentLength: " + file.ContentLength +"<br/>" +
                        //    "FileHashCode : " + file.GetHashCode() + "<br/>" +
                        //    "FileGetType : " + file.GetType() + "<br/>" +
                        //    "FileToString: " + file.ToString() + "<br/>" +
                        //    "FilePath: " + path + file.FileName;
                    }
                    catch (Exception exp) {
                        Console.WriteLine("Error occured: " + exp.Message);
                        break;
                    }
                }
            }//End Upload ZIP File
            //------End - Get Uploaded Files & Image ------//
            

            //------Start - Populate LOGIN Table------//
            //SQL Connection String to LOGIN table
            string connectionStringLogin =
                ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            
            string insertLoginQuery = 
			"INSERT INTO dbo.LOGIN " +
			"(" +
				"username, " +
				"userpassword, " +
				"User_Type, " +
				"Login_Count, " +
				"Last_Login, " +
				"Approve_Status" +
			") " +
			"VALUES" +
			"(" +
				"@un, " +
				"@up, " +
				"'s', " +
				"0, " +
				"CURRENT_TIMESTAMP, " +
				"'n'" +
			");";

            using (SqlConnection connection = new SqlConnection(connectionStringLogin))
            {
                SqlCommand commandOne = new SqlCommand(insertLoginQuery, connection);
                commandOne.Parameters.AddWithValue("@un", enteredUsername);
                commandOne.Parameters.AddWithValue("@up", hashedPassword);
                try
                {
                    connection.Open();
                    commandOne.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Debug.WriteLine("LoginQuery Error: " + ex.Message);
                }
            }
            //------End - Populate LOGIN Table------//
            
            //------Start - Populate USER Table------//
            //SQL Connection String to USER table
            string connectionStringUser =
                ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

                string insertUserQuery =
				"INSERT INTO dbo.USERS " +
				"(" +
					"username, " +
					"First_Name, " +
					"Last_Name, " +
					"Email, " +
					"Security_Question, " +
					"Security_Answer, " +
					"Acct_Reason, " +
					"Semester_Completion, " +
					"Account_Date, " +
					"Progress_Bar, " +
					"Comment_Box, " +
					"Comment_Status, " +
					"Reviewer_Comments, " +
					"College_Dept " +
				") " +
				"VALUES" +
				"(" +
					"@un, " +
					"@fn, " +
					"@ln, " +
					"@em, " +
					"@sq, " +
					"@sa, " +
					"@ar, " +
					"@sm, " +
					"CURRENT_TIMESTAMP, " +
					"0, " +
					"'', " +
					"'n', " +
                    "'', " +
					"'Information Technology'" +
				");";

				using (SqlConnection connection = new SqlConnection(connectionStringUser)) {
                    SqlCommand commandTwo = new SqlCommand(insertUserQuery, connection);
	                commandTwo.Parameters.AddWithValue("@un", enteredUsername);
					commandTwo.Parameters.AddWithValue("@fn", enteredFirstName);
					commandTwo.Parameters.AddWithValue("@ln", enteredLastName);
					commandTwo.Parameters.AddWithValue("@em", enteredUlid);
					commandTwo.Parameters.AddWithValue("@sq", enteredSecQuestion);
					commandTwo.Parameters.AddWithValue("@sa", enteredSecAnswer);
					commandTwo.Parameters.AddWithValue("@ar", submissionType);
					commandTwo.Parameters.AddWithValue("@sm", enteredSemester);

	                try {
	                    connection.Open();
	                    commandTwo.ExecuteNonQuery();
	                    connection.Close();
	                }
	                catch (Exception ex) {
	                    Debug.WriteLine("UserQuery Error: " + ex.Message);
	                }
            	}
            //------End - Populate USER Table------//


            //------Start - Populate FILES Table------//
            string connectionStringFiles =
                ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string insertFilesQuery =
            "INSERT INTO dbo.FILES " +
	        "(" +
		        "username, " +
		        "Project_ID, " +
		        "Project_Name, " +
		        "Course_ID, " +
		        "Keyword1, " +
		        "Keyword2, " +
		        "Keyword3, " +
		        "Abstract, " +
		        "Live_Link, " +
		        "Video_Link, " +
		        "Chair_Name, " +
		        "Chair_Email, " +
		        "Comm_Name, " +
		        "Comm_Email, " +
		        "Gadvisor_Name, " +
		        "Gadvisor_Email, " +
		        "Upload_Date, " +
		        "Reject_Reason, " +
		        "Num_Views, " +
		        "Num_Dloads, " +
		        "Pic_File, " +
		        "Proj_Pdf_File, " +
		        "Proj_Zip_File, " +
		        "Pres_Date, " +
		        "Like_Count, " +
		        "Dislike_Count, " +
		        "Approval_Status1, " +
		        "Approval_Status2, " +
		        "Approval_Status3, " +
		        "Reviewer_Comment1, " +
		        "Reviewer_Comment2, " +
		        "Reviewer_Comment3 " +		
	        ") " +
	        "VALUES" +
	        "(" +
		        "@username, " +
		        "@Project_ID, " +
		        "@Project_Name, " +
		        "@Course_ID, " +
		        "@Keyword1, " +
		        "@Keyword2, " +
		        "@Keyword3, " +
		        "@Abstract, " +
		        "@Live_Link, " +
		        "@Video_Link, " +
		        "@Chair_Name, " +
		        "@Chair_Email, " +
		        "@Comm_Name, " +
		        "@Comm_Email, " +
		        "@Gadvisor_Name, " +
		        "@Gadvisor_Email, " +
                "CURRENT_TIMESTAMP, " +
		        "@Reject_Reason, " +
		        "@Num_Views, " +
		        "@Num_Dloads, " +
		        "@Pic_File, " +
		        "@Proj_Pdf_File, " +
		        "@Proj_Zip_File, " +
		        "@Pres_Date, " +
		        "@Like_Count, " +
		        "@Dislike_Count, " +
		        "@Approval_Status1, " +
		        "@Approval_Status2, " +
		        "@Approval_Status3, " +
		        "@Reviewer_Comment1, " +
		        "@Reviewer_Comment2, " +
		        "@Reviewer_Comment3 " +
	        ");";

            using (SqlConnection connection = new SqlConnection(connectionStringLogin))
            {
                SqlCommand commandThree = new SqlCommand(insertFilesQuery, connection);
                commandThree.Parameters.AddWithValue("@username", enteredUsername);
        		commandThree.Parameters.AddWithValue("@Project_ID", enteredUsername);
				commandThree.Parameters.AddWithValue("@Project_Name", enteredResearchName);
				commandThree.Parameters.AddWithValue("@Course_ID", enteredCourseNumber);
				commandThree.Parameters.AddWithValue("@Keyword1", enteredKeywordOne);
				commandThree.Parameters.AddWithValue("@Keyword2", enteredKeywordTwo);
				commandThree.Parameters.AddWithValue("@Keyword3", enteredKeywordThree);
				commandThree.Parameters.AddWithValue("@Abstract", enteredAbstract);
				commandThree.Parameters.AddWithValue("@Live_Link", enteredCodeURL);
				commandThree.Parameters.AddWithValue("@Video_Link", enteredVideoURL);
				commandThree.Parameters.AddWithValue("@Chair_Name", enteredCommitteeOne);
				commandThree.Parameters.AddWithValue("@Chair_Email", "reggievault@gmail.com");
				commandThree.Parameters.AddWithValue("@Comm_Name", enteredCommitteeTwo);
				commandThree.Parameters.AddWithValue("@Comm_Email", "reggievault@gmail.com");
				commandThree.Parameters.AddWithValue("@Gadvisor_Name", enteredGA);
				commandThree.Parameters.AddWithValue("@Gadvisor_Email","reggievault@gmail.com");
				commandThree.Parameters.AddWithValue("@Reject_Reason", "''");
				commandThree.Parameters.AddWithValue("@Num_Views", 0);
				commandThree.Parameters.AddWithValue("@Num_Dloads", 0);
				commandThree.Parameters.AddWithValue("@Pic_File", imagePath);
				commandThree.Parameters.AddWithValue("@Proj_Pdf_File", pdfPath);
				commandThree.Parameters.AddWithValue("@Proj_Zip_File", zipPath);
				commandThree.Parameters.AddWithValue("@Pres_Date", "''");
				commandThree.Parameters.AddWithValue("@Like_Count", 0);
				commandThree.Parameters.AddWithValue("@Dislike_Count", 0);
				commandThree.Parameters.AddWithValue("@Approval_Status1", "''");
				commandThree.Parameters.AddWithValue("@Approval_Status2", "''");
				commandThree.Parameters.AddWithValue("@Approval_Status3", "''");
				commandThree.Parameters.AddWithValue("@Reviewer_Comment1", "''");
				commandThree.Parameters.AddWithValue("@Reviewer_Comment2", "''");
				commandThree.Parameters.AddWithValue("@Reviewer_Comment3", "''");

                try {
                    connection.Open();
                    commandThree.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)                 {
                    Debug.WriteLine("LoginQuery Error: " + ex.Message);
                }
            }//------End - Populate FILES Table------//

            //--------Start - Sent Email to Student and Committee--------//
            EmailStudent();
            EmailCommittee("Chair");
            EmailCommittee("Member");
            //--------End - Sent Email to Student and Committee--------//

            Response.Redirect("A_Login.aspx");
        }//end submitButton_Click

        //Takes any string and hashes it using SHA1 then returns the hashed value
        //REF: http://www.codeproject.com/Articles/38951/How-To-Hash-Data-Using-MD-and-SHA
        private string GetSHA1HashData(string data) {
            //create new instance of sha1
            //SHA1 sha1 = SHA1.Create();
            SHA1 sha1 = new SHA1CryptoServiceProvider();

            //convert the input text to array of bytes
            byte[] bytes = Encoding.UTF8.GetBytes(data);
            byte[] hashData = sha1.ComputeHash(bytes);

            //create new instance of StringBuilder to save hashed data
            StringBuilder returnValue = new StringBuilder();

            //loop for each byte and add it to StringBuilder
            for (int i = 0; i < hashData.Length; i++)
            {
                returnValue.Append(hashData[i].ToString());
            }

            // return hexadecimal string
            return returnValue.ToString();
        }


        private void EmailStudent()
        {
            //START - CONSTRUCT AND SEND EMAIL
            string senderName = "Reggie Scholar";
            string messageSubject = "Your account at Reggie Scholar is now awaiting the admin's approval";
            string emailContent = "";
            emailContent
            += "<img src='http://s8.postimg.org/dw0wpoy6t/15_04_23_Logo_Email.png' height='100'>"
            + "<br/>"
            + "<p>Thank you for registering an account with us.<br/>"
            + "Please take a moment to review the information in your new account while awaiting the admin's approval.</p>"
            + "<table id='resultTable'>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "First Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtFirstName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Last Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtlastName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "UserID :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtUsername.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Password :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtPassword.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Email :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtUlid.Text + "@ilstu.com"
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Security Question :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtSecQuestion.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Security Answer :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtSecAnswer.Text
            + "</td>"
            + "</tr>"            
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Research Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtResearchName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Course Number :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCourseNumber.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Semester Completion :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenSemester.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Committee Chair :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCommitteeOne.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Committee Member :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCommitteeTwo.Value
            + "</td>"
            + "</tr>"
            + "</table>"
            + "<br/>"
            + "Reggie Scholar. "
            + "One Infinite Loop, "
            + "Mountain View, CA 94043";

            MailMessage emailMessage = new MailMessage();
            emailMessage.IsBodyHtml = true;

            MailAddress messageFrom = new MailAddress("tprajan@ilstu.edu", senderName);
            emailMessage.From = messageFrom;

            string emailTo = txtUlid.Text + "@ilstu.com";
            MailAddress messageTo = new MailAddress(emailTo);
            emailMessage.To.Add(messageTo.Address);

            emailMessage.Subject = messageSubject;
            emailMessage.Body = emailContent;

            SmtpClient mailClient = new SmtpClient("smtp.ilstu.edu");
            mailClient.UseDefaultCredentials = true;
            mailClient.Send(emailMessage);
            //END - CONSTRUCT AND SEND EMAIL
        }

        private void EmailCommittee(string position)
        {
            //START - CONSTRUCT AND SEND EMAIL
            string senderName = "Reggie Scholar";
            string messageSubject = "[Reggie Scholar] You have been designated Committee " + position + " for " + txtlastName.Text + "'s Submission";
            string emailContent = "";
            emailContent
            += "<img src='http://s8.postimg.org/dw0wpoy6t/15_04_23_Logo_Email.png' height='100'>"
            + "<br/>"
            + "<p>You have been designated Committee <b>" + position + "</b> for <b>" + txtFirstName.Text + " " + txtlastName.Text + "</b>'s Submission.<br/>"
            + "Please take a moment to review the information below and click the Submission URL to review the student's submission.</p>"
            + "<table id='resultTable'>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "First Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtFirstName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Last Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtlastName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col2'>"
            + "Research Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + txtResearchName.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Course Number :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCourseNumber.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Semester Completion :"
            + "</td>"            
            + "<td class = 'col2'>"
            + hiddenSemester.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Committee Chair :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCommitteeOne.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Committee Member :"
            + "</td>"
            + "<td class = 'col2'>"
            + hiddenCommitteeTwo.Value
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Submission URL :"    //Most important email component
            + "</td>"
            + "<td class = 'col2'>"
            + "<a href='http://localhost:51229/A_Login.aspx?username=" + txtUsername.Text + "'>" + txtFirstName.Text + " " + txtlastName.Text + "</a>"
            + "</td>"
            + "</tr>"
            + "</table>"
            + "<br/>"
            + "Reggie Scholar. "
            + "One Infinite Loop, "
            + "Mountain View, CA 94043";

            MailMessage emailMessage = new MailMessage();
            emailMessage.IsBodyHtml = true;

            MailAddress messageFrom = new MailAddress("tprajan@ilstu.edu", senderName);
            emailMessage.From = messageFrom;

            string emailTo = "tprajan@ilstu.edu";
            MailAddress messageTo = new MailAddress(emailTo);
            emailMessage.To.Add(messageTo.Address);

            emailMessage.Subject = messageSubject;
            emailMessage.Body = emailContent;

            SmtpClient mailClient = new SmtpClient("smtp.ilstu.edu");
            mailClient.UseDefaultCredentials = true;
            mailClient.Send(emailMessage);
            //END - CONSTRUCT AND SEND EMAIL
        }
    }
}
