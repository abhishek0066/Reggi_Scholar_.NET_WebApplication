using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ReggieScholar
{
    public partial class Z_FileUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string path = Server.MapPath("~/Upload/");
                foreach(HttpPostedFile file in FileUpload1.PostedFiles)
                {
                    try
                    {
                        file.SaveAs(Path.Combine(path, file.FileName));
                        outputLabel.Text += "Filename: " + file.FileName + "<br/>FileContentLength: " + file.ContentLength +
                                            "<br/>FileHashCode : " + file.GetHashCode() + "<br/>FileGetType : " + file.GetType();
                    }
                    catch (Exception exp)
                    {
                        outputLabel.Text = "Error occured: " + exp.Message;
                        break;
                        //throw;
                    }
                }
            }
        }
    }
}