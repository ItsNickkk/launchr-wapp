<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="create-project.aspx.cs" Inherits="Launchr.pages.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://unpkg.com/easymde/dist/easymde.min.css">
<script src="https://unpkg.com/easymde/dist/easymde.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col neumorph p-3">
					<h1>Create new project</h1>
					<h3>Step 1: Insert project details</h3>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col neumorph p-3">
					<span class="text-warning">All the fields are mandatory.</span><br />

					<label for="content_filPhoto" class="mt-2" data-toggle="tooltip" title="Choose some attractive photo for your project!" data-placement="right">Upload Cover Images</label>
					<asp:RequiredFieldValidator ID="createProjFileReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="filPhoto" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
					<asp:RegularExpressionValidator id="createProjFileDocumentPDFVal" CssClass="text-danger" errormessage="<br/><i>Invalid file format.</i>" ControlToValidate="filPhoto" ValidationExpression="^.*\.(bmp|BMP|gif|GIF|JPG|jpg|jpeg|JPEG|PNG|png)$" runat="server" Display="Dynamic" ValidationGroup="createProj"/>
					<asp:FileUpload ID="filPhoto" runat="server" cssclass="form-control-file" AllowMultiple="true"/>
					<label for="content_filPhoto" class="text-muted">Maximum number of photos allowed: 6, Supported format: .bmp, .gif, .jpg, .jpeg, .png</label><br/>
					<label for="content_filPhoto" class="text-muted">This field will not be editable in the future.</label><br />

					<label for="txtTitle" class="mt-2" data-toggle="tooltip" title="Make an attractive title" data-placement="right">Title</label>
					<asp:RequiredFieldValidator ID="createProjTitleReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTitle" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtTitle" runat="server" Cssclass="form-control" MaxLength="55"></asp:TextBox>
					<label for="content_txtTitle" class="text-muted">Maximum length: 55</label><br/>

					<label for="content_txtDate" class="mt-2" data-toggle="tooltip" title="End date of your project" data-placement="right">Time End</label>
					<asp:RequiredFieldValidator ID="createProjDateReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtDate" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>				
					<asp:TextBox ID="txtDate" runat="server" TextMode="date" Cssclass="form-control"></asp:TextBox>
					<asp:CompareValidator ID="CompareEndTodayValidator" Operator="GreaterThan" type="date" ControltoValidate="txtDate" ErrorMessage="The 'End Date' must be after today!<br/>" CssClass="text-danger" Display="Dynamic" ValidationGroup="createProj" runat="server" />
					<label for="content_txtDate" class="text-muted">This field will not be editable in the future.</label><br />

					<label for="content_txtDescription" class="mt-2" data-toggle="tooltip" title="Make a short and concise description to attract people" data-placement="right">Project Description</label>
					<asp:RequiredFieldValidator ID="createProjDescReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtDescription" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtDescription" runat="server" Cssclass="form-control" MaxLength="140"></asp:TextBox>
					<label for="content_txtDescription" class="text-muted">Maximum length: 140</label><br/>

					<label for="txtContentFaux" class="mt-2" data-toggle="tooltip" title="Describe your project, with passion!" data-placement="right">Project Content</label>
					<asp:RequiredFieldValidator ID="createProjContentReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtContent" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
					<asp:TextBox TextMode="MultiLine" ID="txtContentFaux" runat="server" Cssclass="form-control"></asp:TextBox>
					<asp:TextBox ID="txtContent" runat="server" TextMode="multiline" Cssclass="form-control d-none"></asp:TextBox>

					<div class="row">
						<div class="col">
							<label for="cobTopic" class="mt-2" data-toggle="tooltip" title="Choose where your project belongs to" data-placement="right">Project Topic</label>
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
							<label for="content_txtTarget" class="mt-2" data-toggle="tooltip" title="How much do you need to launch your project" data-placement="right">Project Target</label>
							<asp:RequiredFieldValidator ID="createProjMoneyReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTarget" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">$</span>
								</div>
								<asp:TextBox ID="txtTarget" runat="server" Cssclass="form-control text-right" onkeypress="return allowOnlyNumber(event);" MaxLength="9"></asp:TextBox>
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
							<label for="content_txtTarget" class="text-muted">This field will not be editable in the future.</label><br/>
						</div>
					</div>
					<asp:Button ID="btnCreateProject" runat="server" Text="Next" CssClass="btn launchr-btn mt-3" OnClick="btnCreateProject_Click" ValidationGroup="createProj"/>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="../Scripts/pages/create-project.js"></script>
</asp:Content>
