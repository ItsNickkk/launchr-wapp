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
	//Member Ban
	$("#memberTable").on('click', '.btnBanUser', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'ban-user-admin.aspx/banMember',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox2(1, username + " is now banned", 2);
					btn.removeClass("btnBanUser");
					btn.addClass("btnUnbanUser");
					btn.html("Unban User");
				}
				else {
					generateInfoMsgBox2(1, "An error occured when trying to ban " + username, 1);
				}
			},
			error: function (resp) {
				generateInfoMsgBox2(1, "AJAX Error", 1);
			}
		});
	});

	$("#memberTable").on('click', '.btnUnbanUser', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'ban-user-admin.aspx/unbanMember',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox2(1, username + " is now unbanned", 2);
					btn.removeClass("btnUnbanUser");
					btn.addClass("btnBanUser");
					btn.html("Ban User");
				}
				else {
					generateInfoMsgBox2(1, "An error occured when trying to ban " + username, 1);
				}
			},
			error: function (resp) {
				generateInfoMsgBox2(1, "AJAX Error", 1);
			}
		});
	});
	//Creator Ban
	$("#creatorTable").on('click', '.btnBanUser', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'ban-user-admin.aspx/banCreator',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox2(0, username + " is now banned", 2);
					btn.removeClass("btnBanUser");
					btn.addClass("btnUnbanUser");
					btn.html("Unban User");
				}
				else {
					generateInfoMsgBox2(0, "An error occured when trying to ban " + username, 1);
				}
			},
			error: function (resp) {
				generateInfoMsgBox2(0, "AJAX Error", 1);
			}
		});
	});

	$("#creatorTable").on('click', '.btnUnbanUser', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'ban-user-admin.aspx/unbanCreator',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox2(0, username + " is now unbanned", 2);
					btn.removeClass("btnUnbanUser");
					btn.addClass("btnBanUser");
					btn.html("Ban User");
				}
				else {
					generateInfoMsgBox2(0, "An error occured when trying to ban " + username, 1);
				}
			},
			error: function (resp) {
				generateInfoMsgBox2(0, "AJAX Error", 1);
			}
		});
	});

	function generateInfoMsgBox2(type, message, status) {
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

});
