﻿	<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Admin.Master" AutoEventWireup="true" CodeBehind="creator-approval-admin.aspx.cs" Inherits="Launchr.pages.creator_approval_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
				<div class="row">
					<div class="col xl-12 neumorph p-3">	
						<div class="row">
							<div class="col">
								<h1>Approve New Creator Account</h1>
								<p class="mb-0">Approve pending creator application</p>
							</div>
							<div class="col text-right">
								<a href="summary-admin" class="btn launchr-btn">Back to Admin panel</a>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col xl-12 neumorph p-3">
						<h3>Search</h3>
						<p class="mb-0">Search for the account that you wish to approve.</p>
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
									<th scope="col" class="text-center">Document</th>
									<th scope="col" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody id="pendingCreatorTable">
                                <asp:PlaceHolder ID="plcPendingCreator" runat="server"></asp:PlaceHolder>
								<%--<tr>
									<th scope="row" class="text-right">200004</th>
									<td>200004</td>
									<td>Column content</td>
									<td>Column content</td>
									<td class="text-center"><button type="button" class="btnViewDoc launchr-btn btn p-2" onclick="window.open('../Content/documents/creator_200004.pdf')">View Document</button></td>
									<td class="text-center">
										<button type="button" data-toggle="tooltip" data-placement="top" title="Approve" class="btnApprove btn-success btn p-2 creator-approval-btn">&#10003;</button>
										<button type="button" data-toggle="tooltip" data-placement="top" title="Reject" class="btnReject btn-danger btn p-2 creator-approval-btn">&#10005;</button>
									</td>
								</tr>
								<tr>
									<th scope="row" class="text-right">2</th>
									<td>bt</td>
									<td>Column content</td>
									<td>Column content</td>
									<td>Column content</td>
									<td class="text-center"><button type="button" class="btnUnassignAdmin btn-danger btn p-2 assign-admin-btn">&times;</button></td>
								</tr>--%>
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
	<script src="../Scripts/pages/creator-approval-admin.js"></script>
</asp:Content>
