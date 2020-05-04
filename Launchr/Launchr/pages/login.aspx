<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Launchr.pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Launch:r | Log In & Sign Up</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid login-bg pt-5">
<div class="row">
<!--Login card-->
<div class="col-md-3 offset-md-1 mt-5 p-5 login-box">
	<h3>MEMBER LOGIN</h3>
	<label for="txtMemberLoginUsername">Username</label>
	<asp:TextBox runat="server" id="txtMemberLoginUsername" class="form-control mb-3" placeholder="Username" ValidationGroup="login"></asp:TextBox>
	<label for="txtMemberLoginPasssword">Password</label>
	<asp:RegularExpressionValidator ID="memberLoginPassMinLength" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password contains between 8 to 26 characters." ControlToValidate="txtMemberLoginPasssword" Display="Dynamic" ValidationGroup="login"></asp:RegularExpressionValidator><br />
	<asp:TextBox id="txtMemberLoginPasssword" runat="server" class="form-control" placeholder="Password" TextMode="Password" MaxLength="26" ValidationGroup="login"></asp:TextBox>
	<asp:Button ID="btnLogin" runat="server" Text="Log In" CssClass="btn launchr-btn mt-3" OnClick="btnLogin_Click" CausesValidation="False" ValidationGroup="login"/>
	<asp:PlaceHolder ID="loginError" runat="server"></asp:PlaceHolder>

	<!--<div id="alertbox" class="mt-3" runat="server" style="display: none">
		<div class="alert alert-danger">
			<strong>Wrong credentials!</strong> Incorrect username and password.
		</div>
	</div>-->

</div>
<!--Login card end-->
<!--Signup card -->
<div class="col-md-3 mt-5 p-5 ml-3 login-box">
	<h3>MEMBER SIGN UP</h3>
	<label for="email-register">New to Launch:r? Click the button below to continue</label>
	<button type="button" class="btn btn-secondary launchr-btn mt-3" data-toggle="modal" data-target="#sign-up-modal">Continue</button>

	<asp:PlaceHolder ID="registerError" runat="server"></asp:PlaceHolder>

	<div id="sign-up-modal" class="modal fade" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Sign Up</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body pl-5 pr-5">
					<p class="mb-0">Let us know more about you.</p>
					<span class="text-warning">All the fields are mandatory.</span><br />
					
					<asp:PlaceHolder ID="registerErrorModal" runat="server"></asp:PlaceHolder>

					<label for="txtMemberName" class="mt-2">Full Name</label>
					<asp:RequiredFieldValidator ID="memberNameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberName" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtMemberName" runat="server" Cssclass="form-control" ValidationGroup="signup"></asp:TextBox>

					<label for="txtMemberUsername" class="mt-2">Username</label>
					<asp:RequiredFieldValidator ID="memberUsernameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberUsername" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="memberUsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> Username must be between 6 to 20 characters." ControlToValidate="txtMemberUsername" Display="Dynamic" ValidationGroup="signup"></asp:RegularExpressionValidator><br />
					<asp:RegularExpressionValidator ID="memberUsernameAlphanumericValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9_.]*$" runat="server" ErrorMessage="<br/><i>Error:</i> Username should contains alphanumerical and underscore (_) only." ControlToValidate="txtMemberUsername" Display="Dynamic" ValidationGroup="signup"></asp:RegularExpressionValidator>
					<asp:TextBox ID="txtMemberUsername" runat="server" Cssclass="form-control" MaxLength="20" ValidationGroup="signup"></asp:TextBox>
					<label for="txtMemberUsername" class="text-muted">You'll need this to login later.</label><br/>
								

					<label for="txtMemberEmail" class="mt-2">Email</label>
					<asp:RequiredFieldValidator ID="memberEmailReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberEmail" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="<br/><i>Error:</i> Email format is wrong!" ControlToValidate="txtMemberEmail" Display="Dynamic" ValidationGroup="signup"></asp:RegularExpressionValidator><br />
					<asp:TextBox ID="txtMemberEmail" runat="server" Cssclass="form-control" ValidationGroup="signup"></asp:TextBox>


					<label for="txtMemberPhone" class="mt-2">Phone Number</label>
					<asp:RequiredFieldValidator ID="memberReqPhoneValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberPhone" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtMemberPhone" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" ValidationGroup="signup"></asp:TextBox>

					<label for="txtMemberAddress" class="mt-2">Address</label>
					<asp:RequiredFieldValidator ID="memberReqAddValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberAddress" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:TextBox TextMode="MultiLine" ID="txtMemberAddress" runat="server" Cssclass="form-control" ValidationGroup="signup"></asp:TextBox>
					<label for="txtMemberAddress" class="text-muted">We will never share your personal details.</label><br/>

					<label for="txtMemberPassword" class="mt-2">Password</label>
					<asp:RequiredFieldValidator ID="memberPassAddValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtMemberPassword" Display="Dynamic" ValidationGroup="signup"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="memberPassMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password must be between 8 to 26 characters." ControlToValidate="txtMemberPassword" Display="Dynamic" ValidationGroup="signup"></asp:RegularExpressionValidator><br />
					<asp:TextBox ID="txtMemberPassword" TextMode="Password" runat="server" Cssclass="form-control" ValidationGroup="signup"></asp:TextBox>
					<label for="txtMemberPassword" class="text-muted">Your password must contain at least 8 characters.</label>


					<label for="txtMemberConfirmPassword" class="mt-2">Confirm Password</label>
					<asp:CompareValidator id="comparePasswords" 
							runat="server"
							ControlToCompare="txtMemberPassword"
							ControlToValidate="txtMemberConfirmPassword"
							ErrorMessage="<br/><i>Error:</i> Your passwords do not match up!"
							Display="Dynamic"
							CssClass="text-danger"
							ValidationGroup="signup"
					/><br />
					<asp:TextBox ID="txtMemberConfirmPassword" TextMode="Password" runat="server" Cssclass="form-control" ValidationGroup="signup"></asp:TextBox>
								
					<label for="txtMemberCountry" class="mt-2">Country</label>
					<asp:DropDownList ID="txtMemberCountry" DataSourceID="countryXMLDS" runat="server" DataValueField="handle" DataTextField="handle" AutoPostBack="False" CssClass="form-control" ValidationGroup="signup"></asp:DropDownList>
					<asp:XmlDataSource ID="countryXMLDS" runat="server" DataFile="../Content/countries.xml" XPath="countries/country"></asp:XmlDataSource>
					
				</div>
				<div class="modal-footer">
					<asp:Button ID="btnSignUp" runat="server" Text="Sign Up" CssClass="btn launchr-btn" OnClick="btnSignUp_Click" ValidationGroup="signup"/>
					<button type="button" class="btn" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<a href="creator-login.aspx">creator</a>
</div>
<!--Signup card end-->
</div>
</div>
<script type="text/javascript">
function allowOnlyNumber(evt)
{
var charCode = (evt.which) ? evt.which : event.keyCode
if (charCode > 31 && (charCode < 48 || charCode > 57))
	return false;
return true;
}
</script>

</asp:Content>
