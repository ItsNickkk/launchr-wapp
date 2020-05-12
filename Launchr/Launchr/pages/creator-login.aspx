<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="creator-login.aspx.cs" Inherits="Launchr.pages.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>Creator Log In & Sign Up | Launch:r</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid login-bg pt-5">
<div class="row">
	<!--Login card-->
	<div class="col-md-3 offset-md-5 mt-5 p-5 login-box">
		<h3>CREATOR LOGIN</h3>

		<label for="txtCreatorLoginUsername">Username</label>
		<asp:RequiredFieldValidator ID="creatorLoginUsernameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorLoginUsername" Display="Dynamic" ValidationGroup="creatorLogin"></asp:RequiredFieldValidator>
		<asp:TextBox runat="server" id="txtCreatorLoginUsername" class="form-control mb-3" placeholder="Username"></asp:TextBox>

		<label for="txtCreatorLoginUsername">Password</label>
		<asp:RequiredFieldValidator ID="creatorLoginPasseReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorLoginPasssword" Display="Dynamic" ValidationGroup="creatorLogin"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="creatorLoginPassMinLength" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password contains between 8 to 26 characters." ControlToValidate="txtCreatorLoginPasssword" Display="Dynamic" ValidationGroup="creatorLogin"></asp:RegularExpressionValidator><br />
		<asp:TextBox id="txtCreatorLoginPasssword" runat="server" class="form-control" placeholder="Password" TextMode="Password" MaxLength="26"></asp:TextBox>

		<asp:Button ID="btnCreatorLogin" runat="server" Text="Log In" CssClass="btn launchr-btn mt-3" CausesValidation="True" ValidationGroup="creatorLogin" OnClick="btnCreatorLogin_Click"/>

		<asp:PlaceHolder ID="loginAlert" runat="server"></asp:PlaceHolder>

	</div>
	<!--Login card end-->
	<!--Signup card -->
	<div class="col-md-3 mt-5 p-5 ml-3 login-box">
		<h3>CREATOR SIGN UP</h3>
		<label for="email-register">Want to launch your project in Launch:r? Click the button below to continue</label>
		<button type="button" class="btn btn-secondary launchr-btn mt-3" data-toggle="modal" data-target="#sign-up-modal">Continue</button>
		<asp:PlaceHolder ID="registerAlert" runat="server"></asp:PlaceHolder>
		<a class="to-creator launchr-btn text-decoration-none" href="login.aspx">Switch to Member Login</a>
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

						<asp:PlaceHolder ID="registerAlertModal" runat="server"></asp:PlaceHolder>

						<label for="txtCreatorName" class="mt-2">Name</label>
						<asp:RequiredFieldValidator ID="creatorNameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorName" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txtCreatorName" runat="server" Cssclass="form-control" ValidationGroup="creatorSignup"></asp:TextBox>
						<label for="txtCreatorName" class="text-muted">Use your real name if you're an individual; Use company name if you're creating project as a company</label>

						<label for="txtCreatorUsername" class="mt-2">Username</label>
						<asp:RequiredFieldValidator ID="creatorUsernameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorUsername" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="creatorUsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> Username must be between 6 to 20 characters." ControlToValidate="txtCreatorUsername" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RegularExpressionValidator><br />
						<asp:RegularExpressionValidator ID="creatorUsernameAlphanumericValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9_.]*$" runat="server" ErrorMessage="<br/><i>Error:</i> Username should contains alphanumerical and underscore (_) only." ControlToValidate="txtCreatorUsername" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RegularExpressionValidator>						
						<asp:TextBox ID="txtCreatorUsername" runat="server" Cssclass="form-control" MaxLength="20" ValidationGroup="creatorSignup"></asp:TextBox>
						<label for="txtCreatorUsername" class="text-muted">You'll need this to login later.</label><br/>
								

						<label for="txtCreatorEmail" class="mt-2">Email</label>
						<asp:RequiredFieldValidator ID="creatorEmailReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorEmail" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="creatorEmailFormatValidator" CssClass="text-danger" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="<br/><i>Error:</i> Email format is wrong!" ControlToValidate="txtCreatorEmail" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RegularExpressionValidator><br />
						<asp:TextBox ID="txtCreatorEmail" runat="server" Cssclass="form-control" ValidationGroup="creatorSignup"></asp:TextBox>


						<label for="txtCreatorPhone" class="mt-2">Phone Number</label>
						<asp:RequiredFieldValidator ID="creatorReqPhoneValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorPhone" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:TextBox ID="txtCreatorPhone" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" ValidationGroup="creatorSignup"></asp:TextBox>

						<label for="txtCreatorAddress" class="mt-2">Address</label>
						<asp:RequiredFieldValidator ID="creatorReqAddValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorAddress" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:TextBox TextMode="MultiLine" ID="txtCreatorAddress" runat="server" Cssclass="form-control" ValidationGroup="creatorSignup"></asp:TextBox>
						<label for="txtCreatorAddress" class="text-muted">We will never share your personal details.</label><br/>

						<label for="txtCreatorPassword" class="mt-2">Password</label>
						<asp:RequiredFieldValidator ID="creatorPassReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCreatorPassword" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="creatorPassMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password must be between 8 to 26 characters." ControlToValidate="txtCreatorPassword" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RegularExpressionValidator><br />
						<asp:TextBox ID="txtCreatorPassword" TextMode="Password" runat="server" Cssclass="form-control" ValidationGroup="creatorSignup"></asp:TextBox>
						<label for="txtCreatorPassword" class="text-muted">Your password must contain at least 8 characters.</label>


						<label for="txtCreatorConfirmPassword" class="mt-2">Confirm Password</label>
						<asp:CompareValidator id="creatorComparePasswords" 
								runat="server"
								ControlToCompare="txtCreatorPassword"
								ControlToValidate="txtCreatorConfirmPassword"
								ErrorMessage="<br/><i>Error:</i> Your passwords do not match up!"
								Display="Dynamic"
								CssClass="text-danger"
								ValidationGroup="creatorSignup"
						/><br />
						<asp:TextBox ID="txtCreatorConfirmPassword" TextMode="Password" runat="server" Cssclass="form-control" ValidationGroup="creatorSignup"></asp:TextBox>
								
						<label for="txtCreatorCountry" class="mt-2">Country</label>
						<asp:DropDownList ID="txtCreatorCountry" DataSourceID="countryCreatorXMLDS" runat="server" DataValueField="handle" DataTextField="handle" AutoPostBack="False" CssClass="form-control" ValidationGroup="creatorSignup"></asp:DropDownList>
						<asp:XmlDataSource ID="countryCreatorXMLDS" runat="server" DataFile="../Content/countries.xml" XPath="countries/country"></asp:XmlDataSource>

						<label for="txtBusinessType" class="mt-2">Creator Type</label>
						<asp:DropDownList ID="txtBusinessType" runat="server" AutoPostBack="False" CssClass="form-control" ValidationGroup="creatorSignup">
							<asp:ListItem Text="Individual-based" Value="0"></asp:ListItem>
							<asp:ListItem Text="Corporate-based" Value="1"></asp:ListItem>
						</asp:DropDownList>
						<label for="txtBusinessType" class="text-warning">Please choose the appropriate type as it cannot be changed later.</label>

						<label for="filDocument" class="mt-2">Document Upload</label>
						<asp:RequiredFieldValidator ID="creatorFileReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="filDocument" Display="Dynamic" ValidationGroup="creatorSignup"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator id="creatorFileDocumentPDFVal" CssClass="text-danger" errormessage="<br/><i>Invalid file format.</i>" ControlToValidate="filDocument" ValidationExpression="^.*\.(pdf|PDF)$" runat="server" Display="Dynamic" ValidationGroup="creatorSignup"/>
						<asp:FileUpload ID="filDocument" runat="server" cssclass="form-control"/>
						<div class="text-muted">Supported format: .pdf<br />Please upload a document to proof your identity
							<ul>
								<li>Individual: Any government-issued document that contains your full name and address</li>
								<li>Corporate: Any company document that contains your company name and address</li>
							</ul>
						</div>
						<small>Please do note that a creator account requires administrator's approval and verification. It might take up to 3-5 working days after submission.</small>
					</div>
					<div class="modal-footer">
						<asp:Button ID="btnCreatorSignUp" runat="server" Text="Sign Up" CssClass="btn launchr-btn" ValidationGroup="creatorSignup" OnClick="btnCreatorSignUp_Click"/>
						<button type="button" class="btn" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--Signup card end-->
</div>
</div>
</asp:Content>
