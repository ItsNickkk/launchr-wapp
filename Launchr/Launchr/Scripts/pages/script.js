//Display Error Message
function generateInfoMsgBox(type, message) {
	if (type == 1) {
		//alert-danger
		$("#errorMsgBoxInner").removeClass("alert-success");
		$("#errorMsgBox").removeClass("d-none");
		$("#errorMsgBoxInner").addClass("alert-danger");
		$("#errorMsg").html(message);
	}
	else {
		//alert-success
		$("#errorMsgBoxInner").removeClass("alert-danger");
		$("#errorMsgBox").removeClass("d-none");
		$("#errorMsgBoxInner").addClass("alert-success");
		$("#errorMsg").html(message);
	}
}

//Number only validation
function allowOnlyNumber(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
}



//GET paramater
function GetURLParameter(sParam) {
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}
	}
}

$(document).ready(function () {
	$('[data-toggle="tooltip"]').tooltip();
});