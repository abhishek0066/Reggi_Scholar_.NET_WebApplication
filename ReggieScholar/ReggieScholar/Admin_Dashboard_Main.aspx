<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin_Dashboard_Main.aspx.cs" Inherits="ReggieScholar.Admin_Dashboard_Main" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />

    <script src="./bootstrap/customBootstrapJS/jquery-latest.js"></script>
    <script src="./bootstrap/js/bootstrap.js"></script>
    
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="./bootstrap/customBootstrapCSS/prettify.css" rel="stylesheet" />
    <link href="./Custom_StyleSheet/StyleSheet1.css" rel="stylesheet" />
    
    <title>Admin Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container container-fluid">
            <div class="row" id="headerImage">
                <%--image div starts--%>
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <img src="images/logo.png" />
                </div>
                <div class="col-md-3"></div>
            </div>
            
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

                <div class="col-sm-0 col-md-1"></div>
            </div>
            <%--outer wizard body ends--%>


            <div class="row"><%--content below header starts--%>
                <div class="col-md-1"></div>
                    <div class="col-md-12"><%--body content starts--%>
                        <div class="page-header"> <%--header div begins--%>
                            <h2 class="googleFont">Administrator Dashboard</h2>
                        </div> <%--header div ends--%> 
                        <div id="rootwizard" class="tabbable tabs-left"><%--wizard div starts--%>
                            <ul class="nav nav-tabs">
                                <li><a href="#tab1" data-toggle="tab"><b>User Registration</b></a></li>
                                <li><a href="#tab2" data-toggle="tab"><b>Most Viewed Statistics</b></a></li>
                                <li><a href="#tab3" data-toggle="tab"><b>Most Downloaded Statistics</b></a></li>
                                <li><a href="#tab4" data-toggle="tab"><b>Current Registered Students</b></a></li>
                                <li><a href="#tab6" data-toggle="tab"><b>Current Registered Reviewers</b></a></li>
                                <li><a href="#tab5" data-toggle="tab"><b>Repository Statistics</b></a></li>
                            </ul>
                            <div class="tab-content">
                                <%--wizard tab content starts--%>
                                <div class="tab-pane active" id="tab1">
                                    <%--tab 1 content starts--%>
                                    <div class="panel panel-default panel-success" id="changePanel2">
                                        <div class="panel-heading"><center><b><p id="pendingApprovalID" style="font-size:25px !important;font-weight:750">Pending Approval List</p></b></center></div>
                                        <div class="panel-body">
                                            

                                            

                                                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand="SELECT     u.username Username, u.First_Name as &quot;First Name&quot;, u.Last_Name as &quot;Last Name&quot;, u.Email as &quot;Email&quot;, u.College_Dept as &quot;Department&quot;
                                                    FROM         USERS AS u INNER JOIN
                                                    LOGIN AS l ON u.username = l.username
                                                    WHERE     (l.Approve_Status = 'n')"></asp:SqlDataSource>
                                            

                                            <asp:DataGrid ID="DataGrid4" runat="server" DataSourceID="SqlDataSource4" CssClass="table table-hover table-striped  " >
                                                <Columns>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="authorizeNewUsers.aspx?u.username={0}" HeaderText="Approve Account" Text="Approve Account"></asp:HyperLinkColumn>
           
                                                </Columns>
                                                <HeaderStyle BackColor="White" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                            </asp:DataGrid>

                                        </div>
                                    </div> 
                                    

                                </div><%--tab 1 content ends--%>

                                
                                <div class="tab-pane active" id="tab2">
                                    <%--tab 2 content starts--%>
                                    <div class="panel panel-default changePanel2  panel-info">
                                        <div class="panel-heading"><center><b><p id="p1" style="font-size:25px !important;font-weight:750">Most Viewed Submissions</p></b></center></div>
                                        <div class="panel-body">
                                            

                                           <%--put the contents here!!!!!!--%>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand="SELECT  username as &quot;Username&quot;, Project_Name as &quot;Project Name&quot;,  Project_ID as &quot;Project ID&quot;, Num_Views as &quot;Number of Views&quot;
                                                    FROM    (SELECT username, Project_ID, Num_Views, Project_Name,
                                                    ROW_NUMBER() OVER (ORDER BY Num_Views DESC ) AS 'RowNumber'
                                                    FROM    Files
                                                    ) AS A
                                                    WHERE   RowNumber &lt;=10"></asp:SqlDataSource>

                                           
                                            
                                                <asp:DataGrid ID="DataGrid1" runat="server" DataSourceID="SqlDataSource1"  CssClass="table table-hover table-striped  " Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False">
                                                    <Columns>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="SearchProfile_ReviewerProject.aspx?username={0}" HeaderText="Show Account" Text="Account"></asp:HyperLinkColumn>
                                                    </Columns>
                                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                            </asp:DataGrid>
                                               

                                        </div>
                                    </div> 
                                    

                                </div><%--tab 2 content ends--%>
                                
                                <div class="tab-pane active" id="tab3">
                                    <%--tab 3 content starts--%>
                                    <div class="panel panel-default changePanel2">
                                        <div class="panel-heading"><center><b><p id="p2" style="font-size:25px !important;font-weight:750">Most Downloaded Submissions</p></b></center></div>
                                        <div class="panel-body">
                                            

                                            <%--put the contents here!!!!!!--%>
                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand="SELECT  username as &quot;Username&quot;, Project_Name as &quot;Project Name&quot;,  Project_ID as &quot;Project ID&quot;, Num_Dloads as &quot;Number of Downloads&quot;
                                                FROM    (SELECT username, Project_ID, Num_Dloads, Project_Name,
                                                ROW_NUMBER() OVER (ORDER BY Num_Dloads DESC ) AS 'RowNumber'
                                                FROM    Files
                                                ) AS A
                                                WHERE   RowNumber &lt;=10"></asp:SqlDataSource>
                                            
                                            
                                                <asp:DataGrid ID="DataGrid2" runat="server" DataSourceID="SqlDataSource2" CssClass="table table-hover table-striped">
                                                    <Columns>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="SearchProfile_ReviewerProject.aspx?username={0}" HeaderText="Show Account" Text="Account"></asp:HyperLinkColumn>
                                                    </Columns>
                                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                            </asp:DataGrid>
                                           

                                        </div>
                                    </div> 
                                    

                                </div><%--tab 3 content ends--%>

                                <div class="tab-pane" id="tab4">
                                    <%--tab 4 content starts--%>
                                    <div class="panel panel-default changePanel2 panel-primary">
                                        <div class="panel-heading"><center><b><p id="p3" style="font-size:25px !important;font-weight:750">Registered Students</p></b></center></div>
                                        <div class="panel-body">
                                            

                                          <%--put the contents here!!!!!!--%>
                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand="SELECT     u.username as &quot;username&quot;, u.First_Name as &quot;First Name&quot;, u.Last_Name &quot;Last Name&quot;, u.Email &quot;Email&quot;, u.College_Dept &quot;Department&quot;, u.Acct_Reason &quot;Account Reason&quot;
                                                FROM         USERS AS u INNER JOIN
                                                LOGIN AS l ON u.username = l.username
                                                WHERE     (l.Approve_Status = 'y') AND (l.User_Type='s')"></asp:SqlDataSource>
                                            

                                            
                                                <asp:DataGrid ID="DataGrid3" runat="server" DataSourceID="SqlDataSource3" CssClass="table table-hover table-striped">
                                                    <Columns>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="SearchProfile_ReviewerProject.aspx?username={0}" HeaderText="Show Account" Text="Account"></asp:HyperLinkColumn>
                                                    </Columns>
                                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                                </asp:DataGrid>
                                            
                                        </div>
                                    </div> 

                                   
                                </div><%--tab 4 content ends--%>

                                <div class="tab-pane" id="tab6">
                                    <%--tab 4 content starts--%>
                                    <div class="panel panel-default changePanel2 panel-primary">
                                        <div class="panel-heading"><center><b><p id="p4" style="font-size:25px !important;font-weight:750">Registered Reviewers</p></b></center></div>
                                        <div class="panel-body">
                                            

                                          <%--put the contents here!!!!!!--%>
                                                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringLocalDB %>" SelectCommand="SELECT     u.username as &quot;Username&quot;, u.First_Name as &quot;First Name&quot;, u.Last_Name &quot;Last Name&quot;, u.Email &quot;Email&quot;, u.College_Dept &quot;Department&quot;
                                                FROM         USERS AS u INNER JOIN
                                                LOGIN AS l ON u.username = l.username
                                                WHERE     (l.Approve_Status = 'y') AND (l.User_Type='r')"></asp:SqlDataSource>
                                            

                                            
                                                <asp:DataGrid ID="DataGrid5" runat="server" DataSourceID="SqlDataSource5" CssClass="table table-hover table-striped">
                                                    <Columns>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="USERNAME" DataNavigateUrlFormatString="ReviewerProfile.aspx?u.username={0}" HeaderText="Show Account" Text="Account"></asp:HyperLinkColumn>
                                                    </Columns>
                                                    <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Medium" Font-Strikeout="False" Font-Underline="False" />
                                                </asp:DataGrid>
                                            
                                        </div>
                                    </div> 

                                   
                                </div><%--tab 4 content ends--%>
                                
                                <div class="tab-pane active" id="tab5"><%--tab 5 content ends--%>
                                    <div class="panel panel-default changePanel2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading"><b>Website Usage Statistics</b></div>
                                            <div class="panel-body">
                                                <div class="row">
                                                    <div class="col-md-3">
                                                        <div class="well">
                                                            <table class="table">
                                                                <thead><tr><td><b>Users Login Statistics:</b></td></tr></thead>
                                                                <tbody><tr><td><b>Count= 5 Days</b></td></tr></tbody>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-8 col-lg-8">
                                                        <asp:Chart ID="Chart2" runat="server" Width="500px" CssClass="userLoginGraph">
                                                            <Titles>
                                                                <asp:Title Text="User Login Number"></asp:Title>
                                                            </Titles>
                                                            <Series>
                                                                <asp:Series Name="Series1" ChartArea="ChartArea1" ChartType="Column">
                                                                </asp:Series>
                                                            </Series>
                                                            <ChartAreas>
                                                                <asp:ChartArea Name="ChartArea1">
                                                                    <AxisX Title="Date"></AxisX>
                                                                    <AxisY Title="Number of Logins"></AxisY>
                                                                </asp:ChartArea>
                                                            </ChartAreas>
                                                        </asp:Chart>
                                                    </div>

                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div><%--tab 5 content ends--%>

                            </div><%--wizard tab content ends--%>

                        </div>               
                    </div>
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

