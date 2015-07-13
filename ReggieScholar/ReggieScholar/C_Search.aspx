<%@ Page Language="C#" AutoEventWireup="true" CodeFile="C_Search.aspx.cs" Inherits="ReggieScholar.C_Search" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <script src="./bootstrap/customBootstrapJS/jquery-latest.js"></script>
    <script src="./bootstrap/js/bootstrap.js"></script>
    <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
    <link href="./bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="./Custom_StyleSheet/StyleSheet1.css" rel="stylesheet" />
    <script src="./bootstrap/js/bootstrap.min.js"></script>
    
    <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

    <link href="./Custom_StyleSheet/StyleSheet1.css" rel="stylesheet" />
    <link href="Custom_StyleSheet/searchPage.css" rel="stylesheet" />

    <title>Search - Reggie Scholar</title>
    <script language="javascript" type="text/javascript">
        $(function () {
            $("#from").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#to").datepicker("option", "minDate", selectedDate);
                }
            });
            $("#to").datepicker({
                defaultDate: "+1w",
                changeMonth: true,
                numberOfMonths: 1,
                onClose: function (selectedDate) {
                    $("#from").datepicker("option", "maxDate", selectedDate);
                }
            });
        });
    </script>
    <script language="javascript" type="text/javascript">
        $(function() {
            $('#<%=keywordInput.ClientID%>').autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: "C_Search.aspx/GetKeywords",
                        data: "{ 'pre':'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset-utf-8",
                        success: function(data) {
                            response($.map(data.d, function (item)
                            {
                                return { value: item }
                            }));
                        },
                        error: function(XMLHttpRequest, textStatus, errorThrown) {
                            //alert(textStatus);
                        }
                    });
                }
            });
        });

        $(function () {
            $('#<%=researchNameInput.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "C_Search.aspx/GetResearchName",
                        data: "{ 'pre':'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset-utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return { value: item }
                            }));
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            //alert(textStatus);
                        }
                    });
                }
            });
        });

        $(function () {
            $('#<%=committeeInput.ClientID%>').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "C_Search.aspx/GetCommitteeName",
                        data: "{ 'pre':'" + request.term + "'}",
                        dataType: "json",
                        type: "POST",
                        contentType: "application/json; charset-utf-8",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return { value: item }
                            }));
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            //alert(textStatus);
                        }
                    });
                }
            });
        });

        function RefreshUpdatePanel() {
            __doPostBack('searchOutputPanel', '');
        }
    </script>
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
                <div class="col-xs-1 col-sm-0 col-md-1 col-lg-1"></div>
                
                <div id="header" class="col-xs-7 col-sm-12 col-md-12 col-lg-12">
                    <nav class="navbar navbar-default" >
                        <div class="container-fluid">
                            <div class="navbar-header"></div>
                            <div class="collapse navbar-collapse" >
                                <ul class="nav nav-tabs nav-justified">
                                    <li>
                                        <asp:HyperLink NavigateUrl="UserProfile.aspx" ID="userProfileHomeID" runat="server"><span class="glyphicon glyphicon-home" aria-hidden="true"></span><b> Home</b><span class="sr-only"></span></asp:HyperLink>

                                    </li>
                                    <li class="active">
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
                                </ul><%-- end nav nav-tabs nav-justified--%>   
                            </div><%-- end collapse navbar-collapse--%>
                        </div><%-- end container-fluid --%>
                    </nav><%-- end navbar navbar-default --%>
                </div><%-- end header --%>
                <div class="col-xs-0 col-sm-0 col-md-1 col-lg-1"></div>
            </div><%-- end row --%>
            
            <div class="col-md-offset-1 col-md-10"><%-- START WHOLE PAGE --%>
                <div class="row">
                    <h2 class="googleFont searchTitle">Search</h2>
                </div>
                
                <div class="row">
                    <div class="col-md-12">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-certificate"></span></span>
                            <asp:TextBox placeholder="Research Name" runat="server" ID="researchNameInput" OnTextChanged="search_Click" onkeyup="RefreshUpdatePanel()" CssClass="form-control input-lg inputForm searchPageInput"></asp:TextBox>
                        </div>
                    </div><%-- col-md-12 --%>
                </div>
            
                <div class="row marginTop">
                    <div class="col-md-6">
                        <div class="input-group topMargin">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
                            <asp:TextBox placeholder="Oldest Submission Date" runat="server" ID="from" OnTextChanged="search_Click" onchange="RefreshUpdatePanel()" CssClass="form-control input-lg inputForm searchPageInput"></asp:TextBox>
                        </div>
                    </div>
                
                    <div class="col-md-6">
                        <div class="input-group topMargin">
                            <span class="input-group-addon topMargin"><span class="glyphicon glyphicon-time"></span></span>
                            <asp:TextBox placeholder="Newest Submission Date" runat="server" ID="to" OnTextChanged="search_Click" onchange="RefreshUpdatePanel()" CssClass="form-control input-lg inputForm searchPageInput"></asp:TextBox>
                        </div>
                    </div>
                </div>
                
                <div class="row marginTop">
                    <div class="col-md-6">
                        <div class="input-group topMargin">
                            <span class="input-group-addon glyphHash">#</span>
                            <asp:TextBox placeholder="Keyword" runat="server" ID="keywordInput" OnTextChanged="search_Click" onkeyup="RefreshUpdatePanel()" CssClass="form-control input-lg inputForm searchPageInput"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="input-group topMargin">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                            <asp:TextBox placeholder="Committee" runat="server" ID="committeeInput" OnTextChanged="search_Click" onkeyup="RefreshUpdatePanel()" CssClass="form-control input-lg inputForm searchPageInput"></asp:TextBox>
                        </div>
                    </div><%-- end col-md-6 --%>
                </div><%-- end row marginTop --%>
                
                <%--<div class="row marginTop">
                    <asp:Button runat="server" Text="Search" ID="submitButton" OnClick="search_Click"/>
                </div><%-- end row marginTop --%>
                
                <asp:ScriptManager runat="server" ID="sm1"></asp:ScriptManager>
                    <asp:UpdatePanel runat="server" ID="searchOutputPanel">
                        <ContentTemplate>
                            <div class="row marginTop">
                                <div class="col-md-12">
                                        <div class="resultDIV">
                                            <center>
                                            <div runat="server" id="resultCount"></div>
                                            <div runat="server" id="resultOutput"></div>
                                            <center>
                                        </div>
                                </div><%-- end col-md-12 --%>
                            </div><%-- end row marginTop --%>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="researchNameInput" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="from" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="to" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="keywordInput" EventName="TextChanged" />
                            <asp:AsyncPostBackTrigger ControlID="committeeInput" EventName="TextChanged" />
                        </Triggers>
                    </asp:UpdatePanel>
            </div><%-- end col-md-offset-1 col-md-10 WHOLE PAGE --%>
        </div><%-- end container container-fluid --%>
    </form>
</body>
</html>
