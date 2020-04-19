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
				<label for="email-register">New to Launch:r? Enter email below to continue</label>
				<input type="email" id="email-register" class="form-control" placeholder="Email"/>
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
							<div class="modal-body">
								<p>Let us know more about you.</p>


							</div>
							<div class="modal-footer">
								<button type="button" class="btn join-sign-up-btn">Save changes</button>
								<button type="button" class="btn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</asp:Content>
