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
    public partial class UserProfileReviewerApproval_Project : System.Web.UI.Page
    {
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
            string finalUsername = "";
            string finalFirstName = "";
            string finalLastName = "";
            string finalFullName = "";
            string finalEmail = "";
            string finalPicFile = "";
            string finalLiveLink = "";
            string finalVideoLink = "";
            string finalZipFile = "";
            string finalPdfFile = "";
            string courseIDNumber = "";
            string collegeDept = "";
            string firstName = "";
            string lastName = "";
            string emailAddress = "";
            string imageFile = "";
            string researchName = "";
            string abstractContent = "";
            string liveLink = "";
            string videoLink = "";
            string pdfFile = "";
            string zipFile = "";
            string userImage = "";
            string committeeChairName = "";
            string committeeMemberName = "";
            string advisorName = "";
            string committeeChairEmail = "";
            string committeeMemberEmail = "";
            string advisorEmail = "";
            string semesterCompleted = "";
            string presentationDate = "";
            string finalCommitteeMemberName = "";
            string finalCommitteeChairName = "";
            string finalAdvisorName = "";
            
            
            if (!String.IsNullOrEmpty(Request.QueryString["username"]))
            {
                userNameToSet = Request.QueryString["username"];
                finalUsername = userNameToSet;
            }

            if (!String.IsNullOrEmpty(Request.QueryString["u.username"]))
            {
                userNameToSet2 = Request.QueryString["u.username"];
                finalUsername = userNameToSet2;
            }

            
            //try
            //{
            //    if (userNameToSet.Length > 1)
            //    {
            //        finalUsername = userNameToSet;
            //    }
            //    if (userNameToSet2.Length > 1)
            //    {
            //        finalUsername = userNameToSet2;
            //    }
            //}
            ////Fit the other condition here
            //catch (Exception ex)
            //{
            //    Console.WriteLine(ex.Message);
            //}


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
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        "SELECT " +
                        "First_Name, " +
                        "Last_Name, " +
                        "Email, " +
                        "Semester_Completion, " +
                        "College_Dept " +
                        "FROM " +
                        "dbo.USERS " +
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
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT " +
                        "Course_ID, " +
                        "Pic_File, " +
                        "Project_Name, " +
                        " Abstract, " +
                        "Live_Link, " +
                        "Video_Link, " +
                        "Proj_Zip_File, " +
                        "Proj_Pdf_File, " +
                        "Chair_Name, " +
                        "Chair_Email, " +
                        "Comm_Name, " +
                        "Comm_Email, " +
                        "Gadvisor_Name, " +
                        "Gadvisor_Email, " +
                        "Pres_Date " +
                        "FROM " +
                        "dbo.FILES " +
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
                    finally
                    {
                        connection.Close();
                    }
                }
            }

            //Define object to make string proper case
            TextInfo titleCase = new CultureInfo("en-US", false).TextInfo;

            finalAdvisorName = titleCase.ToTitleCase(advisorName);
            finalCommitteeChairName = titleCase.ToTitleCase(committeeChairName);
            finalCommitteeMemberName = titleCase.ToTitleCase(committeeMemberName); 
            finalFirstName = titleCase.ToTitleCase(firstName.ToLower());
            finalLastName = titleCase.ToTitleCase(lastName);
            finalFullName = finalFirstName + " " + finalLastName;
            finalEmail = titleCase.ToLower(emailAddress);
            finalPicFile = imageFile;
            finalLiveLink = liveLink;
            finalVideoLink = videoLink;
            finalZipFile = zipFile;
            finalPdfFile = pdfFile;

            pdfLink.NavigateUrl = "UploadPDF\\" + finalPdfFile;
            zipLink.NavigateUrl = "UploadZIP\\" + finalZipFile; 

            userHeaderNameID.Text = finalFullName;
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
            committeeChairNameID.Text = "Dr. "+finalCommitteeChairName;
            committeeChairEmailID.Text = committeeChairEmail;
            committeeMemberNameID.Text ="Dr. "+finalCommitteeMemberName;
            committeeMemberEmailID.Text = committeeMemberEmail;
            graduateAdvisorNameID.Text = finalAdvisorName;
            graduateAdvisorEmailID.Text = advisorEmail;
            presentationDateID.Text = presentationDate;

            userPic.InnerHtml = "<img class='userProfileImageBorder' src='UploadImage/" + finalPicFile + "'></img>";
        }



        protected void approve_OnClick(object sender, EventArgs e)
        {
            string connectionString2 =
ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string username = "";
            if (!String.IsNullOrEmpty(Request.QueryString["username"]))
            {
                username = Request.QueryString["username"];
            }

            int UserProgress_BarDB = 5;
            
            using (SqlConnection connection = new SqlConnection(connectionString2))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        "SELECT " +
                            "u.Progress_Bar " +
                        "FROM " +
                        "dbo.USERS u " +
                        "WHERE u.username = @usernameDB";

                    command.Parameters.AddWithValue("@usernameDB", username);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                UserProgress_BarDB = reader.GetInt32(0);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                } //End SqlCommand
            } //End SqlConnection
            

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string updateDateQuery =
                "UPDATE " +
                "dbo.USERS " +
                "SET " +
                "Progress_Bar = " + (UserProgress_BarDB + 1) + ", " +
                "Comment_Box = '" + commentBoxId.Text + "'" +
                "WHERE username = '" + username + "'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand updateDateCommand = new SqlCommand(updateDateQuery, connection);
                try
                {
                    connection.Open();
                    updateDateCommand.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("UpdateDateQuery Error " + ex.Message);
                }
            }
            /////END -Increment login count and update last login to current date

            Response.Redirect("A_Login.aspx");
        }


        protected void logoutOut_OnClick(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("A_Login.aspx");
        }


        protected void decline_OnClick(object sender, EventArgs e)
        {
            string connectionString2 =
ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string username = "";
            if (!String.IsNullOrEmpty(Request.QueryString["username"]))
            {
                username = Request.QueryString["username"];
            }

            int UserProgress_BarDB = 0;

            using (SqlConnection connection = new SqlConnection(connectionString2))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText =
                        "SELECT " +
                            "u.Progress_Bar " +
                        "FROM " +
                        "dbo.USERS u " +
                        "WHERE u.username = @usernameDB";

                    command.Parameters.AddWithValue("@usernameDB", username);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                UserProgress_BarDB = reader.GetInt32(0);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                } //End SqlCommand
            } //End SqlConnection
            
            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string updateDateQuery =
                "UPDATE " +
                "dbo.USERS " +
                "SET " +
                "Progress_Bar = -1, " +
                "Comment_Box = '" + commentBoxId.Text + "'" +
                "WHERE username = '" + username + "'";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand updateDateCommand = new SqlCommand(updateDateQuery, connection);
                try
                {
                    connection.Open();
                    updateDateCommand.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    Console.WriteLine("UpdateDateQuery Error " + ex.Message);
                }
            }
            /////END -Increment login count and update last login to current date

            Response.Redirect("A_Login.aspx");
        }
    }
}