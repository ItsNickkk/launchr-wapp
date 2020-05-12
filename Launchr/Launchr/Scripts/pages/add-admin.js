var trs = $("#userTable tr");
var trsLength = trs.length;
var currentIndex = 10;
//See more rows
$("#see-more-btn").click(function (e) {
	e.preventDefault();
	$("#userTable tr").slice(currentIndex, currentIndex + 10).show();
	currentIndex += 10;
	checkButton();
});
//Check how many rows, hide button if under 10 lows
function checkButton() {
	var currentLength = $("#userTable tr:visible").length;

	if (currentLength >= trsLength) {
		$("#see-more-btn").hide();
	} else {
		$("#see-more-btn").show();
	}
}
$(document).ready(function () {
	trs.hide();
	trs.slice(0, 10).show();
	checkButton();

	//Search function
	$("#txtSearch").on("keyup", function () {
		var value = $(this).val().toLowerCase();
		$("#userTable tr").filter(function () {
			$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
		});
	});

	//Assign Admin
	$("#userTable").on('click', '.btnAssignAdmin', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'add-admin.aspx/assignAdmin',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox(2, "Admin privilege granted to " + username);
					$(this).removeClass("btnAssignAdmin");
					$(this).addClass("btnUnassignAdmin");
					$(this).html("Unassign Admin");
					btn.removeClass("btnAssignAdmin");
					btn.addClass("btnUnassignAdmin");
					btn.html("Unassign Admin");
				}
				else {
					generateInfoMsgBox(1, "An error occured");
				}
			},
			error: function (resp) {
				generateInfoMsgBox(1, "AJAX Error");
			}
		});
	});

	//Unassign Admin
	$("#userTable").on('click', '.btnUnassignAdmin', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'add-admin.aspx/unassignAdmin',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox(2, "Admin privilege revoked from " + username);
					btn.removeClass("btnUnassignAdmin");
					btn.addClass("btnAssignAdmin");
					btn.html("Assign As Admin");
				}
				else {
					generateInfoMsgBox(1, "An error occured");
				}
			},
			error: function (resp) {
				generateInfoMsgBox(1, "AJAX Error");
			}
		});
	});



});