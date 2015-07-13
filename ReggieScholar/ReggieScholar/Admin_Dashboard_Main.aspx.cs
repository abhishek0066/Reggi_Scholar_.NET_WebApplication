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

using System.Data.SqlClient;
using System.Net.Mail;
using System.Net.Mime;
using System.Web.UI.DataVisualization.Charting;

namespace ReggieScholar
{
    public partial class Admin_Dashboard_Main : System.Web.UI.Page
    {
        int countObtained;
        DateTime dateObtained;
        protected void Page_Load(object sender, EventArgs e)
        {
            //GetChartData(countObtained, dateObtained);
            //string connectionString = "Data Source=itksqlexp8;Initial Catalog=dbo;"
            //                          + "Integrated Security=true";

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
                    command.CommandText = "SELECT top 5 COUNT(*), Last_Login, ROW_NUMBER() OVER (ORDER BY Last_Login DESC ) RowNumber FROM LOGIN GROUP BY Last_Login";
                    try
                    {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            countObtained = reader.GetInt32(0);
                            dateObtained = reader.GetDateTime(1);
                            GetChartData(countObtained, dateObtained);

                        }
                    }
                    catch (Exception ex)
                    {


                        Console.WriteLine(ex.Message);
                    }

                }
            }

        }
        private void GetChartData(int countObtained1, DateTime dateObtained1)
        {
            System.Web.UI.DataVisualization.Charting.Series series = Chart2.Series["Series1"];
            series.Points.AddXY(dateObtained1, countObtained1);
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