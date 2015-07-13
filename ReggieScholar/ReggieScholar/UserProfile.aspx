<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="ReggieScholar.UserProfile" %>

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
    
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.js"></script>
    <title>User Profile</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container container-fluid">
            <div class="row" id="headerImage"><%--image div starts--%>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
                <div class="col-xs-4 col-sm-4 col-md-6 col-lg-6">
                    <img src="images/logo.png" />
                </div>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3"></div>
            </div><%--image div ends--%>
            <div class="row">
                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
                
                <div id="header" class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                    <%--"nav nav-tabs nav-justified"--%>
                    <nav class="navbar navbar-default" >
                        <div class="container-fluid">
                            <%--container1 begins--%>
                            <div class="navbar-header">
                                <%--header begins--%>
                            </div>
                            <%--header ends--%>
                            <div class="collapse navbar-collapse" >
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
                                       <asp:HyperLink NavigateUrl="ProjectShowcase.aspx" ID="thesisShowcaseID" runat="server"><span class="glyphicon glyphicon-book" aria-hidden="true"></span><b> Showcase</b><span class="sr-only"></span></asp:HyperLink>


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
                </div>
                <div class="col-xs-0 col-sm-0 col-md-1 col-lg-1"></div>
            </div>

            <div class="row">
                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
                <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">


                    <div class="page-header">
                       <%--header div begins--%>
                        <h2 class="googleFont"><asp:Label ID="headerUserNameID" runat="server" Text="User"></asp:Label>'s Profile</h2>
                    </div>
                    <%--header div ends--%>
                    <div id="rootwizard" class="tabbable tabs-left">
                        <%--wizard div starts--%>
                        <ul class="nav nav-tabs">
                            <li><a href="#tab1" data-toggle="tab"><b>Profile Section</b></a></li>
                            <li><a href="#tab3" data-toggle="tab"><b>Submit Details</b></a></li>
                            <li><a href="#tab4" data-toggle="tab"><b>Submit Status</b></a></li>
                            <li><a href="#tab2" data-toggle="tab"><b>Update Information</b></a></li>

                        </ul>
                        <div class="tab-content">
                            <%--wizard tab content starts--%>
                            <div class="tab-pane active" id="tab1">
                                <%--tab 1 content starts--%>
                                <div class="row">
                                    <div class="col-md-3">
                                        <%--tab 1 content part 1 starts--%>
                                        <div id="userPic" class="centerImageUserProfile" runat="server"></div>
                                        <div class="panel panel-default panelaccount">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>    <asp:Label ID="FullNameLabel" runat="server" Text="Profile Name"></asp:Label>
                                            </div>
                                            <div class="panel-body">
                                                <span class="glyphicon glyphicon-time" aria-hidden="true"></span>    <asp:Label ID="LastLoginLabel" runat="server" Text="Last Login Date"></asp:Label>
                                            
                                            </div>
                                        </div>
                                    </div>
                                    <%--tab 1 content part 1 ends--%>

                                    <div class="col-md-7">
                                        <%--tab 1 content part 2 begins--%>

                                        <div class="panel" id="changePanel2">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <center><b>User Information</b></center>
                                                </div>
                                                <table class="table table-hover">

                                                    <tbody>
                                                        <tr>
                                                            <td><b>Course Number</b></td>
                                                            <td>
                                                                <asp:Label ID="CourseNumberLabel" runat="server" Text="Course Number"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>College Dept</b></td>
                                                            <td>
                                                                <asp:Label ID="DepartmentLabel" runat="server" Text="Department"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Semester Completed</b></td>
                                                            <td>
                                                                <asp:Label ID="SemesterCompletedLabel" runat="server" Text="Semester Completed"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Email Address</b></td>
                                                            <td>
                                                                <asp:Label ID="EmailLabel" runat="server" Text="Email of User"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>

                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <center><b>Account Information</b></center>
                                                </div>
                                                <table class="table table-hover">
                                                    <tbody>
                                                        <tr>
                                                            <td><b>Account Creation Date</b></td>
                                                            <td>
                                                                <asp:Label ID="AccountCreatedDateLabel" runat="server" Text="Account Created Date"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Submission Type</b></td>
                                                            <td>
                                                                <asp:Label ID="AccountReasonLabel" runat="server" Text="Account Reason"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>
                                                        <tr>
                                                            <td><b>Account Status</b></td>
                                                            <td>
                                                                <asp:Label ID="AccountApprovedLabel" runat="server" Text="Account Approved"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>

                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <%--tab 1 content part 2 ends--%>
                                </div>

                            </div>
                            <%--tab1 content ends--%>
                            <div class="tab-pane" id="tab2">

                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <%--<td><b>Description</b></td>--%>
                                                        <td colspan="3"><b>User Information</b></td>
                                                        <%--<td></td>--%>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>First Name</td>
                                                        <td>
                                                            <asp:TextBox ID="firstNameId" runat="server" class="form-control boxcolorstyle" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="First Name"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="firstNameValidator" ControlToValidate="firstNameId" runat="server" ErrorMessage="Please provide first name"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Last Name</td>
                                                        <td>
                                                            <asp:TextBox ID="lastNameId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Last Name"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="lastNameValidator" ControlToValidate="lastNameId" runat="server" ErrorMessage="Please provide last name"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Username</td>
                                                        <td>
                                                            <asp:Label ID="userNameId" runat="server" class="form-control" ReadOnly="true" Style="height: 100%;border-width: 3px;" placeholder="User Name"></asp:Label>                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Password</td>
                                                        <td>
                                                            <asp:TextBox ID="passwordId" TextMode="Password" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Password"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="passwordValidator" ControlToValidate="passwordId" runat="server" ErrorMessage="Please provide password"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                                        <%--<td>Confirm Password</td>--%>
                                                       <%-- <td>
                                                            <asp:TextBox ID="confirmPasswordId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Confirm Password"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="confirmPasswordValidator" ControlToValidate="confirmPasswordId" runat="server" ErrorMessage="Please provide confirm password"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <td>Email</td>
                                                        <td>
                                                            <asp:TextBox ID="emailId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Email"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="emailValidator" ControlToValidate="emailId" runat="server" ErrorMessage="Please provide email address"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Security Question</td>
                                                        <td>
                                                            <asp:TextBox ID="securityQuestionID" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Security Question"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="securityQuestionValidator" ControlToValidate="securityQuestionID" runat="server" ErrorMessage="Please provide security question"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Security Answer</td>
                                                        <td>
                                                            <asp:TextBox ID="securityAnswerID" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Security Answer"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="securityAnswerValidator" ControlToValidate="securityAnswerID" runat="server" ErrorMessage="Please provide security answer"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <%--<tr>
                                                        <td>College Department</td>
                                                        <td>
                                                            <asp:TextBox ID="collegeDepartmentId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="College Department"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="collegeDepartmentIdValidator" ControlToValidate="collegeDepartmentId" runat="server" ErrorMessage="Please provide college department"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>--%>
                                                    <%--<tr>
                                                        <td>Course ID</td>
                                                        <td>
                                                            <asp:TextBox ID="courseId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Course ID"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="courseIdValidator" ControlToValidate="courseId" runat="server" ErrorMessage="Please provide course ID"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>--%>
                                                    <tr>
                                                        <%--<td><b>Description</b></td>--%>
                                                        <td><b>Submission Details</b></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>Keyword 1</td>
                                                        <td>
                                                            <asp:TextBox ID="keyword1Id" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Search Keyword 1"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="keyword1Validator" ControlToValidate="keyword1Id" runat="server" ErrorMessage="Please provide keyword 1"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                         <td>Keyword 2</td>
                                                        <td>
                                                            <asp:TextBox ID="keyword2Id" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Search Keyword 2"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="keyword2Validator" ControlToValidate="keyword2Id" runat="server" ErrorMessage="Please provide keyword 2"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Keyword 3</td>
                                                        <td>
                                                            <asp:TextBox ID="keyword3Id" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Search Keyword 3"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="keyword3Validator" ControlToValidate="keyword3Id" runat="server" ErrorMessage="Please provide keyword 3"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Code URL</td>
                                                        <td>
                                                            <asp:TextBox ID="liveLinkId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Live Link"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="liveLinkValidator" ControlToValidate="liveLinkId" runat="server" ErrorMessage="Please provide live link"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>Video URL</td>
                                                        <td>
                                                            <asp:TextBox ID="videoLinkId" runat="server" class="form-control" Style="height: 100%; border-color: #117ED2; border-width: 3px;" placeholder="Video Link"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:RequiredFieldValidator ID="videoLinkValidator" ControlToValidate="videoLinkId" runat="server" ErrorMessage="Please provide video link"></asp:RequiredFieldValidator>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="updateInformationButton" runat="server"
                                                                CssClass="btn btn-default" OnClick="updateInformationButton_Click">
                                                        <i aria-hidden="true" class="glyphicon glyphicon-floppy-disk"></i> Update</asp:LinkButton>
                                                        </td>
                                                        <td>
                                                        <asp:Label ID="updateInformationLabelID" runat="server" Text=""></asp:Label></td>
                                                    </tr>

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab3">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                                            <div class="panel panel-default">
                                                <div class="panel-heading" id="researchNamePanel">
                                                    <span class="researchNameClass">Research Name:  </span><asp:Label id="researchNameLabel" runat="server" Text="Put the topic here"></asp:Label>
                                                </div>
                                                <div class="panel-body">
                                                    <div class="well">
                                                        <b>
                                                            <p>Research Abstract</p>
                                                        </b>
                                                        <br>
                                                        <asp:Label ID="abstractID" runat="server" Text="Abstract label"></asp:Label>
                                                    </div>
                                                    <b>
                                                        <p>Research Attachments</p>
                                                    </b>
                                                    <ul class="list-group">

                                                        <li class="list-group-item">Project Live Link:
                                                            <asp:HyperLink ID="projectLiveLinkID" Text="Click Here" runat="server">
                                                                
                                                            </asp:HyperLink>
                                                            <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span>
                                                        </li>
                                                        <li class="list-group-item">Project Video Link:
                                                            <asp:HyperLink ID="projectVideoLinkID" Text="Click Here" runat="server">
                                                                
                                                            </asp:HyperLink>
                                                            <span class="glyphicon glyphicon-circle-arrow-right" aria-hidden="true"></span>

                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>

                                            <div class="panel panel-default">
                                                <div class="panel-heading"><b>Submission Attachments</b></div>
                                                <div class="panel-body">
                                                    <ul class="list-group">

                                                        <li class="list-group-item">PDF Submission: <asp:HyperLink ID="pdfDownload" Text="Click Here to Download " runat="server"></asp:HyperLink><span class="glyphicon glyphicon-download" aria-hidden="true"></span></li>
                                                        <li class="list-group-item">ZIP Submission: <asp:HyperLink ID="zipDownload" Text="Click Here to Download " runat="server"></asp:HyperLink><span class="glyphicon glyphicon-download" aria-hidden="true"></span>
                                                        </li>
                                                    </ul>

                                                </div>

                                            </div>

                                            <div class="panel panel-default">
                                                <div class="panel-heading"><b>Committee Group</b></div>
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
                                                                <td>Committee Member</td>
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


                                            <div class="form-group">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><b>Presentation Schedule</b></div>
                                                <div class="panel-body">
                                                    <p>Schedule Presentation</p>
                                                    <div class='col-sm-5'>
                                                        <div class="form-group">
                                                            <div class='input-group date' id='datetimepicker1'>

                                                                <asp:TextBox ID="schedulePresentationInputID" class="form-control" runat="server" Style="height: 3%;"></asp:TextBox>
                                                                <span class="input-group-addon">
                                                                    <span class="glyphicon glyphicon-calendar"></span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('#datetimepicker1').datetimepicker();
                                                        });
                                                    </script>
                                                    <link href="./bootstrap/customBootstrapCSS/datetimepicker.css" rel="stylesheet" />
                                                    <script src="./bootstrap/customBootstrapJS/datetimepicker.js"></script>


                                                    <asp:LinkButton ID="sendPresentationInviteID" runat="server"
                                                        CssClass="btn btn-default" OnClick="Send_Invite">
                                                        <i aria-hidden="true" class="glyphicon glyphicon-envelope"></i> Send Invite
                                                    </asp:LinkButton>

                                                    <asp:Label ID="presentationScheduleLabel" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

                                                    
                                                    <div class="well" id="welldiv">
                                                        <p><b>Presentation Date: <asp:Label ID="presentationDateID" runat="server" Text="Label"></asp:Label></b></p>
                                                    </div>
                                                </div>

                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab4">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                                            <div class="panel panel-default" id="progressBarPanel" runat="server">
                                                <div class="panel-heading"><b>Submission Status</b></div>
                                                <div class="panel-body">
                                                    <table class="table">

                                                        <tbody>
                                                            <tr>
                                                                <td>Approval Progress
                                                                
                                                                    <div class="progress">
                                                                        <div class="progress-bar progress-bar-success progress-bar-striped" runat="server" id="progressBarInt" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                                                        
                                                                        </div>
                                                                    </div>
                                                                    <div class="row">
                                                                                <div class="col-md-3"><p class="progressColor"><b>Proposal Submitted</b></p></div>
                                                                                <div class="col-md-3"><p class="progressColor"><b>Chairman Approved</b></p></div>
                                                                                <div class="col-md-3"><p class="progressColor"><b>Committee Approved</b></p></div>
                                                                                <div class="col-md-3"><p class="progressColor"><b>Graduate Advisor Approved</b></p></div>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>

                                            <div class="panel panel-danger" runat="server" id="submissionDeclinedPanel">
                                                <div class="panel-heading"><b>Submission Declined</b></div>
                                                <div class="panel-body">
                                                    <asp:TextBox id="rejectID" class="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" ReadOnly="true"/>   
                                                </div>
                                            </div>
                                               
                                            <div class="panel panel-default">

                                                <div class="panel-heading"><b>Submission Statistics</b></div>
                                                <div class="panel-body">
                                                    <table class="table">
                                                        <tbody>
                                                            <tr>
                                                                <td>Number of Views</td>
                                                                <td>
                                                                    <asp:Label ID="numberOfViewsID" runat="server" Text="Number of View"></asp:Label>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Number of downloads</td>
                                                                <td><asp:Label ID="numberOfDownloadID" runat="server" Text="Number of Downloads"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Like Count</td>
                                                                <td><asp:Label ID="likeCountID" runat="server" Text="Like Count"></asp:Label></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Dislike Count</td>
                                                                <td><asp:Label ID="dislikeCountID" runat="server" Text="Dislike Count"></asp:Label></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div id="disableOrEnable">
                                            <div class="panel panel-default">
                                                <div class="panel-heading"><b>Submission Comments</b></div>
                                                <div class="panel-body">
                                                 <asp:TextBox id="commentSectionID" class="form-control" TextMode="multiline" Columns="50" Rows="5" runat="server" ReadOnly="true"/>   
                                                </div>
                                            </div>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>


                        </div>


                        <ul class="pager wizard">
                            <li class="previous first" style="display: none;">
                                <a href="#">First</a>

                            </li>
                            <li class="previous" style="display: none;">
                                <a href="#">Previous</a>

                            </li>
                            <li class="next last" style="display: none;">
                                <a href="#">Last</a>

                            </li>
                            <li class="next" style="display: none;">
                                <a href="#">Next</a>

                            </li>
                        </ul>
                    </div>
                    <%--wizard tab content ends--%>
                </div>
                <%--wizard div ends--%>
            </div>
            <div class="col-xs-0  col-sm-0 col-md-1"></div>
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
