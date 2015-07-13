using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Threading;

namespace ReggieScholar {
    public partial class C_Search : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {

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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetKeywords(string pre) {

            List<string> allKeywordsUnique = new List<string>();
            List<string> allKeywords = new List<string>();
            List<string> keywordsOne = new List<string>();
            List<string> keywordsTwo = new List<string>();
            List<string> keywordsThree = new List<string>();

            using (ReggieRepoEntities dc = new ReggieRepoEntities()) {
                keywordsOne = (from f in dc.FILES
                    where f.Keyword1.Contains(pre)
                    select f.Keyword1).ToList();
            }

            using (ReggieRepoEntities dc = new ReggieRepoEntities()) {
                keywordsTwo = (from f in dc.FILES
                               where f.Keyword2.Contains(pre)
                               select f.Keyword2).ToList();
            }

            using (ReggieRepoEntities dc = new ReggieRepoEntities()) {
                keywordsThree = (from f in dc.FILES
                               where f.Keyword3.Contains(pre)
                               select f.Keyword3).ToList();
            }

            allKeywords.AddRange(keywordsOne);
            allKeywords.AddRange(keywordsTwo);
            allKeywords.AddRange(keywordsThree);

            allKeywordsUnique = allKeywords.Distinct().ToList();

            return allKeywordsUnique;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetResearchName(string pre) {
            List<string> researchNameUnique = new List<string>();
            List<string> allResearchName = new List<string>();

            using (ReggieRepoEntities dc = new ReggieRepoEntities()) {
                allResearchName = (from f in dc.FILES
                                   where f.Project_Name.Contains(pre)
                                   select f.Project_Name).ToList();
            }

            researchNameUnique = allResearchName.Distinct().ToList();

            return researchNameUnique;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public static List<string> GetCommitteeName(string pre) {
            List<string> committeeNameUnique = new List<string>();
            List<string> allCommittees = new List<string>();
            List<string> allCommitteeOneName = new List<string>();
            List<string> allCommitteeTwoName = new List<string>();

            using (ReggieRepoEntities dc = new ReggieRepoEntities()) {
                allCommitteeOneName = (from f in dc.FILES
                                       where f.Chair_Name.Contains(pre)
                                       select f.Chair_Name).ToList();

                allCommitteeTwoName = (from f in dc.FILES
                                       where f.Comm_Name.Contains(pre)
                                       select f.Comm_Name).ToList();
            }

            allCommittees.AddRange(allCommitteeOneName);
            allCommittees.AddRange(allCommitteeTwoName);

            committeeNameUnique = allCommittees.Distinct().ToList();

            return committeeNameUnique;
        }

        protected void search_Click(object sender, EventArgs e)
        {
            resultOutput.InnerHtml = ""; //Clean result output from last search

            if (string.IsNullOrEmpty(from.Text)) //If no From Date, enter Default From Date
            {
                from.Text = "01/01/2014";    
            }

            if (string.IsNullOrEmpty(to.Text))  //If no To Date, enter Today's Date
            {
                to.Text = DateTime.Today.ToString("d");    
            }


            string connectionString = ConfigurationManager.ConnectionStrings["ConnectionStringLocalDB"].ConnectionString;
            
            List<string> username = new List<string>();
            List<string> First_Name = new List<string>();
            List<string> Last_Name = new List<string>();
            List<string> Email = new List<string>();
            List<string> Security_Question = new List<string>();
            List<string> Security_Answer = new List<string>();
            List<string> Acct_Reason = new List<string>();
            List<string> Semester_Completion = new List<string>();
            List<DateTime> Account_Date = new List<DateTime>();
            List<int> Progress_Bar = new List<int>();
            List<string> Comment_Box = new List<string>();
            List<string> Comment_Status = new List<string>();
            List<string> Reviewer_Comments = new List<string>();
            List<string> College_Dept = new List<string>();

            List<string> Filesusername = new List<string>();
            List<string> FilesProject_ID = new List<string>();
            List<string> FilesProject_Name = new List<string>();
            List<string> FilesCourse_ID = new List<string>();
            List<string> FilesKeyword1 = new List<string>();
            List<string> FilesKeyword2 = new List<string>();
            List<string> FilesKeyword3 = new List<string>();
            List<string> FilesAbstract = new List<string>();
            List<string> FilesLive_Link = new List<string>();
            List<string> FilesVideo_Link = new List<string>();
            List<string> FilesChair_Name = new List<string>();
            List<string> FilesChair_Email = new List<string>();
            List<string> FilesComm_Name = new List<string>();
            List<string> FilesComm_Email = new List<string>();
            List<string> FilesGadvisor_Name = new List<string>();
            List<string> FilesGadvisor_Email = new List<string>();
            List<DateTime> FilesUpload_Date = new List<DateTime>();
            List<string> FilesReject_Reason = new List<string>();
            List<int> FilesNum_Views = new List<int>();
            List<int> FilesNum_Dloads = new List<int>();
            List<string> FilesPic_File = new List<string>();
            List<string> FilesProj_Pdf_File = new List<string>();
            List<string> FilesProj_Zip_File = new List<string>();
            List<string> FilesPres_Date = new List<string>();
            List<int> FilesDislike_Count = new List<int>();
            List<int> FilesLike_Count = new List<int>();
            List<string> FilesApproval_Status1 = new List<string>();
            List<string> FilesApproval_Status2 = new List<string>();
            List<string> FilesApproval_Status3 = new List<string>();
            List<string> FilesReviewer_Comment1 = new List<string>();
            List<string> FilesReviewer_Comment2 = new List<string>();
            List<string> FilesReviewer_Comment3 = new List<string>();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = connection.CreateCommand())
                {
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
                           "dbo.FILES f JOIN dbo.USERS u ON f.username=u.username " +
                        "WHERE (f.Upload_Date BETWEEN @fromDate AND @toDate) ";         //Filter by date

                    command.Parameters.AddWithValue("@fromDate", from.Text);
                    command.Parameters.AddWithValue("@toDate", to.Text);
                    
                    if (!(string.IsNullOrEmpty(researchNameInput.Text))) //Filter by Research Name
                    {
                        command.CommandText += "AND (f.Project_Name LIKE @researchName) ";
                        command.Parameters.AddWithValue("@researchName", '%' + researchNameInput.Text + '%');
                    }

                    if (!(string.IsNullOrEmpty(keywordInput.Text))) //Filter by Keyword
                    {
                        command.CommandText += "AND (f.Keyword1 LIKE @keywordValue OR f.Keyword2 LIKE @keywordValue OR f.Keyword3 LIKE @keywordValue) ";
                        command.Parameters.AddWithValue("@keywordValue", '%' + keywordInput.Text + '%');
                    }

                    if (!(string.IsNullOrEmpty(committeeInput.Text))) //Filter by Committee
                    {
                        command.CommandText += "AND (f.Chair_Name LIKE @committeeValue OR f.Comm_Name LIKE @committeeValue) ";
                        command.Parameters.AddWithValue("@committeeValue", '%' + committeeInput.Text + '%');
                    }
                    
                    try {
                        connection.Open();
                        SqlDataReader reader = command.ExecuteReader();

                        if (reader.HasRows) {
                            while (reader.Read()) {
                                username.Add(reader.GetString(0));
                                First_Name.Add(reader.GetString(1));
                                Last_Name.Add(reader.GetString(2));
                                Email.Add(reader.GetString(3));
                                Security_Question.Add(reader.GetString(4));
                                Security_Answer.Add(reader.GetString(5));
                                Acct_Reason.Add(reader.GetString(6));
                                Semester_Completion.Add(reader.GetString(7));
                                Account_Date.Add(reader.GetDateTime(8));
                                Progress_Bar.Add(reader.GetInt32(9));
                                Comment_Box.Add(reader.GetString(10));
                                Comment_Status.Add(reader.GetString(11));
                                Reviewer_Comments.Add(reader.GetString(12));
                                College_Dept.Add(reader.GetString(13));

                                Filesusername.Add(reader.GetString(14));
                                FilesProject_ID.Add(reader.GetString(15));
                                FilesProject_Name.Add(reader.GetString(16));
                                FilesCourse_ID.Add(reader.GetString(17));
                                FilesKeyword1.Add(reader.GetString(18));
                                FilesKeyword2.Add(reader.GetString(19));
                                FilesKeyword3.Add(reader.GetString(20));
                                FilesAbstract.Add(reader.GetString(21));
                                FilesLive_Link.Add(reader.GetString(22));
                                FilesVideo_Link.Add(reader.GetString(23));
                                FilesChair_Name.Add(reader.GetString(24));
                                FilesChair_Email.Add(reader.GetString(25));
                                FilesComm_Name.Add(reader.GetString(26));
                                FilesComm_Email.Add(reader.GetString(27));
                                FilesGadvisor_Name.Add(reader.GetString(28));
                                FilesGadvisor_Email.Add(reader.GetString(29));
                                FilesUpload_Date.Add(reader.GetDateTime(30));
                                FilesReject_Reason.Add(reader.GetString(31));
                                FilesNum_Views.Add(reader.GetInt32(32));
                                FilesNum_Dloads.Add(reader.GetInt32(33));
                                FilesPic_File.Add(reader.GetString(34));
                                FilesProj_Pdf_File.Add(reader.GetString(35));
                                FilesProj_Zip_File.Add(reader.GetString(36));
                                FilesPres_Date.Add(reader.GetString(37));
                                FilesDislike_Count.Add(reader.GetInt32(38));
                                FilesLike_Count.Add(reader.GetInt32(39));
                                FilesApproval_Status1.Add(reader.GetString(40));
                                FilesApproval_Status2.Add(reader.GetString(41));
                                FilesApproval_Status3.Add(reader.GetString(42));
                                FilesReviewer_Comment1.Add(reader.GetString(43));
                                FilesReviewer_Comment2.Add(reader.GetString(44));
                                FilesReviewer_Comment3.Add(reader.GetString(45));
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                } //End SqlCommand
            } //End SqlConnection

            CultureInfo cultureInfo = Thread.CurrentThread.CurrentCulture;
            TextInfo textInfo = cultureInfo.TextInfo;

            if (Filesusername.Count > 0) //Only produce table if there is result
            {
                string resultTable =
                "<table class='tg'>" +
                    "<tr>" +
                        "<th class='tg-vn4c resultHeader'>Author</th>" +
                        "<th class='tg-vn4c resultHeader'>Research</th>" +
                        "<th class='tg-vn4c resultHeader'>Views</th>" +
                        "<th class='tg-vn4c resultHeader'>Downloads</th>" +
                    "</tr>";

                string abstractSubstring = "";

                for (int i = 0; i < Filesusername.Count; i++)
                {
                    abstractSubstring = FilesAbstract[i].Substring(0, 200);

                    resultTable +=
                          "<tr>" +
                            "<td class='tg-031e centerName'>" +
                                "<a href='UserProfile.aspx?usernameFromSearch=" + username[i] + "'>" +
                                    "<img class='imageBorder' src='UploadImage/" + FilesPic_File[i] + "'</img><br>" +
                                "</a>"+
                                textInfo.ToTitleCase(First_Name[i]) + " " + textInfo.ToTitleCase(Last_Name[i]) + "</td>" +
                            "<td class='tg-031e'>" +
                                "<b class='researchNameResult'>" +
                                    "<a href='SearchProfile_ReviewerProject.aspx?username=" + username[i] + "'>" + FilesProject_Name[i] + "</a></b><br/>" +
                                abstractSubstring + " ...<br/>" +
                                "<p class='tagsDIV'>"+
                                "<span class='tags'>" + FilesKeyword1[i] + "</span> " +
                                "<span class='tags'>" + FilesKeyword2[i] + "</span> " +
                                "<span class='tags'>" + FilesKeyword3[i] + "</span>" +
                                "</p>" +
                            "</td>" +
                            "<td class='tg-0ord sideResult'>" + FilesNum_Views[i] + "</td>" +
                            "<td class='tg-0ord sideResult'>" + FilesNum_Dloads[i] + "</td>" +
                          "</tr>";
                }//end for loop

                resultTable += "</table>";
                resultOutput.InnerHtml = resultTable;
            }

            resultCount.InnerHtml = "<span id='resultCountColor'>" + Filesusername.Count.ToString() + "</span> Result(s)";


        }//end search-click function

        protected void logoutOut_OnClick(object sender, EventArgs e)
        {
            if (Request.Cookies["user"] != null)
            {
                Response.Cookies["user"].Expires = DateTime.Now.AddDays(-1);
            }

            Response.Redirect("A_Login.aspx");
        }

    }//end C_Search
}
    
