<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Admin.Master" AutoEventWireup="true" CodeBehind="ban-user-admin.aspx.cs" Inherits="Launchr.pages.ban_user_admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
				<div class="row">
					<div class="col xl-12 neumorph p-3">
						<h1>Ban Member</h1>
						<p class="mb-0">Stop accounts from logging in to this website</p>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col xl-12 neumorph p-3">
						<ul class="nav nav-tabs">
							<li class="nav-item">
								<a class="nav-link active project-tab p-3" data-toggle="tab" href="#member">Member</a>
							</li>
							<li class="nav-item">
								<a class="nav-link project-tab p-3" data-toggle="tab" href="#creator">Creator</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active show pt-3" id="member">
								<h3>Search member</h3>
								<p class="mb-0">Search for the member account that you wish to ban.</p>
								<input type="text" id="txtSearchMember" class="form-control" placeholder="Type to search">

								<div id="errorMsgBoxMember" class="d-none" role="dialog">
									<div class="mt-3" runat="server">
										<div class="alert alert-danger" id="errorMsgBoxInnerMember">
											<div id="errorMsgMember"></div>
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
									<tbody id="memberTable">
                                        <asp:PlaceHolder ID="plcUserList" runat="server"></asp:PlaceHolder>
									<%--<tr>
										<th scope="row" class="text-right">1</th>
										<td>a</td>
										<td>Column content</td>
										<td>Column content</td>
										<td class="text-center"><button type="button" class="btnBanUser launchr-btn btn p-2 btnBanUser">Ban User</button></td>
									</tr>
									<tr>
										<th scope="row" class="text-right">2</th>
										<td>bt</td>
										<td>Column content</td>
										<td>Column content</td>
										<td class="text-center"><button type="button" class="btnUnbanUser launchr-btn btn p-2 btnUnbanUser">Unban User</button></td>
									</tr>--%>
									</tbody>
								</table>
								<div class="row">
									<div class="col text-center">
										<button type="button" class="btn launchr-btn" id="see-more-btn-member">See More</button>
									</div>
								</div>		
							</div>
							<div class="tab-pane fade in pt-3" id="creator">
								<h3>Search Creator</h3>
								<p class="mb-0">Search for the creator account that you wish to ban.</p>
								<input type="text" id="txtSearchCreator" class="form-control" placeholder="Type to search">

								<div id="errorMsgBoxCreator" class="d-none" role="dialog">
									<div class="mt-3" runat="server">
										<div class="alert alert-danger" id="errorMsgBoxInnerCreator">
											<div id="errorMsgCreator"></div>
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
									<tbody id="creatorTable">
                                        <asp:PlaceHolder ID="plcCreatorList" runat="server"></asp:PlaceHolder>
									<%--<tr>
										<th scope="row" class="text-right">1</th>
										<td>a</td>
										<td>Column content</td>
										<td>Column content</td>
										<td class="text-center"><button type="button" class="btnBanUser launchr-btn btn p-2 btnBanUser">Ban User</button></td>
									</tr>
									<tr>
										<th scope="row" class="text-right">2</th>
										<td>bt</td>
										<td>Column content</td>
										<td>Column content</td>
										<td class="text-center"><button type="button" class="btnUnbanUser launchr-btn btn p-2 btnUnbanUser">Unban User</button></td>
									</tr>--%>
									</tbody>
								</table>
								<div class="row">
									<div class="col text-center">
										<button type="button" class="btn launchr-btn" id="see-more-btn-creator">See More</button>
									</div>
								</div>				
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		function generateInfoMsgBox(type, message, status) {
			var errorMsgBoxInner;
			var errorMsgBox;
			var errorMsg;

			if (type == 1) {
				errorMsgBoxInner = $("#errorMsgBoxInnerMember");
				errorMsgBox = $("#errorMsgBoxMember");
				errorMsg = $("#errorMsgMember");
			}
			else {
				errorMsgBoxInner = $("#errorMsgBoxInnerCreator");
				errorMsgBox = $("#errorMsgBoxCreator");
				errorMsg = $("#errorMsgCreator");
			}
			if (status == 1) {
				//alert-danger
				errorMsgBoxInner.removeClass("alert-success");
				errorMsgBox.removeClass("d-none");
				errorMsgBoxInner.addClass("alert-danger");
				errorMsg.html(message);
			}
			else {
				//alert-success
				errorMsgBoxInner.removeClass("alert-danger");
				errorMsgBox.removeClass("d-none");
				errorMsgBoxInner.addClass("alert-success");
				errorMsg.html(message);
			}
		}

		var trsm = $("#userTable tr");
		var trsc = $("#userTable tr");
		var trsmLength = trsm.length;
		var trscLength = trsc.length;
		var currentIndex = 10;

		trsm.hide();
		trsm.slice(0, 10).show();
		trsc.hide();
		trsc.slice(0, 10).show();
		checkButton();

		$("#see-more-btn-member").click(function (e) {
			e.preventDefault();
			$("#memberTable tr").slice(currentIndex, currentIndex + 10).show();
			currentIndex += 10;
			checkButton();
		});

		$("#see-more-btn-creator").click(function (e) {
			e.preventDefault();
			$("#creatorTable tr").slice(currentIndex, currentIndex + 10).show();
			currentIndex += 10;
			checkButton();
		});

		function checkButton() {
			var currentLength = $("memberTable tr:visible").length;

			if (currentLength >= trscLength) {
				$("#see-more-btn-member").hide();
			} else {
				$("#see-more-btn-member").show();
			}
		}
		$(document).ready(function () {
			$("#txtSearchMember").on("keyup", function () {
				var value = $(this).val().toLowerCase();
				$("#memberTable tr").filter(function () {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});

			$("#txtSearchCreator").on("keyup", function () {
				var value = $(this).val().toLowerCase();
				$("#creatorTable tr").filter(function () {
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
				});
			});

			$("#memberTable").on('click', '.btnBanUser', function () {
				console.log("hi");
				var currentRow = $(this).closest("tr");
				var userID = currentRow.find("th:eq(0)").html();
				var username = currentRow.find("td:eq(2)").html();
				$.ajax({
					type: 'POST',
					url: 'ban-user-admin.aspx/banMember',
					data: JSON.stringify({ "userID": userID }),
					dataType: 'json',
					contentType: 'application/json; charset=utf-8',
					success: function (resp) {
						if (resp.d == 1) {
							generateInfoMsgBox(1, username + " is now banned", 2);
						}
						else {
							generateInfoMsgBox(1, "An error occured when trying to ban " + username, 1);
						}		
					},
					error: function (resp) {
						generateInfoMsgBox(1, "AJAX Error", 1);
					}
				});
			});

			$("#memberTable").on('click', '.btnUnbanUser', function () {
				var currentRow = $(this).closest("tr");
				var userID = currentRow.find("th:eq(0)").html();
				var username = currentRow.find("td:eq(2)").html();
				$.ajax({
					type: 'POST',
					url: 'ban-user-admin.aspx/unbanMember',
					data: JSON.stringify({ "userID": userID }),
					dataType: 'json',
					contentType: 'application/json; charset=utf-8',
					success: function (resp) {
						if (resp.d == 1) {
							generateInfoMsgBox(1, username + " is now unbanned", 2);
						}
						else {
							generateInfoMsgBox(1, "An error occured when trying to ban " + username, 1);
						}
					},
					error: function (resp) {
						generateInfoMsgBox(1, "AJAX Error", 1);
					}
				});
			});

			$("#creatorTable").on('click', '.btnBanUser', function () {
				var currentRow = $(this).closest("tr");
				var userID = currentRow.find("th:eq(0)").html();
				var username = currentRow.find("td:eq(2)").html();
				$.ajax({
					type: 'POST',
					url: 'ban-user-admin.aspx/banCreator',
					data: JSON.stringify({ "userID": userID }),
					dataType: 'json',
					contentType: 'application/json; charset=utf-8',
					success: function (resp) {
						if (resp.d == 1) {
							generateInfoMsgBox(0, username + " is now banned", 2);
						}
						else {
							generateInfoMsgBox(0, "An error occured when trying to ban " + username, 1);
						}
					},
					error: function (resp) {
						generateInfoMsgBox(0, "AJAX Error", 1);
					}
				});
			});

			$("#creatorTable").on('click', '.btnUnbanUser', function () {
				var currentRow = $(this).closest("tr");
				var userID = currentRow.find("th:eq(0)").html();
				var username = currentRow.find("td:eq(2)").html();
				$.ajax({
					type: 'POST',
					url: 'ban-user-admin.aspx/unbanCreator',
					data: JSON.stringify({ "userID": userID }),
					dataType: 'json',
					contentType: 'application/json; charset=utf-8',
					success: function (resp) {
						if (resp.d == 1) {
							generateInfoMsgBox(0, username + " is now unbanned", 2);
						}
						else {
							generateInfoMsgBox(0, "An error occured when trying to ban " + username, 1);
						}
					},
					error: function (resp) {
						generateInfoMsgBox(0, "AJAX Error", 1);
					}
				});
			});

			

		});

	</script>
</asp:Content>
