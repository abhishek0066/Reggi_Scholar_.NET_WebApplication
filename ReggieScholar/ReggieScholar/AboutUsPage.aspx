<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUsPage.aspx.cs" Inherits="ReggieScholar.AboutUsPage" %>

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
    <title>About Us</title>
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
                                    <li>
                                        <asp:HyperLink NavigateUrl="ProjectShowcase.aspx" ID="projectShowcaseID" runat="server"><span class="glyphicon glyphicon-book" aria-hidden="true"></span><b> Showcase</b><span class="sr-only"></span></asp:HyperLink>


                                    </li>
                                    
                                    <li class="active">
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
                        <h2 class="googleFont">About Us</h2>
                    </div>
                    <div class="panel panel-default" id="changePanel2">
                        <div class="panel-heading">Welcome to our page</div>
                        <div class="panel-body">

                            <div class="row">
                                <%--part 1 starts--%>

                                <div class="col-md-3">
                                    <%--part 1_1 starts--%>
                                    <div class="well">
                                        <center><img src="images/01_Thanesh.jpg" /></center>
                                        <div class="panel panel-default panelaccount">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="FullNameLabel" runat="server" Text="Thanesh Rajandaran"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%--part 1_1 ends--%>
                                <div class="col-md-9">
                                    <%--part 1_2 starts--%>
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                             <p class="aboutUsBody">
                                                 Thanesh is the founder of Reggie Scholar, and successful entrepreneur.   Bill Gates has called him “a WEB guru extraordinaire,” and Professor Billy Lim referred to him as “a horse whisperer for web developers and JavaScript thinkers.” He has written for The New York Times, and has written or co-created five web development books. His latest is a revised, expanded, and re-subtitled edition of his bestseller, Accidental WEB Genius: Using Writing to Generate Your Best Web Ideas, Insight, and Content. Thanesh also creates magic tricks and shows just to keep his six children entertained.  He is also an avid dodgeball player who specializes in punishing his opponents. Visit him and read his blog at godlike.com.

                                             </p>
                                        </div>
                                    </div>
                                </div>
                                <%--part 1_2 ends--%>
                            </div>
                            <%--part 1 ends--%>

                            <div class="row">
                                <%--part 2 starts--%>
                                <div class="col-md-3">
                                    <%--part 2_1 ends--%>
                                    <div class="well">
                                        <center><img src="images/01_Abishek.jpg" /></center>
                                        <div class="panel panel-default panelaccount">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="Label1" runat="server" Text="Abhishek Varghese"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                <%--part 2_1 ends--%>
                                <%--part 2_2 starts--%>
                                <div class="col-md-9">
                                    <div class="panel panel-default">
                                        <div class="panel-body">
                                            <p class="aboutUsBody">
                                                 Abhishek was born into a life of privilege as the son of a wealthy milk processing baron.  He spent his childhood learning about computers and studying various styles of dance at the national academy for performing arts.  Abhishek finished his technical certification and quickly became a top notch computer technician / IT support guy.  Aamir Khan has called him “the help desk king,” and Kal Penn referred to him as “a dude who knows his stuff.”  Unfortunately he was fired from Best Buy after crashing the geek squad Volkswagen bug into a short bus filled with disabled students while drinking some spiked chocolate milk.  The Reggie Scholar staff decided to give Abhishek a chance and he now runs our help desk operations. 
                                             </p>
                                        </div>
                                    </div>
                                </div>
                                <%--part 2_2 ends--%>
                            </div>

                            <div class="row">
                                <%--part 3 starts--%>
                                <div class="col-md-3">
                                    <%--part 3_1 starts--%>
                                    <div class="well">
                                       <center> <img src="images/01_FrankWylie.jpg" /></center>
                                        <div class="panel panel-default panelaccount">
                                            <!-- panel begins -->
                                            <div class="panel-heading">
                                                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
                                                <asp:Label ID="Label2" runat="server" Text="Frank Wylie"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                            </div>
                            <%--part 3_1 ends--%>
                            <div class="col-md-9">
                                <%--part 3_1 starts--%>
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <p class="aboutUsBody">
                                            Frank is a man with a dream. His dream includes nachos, beer, and a super-fast computer. After spending nearly a decade in starring in his own reality show titled,
 How to build your own man-cave; one man’s journey for perfection. Frank decided it was time to join a start-up company and make things happen. Within just a few short months,
 he joined the dynamic crew at Reggie Scholar as an HTML 5 expert. He believes that Reggie Scholar will be a successful organization that one day rival Apple Corporation.  
 In his free time, Frank also works as a blogger to help improve the worldwide image and popularity for the leading  Mexican-style quick service restaurant chain called Taco Bell.
 In the future, he hopes to buy a small beach house.
                                        </p>
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
