<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Admin.Master" AutoEventWireup="true" CodeBehind="summary-admin.aspx.cs" Inherits="Launchr.pages.summary_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<% User user = (User)this.Session["user"]; %>
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col xl-12 neumorph p-3">
					<h1>Admin Panel</h1>
					<p class="mb-0">Welcome back, <%// Response.Write(user.name); %></p>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col xl-12 neumorph p-3">
					<div class="row pl-3">
						<h3>Navigation</h3>
					</div>
					<div class="row">
						<div class="col-xl text-center">
							<div class="admin-navigation m-auto">
								<a href="#Summary" class="text-decoration-none"><img src="../Content/Logo/icons/summary.svg" /><h5>Summary</h5></a>
							</div>
						</div>
						<div class="col-xl text-center">
							<div class="admin-navigation m-auto">
								<a href="ban-user-admin"><img src="../Content/Logo/icons/ban.svg" /><h5>Ban User</h5></a>
							</div>
						</div>
						<div class="col-xl text-center">
							<div class="admin-navigation m-auto">
								<a href="add-admin"><img src="../Content/Logo/icons/add.svg" /><h5>Add Admin</h5></a>
							</div>
						</div>
						<div class="col-xl text-center">
							<div class="admin-navigation m-auto">
								<a href="creator-approval-admin"><img src="../Content/Logo/icons/approve.svg" /><h5>Approve creator accounts</h5></a>
							</div>
						</div>
						<div class="col-xl text-center">
							<div class="admin-navigation m-auto">
								<a href="home"><img src="../Content/Logo/icons/home.svg" /><h5>Home</h5></a>
							</div>
							
						</div>					
					</div>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col xl-12 neumorph p-3">
					<h3>Summary</h3>
					<div class="row ml-3 mr-3 p-3 border">
						<div class="col">
							<div class="row">
								<div class="col">
									<h4>Member summary</h4>
								</div>
							</div>
							<div class="row">
								<div class="col-xl text-center">
									<div class="summary-count m-auto">20</div>
									<div>Number of members</div>
								</div>
								<div class="col-xl text-center">
									<div class="summary-count m-auto">20</div>
									<div>Number of members</div>
								</div>
								<div class="col-xl text-center">
									<div class="summary-count m-auto">20</div>
									<div>Number of members</div>
								</div>
							</div>
						</div>
					</div>				
				</div>
			</div>
		</div>
	</div>
</div>
</asp:Content>
