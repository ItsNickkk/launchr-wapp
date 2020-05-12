<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="project-control-panel.aspx.cs" Inherits="Launchr.pages.WebForm9" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://unpkg.com/easymde/dist/easymde.min.css">
<script src="https://unpkg.com/easymde/dist/easymde.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col xl-12 neumorph p-3">
					<h1>Project Control Panel</h1>
					<p class="mb-0">Your project at a glance</p>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col xl-12 pl-0 pr-0">
					<ul class="nav nav-tabs">
						<li class="nav-item">
							<a class="nav-link active project-tab p-3" data-toggle="tab" href="#edit-project">Edit Project</a>
						</li>
						<li class="nav-item">
							<a class="nav-link project-tab p-3" data-toggle="tab" href="#project-backer">Project Backer</a>
						</li>
					</ul>
					<div class="tab-content border">
						<div class="tab-pane fade active show project-details neumorph p-3" id="edit-project">
							<label for="txtTitle" class="mt-2" data-toggle="tooltip" title="Make an attractive title" data-placement="right">Title</label>
							<asp:RequiredFieldValidator ID="createProjTitleReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTitle" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
							<asp:TextBox ID="txtTitle" runat="server" Cssclass="form-control" MaxLength="55"></asp:TextBox>
							<label for="content_txtTitle" class="text-muted">Maximum length: 55</label><br/>

							<label for="content_txtDescription" class="mt-2" data-toggle="tooltip" title="Make a short and concise description to attract people" data-placement="right">Project Description</label>
							<asp:RequiredFieldValidator ID="createProjDescReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtDescription" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
							<asp:TextBox ID="txtDescription" runat="server" Cssclass="form-control" MaxLength="140"></asp:TextBox>
							<label for="content_txtDescription" class="text-muted">Maximum length: 140</label><br/>

							<label for="txtContentFaux" class="mt-2" data-toggle="tooltip" title="Describe your project, with passion!" data-placement="right">Project Content</label>
							<asp:RequiredFieldValidator ID="createProjContentReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtContent" Display="Dynamic" ValidationGroup="createProj"></asp:RequiredFieldValidator>
							<asp:TextBox TextMode="MultiLine" ID="txtContentFaux" runat="server" Cssclass="form-control"></asp:TextBox>
							<asp:TextBox ID="txtContent" runat="server" TextMode="multiline" Cssclass="form-control d-none"></asp:TextBox>
							
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
							<asp:Button ID="btnSaveProject" runat="server" Text="Save Changes" CssClass="btn launchr-btn mt-3" OnClick="btnSaveProject_Click"/>
						</div>
						<div class="tab-pane fade project-details neumorph p-3" id="project-backer">
							<div class="row">
								<div class="col">
									<h3>Search</h3>
									<p class="mb-0">Search for specific entries.</p>
									<input type="text" id="txtSearch" class="form-control" placeholder="Type to search">
									<table class="table table-hover mt-3 table-responsive-xl table-striped">
										<thead>
											<tr>
												<th scope="col" class="text-right">ID</th>
												<th scope="col">Name</th>
												<th scope="col">Email</th>
												<th scope="col">Username</th>
												<th scope="col">Address</th>
												<th scope="col">Phone Number</th>
												<th scope="col">Country</th>
												<th scope="col">Tier chose</th>
												<th scope="col">Amount ($)</th>
											</tr>
										</thead>
										<tbody id="backerTable">
											<asp:PlaceHolder ID="plcBackerList" runat="server"></asp:PlaceHolder>
											<!--Arrange in reverse chrono order-->
											<%--<tr>
												<th scope="row" class="text-right">100001</th>
												<td>Potato</td>
												<td>Potato@gmail.com</td>
												<td>potatoslayer1</td>
												<td class="text-break">1, PotatolandqdqwdqwqwdwqddPotatolandqdqwdqwqwdwqddPotatolandqdqwdqwqwdwqddPotatolandqdqwdqwqwdwqddPotatolandqdqwdqwqwdwqdd</td>
												<td>69420</td>
												<td>malaysia</td>
												<td>Tier 1</td>
												<td>$$$</td>
											</tr>--%>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col text-center">
									<button type="button" class="btn launchr-btn" id="see-more-btn">See More</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>				
		</div>
	</div>
</div>
<script type="text/javascript">
	var easyMDE = new EasyMDE({ element: document.getElementById('content_txtContentFaux') });
	$("#txtSearch").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		$("#backerTable tr").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	var trs = $("#backerTable tr");
	var trsLength = trs.length;
	var currentIndex = 10;

	trs.hide();
	trs.slice(0, 10).show();
	checkButton();

	$("#see-more-btn").click(function (e) {
		e.preventDefault();
		$("#backerTable tr").slice(currentIndex, currentIndex + 10).show();
		currentIndex += 10;
		checkButton();
	});

	function checkButton() {
		var currentLength = $("#backerTable tr:visible").length;

		if (currentLength >= trsLength) {
			$("#see-more-btn").hide();
		} else {
			$("#see-more-btn").show();
		}
	}

	$(document).ready(function () {
		
		if (trsLength < 10) {
			$("#see-more-btn").hide();
		}
	});

</script>
</asp:Content>
