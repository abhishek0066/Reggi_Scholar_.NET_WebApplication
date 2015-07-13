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
    public partial class ReviewerProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usernameCookie = "";

            if (Request.Cookies["user"] != null)
            { //If cookie exist, get username
                
                HttpCookie getUserCookie = Request.Cookies["user"];

                usernameCookie = getUserCookie.Values["username"];
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


            string firstName = "";
            string lastName = "";
            string finalFirstName = "";
            string finalLastName = "";
            string finalFullName = "";
            string emailAddress = "";
            string finalEmailAddress = "";
            string collegeDepartment = "";
            string finalCollegeDepartment = "";
            string username = usernameCookie;
            string picFileName = "";

            //username = Request.QueryString["u.username"];



            string connectionString;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) { 
                    command.CommandText=
                        "SELECT "+
                        "First_Name, "+
                        "Last_Name, "+
                        "College_Dept, "+
                        "Email, " +
                        "Comment_Box " +
                        "FROM "+
                        "dbo.USERS "+
                        "WHERE username = @usernameDB";
                    command.Parameters.AddWithValue("@usernameDB", username);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows) {
                            while (reader.Read()) {
                                firstName = reader.GetString(0);
                                lastName = reader.GetString(1);
                                collegeDepartment = reader.GetString(2);
                                emailAddress = reader.GetString(3);
                                picFileName = reader.GetString(4);

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

            finalFirstName = titleCase.ToTitleCase(firstName.ToLower());
            finalLastName = titleCase.ToTitleCase(lastName);
            finalFullName = finalFirstName + " " + finalLastName;
            finalEmailAddress = titleCase.ToLower(emailAddress);
            reviewerUserID.Text = finalFirstName + " " + finalLastName;
            profileNameID.Text = finalFullName;
            departmentID.Text = collegeDepartment;
            useremailID.Text = finalEmailAddress;
            
            profPic.InnerHtml = "<img class='userProfileImageBorder' src='UploadImage/" + picFileName + "'></img>"; ;

            SqlDataSource1.SelectCommand="select username, Project_ID , Project_Name , Course_ID from FILES "+ 
                                            "WHERE "+ 
                                            "Comm_Name in "+
                                            "(select First_Name+' '+Last_Name from USERS WHERE username='"+username+"') OR "+
                                            "Chair_Name in "+
                                            "(select First_Name+' '+Last_Name from USERS WHERE username='"+username+"')";
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