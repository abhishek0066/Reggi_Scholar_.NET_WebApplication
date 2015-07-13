<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectShowcase.aspx.cs" Inherits="ReggieScholar.ProjectShowcase" %>
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
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    <script src="./bootstrap/customBootstrapJS/wizard.js"></script>
    <script src="./bootstrap/customBootstrapJS/prettify.js"></script>
    <link href="Custom_StyleSheet/project_thesis_showcase.css" rel="stylesheet" />
    <title>Project Showcase</title>
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
                                    <li>
                                        <asp:HyperLink NavigateUrl="UserProfile.aspx" ID="userProfileHomeID" runat="server"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><b> Home</b><span class="sr-only"></span></asp:HyperLink>

                                    </li>
                                    <li>
                                        <asp:HyperLink NavigateUrl="C_Search.aspx" ID="userProfileSearchID" runat="server"><span class="glyphicon glyphicon-search" aria-hidden="true"></span><b> Search</b><span class="sr-only"></span></asp:HyperLink>


                                    </li>
                                    <li class="active">
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
                </div>

                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
            </div>


            <%--Body content starts--%>
            <div class="row">
                <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
                <div class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                    <div class="page-header">
                        <%--header div begins--%>
                        <h2 class="googleFont">Research Showcase</h2>
                    </div>
                    <div class="panel panel-default" id="changePanel2">
                        
                        <div class="panel-body">

                            <div class="row">
                                <%--part 1 starts--%>

                                <div class="col-md-3">
                                    <%--part 1_1 starts--%>
                                    <div class="well">
                                        <center><img src="images/Project_Showcase_image.png" /></center>
                                        <div class="panel panel-default panelaccount panel-success">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="project1FullNameLabel" runat="server" Text="Position 1"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%--part 1_1 ends--%>
                                <div class="col-md-9">
                                    <%--part 1_2 starts--%>
                                    <div class="panel panel-default panel-success">
                                        
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <b>Project Topic:</b>
                                                        <asp:Label ID="projectTopic1" runat="server" Text="Topic1"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <asp:HyperLink ID="projectTopic1Link" class="btn btn-default" runat="server">
                                                        <span class="glyphicon glyphicon-new-window" aria-hidden="true" onclick=""></span> Visit Project Page
                                                        </asp:HyperLink>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="well">
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="test">
                                                            <b>Abstract:</b>
                                                            <asp:Label ID="projectTopic1Abstract" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-success">
                                                            <center>
                                                            <b> Number of Views</b>:
                                                            <asp:Label ID="project1NumberofViews" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-success">
                                                            <center>
                                                            <b> Number of Downloads</b>:
                                                            <asp:Label ID="project1NumberofDownloads" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-success">
                                                            <center>
                                                            <b> Number of Likes</b>:
                                                            <asp:Label ID="project1NumberofLikes" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                </div>
                                <%--part 1_2 ends--%>
                            </div>
                            <%--part 1 ends--%>




                            <div class="row">
                                <%--part 2 starts--%>

                                <div class="col-md-3">
                                    <%--part 2_1 starts--%>
                                    <div class="well">
                                        <center><img src="images/Project_Showcase_image.png" /></center>
                                        <div class="panel panel-default panelaccount panel-info">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="project2FullNameLabel" runat="server" Text="Position 2"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%--part 2_1 ends--%>
                                <div class="col-md-9">
                                    <%--part 2_2 starts--%>
                                    <div class="panel panel-default panel-info">
                                        
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <b>Project Topic:</b>
                                                        <asp:Label ID="projectTopic2" runat="server" Text="Topic2"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <asp:HyperLink ID="projectTopic2Link" class="btn btn-default" runat="server" NavigateUrl="" Text="">
                                                        <span class="glyphicon glyphicon-new-window" aria-hidden="true"></span> Visit Project Page
                                                        </asp:HyperLink>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="well">
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="test">
                                                            <b>Abstract:</b>
                                                            <asp:Label ID="projectTopic2Abstract" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-info">
                                                            <center>
                                                            <b> Number of Views</b>:
                                                            <asp:Label ID="project2NumberofViews" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-info">
                                                            <center>
                                                            <b> Number of Downloads</b>:
                                                            <asp:Label ID="project2NumberofDownloads" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-info">
                                                            <center>
                                                            <b> Number of Likes</b>:
                                                            <asp:Label ID="project2NumberofLikes" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                </div>
                                <%--part 2_2 ends--%>
                            </div>
                            <%--part 2 ends--%>

                            <div class="row">
                                <%--part 3 starts--%>

                                <div class="col-md-3">
                                    <%--part 3_1 starts--%>
                                    <div class="well">
                                        <center><img src="images/Project_Showcase_image.png" /></center>
                                        <div class="panel panel-default panelaccount panel-warning">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="project3FullNameLabel" runat="server" Text="Position 3"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%--part 3_1 ends--%>
                                <div class="col-md-9">
                                    <%--part 3_2 starts--%>
                                    <div class="panel panel-default panel-warning">
                                        
                                            <div class="panel-heading">
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <b>Project Topic:</b>
                                                        <asp:Label ID="projectTopic3" runat="server" Text="Topic3"></asp:Label>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <asp:HyperLink ID="projectTopic3Link" class="btn btn-default" runat="server">
                                                        <span class="glyphicon glyphicon-new-window" aria-hidden="true" onclick=""></span> Visit Project Page
                                                        </asp:HyperLink>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="panel-body">
                                                <div class="well">
                                                    <div class="tab-content">
                                                        <div class="tab-pane active" id="test">
                                                            <b>Abstract:</b>
                                                            <asp:Label ID="projectTopic3Abstract" runat="server" Text="Label"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-warning">
                                                            <center>
                                                            <b> Number of Views</b>:
                                                            <asp:Label ID="project3NumberofViews" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-warning">
                                                            <center>
                                                            <b> Number of Downloads</b>:
                                                            <asp:Label ID="project3NumberofDownloads" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4">
                                                        <div class="panel panel-default panel-warning">
                                                            <center>
                                                            <b> Number of Likes</b>:
                                                            <asp:Label ID="project3NumberofLikes" runat="server" Text="Label"></asp:Label></center>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                </div>
                                <%--part 3_2 ends--%>
                            </div>
                           <%--part 3 ends--%>
                    </div>
                    <%--panel body ends--%>
                </div>
            </div>
            <div class="col-xs-1  col-sm-0 col-md-1 col-lg-1"></div>
        </div>
        <%--Body content ends--%>
        </div>
        <%--container fluid ends--%>
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
