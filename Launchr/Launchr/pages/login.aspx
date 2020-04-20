<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Launchr.pages.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid login-bg pt-5">
		<div class="row">
			<div class="col-md-3 offset-md-1 mt-5 p-5 login-box">
				<h3>LOGIN</h3>
				<label for="email-username-login">Username or Email</label>
				<input type="text" id="email-username-login" class="form-control mb-3" placeholder="Username"/>
				<label for="password-login">Password</label>
				<input type="text" id="password-login" class="form-control" placeholder="Password"/>
				<button class="btn btn-secondary join-sign-up-btn mt-3">Log In</button>
			</div>

			<div class="col-md-3 mt-5 p-5 ml-3 login-box">
				<h3>Sign Up</h3>
				<label for="email-register">New to Launch:r? Click the button below to continue</label>
				<button type="button" class="btn btn-secondary join-sign-up-btn mt-3" data-toggle="modal" data-target="#sign-up-modal">Continue</button>
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
								<p>Let us know more about you.</p>

								<label for="memberName" class="mt-2">Full Name</label>
								<asp:RequiredFieldValidator ID="memberNameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="memberName" Display="Dynamic"></asp:RequiredFieldValidator>
								<asp:TextBox ID="memberName" runat="server" Cssclass="form-control"></asp:TextBox>

								<label for="memberUsername" class="mt-2">Username</label>
								<asp:RequiredFieldValidator ID="memberUsernameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="memberUsername" Display="Dynamic"></asp:RequiredFieldValidator>
								<asp:RegularExpressionValidator ID="memberUsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> Username must between 6 to 20 characters." ControlToValidate="memberUsername" Display="Dynamic"></asp:RegularExpressionValidator><br />
								<asp:TextBox ID="memberUsername" runat="server" Cssclass="form-control" MaxLength="20"></asp:TextBox>
								<label for="memberUsername" class="text-muted">You'll need this to login later.</label><br/>
								

								<label for="memberEmail" class="mt-2">Email</label>
								<asp:TextBox TextMode="Email" ID="memberEmail" runat="server" Cssclass="form-control"></asp:TextBox>

								<label for="memberPhone" class="mt-2">Phone Number</label>
								<asp:TextBox ID="TextBox1" runat="server" Cssclass="form-control"></asp:TextBox>

								<label for="memberAddress" class="mt-2">Address</label>
								<asp:TextBox TextMode="MultiLine" ID="memberAddress" runat="server" Cssclass="form-control"></asp:TextBox>
								<label for="memberAddress" class="text-muted">We will never share your personal details.</label><br/>

								<label for="memberPassword" class="mt-2">Password</label>
								<asp:TextBox ID="memberPassword" TextMode="Password" runat="server" Cssclass="form-control"></asp:TextBox>
								<label for="memberPassword" class="text-muted">Your password must contain at least 8 characters.</label>


								<label for="memberConfirmPassword" class="mt-2">Confirm Password</label>
								<asp:TextBox ID="memberConfirmPassword" TextMode="Password" runat="server" Cssclass="form-control"></asp:TextBox>
								<asp:CompareValidator id="comparePasswords" 
									  runat="server"
									  ControlToCompare="memberPassword"
									  ControlToValidate="memberConfirmPassword"
									  ErrorMessage="Your passwords do not match up!"
									  Display="Dynamic"
									  CssClass="text-danger"
								/><br />
								<label for="memberCountry" class="mt-2">Country</label>
								<asp:DropDownList ID="memberCountry" DataSourceID="countryXMLDS" runat="server" DataValueField="handle" DataTextField="handle" AutoPostBack="False" CssClass="form-control"></asp:DropDownList>
								<asp:XmlDataSource ID="countryXMLDS" runat="server" DataFile="../Content/countries.xml" XPath="countries/country"></asp:XmlDataSource>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn join-sign-up-btn">Sign Up</button>
								<button type="button" class="btn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
