<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="create-project.aspx.cs" Inherits="Launchr.pages.WebForm6" %>
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

	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	});
	
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col neumorph p-3">
					<h1>Create new project</h1>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col neumorph p-3">
					<label for="filPhoto" class="mt-2">Upload Cover Images</label>
					<asp:FileUpload ID="filPhoto" runat="server" cssclass="form-control" AllowMultiple="true"/>

					<label for="txtTitle" class="mt-2" data-toggle="tooltip" title="Make an attractive title" data-placement="right">Title</label>
					<asp:TextBox ID="txtTitle" runat="server" Cssclass="form-control" MaxLength="55"></asp:TextBox>

					<label for="txtDate" class="mt-2" data-toggle="tooltip" title="End date of your project" data-placement="right">Time End</label>
					<asp:TextBox ID="txtDate" runat="server" TextMode="date" Cssclass="form-control"></asp:TextBox>

					<label for="txtDescription" class="mt-2" data-toggle="tooltip" title="Make a short and concise description to attract people" data-placement="right">Project Description</label>
					<asp:TextBox ID="txtDescription" runat="server" Cssclass="form-control" MaxLength="140"></asp:TextBox>

					<label for="txtContent" class="mt-2" data-toggle="tooltip" title="Describe your project, with passion!" data-placement="right">Project Content</label>
					<asp:TextBox TextMode="MultiLine" ID="txtContent" runat="server" Cssclass="form-control"></asp:TextBox>
					<!--https://github.com/Ionaru/easy-markdown-editor#how-to-use-->
					<div class="row">
						<div class="col">
							<label for="cobTopic" class="mt-2">Project Topic</label>
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
						</div>
						<div class="col">
							<label for="txtTarget" class="mt-2">Project Target</label>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">$</span>
								</div>
								<asp:TextBox ID="txtTarget" runat="server" Cssclass="form-control text-right" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
					</div>
					
					


					

					<asp:Button ID="btnCreateProject" runat="server" Text="Next" CssClass="btn launchr-btn mt-3" OnClick="btnCreateProject_Click"/>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var easyMDE = new EasyMDE({ element: document.getElementById('content_txtContent') });
</script>
	
</div>
</asp:Content>
