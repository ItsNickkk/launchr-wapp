<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="Launchr.pages.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>404 Error</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid">
		<div class="row pt-5 pb-5" style="height: 55vh">
			<div class="col-xl-4 offset-xl-4 neumorph p-5">
				<h1>Oh Snap!</h1>
				<p>Looks like you've reached the unknown side of the site.</p>
				<h5>What you can do:</h5>
				<ul>
					<li>Check your URL, make sure it's correct.</li>
					<li>Make sure you have the permission to access the page</li>
					<li>Go back to <a href="home.aspx">home</a></li>
				</ul>
			</div>
		</div>
	</div>
</asp:Content>
