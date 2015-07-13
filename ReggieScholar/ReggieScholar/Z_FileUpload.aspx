<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Z_FileUpload.aspx.cs" Inherits="ReggieScholar.Z_FileUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:FileUpload ID="FileUpload1" runat="server"  /><br/>
            <asp:Button ID="uploadButton" runat="server" Text="Submit" OnClick="uploadButton_Click"/><br/>
            <asp:Label runat="server" ID="outputLabel"></asp:Label>
            
            <a href="Upload/CiscoWebEx.txt">CiscoWebExFile</a>
            

        </div>
    </form>
</body>
</html>
