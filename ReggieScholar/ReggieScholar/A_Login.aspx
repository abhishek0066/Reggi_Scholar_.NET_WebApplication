<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="A_Login.aspx.cs" Inherits="ReggieScholar.A_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reggie Scholar</title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="A_Login.css" rel="stylesheet" />
    
    <script src="Scripts/jquery-2.1.3.min.js"></script>
    <script src="A_Login.js"></script>
    <script type="text/javascript">
        function hideAccessDeniedPanel() { //Hide access-denied page and show login page
            $("loginControls").show();
            $("accessDenied").hide();
        };
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%-- Play background music --%>
        <object data="yoyoma.mp3" type="audio/mpeg" width="0" height="0">
            <param name="filename" value="yoyoma.mp3">
            <param name="autostart" value="1">
            <param name="playcount" value="true">
        </object>

        <div class="row">
            <div class="col-md-6 col-md-offset-3"><%-- Logo --%>
                <img id="logo" src="/images/logo.png" width="100%" />
            </div><%-- end col-md-6 col-md-offset-3 --%>
        </div><%-- end row --%>
        

        <div class="row">
            <asp:ScriptManager runat="Server" ID="sm1"></asp:ScriptManager>
            <div class="col-md-4 col-md-offset-2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div id="loginControls"><%-- Login Controls --%>
                            <input runat="server" type="text" value="" id="usernameInput" name="usernameInput" class="form-control input-lg customInput" placeholder="Username" />
                            <br />
                            <br />
                            <asp:Textbox runat="server" ID="passwordInput" type="password" name="passwordInput" class="form-control input-lg customInput" placeholder="Password" />
                            <br />
                            <br />
                        <center>
                            <asp:LinkButton ID="loginButtonID" CssClass="btn btn-lg loginButton" runat="server" OnClick="loginButton_Click">
	                            <i aria-hidden="true" class="glyphicon glyphicon-education"></i> Login
                            </asp:LinkButton>
                            <br/>
                            <br/>
                            <asp:LinkButton ID="registerButtonID" OnClick="RegisterButton_Click" CssClass="btn btn-lg registerButton" runat="server">
	                            <i aria-hidden="true" class="glyphicon glyphicon-pencil"></i> Register
                            </asp:LinkButton>
                        </center>
                        </div><%-- end loginControls --%>
                        
                        <div id="accessDenied"><%-- end accessDenied --%>
                        <center>
                            <img id="accessDeniedImg" src="images/accessDenied.png"/>
                            <br/>
                            <p id="accessDeniedMessage">Username or Password<br/>is <span style="color:#FFD600">INVALID</span></p>
                            <asp:Button ID="backButtonID" runat="server" CssClass="btn btn-lg backButton" Text="Back" OnClientClick="hideAccessDeniedPanel();" />
                        </center>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="loginButtonID" />
                    </Triggers>
                </asp:UpdatePanel>
            </div><%-- end col-md-4 col-md-offset-2 --%>

            <div class="col-md-4">
                <div id="newsFeed"><%-- RSS Feed --%>
                    <script>
                        document.write('\x3Cscript type="text/javascript" src="' + ('https:' == document.location.protocol ? 'https://' : 'http://') + 'feed.mikle.com/js/rssmikle.js">\x3C/script>');
                    </script>
                    <script type="text/javascript">
                        (function () {
                            var params = {
                                rssmikle_url: "http://stories.illinoisstate.edu/feed/?organization=research-sponsored-programs&distribution=website-news",
                                rssmikle_frame_width: "400",
                                rssmikle_frame_height: "400",
                                frame_height_by_article: "0",
                                rssmikle_target: "_blank",
                                rssmikle_font: "Verdana, Arial, sans-serif",
                                rssmikle_font_size: "14",
                                rssmikle_border: "off",
                                responsive: "on",
                                rssmikle_css_url: "",
                                text_align: "left",
                                text_align2: "left",
                                corner: "on",
                                scrollbar: "off",
                                autoscroll: "on",
                                scrolldirection: "up",
                                scrollstep: "6",
                                mcspeed: "20",
                                sort: "New",
                                rssmikle_title: "on",
                                rssmikle_title_sentence: "Research News at Illinois State University",
                                rssmikle_title_link: "",
                                rssmikle_title_bgcolor: "#8B0000",
                                rssmikle_title_color: "#FFFFFF",
                                rssmikle_title_bgimage: "",
                                rssmikle_item_bgcolor: "#FFFFFF",
                                rssmikle_item_bgimage: "",
                                rssmikle_item_title_length: "70",
                                rssmikle_item_title_color: "#8B0000",
                                rssmikle_item_border_bottom: "on",
                                rssmikle_item_description: "on",
                                item_link: "off",
                                rssmikle_item_description_length: "170",
                                rssmikle_item_description_color: "#666666",
                                rssmikle_item_date: "off",
                                rssmikle_timezone: "Etc/GMT",
                                datetime_format: "%b %e, %Y %l:%M:%S %p",
                                item_description_style: "text+tn",
                                item_thumbnail: "full",
                                item_thumbnail_selection: "auto",
                                article_num: "15",
                                rssmikle_item_podcast: "off",
                                keyword_inc: "",
                                keyword_exc: ""
                            };
                            feedwind_show_widget_iframe(params);
                        })();
                    </script>
                </div><%-- end newsFeed --%>
            </div><%-- end col-md-4 --%>
        </div><%-- end row --%>

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
