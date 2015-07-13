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

namespace ReggieScholar
{
    public partial class authorizeNewUsers : System.Web.UI.Page
    {
        string user_name="";
        string firstName="";
        string lastName="";
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









            string userNameToSet = Request.QueryString["u.username"];

            // string connectionString = "Data Source=itksqlexp8;Initial Catalog=dbo;"
            //                           + "Integrated Security=true";

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "Update LOGIN set Approve_Status='y' where username = @username";

                    command.Parameters.AddWithValue("@username", userNameToSet);
                    try {
                        connection.Open();
                        command.ExecuteNonQuery();
                        PopulateUpdatedData(userNameToSet);
                        connection.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    
               
                }
            }
        }

        protected void PopulateUpdatedData(string username) {
            
            // string connectionString = "Data Source=itksqlexp8;Initial Catalog=dbo;"
            //                           + "Integrated Security=true";


            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "SELECT * FROM USERS WHERE USERNAME=  @username";
                    command.Parameters.AddWithValue("@username", username);
                    try {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read()) {
                            user_name = reader[0].ToString();
                            firstName = reader[1].ToString();
                            lastName = reader[2].ToString();

                        }
                        userNameID.Text = user_name;
                        firstNameID.Text = firstName;
                        lastNameID.Text = lastName;

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }


            string picFile = "";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT Pic_File FROM FILES WHERE USERNAME=  @username";
                    command.Parameters.AddWithValue("@username", username);
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            picFile = reader[0].ToString();
                        }
                        userNameID.Text = user_name;
                        firstNameID.Text = firstName;
                        lastNameID.Text = lastName;

                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }

            userPic.InnerHtml = "<img class='userProfileImageBorder' src='UploadImage/" + picFile + "'></img>";
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