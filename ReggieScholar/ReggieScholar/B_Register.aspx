<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="B_Register.aspx.cs" Inherits="ReggieScholar.B_Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reggie Scholar - Register</title>
    <link href='http://fonts.googleapis.com/css?family=Lora:700italic' rel='stylesheet' type='text/css'>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/fileinput.min.css" rel="stylesheet" />
    <link href="B_Register.css" rel="stylesheet" />
    
    <script src="Scripts/jquery-2.1.3.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/fileinput.min.js"></script>
    <script src="B_Register.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="row">
            <div class="col-md-6 col-md-offset-3"><%-- Logo --%>
                <center>
                    <img id="registerLogo" src="images/register.png" width="100%" />
                </center>
            </div><%-- end col-md-4 col-md-offset-4 --%>
        </div><%-- end row --%>
        
        <div class="row">
            <div class="col-md-8 col-md-offset-2"><%-- WHOLE PAGE --%>
                    <div class="panelDiv"><%-- Step 1 Personal Details --%>
                        <center>
                            <p class="panel-step">STEP 1</p>
                            <p class="panel-title">Personal Details</p>
                            <hr/>
                        </center>
                        
                        <div class="row"><%-- Validators --%>
                            <div class="col-md-6 col-md-offset-3 marginTop">
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="firstNameValidator" ToolTip="Required" 
                                    ControlToValidate="txtFirstName" ErrorMessage="First Name Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="lastNameValidator" 
                                    ControlToValidate="txtlastName" ErrorMessage="Last Name Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="usernameValidator" 
                                    ControlToValidate="txtUsername" ErrorMessage="Username Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="passwordValidator" 
                                    ControlToValidate="txtPassword" ErrorMessage="Password Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>     
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="ulidValidator" 
                                    ControlToValidate="txtUlid" ErrorMessage="ULID Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>     
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="secQuestionValidator" 
                                    ControlToValidate="txtSecQuestion" ErrorMessage="Security Question Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>     
                                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ID="secAnswerValidator" 
                                    ControlToValidate="txtSecAnswer" ErrorMessage="Security Answer Required" CssClass="col-md-12 alert alert-danger validationCustom"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" ID="confirmPasswordValidator" Display="Dynamic" 
                                    ControlToValidate="txtPassword" ControlToCompare="txtPasswordConfirm" ErrorMessage="Passwords Dont Match" CssClass="col-md-12 alert alert-danger validationCustom"></asp:CompareValidator>
                            </div><%-- end col-md-12 --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Upload Image --%>
                            <div class="col-md-4 col-md-offset-4">
                                <center>
                                    <asp:FileUpload ID="fileUploadImage" type="file" accept="image/*" runat="server"/>
                                </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-6 marginTop"><%-- First Name --%>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <asp:TextBox runat="server"  CssClass="form-control input-lg inputForm" placeholder="First Name" ID="txtFirstName" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>
                            
                            <div class="col-md-6 marginTop"><%-- Last Name --%>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                                    <asp:TextBox runat="server" CssClass="form-control input-lg inputForm" ID="txtlastName" placeholder="Last Name" Text="" ></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>    
                        </div><%-- end row --%>

                        <div class="row"><%-- Username --%>
                            <div class="col-md-6 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-sunglasses"></span></span>
                                    <asp:TextBox runat="server" CssClass="form-control input-lg inputForm" id="txtUsername" placeholder="Username" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Password --%>
                            <div class="col-md-6 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                    <asp:TextBox runat="server" TextMode="Password" CssClass="form-control input-lg inputForm" id="txtPassword" placeholder="Password" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>        
                            
                            <div class="col-md-6 marginTop"><%-- Confirm Password --%>
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                                    <asp:TextBox ID="txtPasswordConfirm" runat="server" TextMode="Password" CssClass="form-control input-lg inputForm" placeholder="Confirm Password" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>    
                        </div>
                        
                        <div class="row"><%-- ULID --%>
                            <div class="col-md-6 marginTop">
                                <div class="input-group">
                                    <asp:TextBox ID="txtUlid" runat="server" CssClass="form-control input-lg inputForm" placeholder="ULID" Text=""></asp:TextBox>
                                    <span class="input-group-addon glyphSizEmail">@ilstu.edu</span>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>    
                        
                        <div class="row"><%-- Security Question --%>
                            <div class="col-md-6 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon glyphSize"><span class="glyphicon glyphicon-flag"></span></span>
                                    <asp:TextBox ID="txtSecQuestion" runat="server"  CssClass="form-control input-lg inputForm" placeholder="Security Question" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>
                            
                            <div class="col-md-6 marginTop"><%-- Security Answer --%>
                                <div class="input-group">
                                    <span class="input-group-addon glyphSize"><span class="glyphicon glyphicon-flag"></span></span>
                                    <asp:TextBox ID="txtSecAnswer" runat="server" CssClass="form-control input-lg inputForm" placeholder="Security Answer" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 marginTop --%>    
                        </div><%-- end row --%>
                    </div><%-- end panelDiv - Step 1 Personal details --%>
                
                    <div class="panelDiv"><%-- step 2 - submission details --%>
                        <center>
                            <p class="panel-step">STEP 2</p>
                            <p class="panel-title">Submission Details</p>
                            <hr>
                        </center>
                        
                        <div class="row"><%-- Project or Thesis toggle --%>
                            <div class="col-md-6 col-md-offset-3 marginTop">
                                <div class="btn-group btn-group-lg btn-group-justified" data-toggle="buttons">
                                    <label class="btn btn-danger customRadioButton">
                                        <input id="radioBtnProject" name="projectType" type="radio" value="yes"/>Project</label>
                                    <label class="btn btn-danger customRadioButton">
                                        <input id="radioBtnThesis" name="thesisType" type="radio" value="yes"/>Thesis</label>
                                </div><%-- end btn-group btn-group-justified --%>
                            </div><%-- end col-md-6 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Research Name --%>
                            <div class="col-md-12 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-certificate"></span></span>
                                    <asp:TextBox ID="txtResearchName" runat="server" CssClass="form-control input-lg inputForm" placeholder="Research Name" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Research Keywords --%>
                            <div class="marginTop">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon keywordGlyph">#</span>
                                        <asp:TextBox ID="txtKeywordOne" runat="server" CssClass="form-control input-lg inputFormKeyword" placeholder="Keyword #1" Text=""></asp:TextBox>
                                    </div><%-- end input-group --%>
                                </div><%-- end col-md-4 --%>
                                
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon keywordGlyph">#</span>
                                        <asp:TextBox ID="txtKeywordTwo" runat="server" CssClass="form-control input-lg inputFormKeyword" placeholder="Keyword #2" Text=""></asp:TextBox>
                                    </div><%-- end input-group --%>
                                </div><%-- end col-md-4 --%>
                                
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <span class="input-group-addon keywordGlyph">#</span>
                                        <asp:TextBox ID="txtKeywordThree" runat="server" CssClass="form-control input-lg inputFormKeyword" placeholder="Keyword #3" Text=""></asp:TextBox>
                                    </div><%-- end input-group --%>
                                </div><%-- end col-md-4 --%>
                            </div><%-- end marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Course Number dropdown --%>
                            <div class="col-md-6 marginTop">
                                <center>
                                    <div class="dropdown">
                                        <button runat="server"  id="dropdownCourseNumber" class="btn btn-lg btn-warning dropdownCustom">Course Number</button>
                                        <button class="btn btn-lg btn-warning dropdownCustom" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        
                                        <ul class="dropdown-menu dropdownCustom" id="dropdownListOne">
                                            <li><a tabindex="-1">IT 492</a></li>
                                            <li><a tabindex="-1">IT 495</a></li>
                                            <li><a tabindex="-1">IT 497</a></li>
                                        </ul>
                                    </div>
                                    <asp:HiddenField ID="hiddenCourseNumber" Value="" runat="server"/>
                                </center>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                            
                            <div class="col-md-6 marginTop"><%-- Semester Completion dropdown --%>
                            <center>
                                <div class="dropdown">
                                    <button runat="server" class="btn btn-lg btn-warning dropdownCustom" id="dropdownSemester">Semester Completion</button>
                                    <button class="btn btn-lg btn-warning dropdownCustom" data-toggle="dropdown">
                                        <span class="caret"></span>
                                    </button>
                                        
                                    <ul class="dropdown-menu dropdownCustom" id="dropdownListTwo">
                                        <li><a tabindex="-1">Spring 2015</a></li>
                                        <li><a tabindex="-1">Fall 2015</a></li>
                                        <li><a tabindex="-1">Spring 2016</a></li>
                                        <li><a tabindex="-1">Fall 2016</a></li>
                                    </ul>
                                </div><%-- end dropdown --%>
                                <asp:HiddenField ID="hiddenSemester" Value="" runat="server"/>
                            </center>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Research Abstract --%>
                            <div class="col-md-12 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-pencil"></span></span>
                                    <asp:TextBox ID="txtAbstract" TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control input-lg inputForm" placeholder="Research Abstract" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Live Code URL --%>
                            <div class="col-md-12 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
                                    <asp:TextBox ID="txtCodeURL" TextMode="Url" runat="server" CssClass="form-control input-lg inputForm" placeholder="Live Code URL" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row"><%-- Video URL --%>
                            <div class="col-md-12 marginTop">
                                <div class="input-group">
                                    <span class="input-group-addon"><span class="glyphicon glyphicon-link"></span></span>
                                    <asp:TextBox ID="txtVideoURL" TextMode="Url" runat="server" CssClass="form-control input-lg inputForm" placeholder="Video URL" Text=""></asp:TextBox>
                                </div><%-- end input-group --%>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>

                        <div class="row">
                            <div class="col-md-6 marginTop"><%-- upload pdf --%>
                                <center>
                                    <asp:FileUpload ID="fileUploadPDF" accept="application/pdf" runat="server"/>
                                </center>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                            
                            <div class="col-md-6 marginTop"><%-- upload zip --%>
                                <center>
                                    <asp:FileUpload ID="fileUploadZIP" accept="application/zip" runat="server"/>
                                </center>
                            </div><%-- end col-md-6 col-md-offset-3 marginTop --%>
                        </div><%-- end row --%>
                    </div><%-- end panelDiv - Step 2 Submission details --%>
                
                    <div class="panelDiv"><%-- step 3 Committee details --%>
                        <center>
                            <p class="panel-step">STEP 3</p>
                            <p class="panel-title">Committee Details</p>
                            <hr/>
                        </center>
                        
                        <div class="row">
                            <div class="marginTop">
                                <label class="col-md-5 col-md-offset-1 customLabel">Committee Chair</label>
                                <div class="col-md-6">
                                    <div class="dropdown">
                                        <button class="btn btn-lg btn-primary dropdownCustom" id="buttonDropdownThree">Committee Chair</button>
                                        <button class="btn btn-lg btn-primary dropdownCustom" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>

                                        <ul class="dropdown-menu dropdownCustom" id="dropdownListThree">
                                            <li><a tabindex="-1">Bryan Hosack</a></li>
                                            <li><a tabindex="-1">Glen Sagers</a></li>
                                            <li><a tabindex="-1">Billy Lim</a></li>
                                            <li><a tabindex="-1">James Wolf</a></li>
                                            <li><a tabindex="-1">Douglas Twitchell</a></li>
                                        </ul>
                                    </div><%-- end dropdown --%>
                                    <asp:HiddenField ID="hiddenCommitteeOne" Value="" runat="server"/>
                                </div><%-- end col-md-6 --%>
                            </div>
                        </div><%-- end row --%>

                        <div class="row">    
                            <div class="marginTop">
                            <label class="col-md-5 col-md-offset-1 customLabel">Committee Member</label>
                                <div class="col-md-6">
                                    <div class="dropdown">
                                        <button class="btn btn-lg btn-primary dropdownCustom" id="buttonDropdownFour">Committee Member</button>
                                        <button class="btn btn-lg btn-primary dropdownCustom" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>

                                        <ul class="dropdown-menu dropdownCustom" id="dropdownListFour">
                                            <li><a tabindex="-1">Bryan Hosack</a></li>
                                            <li><a tabindex="-1">Glen Sagers</a></li>
                                            <li><a tabindex="-1">Billy Lim</a></li>
                                            <li><a tabindex="-1">James Wolf</a></li>
                                            <li><a tabindex="-1">Douglas Twitchell</a></li>
                                        </ul>
                                    </div><%-- end dropdown --%>
                                    <asp:HiddenField ID="hiddenCommitteeTwo" Value="" runat="server"/>
                                </div><%-- end col-md-6 --%>
                                </div><%-- end marginTop --%>
                        </div><%-- end row --%>
                        
                        <div class="row">    
                            <div class="marginTop">
                            <label class="col-md-5 col-md-offset-1 customLabel">Graduate Advisor</label>
                                <div class="col-md-6">
                                    <div class="dropdown">
                                        <button class="btn btn-lg btn-primary dropdownCustom" id="buttonDropdownFive">Graduate Advisor</button>
                                        <button class="btn btn-lg btn-primary dropdownCustom" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>

                                        <ul class="dropdown-menu dropdownCustom" id="dropdownListFive">
                                            <li><a tabindex="-1">Sherry Jerome</a></li>
                                        </ul>
                                    </div><%-- end dropdown --%>
                                    <asp:HiddenField ID="hiddenGA" Value="" runat="server"/>
                                </div><%-- end col-md-6 --%>
                                </div><%-- end marginTop --%>
                        </div><%-- end row --%>
                    </div><%-- end panelDiv - Step 3 Committee details --%>
                
                    <div class="row"><%-- Submit button --%>
                        <div class="col-md-6 col-md-offset-3">
                            <asp:LinkButton ID="submitButton" runat="server" OnClick="submitButton_Click" CssClass="btn btn-lg btn-group-justified btn-custom"><i aria-hidden="true" class="glyphicon glyphicon-ok-sign glyphSize"></i> Submit</asp:LinkButton>
                            <br/>
                            <br/>
                        </div><%-- end col-md-6 marginTop --%>
                    </div><%-- end row --%>

                </div><%-- WHOLE PAGE end col-md-8 col-md-offset-2 --%>
            </div><%-- end row --%>
    </form>
</body>
</html>
