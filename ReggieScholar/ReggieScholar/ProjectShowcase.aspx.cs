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
    public partial class ProjectShowcase : System.Web.UI.Page
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



            int i = 0;
            string[] projectName = new string[3];
            string[] abstractRetrived = new string[3];
            int[] numberOfViews = new int[3];
            int[] numOfDownloads = new int[3];
            int[] numOfLikes = new int[3];
            string[] username = new string[3];
            string connectionString;
            connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText = "SELECT  username, Num_Dloads, Project_Name, Abstract, Like_Count, Num_Views "+ 
                    "FROM    (SELECT username, Num_Dloads, Project_Name, Abstract, Like_Count, Num_Views, "+
                    "ROW_NUMBER() OVER (ORDER BY Num_Views DESC ) AS 'RowNumber' "+
                    "FROM    Files "+
                    ") AS A "+
                    "WHERE   RowNumber <=3";
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        if (reader.HasRows) {
                            while (reader.Read()) {
                                username[i] = reader.GetString(0);
                                numOfDownloads[i] = reader.GetInt32(1);
                                projectName[i] = reader.GetString(2);
                                abstractRetrived[i] = reader.GetString(3);
                                numOfLikes[i] = reader.GetInt32(4);
                                numberOfViews[i] = reader.GetInt32(5);
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

            projectTopic1.Text = projectName[0];
            projectTopic1Abstract.Text = abstractRetrived[0];
            project1NumberofViews.Text = numberOfViews[0].ToString();
            project1NumberofDownloads.Text = numOfDownloads[0].ToString();
            project1NumberofLikes.Text = numOfLikes[0].ToString();
            projectTopic2.Text = projectName[1];
            projectTopic2Abstract.Text = abstractRetrived[1];
            project2NumberofViews.Text = numberOfViews[1].ToString();
            project2NumberofDownloads.Text = numOfDownloads[1].ToString();
            project2NumberofLikes.Text = numOfLikes[1].ToString();
            projectTopic3.Text = projectName[2];
            projectTopic3Abstract.Text = abstractRetrived[2];
            project3NumberofViews.Text = numberOfViews[2].ToString();
            project3NumberofDownloads.Text = numOfDownloads[2].ToString();
            project3NumberofLikes.Text = numOfLikes[2].ToString();
            projectTopic2Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username="+username[1];
            projectTopic1Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username=" + username[0];
            projectTopic3Link.NavigateUrl = "SearchProfile_ReviewerProject.aspx?username=" + username[2];
        }

        protected void logoutOut_OnClick(object sender, EventArgs e) {
            if (Request.Cookies["user"] != null) {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("A_Login.aspx");
        }
    }
}