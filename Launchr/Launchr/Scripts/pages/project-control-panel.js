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
	$(".back-to-project").attr("href", "project.aspx?id=" + GetURLParameter('id'));
});
