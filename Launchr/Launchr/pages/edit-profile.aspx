<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="edit-profile.aspx.cs" Inherits="Launchr.pages.edit_profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col xl-12 neumorph p-3">
					<h1>Edit profile</h1>
					<p class="mb-0">Update your personal details</p>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col xl-12 neumorph p-3">
					<label for="txtName" class="mt-2">Full Name</label>
					<asp:RequiredFieldValidator ID="NameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtName" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtName" runat="server" Cssclass="form-control" ValidationGroup="updateprof"></asp:TextBox>

					<label for="txtUsername" class="mt-2">Username</label>
					<asp:RequiredFieldValidator ID="UsernameReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtUsername" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="UsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> Username must be between 6 to 20 characters." ControlToValidate="txtUsername" Display="Dynamic" ValidationGroup="updateprof"></asp:RegularExpressionValidator><br />
					<asp:RegularExpressionValidator ID="UsernameAlphanumericValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9_.]*$" runat="server" ErrorMessage="<br/><i>Error:</i> Username should contains alphanumerical and underscore (_) only." ControlToValidate="txtUsername" Display="Dynamic" ValidationGroup="updateprof"></asp:RegularExpressionValidator>
					<asp:TextBox ID="txtUsername" runat="server" Cssclass="form-control" MaxLength="20" ValidationGroup="updateprof"></asp:TextBox>
								

					<label for="txtEmail" class="mt-2">Email</label>
					<asp:RequiredFieldValidator ID="EmailReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server" ErrorMessage="<br/><i>Error:</i> Email format is wrong!" ControlToValidate="txtEmail" Display="Dynamic" ValidationGroup="updateprof"></asp:RegularExpressionValidator><br />
					<asp:TextBox ID="txtEmail" runat="server" Cssclass="form-control" ValidationGroup="updateprof"></asp:TextBox>


					<label for="txtPhone" class="mt-2">Phone Number</label>
					<asp:RequiredFieldValidator ID="ReqPhoneValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtPhone" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtPhone" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" ValidationGroup="updateprof"></asp:TextBox>

					<label for="txtAddress" class="mt-2">Address</label>
					<asp:RequiredFieldValidator ID="ReqAddValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtAddress" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
					<asp:TextBox TextMode="MultiLine" ID="txtAddress" runat="server" Cssclass="form-control" ValidationGroup="updateprof"></asp:TextBox>
					<label for="txtAddress" class="text-muted">We will never share your personal details.</label><br/>

					<label for="txtPassword" class="mt-2">New Password</label>
					<asp:RequiredFieldValidator ID="PassAddValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtPassword" Display="Dynamic"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator ID="PassMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password must be between 8 to 26 characters." ControlToValidate="txtPassword" Display="Dynamic"></asp:RegularExpressionValidator><br />
					<asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Cssclass="form-control"></asp:TextBox>
					<label for="txtPassword" class="text-muted">Your password must contain at least 8 characters.</label><br />
					<label for="txtPassword" class="text-muted">Only fill it when you need to change your password</label><br />

					<label for="cobCountry" class="mt-2">Country</label>
					<asp:DropDownList ID="cobCountry" DataSourceID="countryXMLDS" runat="server" DataValueField="handle" DataTextField="handle" AutoPostBack="False" CssClass="form-control" ValidationGroup="updateprof"></asp:DropDownList>
					<asp:XmlDataSource ID="countryXMLDS" runat="server" DataFile="../Content/countries.xml" XPath="countries/country"></asp:XmlDataSource>

					<div style="border-top:1px solid grey">
						<label for="txtPassword" class="mt-2">Current Password</label>
						<asp:RequiredFieldValidator ID="CurrPassValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtCurrPassword" Display="Dynamic" ValidationGroup="updateprof"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{8,26}" runat="server" ErrorMessage="<br/><i>Error:</i> Password must be between 8 to 26 characters." ControlToValidate="txtCurrPassword" Display="Dynamic" ValidationGroup="updateprof"></asp:RegularExpressionValidator><br />
						<asp:TextBox ID="txtCurrPassword" TextMode="Password" runat="server" Cssclass="form-control" ValidationGroup="updateprof"></asp:TextBox>
						<label for="txtCurrPassword" class="text-muted">Enter your current password to save changes</label><br />
					</div>
					
					<asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn launchr-btn" ValidationGroup="updateprof" CausesValidation="true" OnClick="btnUpdate_Click"/>
					<div id="errorMsgBox" class="d-none" role="dialog">
						<div class="mt-3" runat="server">
							<div class="alert alert-danger" id="errorMsgBoxInner">
								<div id="errorMsg"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$("#<%= btnUpdate.ClientID %>").click(function () {
		var fullname = $("#<%= txtName.ClientID %>").val();
		var username = $("#<%= txtUsername.ClientID %>").val();
		var email = $("#<%= txtEmail.ClientID %>").val();
		var hpno = $("#<%= txtPhone.ClientID %>").val(); 
		var address = $("#<%= txtAddress.ClientID %>").val();
		var newPW = $("#<%= txtPassword.ClientID %>").val();
		var country = $("#<%= txtPassword.ClientID %>").val();
		var currPW = $("#<%= txtCurrPassword.ClientID %>").val();
		var updateDetails = {
			"fullname": fullname,
			"username": username,
			"email": email,
			"hpno": hpno,
			"address": address,
			"newPW": newPW,
			"country": country,
			"currPW": currPW
		};
		$.ajax({
			type: 'POST',
			url: 'edit-profile.aspx/editProfile',
			data: JSON.stringify(updateDetails),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox(2, "Profile successfully updated!");
				}
				else {
					generateInfoMsgBox(1, "An error occured.");
				}
			},
			error: function (resp) {
				generateInfoMsgBox(1, "AJAX Error");
			}
		});
	})

	function generateInfoMsgBox(type, message) {
		if (type == 1) {
			//alert-danger
			$("#errorMsgBoxInner").removeClass("alert-success");
			$("#errorMsgBox").removeClass("d-none");
			$("#errorMsgBoxInner").addClass("alert-danger");
			$("#errorMsg").html(message);
		}
		else {
			//alert-success
			$("#errorMsgBoxInner").removeClass("alert-danger");
			$("#errorMsgBox").removeClass("d-none");
			$("#errorMsgBoxInner").addClass("alert-success");
			$("#errorMsg").html(message);
		}
	}
</script>
</asp:Content>
