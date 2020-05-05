﻿<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="create-project.aspx.cs" Inherits="Launchr.pages.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://unpkg.com/easymde/dist/easymde.min.css">
<script src="https://unpkg.com/easymde/dist/easymde.min.js"></script>
<script type="text/javascript">
function allowOnlyNumber(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
	}

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container">

	<label for="filPhoto">Upload Cover Images</label>
	<asp:FileUpload ID="filPhoto" runat="server" cssclass="form-control" AllowMultiple="true"/>

	<label for="txtTitle">Title</label>
	<asp:TextBox ID="txtTitle" runat="server" Cssclass="form-control" MaxLength="55"></asp:TextBox>

	<label for="txtDate">Time End</label>
	<asp:TextBox ID="txtDate" runat="server" TextMode="date" Cssclass="form-control"></asp:TextBox>

	<label for="txtDescription">Project Description</label>
	<asp:TextBox ID="txtDescription" runat="server" Cssclass="form-control" MaxLength="140"></asp:TextBox>

	<label for="txtContent">Project Content</label>
	<asp:TextBox TextMode="MultiLine" ID="txtContent" runat="server" Cssclass="form-control"></asp:TextBox>
	<!--https://github.com/Ionaru/easy-markdown-editor#how-to-use-->

	<label for="cobTopic">Project Topic</label>
	<asp:DropDownList ID="cobTopic" runat="server" AutoPostBack="False" CssClass="form-control">
		<asp:ListItem Text="Art" Value="art"></asp:ListItem>
		<asp:ListItem Text="Design" Value="design"></asp:ListItem>
		<asp:ListItem Text="Technology" Value="tech"></asp:ListItem>
		<asp:ListItem Text="Film" Value="film"></asp:ListItem>
		<asp:ListItem Text="Food & Craft" Value="foodcraft"></asp:ListItem>
		<asp:ListItem Text="Games" Value="games"></asp:ListItem>
		<asp:ListItem Text="Music" Value="music"></asp:ListItem>
		<asp:ListItem Text="Publishing" Value="publishing"></asp:ListItem>
		<asp:ListItem Text="Everything Else" Value="others"></asp:ListItem>
	</asp:DropDownList>
	<script>
		var easyMDE = new EasyMDE({ element: document.getElementById('content_txtContent') });
	</script>

	<label for="txtTarget">Project Target</label>
	<asp:TextBox ID="txtTarget" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>

	<asp:Button ID="btnCreateProject" runat="server" Text="Add Project" CssClass="btn launchr-btn" OnClick="btnCreateProject_Click"/>
</div>
</asp:Content>
