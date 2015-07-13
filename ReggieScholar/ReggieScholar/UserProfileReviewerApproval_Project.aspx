<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfileReviewerApproval_Project.aspx.cs" Inherits="ReggieScholar.UserProfileReviewerApproval_Project" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap/customBootstrapJS/jquery-latest.js"></script>
    <script src="./bootstrap/js/bootstrap.js"></script>

    <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="./bootstrap/customBootstrapCSS/prettify.css" rel="stylesheet" />
    <link href="./Custom_StyleSheet/StyleSheet1.css" rel="stylesheet" />

    <title>Search User Profile</title>
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
        
        <div class="row"><%--outer wizard body starts--%>
                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
                
                <div id="header" class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
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
                                        <asp:HyperLink NavigateUrl="UserProfile.aspx" ID="userProfileHomeID" runat="server"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><b> Home</b><span class="sr-only"></span></asp:HyperLink>

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
                    </nav><%--navbar ends--%>
                </div>

                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
        </div><%--outer wizard body ends--%>


        <div class="row"><%--content below header starts--%>
            <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
            <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12"><%--body content starts--%>
                <div class="page-header">
                       <%--header div begins--%>
                        <h2 class="googleFont"><asp:Label ID="userHeaderNameID" runat="server" Text="User"></asp:Label>'s Project Page</h2>
                    </div><%--header div ends--%>
                <div id="rootwizard" class="tabbable tabs-left">
                        <%--wizard div starts--%>
                    <ul class="nav nav-tabs">
                            <li><a href="#tab1" data-toggle="tab"><b>Profile Section</b></a></li>
                            <li><a href="#tab2" data-toggle="tab"><b>Project Section</b></a></li>
                    </ul>

                    <div class="tab-content">
                            <%--wizard tab content starts--%>
                         <div class="tab-pane active" id="tab1"><%--tab 1 content starts--%>
                             <div class="row">
                                 <div class="col-md-10 col-lg-10">
                                     <center><div id="userPic" class="centerImageUserProfile" runat="server"></div></center>
                                 </div>
                                 <div class="col-md-2 col-lg-2"></div>
                             </div>
                             <div class="row">
                                 <div class="col-md-3 col-lg-3"></div>
                                 <div class="col-md-4 col-lg-4">
                                     <center>
                                         <div class="panel panel-default panelaccount">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>    <asp:Label ID="profileNameID" runat="server" Text="Profile Name"></asp:Label>
                                            </div>
                                        </div>
                                     </center>
                                 </div>
                                 <div class="col-md-5 col-lg-5"></div>
                             </div>

                             <div class="row">
                                 <div class="col-md-1 col-lg-1"></div>
                                 <div class="col-md-8 col-lg-8">
                                    
                                            <div class="panel panel-default" id="changePanel2">
                                                <div class="panel-heading">
                                                    <center><b>User Information</b></center>
                                                </div>
                                                <table class="table table-hover">

                                                    <tbody>
                                                        <tr>
                                                            <td><b>Course Number</b></td>
                                                            <td>
                                                                <asp:Label ID="courseNumberID" runat="server" Text="Course Number"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>College Dept</b></td>
                                                            <td>
                                                                <asp:Label ID="departmentID" runat="server" Text="Department"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Semester Completed</b></td>
                                                            <td>
                                                                <asp:Label ID="semesterCompletedID" runat="server" Text="Semester Completed"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Email Address</b></td>
                                                            <td>
                                                                <asp:Label ID="userEmailID" runat="server" Text="Email of User"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>

                                            
                                        
                                 </div>
                                 <div class="col-md-3 col-lg-3"></div>
                             </div>
                             
                             
                             </div><%--tab 1 content ends--%>

                        <div class="tab-pane" id="tab2"><%--tab 2 content starts--%>
                             <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                
                                                <b>Project Name:  </b><asp:Label ID="researchNameLabel" runat="server" Text="Put the topic here"></asp:Label>

                                            </div>
                                            <div class="panel-body">
                                                <div class="well">
                                                    <b>
                                                        <p>Abstract</p>
                                                    </b>
                                                    <br>
                                                        <asp:Label ID="abstractID" runat="server" Text="Abstract label"></asp:Label>
                                                </div>
                                                <b>
                                                        <p>Project Attachments</p>
                                                </b>
                                                <ul class="list-group">

                                                        <li class="list-group-item">Project Live Link:
                                                            <asp:HyperLink ID="projectLiveLinkID" NavigateUrl="https://www.google.com/" Text="https://www.google.com/" runat="server">
                                                                
                                                            </asp:HyperLink>
                                                            <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span>
                                                        </li>
                                                        <li class="list-group-item">Project Video Link:
                                                            <asp:HyperLink ID="projectVideoLinkID" NavigateUrl="https://www.google.com/" Text="https://www.google.com/" runat="server">
                                                                
                                                            </asp:HyperLink>
                                                            <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span>

                                                        </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                                <div class="panel-heading"><b>Project/ Thesis Attachments</b></div>
                                                <div class="panel-body">
                                                    <ul class="list-group">

                                                        <li class="list-group-item">Project PDF: <asp:HyperLink ID="pdfLink" Text="Click Here " runat="server"></asp:HyperLink><span class="glyphicon glyphicon-download" aria-hidden="true"></span></li>
                                                        <li class="list-group-item">Project Zip File: <asp:HyperLink ID="zipLink" Text="Click Here " runat="server"></asp:HyperLink><span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                                                        </li>
                                                    </ul>

                                                </div>

                                        </div>

                                        <div class="panel panel-default">
                                                <div class="panel-heading"><b>Project Committee</b></div>
                                                <div class="panel-body">
                                                    <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <td><b>Designation</b></td>
                                                                <td><b>Name</b></td>
                                                                <td><b>Email</b></td>

                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Committee Chair</td>
                                                                <td>
                                                                    <asp:Label ID="committeeChairNameID" runat="server" Text="committeeChairName"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="committeeChairEmailID" runat="server" Text="committeChairEMail"></asp:Label>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Committe Member</td>
                                                                <td>
                                                                    <asp:Label ID="committeeMemberNameID" runat="server" Text="committeeMemberName"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="committeeMemberEmailID" runat="server" Text="committeeMemberEmail"></asp:Label>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Graduate Advisor</td>
                                                                <td>
                                                                    <asp:Label ID="graduateAdvisorNameID" runat="server" Text="graduateAdvisorName"></asp:Label></td>
                                                                <td>
                                                                    <asp:Label ID="graduateAdvisorEmailID" runat="server" Text="graduateAdvisorEmail"></asp:Label>
                                                                </td>


                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading"><b>Presentation Information</b></div>
                                            <div class="panel-body">
                                                <div class="well" id="welldiv">
                                                        <p><b>Presentation Date: <asp:Label ID="presentationDateID" runat="server" Text="Label"></asp:Label></b></p>
                                                    </div>
                                            </div>
                                        </div>
                                        
                                        <div class="panel panel-default">
                                            <div class="panel-heading"><b>Review Section</b></div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-xs-2 col-sm-2 col-md-3 col-lg-3">
                                                        <div class="well" id="likeUnlikeId">
                                                        <center><table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <asp:LinkButton class="btn btn-default" 
ID="approveButtonID" OnClick="approve_OnClick" Width="64%" runat="server">
                                                                            <span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> <b>ACCEPT</b></asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <%--<asp:Button ID="dislikeButtonID" runat="server" Text="DISLIKE" />--%>
                                                                        <asp:LinkButton class="btn btn-default" 
ID="declineButtonID" OnClick="decline_OnClick" Width="64%" runat="server">
                                                                            
                                                                            <span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> <b>REJECT</b>
                                                                        </asp:LinkButton>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                            </table></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-6 col-sm-6 col-md-9 col-lg-9">
                                                        <table class="table">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <b>Comment Box:</b>
                                                                        <asp:TextBox ID="commentBoxId" class="form-control" TextMode="multiline" Width="100%" Columns="40" Rows="5" runat="server"/>
                                                        
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="submitCommentButtonID" class="form-control" runat="server" Text="Submit" />
                                                                    </td>
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
                        </div><%--tab 2 content ends--%>



                    </div><%--wizard tab content ends--%>
                </div><%--wizard div ends--%>

            </div><%--body content ends--%>    
        </div><%--content below header ends--%>
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
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    <script src="./bootstrap/customBootstrapJS/wizard.js"></script>
    <script src="./bootstrap/customBootstrapJS/prettify.js"></script>

    <script>
        $(document).ready(function () {
            $('#rootwizard').bootstrapWizard({ 'tabClass': 'nav nav-tabs' });
            window.prettyPrint && prettyPrint()
        });
    </script>
</body>
</html>
