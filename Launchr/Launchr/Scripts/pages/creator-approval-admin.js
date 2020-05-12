var trs = $("#pendingCreatorTable tr");
var trsLength = trs.length;
var currentIndex = 10;
//See more rows
$("#see-more-btn").click(function (e) {
	e.preventDefault();
	$("#pendingCreatorTable tr").slice(currentIndex, currentIndex + 10).show();
	currentIndex += 10;
	checkButton();
});
//Check how many rows, hide button if under 10 lows
function checkButton() {
	var currentLength = $("#pendingCreatorTable tr:visible").length;

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
	$("#pendingCreatorTable").on('click', '.btnApprove', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'creator-approval-admin.aspx/approveCreator',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox(2, "Application of creator account " + username + " has been approved");
					btn.closest("tr").remove();

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

	$("#pendingCreatorTable").on('click', '.btnReject', function () {
		var currentRow = $(this).closest("tr");
		var userID = currentRow.find("th:eq(0)").html();
		var username = currentRow.find("td:eq(2)").html();
		var btn = $(this);
		$.ajax({
			type: 'POST',
			url: 'creator-approval-admin.aspx/rejectCreator',
			data: JSON.stringify({ "userID": userID }),
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			success: function (resp) {
				if (resp.d == 1) {
					generateInfoMsgBox(2, "Application of creator account " + username + " has been rejected");
					btn.closest("tr").remove();
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