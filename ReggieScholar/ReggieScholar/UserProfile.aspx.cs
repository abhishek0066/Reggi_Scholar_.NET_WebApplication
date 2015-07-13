using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace ReggieScholar {

    
   
    public partial class UserProfile : System.Web.UI.Page {

        string invitationChairEmail;
        string inivitationCommEmail;
        string invitationAdvisorEmail;
        string invitationFirstName;
        string invitationLastName;
        string invitationProjectName;
        //Made Changes Here

        protected void Page_Load(object sender, EventArgs e) {
                string cookieUsername = "";
                string userPasswordFromCookie = "";
                
                if (Request.Cookies["user"] != null) { //If cookie exist, get username
                    HttpCookie getUserCookie = Request.Cookies["user"];
                    cookieUsername = getUserCookie.Values["username"];
                    userPasswordFromCookie = getUserCookie.Values["userpassword"];

                    string userType = getUserCookie.Values["usertype"];

                    switch (userType)
                    {
                        case "s":
                            userProfileHomeID.Attributes["href"] = String.Format("UserProfile.aspx");
                            break;

                        case "r":
                            userProfileHomeID.Attributes["href"] = String.Format("ReviewerProfile.aspx");
                            break;

                        case "a":
                            userProfileHomeID.Attributes["href"] = String.Format("Admin_Dashboard_Main.aspx");
                            break;

                    }
                }
                else {
                    Response.Redirect("A_Login.aspx");
                }


                //Arrive from search page
                if (!String.IsNullOrEmpty(Request.QueryString["usernameFromSearch"]))
                {
                    cookieUsername = Request.QueryString["usernameFromSearch"];    
                }
                


                string connectionString = 
                ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

                string UserUsernameDB = "";
                string UserFirst_NameDB = "";
                string UserLast_NameDB = "";
                string UserEmailDB = "";
                string UserSecurity_QuestionDB = "";
                string UserSecurity_AnswerDB = "";
                string UserAcct_ReasonDB = "";
                string UserSemester_CompletionDB = "";
                DateTime UserAccount_DateDB = DateTime.Now;
                int UserProgress_BarDB = 0;
                string UserComment_BoxDB = "";
                string UserComment_StatusDB = "";
                string UserReviewer_CommentsDB = "";
                string UserCollege_DeptDB = "";

                string LoginUsername = "";
                string LoginUserpassword = "";
                string LoginUser_Type = "";
                int Login_Count;
                DateTime Last_Login = DateTime.Now;
                string Approve_Status = "";

                string Filesusername = "";
                string FilesProject_ID = "";
                string FilesProject_Name = "";
                string FilesCourse_ID = "";
                string FilesKeyword1 = "";
                string FilesKeyword2 = "";
                string FilesKeyword3 = "";
                string FilesAbstract = "";
                string FilesLive_Link = "";
                string FilesVideo_Link = "";
                string FilesChair_Name = "";
                string FilesChair_Email = "";
                string FilesComm_Name = "";
                string FilesComm_Email = "";
                string FilesGadvisor_Name = "";
                string FilesGadvisor_Email = "";
                DateTime FilesUpload_Date = DateTime.Now;
                string FilesReject_Reason = "";
                int FilesNum_Views = 0;
                int FilesNum_Dloads = 0;
                string FilesPic_File = "";
                string FilesProj_Pdf_File = "";
                string FilesProj_Zip_File = "";
                string FilesPres_Date = "";
                int FilesDislike_Count = 0;
                int FilesLike_Count = 0;
                string FilesApproval_Status1 = "";
                string FilesApproval_Status2 = "";
                string FilesApproval_Status3 = "";
                string FilesReviewer_Comment1 = "";
                string FilesReviewer_Comment2 = "";
                string FilesReviewer_Comment3 = "";
                string finalCommitteeMemberName = "";
                string finalCommitteeChairName = "";
                string finalAdvisorName = "";
                using (SqlConnection connection = new SqlConnection(connectionString)) {
                    using (SqlCommand command = connection.CreateCommand()) {
                        command.CommandText =
                            "SELECT " +
                                "u.username, " +
                                "u.First_Name, " +
                                "u.Last_Name, " +
                                "u.Email, " +
                                "u.Security_Question, " +
                                "u.Security_Answer, " +
                                "u.Acct_Reason, " +
                                "u.Semester_Completion, " +
                                "u.Account_Date, " +
                                "u.Progress_Bar, " +
                                "u.Comment_Box, " +
                                "u.Comment_Status, " +
                                "u.Reviewer_Comments, " +
                                "u.College_Dept, " + 

                                "l.username, " +
                                "l.userpassword, " +
                                "l.User_Type, " +
                                "l.Login_Count, " +
                                "l.Last_Login, " +
                                "l.Approve_Status, " +

                                "f.username, " +
                                "f.Project_ID, " +
                                "f.Project_Name, " +
                                "f.Course_ID, " +
                                "f.Keyword1, " +
                                "f.Keyword2, " +
                                "f.Keyword3, " +
                                "f.Abstract, " +
                                "f.Live_Link, " +
                                "f.Video_Link, " +
                                "f.Chair_Name, " +
                                "f.Chair_Email, " +
                                "f.Comm_Name, " +
                                "f.Comm_Email, " +
                                "f.Gadvisor_Name, " +
                                "f.Gadvisor_Email, " +
                                "f.Upload_Date, " +
                                "f.Reject_Reason, " +
                                "f.Num_Views, " +
                                "f.Num_Dloads, " +
                                "f.Pic_File, " +
                                "f.Proj_Pdf_File, " +
                                "f.Proj_Zip_File, " +
                                "f.Pres_Date, " +
                                "f.Dislike_Count, " +
                                "f.Like_Count, " +
                                "f.Approval_Status1, " +
                                "f.Approval_Status2, " +
                                "f.Approval_Status3, " +
                                "f.Reviewer_Comment1, " +
                                "f.Reviewer_Comment2, " +
                                "f.Reviewer_Comment3 " +
                            "FROM " +
                            "dbo.USERS u JOIN dbo.LOGIN l " +
                                "ON u.username=l.username " +
                            "JOIN dbo.FILES f " +
                                "ON l.username=f.username " +
                            "WHERE u.username = @usernameDB";

                        command.Parameters.AddWithValue("@usernameDB", cookieUsername);
                        try {
                            connection.Open();
                            SqlDataReader reader = command.ExecuteReader();

                            if (reader.HasRows) {
                                while (reader.Read()) {
                                    UserUsernameDB = reader.GetString(0);
                                    UserFirst_NameDB = reader.GetString(1);
                                    UserLast_NameDB = reader.GetString(2);
                                    UserEmailDB = reader.GetString(3);
                                    UserSecurity_QuestionDB = reader.GetString(4);
                                    UserSecurity_AnswerDB = reader.GetString(5);
                                    UserAcct_ReasonDB = reader.GetString(6);
                                    UserSemester_CompletionDB = reader.GetString(7);
                                    UserAccount_DateDB = reader.GetDateTime(8);
                                    UserProgress_BarDB = reader.GetInt32(9);
                                    UserComment_BoxDB = reader.GetString(10);
                                    UserComment_StatusDB = reader.GetString(11);
                                    UserReviewer_CommentsDB = reader.GetString(12);
                                    UserCollege_DeptDB = reader.GetString(13);

                                    LoginUsername = reader.GetString(14);
                                    LoginUserpassword = reader.GetString(15);
                                    LoginUser_Type = reader.GetString(16);
                                    Login_Count = reader.GetInt32(17);
                                    Last_Login = reader.GetDateTime(18);
                                    Approve_Status = reader.GetString(19);

                                    Filesusername = reader.GetString(20);
                                    FilesProject_ID = reader.GetString(21);
                                    FilesProject_Name = reader.GetString(22);
                                    FilesCourse_ID = reader.GetString(23);
                                    FilesKeyword1 = reader.GetString(24);
                                    FilesKeyword2 = reader.GetString(25);
                                    FilesKeyword3 = reader.GetString(26);
                                    FilesAbstract = reader.GetString(27);
                                    FilesLive_Link = reader.GetString(28);
                                    FilesVideo_Link = reader.GetString(29);
                                    FilesChair_Name = reader.GetString(30);
                                    FilesChair_Email = reader.GetString(31);
                                    FilesComm_Name = reader.GetString(32);
                                    FilesComm_Email = reader.GetString(33);
                                    FilesGadvisor_Name = reader.GetString(34);
                                    FilesGadvisor_Email = reader.GetString(35);
                                    FilesUpload_Date = reader.GetDateTime(36);
                                    FilesReject_Reason = reader.GetString(37);
                                    FilesNum_Views = reader.GetInt32(38);
                                    FilesNum_Dloads = reader.GetInt32(39);
                                    FilesPic_File = reader.GetString(40);
                                    FilesProj_Pdf_File = reader.GetString(41);
                                    FilesProj_Zip_File = reader.GetString(42);
                                    FilesPres_Date = reader.GetString(43);
                                    FilesDislike_Count = reader.GetInt32(44);
                                    FilesLike_Count = reader.GetInt32(45);
                                    FilesApproval_Status1 = reader.GetString(46);
                                    FilesApproval_Status2 = reader.GetString(47);
                                    FilesApproval_Status3 = reader.GetString(48);
                                    FilesReviewer_Comment1 = reader.GetString(49);
                                    FilesReviewer_Comment2 = reader.GetString(50);
                                    FilesReviewer_Comment3 = reader.GetString(51);
                                }
                            }
                        }
                        catch (Exception ex) {
                            Console.WriteLine(ex.Message);
                        }
                    } //End SqlCommand
                } //End SqlConnection

                //Define object to make string proper case
                TextInfo titleCase = new CultureInfo("en-US", false).TextInfo;

                rejectID.Text = FilesReviewer_Comment1 + "  " + FilesReviewer_Comment2 + "  " + FilesReviewer_Comment3;
                commentSectionID.Text = UserComment_BoxDB;
                finalAdvisorName = titleCase.ToTitleCase(FilesGadvisor_Name);
                finalCommitteeChairName = titleCase.ToTitleCase(FilesChair_Name);
                finalCommitteeMemberName = titleCase.ToTitleCase(FilesComm_Name); 
                string firstNameProperCase = titleCase.ToTitleCase(UserFirst_NameDB.ToLower());
                string lastNameProperCase = titleCase.ToTitleCase(UserLast_NameDB);
                presentationDateID.Text = FilesPres_Date;
                headerUserNameID.Text = firstNameProperCase + " " + lastNameProperCase;
                FullNameLabel.Text = titleCase.ToTitleCase(UserFirst_NameDB.ToLower()) + " " + titleCase.ToTitleCase(UserLast_NameDB.ToLower());
                
                LastLoginLabel.Text = Last_Login.ToString("G");
                CourseNumberLabel.Text = FilesCourse_ID;
                DepartmentLabel.Text = UserCollege_DeptDB;
                SemesterCompletedLabel.Text = UserSemester_CompletionDB;
                EmailLabel.Text = titleCase.ToLower(UserEmailDB);
                
                AccountCreatedDateLabel.Text = UserAccount_DateDB.ToString("G");
                AccountReasonLabel.Text = titleCase.ToTitleCase(UserAcct_ReasonDB);

                string statusString = "";
                if (Approve_Status == "y") {
                    statusString = "Approved";
                }
                else {
                    statusString = "Not Approved";
                }

                AccountApprovedLabel.Text = statusString;
                
                firstNameId.Text = titleCase.ToTitleCase(UserFirst_NameDB);
                lastNameId.Text = titleCase.ToTitleCase(UserLast_NameDB);
                userNameId.Text = UserUsernameDB;
                passwordId.Attributes.Add("value", userPasswordFromCookie);

                emailId.Text = UserEmailDB;
                securityQuestionID.Text = UserSecurity_QuestionDB;
                securityAnswerID.Text = UserSecurity_AnswerDB;

                keyword1Id.Text = titleCase.ToTitleCase(FilesKeyword1);
                keyword2Id.Text = titleCase.ToTitleCase(FilesKeyword2);
                keyword3Id.Text = titleCase.ToTitleCase(FilesKeyword3);

                liveLinkId.Text = titleCase.ToLower(FilesLive_Link);
                videoLinkId.Text = titleCase.ToLower(FilesVideo_Link);
                
                researchNameLabel.Text = FilesProject_Name;
                abstractID.Text = titleCase.ToLower(FilesAbstract);
                
                if (FilesLive_Link == "") {
                    projectLiveLinkID.NavigateUrl = "";
                    string liveLinkMsg = "No LIVE URL was provided.";
                    projectLiveLinkID.Text = liveLinkMsg;
                    projectLiveLinkID.Enabled = false;

                }
                else {
                    projectLiveLinkID.NavigateUrl = FilesLive_Link;
                }
                

                if (FilesVideo_Link == "")
                {
                    projectVideoLinkID.NavigateUrl = "";
                    string videoLinkMsg = "No VIDEO URL was provided.";
                    projectVideoLinkID.Text = videoLinkMsg;
                    projectVideoLinkID.Enabled = false;

                }
                else
                {
                    projectVideoLinkID.NavigateUrl = FilesVideo_Link;
                }

                pdfDownload.NavigateUrl = "UploadPDF\\" + FilesProj_Pdf_File;
                zipDownload.NavigateUrl = "UploadZIP\\" + FilesProj_Zip_File;

                committeeChairNameID.Text = "Dr. "+finalCommitteeChairName;
                committeeChairEmailID.Text = FilesChair_Email;
                committeeMemberNameID.Text = "Dr. " + finalCommitteeMemberName;
                committeeMemberEmailID.Text = FilesComm_Email;
                graduateAdvisorNameID.Text = finalAdvisorName;
                graduateAdvisorEmailID.Text = FilesGadvisor_Email;


                userPic.InnerHtml = "<img class='userProfileImageBorder' src='UploadImage/" + FilesPic_File + "'></img>";
                
                if (UserProgress_BarDB >= 0) {
                    progressBarPanel.Visible = true;
                    submissionDeclinedPanel.Visible = false;    
                }
                else {
                    progressBarPanel.Visible = false;
                    submissionDeclinedPanel.Visible = true;    
                }

                int progressBarStart = UserProgress_BarDB;

                switch (progressBarStart) {
                    case 0:
                        progressBarInt.Style.Add("width", "10%");
                        break;
                    case 1:
                        progressBarInt.Style.Add("width", "33%");
                        break;
                    case 2:
                        progressBarInt.Style.Add("width", "66%");
                        break;
                    case 3:
                        progressBarInt.Style.Add("width", "100%");
                        break;
                }


                numberOfViewsID.Text = FilesNum_Views.ToString();
                numberOfDownloadID.Text = FilesNum_Dloads.ToString();
                likeCountID.Text = FilesLike_Count.ToString();
                dislikeCountID.Text = FilesDislike_Count.ToString();
                //commentSectionID.Text 


                invitationChairEmail = FilesChair_Email;
                inivitationCommEmail = FilesComm_Email;
                invitationAdvisorEmail = FilesGadvisor_Email;
                invitationFirstName = firstNameProperCase;
                invitationLastName = lastNameProperCase;
                invitationProjectName = FilesProject_Name;
                //Changes made here
        }

        protected void Send_Invite(object sender, EventArgs e)
        {

            if (schedulePresentationInputID.Text.Length > 2)
            {
                string dateSelected = schedulePresentationInputID.Text;
                EmailStudent("tprajan@ilstu.com", dateSelected);
                UpdatePresentationInformation(dateSelected);
                presentationDateID.Text = dateSelected;
                schedulePresentationInputID.Text = "";
            }
            else
                presentationScheduleLabel.Text = "Please select date!!!";


        }

        private void EmailStudent(string email, string dateSelected)
        {
            //START - CONSTRUCT AND SEND EMAIL
            string senderName = "Reggie Scholar";
            string messageSubject = "Project Presenation Schedule for " + invitationFirstName + " " + invitationLastName;
            string emailContent = "";
            emailContent
            += "<img src='http://s8.postimg.org/dw0wpoy6t/15_04_23_Logo_Email.png' height='100'>"
            + "<br/>"
            + "<p>You are invited to be a part of the committee for my upcoming presentation.<br/>"
            + "Please take a moment to review the information for the presentation date.</p>"
            + "<table id='resultTable'>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Student Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + FullNameLabel.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Research Name :"
            + "</td>"
            + "<td class = 'col2'>"
            + researchNameLabel.Text
            + "</td>"
            + "</tr>"
            + "<tr class='allRow'>"
            + "<td class = 'col1'>"
            + "Presentation Time :"
            + "</td>"
            + "<td class = 'col2'>"
            + dateSelected
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

            string emailTo = email;
            MailAddress messageTo = new MailAddress(emailTo);
            emailMessage.To.Add(messageTo.Address);

            emailMessage.Subject = messageSubject;
            emailMessage.Body = emailContent;

            SmtpClient mailClient = new SmtpClient("smtp.ilstu.edu");
            mailClient.UseDefaultCredentials = true;
            mailClient.Send(emailMessage);
            //END - CONSTRUCT AND SEND EMAIL
        }


        private void UpdatePresentationInformation(string dateSelected)
        {
            string userName = userNameId.Text;
            string connectionString =
                    ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "UPDATE dbo.FILES " +
                            " set Pres_Date=@Pres_Date WHERE USERNAME =@USERNAME";
                    command.Parameters.AddWithValue("@USERNAME", userName);
                    command.Parameters.AddWithValue("@Pres_Date", dateSelected);
                    try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                        }
                    catch (SqlException exception)
                    {
                        Response.Write("<p>Error code " + exception.Number
                                       + ": " + exception.Message + "</p>");
                    }
                    finally
                    {
                        connection.Close();
                    }
                        
                }
            }
        }

        protected void updateInformationButton_Click(object sender, EventArgs e) {
            string firstname = firstNameId.Text;
            string lastname = lastNameId.Text;
            string username = userNameId.Text;
            string password = passwordId.Text;
            string email = emailId.Text;
            string securityQuestion = securityQuestionID.Text;
            string securityAnswer = securityAnswerID.Text;
            string keyword1 = keyword1Id.Text;
            string keyword2 = keyword2Id.Text;
            string keyword3 = keyword3Id.Text;
            string liveLink = liveLinkId.Text;
            string videoLink = videoLinkId.Text;
            string connectionString =
                    ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                    using (SqlCommand command = connection.CreateCommand()) {
                        command.CommandText = "UPDATE dbo.FILES " +
                            " set KEYWORD1=@KEYWORD1, KEYWORD2=@KEYWORD2, KEYWORD3=@KEYWORD3, LIVE_LINK=@LIVE_LINK, VIDEO_LINK=@VIDEO_LINK WHERE USERNAME =@USERNAME";
                        command.Parameters.AddWithValue("@USERNAME", username);
                        command.Parameters.AddWithValue("@KEYWORD1", keyword1);
                        command.Parameters.AddWithValue("@KEYWORD2", keyword2);
                        command.Parameters.AddWithValue("@KEYWORD3", keyword3);
                        command.Parameters.AddWithValue("@LIVE_LINK", liveLink);
                        command.Parameters.AddWithValue("@VIDEO_LINK", videoLink);
                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                        }
                        catch (SqlException exception)
                        {
                            Response.Write("<p>Error code " + exception.Number
                                           + ": " + exception.Message + "</p>");
                        }
                        finally
                        {
                            connection.Close();
                        }
                        }
                    }

            string connectionString1 =
                    ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString1)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "UPDATE dbo.LOGIN " +
                        " set USERPASSWORD=@USERPASSWORD WHERE USERNAME=@USERNAME";
                    command.Parameters.AddWithValue("@USERNAME", username);
                    command.Parameters.AddWithValue("@USERPASSWORD", password);
                    try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                        }
                    catch (SqlException exception)
                    {
                        Response.Write("<p>Error code " + exception.Number
                                       + ": " + exception.Message + "</p>");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }

            string connectionString2 =
                    ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString2)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "UPDATE dbo.USERS " +
                        " set FIRST_NAME=@FIRST_NAME, LAST_NAME=@LAST_NAME, EMAIL=@EMAIL, SECURITY_QUESTION=@SECURITY_QUESTION, SECURITY_ANSWER=@SECURITY_ANSWER WHERE USERNAME=@USERNAME";
                    command.Parameters.AddWithValue("@USERNAME", username);
                    command.Parameters.AddWithValue("@FIRST_NAME", firstname);
                    command.Parameters.AddWithValue("@LAST_NAME", lastname);
                    command.Parameters.AddWithValue("@EMAIL", email);
                    command.Parameters.AddWithValue("@SECURITY_QUESTION", securityQuestion);
                    command.Parameters.AddWithValue("@SECURITY_ANSWER", securityAnswer);
                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        updateInformationLabelID.Text = "Congratulations Records Updated";
                    }
                    catch (SqlException exception)
                    {
                        Response.Write("<p>Error code " + exception.Number
                                       + ": " + exception.Message + "</p>");
                    }
                    finally
                    {
                        connection.Close();
                    }
                }
            }
 
        }


        protected void logoutOut_OnClick(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("A_Login.aspx");
        }


    }
}
