using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Mime;
using System.Globalization;

namespace ReggieScholar
{
    public partial class SearchProfile_ReviewerProject : System.Web.UI.Page
    {
        public string usernameBackup;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            { //If cookie exist, get username
                HttpCookie getUserCookie = Request.Cookies["user"];

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
            else
            {
                Response.Redirect("A_Login.aspx");
            }
            
            string cookieUsername = "";
            string userNameToSet = "a";
            string userNameToSet2 = "a";
            string finalUsername="";
            string finalFirstName="";
            string finalLastName="";
            string finalFullName="";
            string finalEmail = "";
            string finalPicFile = "";
            string finalLiveLink = "";
            string finalVideoLink = "";
            string finalZipFile = "";
            string finalPdfFile = "";
            string courseIDNumber="";
            string collegeDept="";
            string firstName="";
            string lastName="";
            string emailAddress="";
            string imageFile="";
            string researchName="";
            string abstractContent="";
            string liveLink="";
            string videoLink="";
            string pdfFile="";
            string zipFile="";
            string userImage="";
            string committeeChairName="";
            string committeeMemberName="";
            string advisorName="";
            string committeeChairEmail="";
            string committeeMemberEmail="";
            string advisorEmail="";
            string semesterCompleted="";
            string presentationDate="";
            string finalCommitteeMemberName = "";
            string finalCommitteeChairName = "";
            string finalAdvisorName = "";
            userNameToSet = Request.QueryString["username"];
            userNameToSet2 = Request.QueryString["u.username"];
            
            try
            {
                if (userNameToSet.Length > 1)
                {
                    finalUsername = userNameToSet;
                    usernameBackup = userNameToSet;
                }
                if (userNameToSet2.Length > 1)
                {
                    finalUsername = userNameToSet2;
                    usernameBackup = userNameToSet2;
                }
            }
            //Fit the other condition here
            catch(Exception ex) {
                Console.WriteLine(ex.Message);
            }


            //if (Request.Cookies["user"] != null)
            //{ //If cookie exist, get username
            //    HttpCookie getUserCookie = Request.Cookies["user"];
            //    cookieUsername = getUserCookie.Values["username"];
            //}
            //else
            //{
            //    Response.Redirect("A_Login.aspx");
            //}
            string connectionString;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = 
                        "SELECT "+
                        "First_Name, "+
                        "Last_Name, "+
                        "Email, "+
                        "Semester_Completion, "+
                        "College_Dept "+
                        "FROM "+
                        "dbo.USERS "+
                        "WHERE username = @usernameDB";
                    command.Parameters.AddWithValue("@usernameDB", finalUsername);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                firstName = reader.GetString(0);
                                lastName = reader.GetString(1);
                                emailAddress = reader.GetString(2);
                                semesterCompleted = reader.GetString(3);
                                collegeDept = reader.GetString(4);

                            }
                        }
                    }

                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                    finally
                    {
                        connection.Close();
                    }
                }
            }

            connectionString =
                ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) { 
                    command.CommandText ="SELECT "+
                        "Course_ID, "+
                        "Pic_File, "+
                        "Project_Name, "+
                        " Abstract, "+ 
                        "Live_Link, "+
                        "Video_Link, "+
                        "Proj_Zip_File, "+
                        "Proj_Pdf_File, "+
                        "Chair_Name, "+
                        "Chair_Email, "+
                        "Comm_Name, "+
                        "Comm_Email, "+
                        "Gadvisor_Name, "+
                        "Gadvisor_Email, "+
                        "Pres_Date "+
                        "FROM "+
                        "dbo.FILES "+
                        "WHERE username = @usernameDB";
                    command.Parameters.AddWithValue("@usernameDB", finalUsername);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                courseIDNumber = reader.GetString(0);
                                imageFile = reader.GetString(1);
                                researchName = reader.GetString(2);
                                abstractContent = reader.GetString(3);
                                liveLink = reader.GetString(4);
                                videoLink = reader.GetString(5);
                                zipFile = reader.GetString(6);
                                pdfFile = reader.GetString(7);
                                committeeChairName = reader.GetString(8);
                                committeeChairEmail = reader.GetString(9);
                                committeeMemberName = reader.GetString(10);
                                committeeMemberEmail = reader.GetString(11);
                                advisorName = reader.GetString(12);
                                advisorEmail = reader.GetString(13);
                                presentationDate = reader.GetString(14);

                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally {
                        connection.Close();
                    }
                }
            }


            //Display user image
            userProfileImage.InnerHtml = "<img src='UploadImage/" + imageFile + "'>";


            //Define object to make string proper case
            TextInfo titleCase = new CultureInfo("en-US", false).TextInfo;

            finalAdvisorName = titleCase.ToTitleCase(advisorName);
            finalCommitteeChairName = titleCase.ToTitleCase(committeeChairName);
            finalCommitteeMemberName = titleCase.ToTitleCase(committeeMemberName); 
            finalFirstName= titleCase.ToTitleCase(firstName.ToLower());
            finalLastName = titleCase.ToTitleCase(lastName);
            finalFullName = finalFirstName + " " + finalLastName;
            finalEmail = titleCase.ToLower(emailAddress);
            finalPicFile = imageFile;
            finalLiveLink = titleCase.ToLower(liveLink);
            finalVideoLink = titleCase.ToLower(videoLink);

            pdfLink.NavigateUrl = "UploadPDF\\" + pdfFile;
            zipLink.NavigateUrl = "UploadZIP\\" + zipFile;

            userHeaderNameID.Text = finalFirstName;
            profileNameID.Text = finalFullName;
            courseNumberID.Text = courseIDNumber;
            departmentID.Text = collegeDept;
            semesterCompletedID.Text = semesterCompleted;
            userEmailID.Text = finalEmail;
            researchNameLabel.Text = researchName;
            abstractID.Text = abstractContent;
            projectLiveLinkID.NavigateUrl = finalLiveLink;
            projectLiveLinkID.Text = finalLiveLink;
            projectVideoLinkID.NavigateUrl = finalVideoLink;
            projectVideoLinkID.Text = finalVideoLink;
            committeeChairNameID.Text = "Dr. " + finalCommitteeChairName;
            committeeChairEmailID.Text = committeeChairEmail;
            committeeMemberNameID.Text = "Dr. " + finalCommitteeMemberName;
            committeeMemberEmailID.Text = committeeMemberEmail;
            graduateAdvisorNameID.Text = finalAdvisorName;
            graduateAdvisorEmailID.Text = advisorEmail;
            presentationDateID.Text = presentationDate;

            //Code to Update similar results
            string[] projectTopicArray = new string[3];
            string[] usernameArray = new string[3];
            string[] abstractArray = new string[3];
            int[] numberOfViewsArray = new int[3];
            int[] numberOfDownloadsArray = new int[3];
            int[] numberOfLikesArray = new int[3];
            int i = 0;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "SELECT TOP 3 USERNAME, PROJECT_NAME, ABSTRACT, NUM_VIEWS, NUM_DLOADS, LIKE_COUNT FROM FILES WHERE " +
                        "KEYWORD1 IN (SELECT KEYWORD1 FROM FILES WHERE USERNAME=@username) AND " +
                        "KEYWORD2 IN (SELECT KEYWORD2 FROM FILES WHERE USERNAME=@username)";
                    command.Parameters.AddWithValue("@username", finalUsername);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                usernameArray[i] = reader.GetString(0);
                                projectTopicArray[i] = reader.GetString(1);
                                abstractArray[i] = reader.GetString(2);
                                numberOfViewsArray[i] = reader.GetInt32(3);
                                numberOfDownloadsArray[i] = reader.GetInt32(4);
                                numberOfLikesArray[i] = reader.GetInt32(5);
                                i++;
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                    finally
                    {
                        connection.Close();
                    }
                }
            }
            projectTopic1.Text = projectTopicArray[0];
            projectTopic1Abstract.Text = abstractArray[0];
            project1NumberofViews.Text = numberOfViewsArray[0].ToString();
            project1NumberofDownloads.Text = numberOfDownloadsArray[0].ToString();
            project1NumberofLikes.Text = numberOfLikesArray[0].ToString();
            projectTopic2.Text = projectTopicArray[1];
            projectTopic2Abstract.Text = abstractArray[1];
            project2NumberofViews.Text = numberOfViewsArray[1].ToString();
            project2NumberofDownloads.Text = numberOfDownloadsArray[1].ToString();
            project2NumberofLikes.Text = numberOfLikesArray[1].ToString();
            projectTopic3.Text = projectTopicArray[2];
            projectTopic3Abstract.Text = abstractArray[2];
            project3NumberofViews.Text = numberOfViewsArray[2].ToString();
            project3NumberofDownloads.Text = numberOfDownloadsArray[2].ToString();
            project3NumberofLikes.Text = numberOfLikesArray[2].ToString();
            projectTopic2Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username=" + usernameArray[1];
            projectTopic1Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username=" + usernameArray[0];
            projectTopic3Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username=" + usernameArray[2];
        }

        protected void LikeButtonClicked(object sender, EventArgs e) {
            string finalUsername=usernameBackup;
            
            int count=0;
            
            string connectionString;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) { 
                    command.CommandText =
                        "SELECT Like_Count FROM dbo.FILES where username=@username";
                    command.Parameters.AddWithValue("@username", finalUsername);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                count = reader.GetInt32(0);
                            }
                        }
                    }

                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                    finally
                    {
                        connection.Close();
                    }

                }

            }

            count = count + 1;

            string connectionString1;
            connectionString1 = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString1)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText =
                    "UPDATE dbo.FILES SET Like_Count=@Like_Count WHERE USERNAME =@username";
                    command.Parameters.AddWithValue("@username", finalUsername);
                    command.Parameters.AddWithValue("@Like_Count", count);
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
            likeDislikeLabel.Text = "Thank you!!!";
        }


        protected void DisLikeButtonClicked(object sender, EventArgs e)
        {
            string finalUsername = usernameBackup;
            
            int count = 0;
            

            string connectionString;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        "SELECT Dislike_Count FROM dbo.FILES where username=@username";
                    command.Parameters.AddWithValue("@username", finalUsername);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read()) { 
                            count = reader.GetInt32(0);
                            }
                        }
                    }

                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }

                    finally
                    {
                        connection.Close();
                    }
                    
                }

            }

            count = count + 1;

            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                    "UPDATE dbo.FILES set Dislike_Count=@DisLike_Count WHERE USERNAME =@USERNAME";
                    command.Parameters.AddWithValue("@USERNAME", finalUsername);
                    command.Parameters.AddWithValue("@DisLike_Count", count);
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

                    likeDislikeLabel.Text = "Thank you!!!";
                }
            }

        }

        protected void CommentSubmitButtonClicked(object sender, EventArgs e) {
            string finalUsername = usernameBackup;
            if (commentBoxId.Text.Length > 0)
            {
                string commentSubmitted = commentBoxId.Text;
                string connectionString;
                connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
                using (SqlConnection connection = new SqlConnection(connectionString)) {
                    using (SqlCommand command = connection.CreateCommand()) {
                        command.CommandText = "UPDATE dbo.USERS set Comment_Box=@Comment_Box WHERE USERNAME =@USERNAME";
                        command.Parameters.AddWithValue("@USERNAME", finalUsername);
                        command.Parameters.AddWithValue("@Comment_Box", commentSubmitted);
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
                commentBoxLabel.Text = "Thank you for your comments";
                commentBoxId.Text = "";
            }
            else
            {
                commentBoxLabel.Text = "Please provide your comments";
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