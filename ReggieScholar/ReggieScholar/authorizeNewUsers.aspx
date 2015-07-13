<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="authorizeNewUsers.aspx.cs" Inherits="ReggieScholar.authorizeNewUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap/customBootstrapJS/jquery-latest.js"></script>
    <script src="./bootstrap/js/bootstrap.js"></script>

    <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="./bootstrap/customBootstrapCSS/prettify.css" rel="stylesheet" />
    <link href="./Custom_StyleSheet/StyleSheet1.css" rel="stylesheet" />
    <title>Admin Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container container-fluid">
        <div class="row" id="headerImage"><%--image div starts--%>
            <div class="col-md-3 col-lg-3"></div>
            <div class="col-md-6 col-lg-6">
                    <img src="images/logo.png" />
             </div>
             <div class="col-md-3 col-lg-3"></div>
        </div><%--image div ends--%>

        <div class="row">
                <%--outer wizard body starts--%>
                <div class="col-md-1"></div>

                <div id="header" class="col-md-12">
                    <%--"nav nav-tabs nav-justified"--%>
                    <nav class="navbar navbar-default">
                        <div class="container-fluid">
                            <%--container1 begins--%>
                            <div class="navbar-header">
                                <%--header begins--%>
                            </div>
                            <%--header ends--%>

                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <%--collapse header content begins--%>
                                <ul class="nav nav-tabs nav-justified">
                                    <%--<ul class="nav navbar-nav">--%>
                                    <li class="active">
                                        <asp:HyperLink NavigateUrl="Admin_Dashboard_Main.aspx" ID="userProfileHomeID" runat="server"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><b> Home</b><span class="sr-only"></span></asp:HyperLink>

                                    </li>
                                    <li>
                                        <asp:HyperLink NavigateUrl="C_Search.aspx" ID="userProfileSearchID" runat="server"><span class="glyphicon glyphicon-search" aria-hidden="true"></span><b> Search</b><span class="sr-only"></span></asp:HyperLink>


                                    </li>
                                    <li>
                                        <asp:HyperLink NavigateUrl="ProjectShowcase.aspx" ID="projectShowcaseID" runat="server"><span class="glyphicon glyphicon-book" aria-hidden="true"></span><b> Showcase</b><span class="sr-only"></span></asp:HyperLink>


                                    </li>
                                    <li>
                                        <asp:HyperLink NavigateUrl="AboutUsPage.aspx" ID="aboutUsID" runat="server"><span class="glyphicon glyphicon-user" aria-hidden="true"></span><b> About Us</b><span class="sr-only"></span></asp:HyperLink>

                                    </li>
                                    <li>
                                        <asp:LinkButton ID="logoutout" OnClick="logoutOut_OnClick" runat="server"><span class="glyphicon glyphicon-off" aria-hidden="true"></span><b> Logout</b><span class="sr-only"></span></asp:LinkButton>

                                    </li>
                                </ul>


                            </div>
                            <%--collapse header ends--%>
                        </div>
                        <%--container1 ends --%>
                    </nav>
                    <%--navbar ends--%>
                </div>

                <div class="col-md-1"></div>
            </div>
            <%--outer wizard body ends--%>

            <div class="row">
                <%--content below header starts--%>
               
                <div class="col-md-12">
                    <%--body content starts--%>

                    <div class="panel panel-default" id="changePanel">
                        <div class="panel-heading">Approved User Details</div>
                        <div class="panel-body">
                           <div class="row">
                               <div class="col-md-3">
                                   <div class="well">
                                       <div id="userPic" runat="server"></div>
                                   </div>
                               </div>
                               <div class="col-md-9">
                                   <div class="panel panel-default">
                                       
                                      
                                        
                                       <div class="panel-body">
                                           <table class="table">
                                               <tbody>
                                                   <tr>
                                                       <td></td>
                                                       <td></td>
                                                   </tr>
                                                   <tr>
                                                       <td></td>
                                                       <td></td>
                                                   </tr>
                                                   <tr>
                                                       <td><b>Username</b></td>
                                                       <td>
                                                           <asp:Label ID="userNameID" runat="server" Text="UserName"></asp:Label></td>
                                                   </tr>
                                                   <tr>
                                                       <td></td>
                                                       <td></td>
                                                   </tr>
                                                   <tr>
                                                       <td><b>First Name</b></td>
                                                       <td>
                                                           <asp:Label ID="firstNameID" runat="server" Text="FirstName"></asp:Label></td>
                                                   </tr>
                                                   <tr>
                                                       <td></td>
                                                       <td></td>
                                                   </tr>
                                                   <tr>
                                                       <td><b>Last Name</b></td>
                                                       <td>
                                                           <asp:Label ID="lastNameID" runat="server" Text="LastName"></asp:Label></td>
                                                   </tr>
                                                   <tr>
                                                       <td></td>
                                                       <td></td>
                                                   </tr>
                                                   
                                                   
                                               </tbody>
                                           </table>
                                       </div>
                                          
                                   </div>
                               </div>
                           </div> 
                        </div>
                    </div>

                </div>
                
            </div><%--content below ends--%>
    </div>
         <div class="row">
            <%-- footer --%>
            <div class="col-md-6 col-md-offset-3">
                <br />
                <div class="footerMsg">
                    <p id="footer">2015 &copy; Thanesh Rajandran, Abhishek Varghese &amp; Frank Wylie</p>
                </div>
            </div>
        </div><%-- end row --%>
    </form>
</body>
</html>
