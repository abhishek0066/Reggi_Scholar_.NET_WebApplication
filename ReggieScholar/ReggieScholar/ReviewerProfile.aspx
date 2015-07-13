<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReviewerProfile.aspx.cs" Inherits="ReggieScholar.ReviewerProfile" %>

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
    <title>Reviewer Profile</title>
</head>
<body>
    
    <form id="form1" runat="server">
        <div class="container container-fluid">
            <div class="row" id="headerImage">
                <%--image div starts--%>
                <div class="col-md-3 col-lg-3"></div>
                <div class="col-md-6 col-lg-6">
                    <img src="images/logo.png" />

                </div>
                <div class="col-md-3 col-lg-3"></div>
            </div>
            <%--image div ends--%>

            <div class="row">
                <%--outer wizard body starts--%>
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
                    </nav>
                    <%--navbar ends--%>
                </div>

                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
            </div>
            <%--outer wizard body ends--%>

            <div class="row">
                <%--content below header starts--%>
                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
                <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                    <%--body content starts--%>
                    <div class="page-header">
                        <%--header div begins--%>
                        <h2 class="googleFont">
                            <asp:Label ID="reviewerUserID" runat="server" Text="Reviewer"></asp:Label>'s Profile</h2>
                    </div>
                    <%--header div ends--%>
                    <div id="rootwizard" class="tabbable tabs-left">
                        <%--wizard div starts--%>
                        <ul class="nav nav-tabs">
                            <li><a href="#tab1" data-toggle="tab"><b>Profile Section</b></a></li>
                            <li><a href="#tab2" data-toggle="tab"><b>Project Section</b></a></li>
                        </ul>
                        <div class="tab-content">
                            <%--wizard tab content starts--%>
                            <div class="tab-pane active" id="tab1">
                                <%--tab 1 content starts--%>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <center><div id="profPic" runat="server"></div></center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-4 col-lg-4"></div>
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
                                    <div class="col-md-4 col-lg-4"></div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="well">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <center><b>User Information</b></center>
                                                </div>
                                                <table class="table table-hover">

                                                    <tbody>

                                                        <tr>
                                                            <td><b>College Dept</b></td>
                                                            <td>
                                                                <asp:Label ID="departmentID" runat="server" Text="Department"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>

                                                        <tr>
                                                            <td><b>Email Address</b></td>
                                                            <td>
                                                                <asp:Label ID="useremailID" runat="server" Text="Email of User"></asp:Label></td>
                                                            <%--Change to put user name here !!!!!!!!!!!!!--%>
                                                        </tr>


                                                    </tbody>
                                                </table>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%--tab 1 content ends--%>

                            <div class="tab-pane" id="tab2">
                                <%--tab 2 content starts--%>
                                <div class="panel panel-default changePanel2  panel-info">
                                    <div class="panel-heading">
                                        <center><b><p id="p1" style="font-size:25px !important;font-weight:750">Assigned Projects</p></b></center>
                                    </div>
                                    <div class="panel-body">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand=""></asp:SqlDataSource>

                                        <asp:DataGrid ID="DataGrid1" runat="server" DataSourceID="SqlDataSource1" CssClass="table table-hover table-striped " Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                            <Columns>
                                                <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="UserProfileReviewerApproval_Project.aspx?username={0}" HeaderText="Show Project" Text="Show Project"></asp:HyperLinkColumn>
                                            </Columns>
                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                        </asp:DataGrid>
                                    </div>
                                </div>
                            </div>
                            <%--tab 2 content ends--%>
                        </div>
                        <%--wizard tab content ends--%>
                    </div>
                    <%--wizard div ends--%>
                </div>
                <%--body content ends--%>
            </div>


        </div>
        <div>
        </div>
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
