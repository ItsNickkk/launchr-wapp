<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Admin.Master" AutoEventWireup="true" CodeBehind="add-admin.aspx.cs" Inherits="Launchr.pages.add_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
				<div class="row">
					<div class="col xl-12 neumorph p-3">
						<h1>Add Admin</h1>
						<p class="mb-0">Assign Admin role to an account</p>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col xl-12 neumorph p-3">
						<h3>Search</h3>
						<p class="mb-0">Search for the account that you wish to assign.</p>
						<input type="text" id="txtSearch" class="form-control" placeholder="Type to search">

						<div id="errorMsgBox" class="d-none" role="dialog">
							<div class="mt-3" runat="server">
								<div class="alert alert-danger" id="errorMsgBoxInner">
									<div id="errorMsg"></div>
								</div>
							</div>
						</div>
						

						<table class="table table-hover mt-3 table-responsive-xl table-striped">
							<thead>
								<tr>
									<th scope="col" class="text-right">ID</th>
									<th scope="col">Name</th>
									<th scope="col">Email</th>
									<th scope="col">Username</th>
									<th scope="col" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody id="userTable">
                                <asp:PlaceHolder ID="plcUserAdminList" runat="server"></asp:PlaceHolder>
								<!--<tr>
									<th scope="row" class="text-right">1</th>
									<td>a</td>
									<td>Column content</td>
									<td>Column content</td>
									<td class="text-center"><button type="button" class="btnAssignAdmin launchr-btn btn p-2 assign-admin-btn">Assign as admin</button></td>
								</tr>
								<tr>
									<th scope="row" class="text-right">2</th>
									<td>bt</td>
									<td>Column content</td>
									<td>Column content</td>
									<td class="text-center"><button type="button" class="btnUnassignAdmin launchr-btn btn p-2 assign-admin-btn">Unassign admin</button></td>
								</tr>-->
							</tbody>
						</table>
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
	<script src="../Scripts/pages/script.js"></script>
	<script src="../Scripts/pages/add-admin.js"></script>
</asp:Content>
