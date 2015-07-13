using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReggieScholar
{
    public partial class A_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack) { //Load first time
                //If cookie exist, get username and password, populate input field
                if (Request.Cookies["user"] != null) {
                    HttpCookie getUserCookie = Request.Cookies["user"];
                    usernameInput.Value = getUserCookie.Values["username"];
                    string userPasswordFromCookie = getUserCookie.Values["userpassword"];
                    passwordInput.Attributes.Add("value", userPasswordFromCookie);
                }   
            }
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            string usernameEntered = Request.Form["usernameInput"];
            string passwordEntered = Request.Form["passwordInput"];
            string passwordHashed = GetSHA1HashData(passwordEntered);   //Get SHA1 hash of user-entered password

            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;

            string usernameDB = "";
            string passwordDB;
            string user_typeDB = "";
            int loginCountDB = 0;
            DateTime lastLoginDB = DateTime.Now;
            string approveStatusDB = "n";

            using (SqlConnection connection = new SqlConnection(connectionString)) {
                using (SqlCommand command = connection.CreateCommand()) {
                    command.CommandText =
                        "SELECT username, userpassword, user_type, login_count, last_login, approve_status " +
                        "FROM dbo.LOGIN " +
                        "WHERE username = @inputUsername and userpassword = @inputPassword";

                    command.Parameters.AddWithValue("@inputUsername", usernameEntered);
                    command.Parameters.AddWithValue("@inputPassword", passwordHashed);

                    try {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows) {
                            while (reader.Read()) {
                                usernameDB = reader.GetString(0);
                                passwordDB = reader.GetString(1);
                                user_typeDB = reader.GetString(2);
                                loginCountDB = reader.GetInt32(3);
                                lastLoginDB = reader.GetDateTime(4);
                                approveStatusDB = reader.GetString(5);
                            }
                        }
                        else
                        {
                            //if invalid username or password, display access denied page (using jQuery)
                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>showAccessDeniedPanel();</script>", false);
                            reader.Close();
                            return;
                        }
                        reader.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }//end sqlCommand
            }//end sqlConnection

            if (approveStatusDB == "n") //Check if user account has been approved by admin
            {
                //display access denied page (using jQuery)
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "deniedPanel", "<script type='text/javascript'>showAccessDeniedPanel();</script>", false);
                return;
            }
            
            //Save user info to cookie
            HttpCookie createUserCookie = new HttpCookie("user");
            createUserCookie.Values["username"] = usernameEntered;
            createUserCookie.Values["userpassword"] = passwordEntered;
            createUserCookie.Values["usertype"] = user_typeDB;
            createUserCookie.Values["logincount"] = loginCountDB.ToString();
            createUserCookie.Values["lastlogin"] = lastLoginDB.ToString();
            
            createUserCookie.Expires = DateTime.Now.AddDays(14);
            Response.Cookies.Add(createUserCookie);
            
            /////START -Increment login count and update last login to current date
            string updateDateQuery =
                "UPDATE " +
                "dbo.LOGIN " +
                "SET " +
                "login_count = " + (loginCountDB + 1) + ", " +
                "last_login = CURRENT_TIMESTAMP " +
                "WHERE username = '" + usernameDB + "'";

            using (SqlConnection connection = new SqlConnection(connectionString)) {
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

            if (user_typeDB == "s") //Student
            {
                Response.Redirect("UserProfile.aspx");    
            }
            else if (user_typeDB == "r") //Reviewer
            {
                Response.Redirect("ReviewerProfile.aspx");
            }
            else if (user_typeDB == "r" && (!String.IsNullOrEmpty(Request.QueryString["username"]))) //Reviewer via email
            {
                Response.Redirect("UserProfileReviewerApproval_Project.aspx?username=" + Request.QueryString["username"]);
            }
            else if (user_typeDB == "a") //Admin
            {
                Response.Redirect("Admin_Dashboard_Main.aspx");
            }
        }//end login button
        


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
            for (int i = 0; i < hashData.Length; i++) {
                returnValue.Append(hashData[i].ToString());
            }

            // return hexadecimal string
            return returnValue.ToString();
        }

        //Compare hashed values to determine if there is a match
        //REF: http://www.codeproject.com/Articles/38951/How-To-Hash-Data-Using-MD-and-SHA
        private bool ValidateSHA1HashData(string userInputPassword, string storedHashDate) {
            //hash input text and save it string variable
            string getHashInputData = GetSHA1HashData(userInputPassword);

            if (string.Compare(getHashInputData, storedHashDate) == 0) {
                return true;
            }

            return false;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("B_Register.aspx");
        }
    }
}