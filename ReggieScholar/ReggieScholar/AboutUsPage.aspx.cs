using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReggieScholar
{
    public partial class AboutUsPage : System.Web.UI.Page
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