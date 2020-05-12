$(document).ready(function () {
	if ($("#content_txtUserID").val() == "") {
		$(".pledge-tier-btn").attr("data-target", "#sign-in-info");
		$(".pledge-without-reward").attr("data-target", "#sign-in-info");
	}

	$('#content_txtCommentReplyPointer').val("this project");
	$(".reply-btn").click(function () {
		id = $(this).parent().parent().parent().parent().attr('id');
		$('#content_txtCommentReplyPointer').val(id);
	});

	$(".clear-comment-pointer-btn").click(function () {
		$('#content_txtCommentReplyPointer').val("this project");
	});

	$(".tier-card").on('click', '.pledge-tier-btn', function () {
		var tierID = $(this).siblings(".tier-id").val();
		var tierName = $(this).siblings(".pledge-title").html();
		var tierPrice = $(this).siblings(".pledge-amount").html();
		$("#txtTierIDModal").val(tierID);
		$("#txtTierNameModal").val(tierName);
		$("#txtTierPriceModal").val(tierPrice);
	});

	$("#btnConfirmPayModal").click(function () {
		if ($("#txtTierIDModal").val().slice(0, 1) == 3) {
			//Pledge without reward
			var backerID = $("#content_txtUserID").val();
			var projID = $("#txtTierIDModal").val();
			var amount = $("#txtTierPriceModal").val().substring(1);
			$.ajax({
				type: 'POST',
				url: 'project.aspx/pledgeTierNoReward',
				data: JSON.stringify({ "backerID": backerID, "projID": projID, "amount": amount }),
				dataType: 'json',
				contentType: 'application/json; charset=utf-8',
				success: function (resp) {
					console.log(resp);
					if (resp.d == 1) {
						$('#tier-pledge-modal-success').modal('show');
						console.log("proj");
						setTimeout(location.reload.bind(location), 3000);
					}
					else {
						generateInfoMsgBox(1, "An Error Occured!");
					}

				},
				error: function (resp) {
					generateInfoMsgBox(1, "AJAX Error");
				}
			});
		}
		else {
			var tierID = $("#txtTierIDModal").val();
			var backerID = $("#content_txtUserID").val();
			$.ajax({
				type: 'POST',
				url: 'project.aspx/pledgeTier',
				data: JSON.stringify({ "backerID": backerID, "tierID": tierID }),
				dataType: 'json',
				contentType: 'application/json; charset=utf-8',
				success: function (resp) {
					console.log(resp)
					if (resp.d == 1) {
						$('#tier-pledge-modal-success').modal('show');
						setTimeout(location.reload.bind(location), 3000);
						console.log("tier");
					}
					else {
						generateInfoMsgBox(1, "An Error Occured!");
					}

				},
				error: function (resp) {
					generateInfoMsgBox(1, "AJAX Error");
				}
			});
		}
	});

	$(".tier-card").on('click', '.pledge-without-reward', function () {
		var projID = GetURLParameter('id');
		var amount = $(this).siblings(".no-reward").val();
		$("#txtTierIDModal").val(projID);
		$("#txtTierNameModal").val("no rewards");
		$("#txtTierPriceModal").val("$" + amount);
	});
});
$(document).on('show.bs.modal', '.modal', function () {
	var zIndex = 1040 + (10 * $('.modal:visible').length);
	$(this).css('z-index', zIndex);
	setTimeout(function () {
		$('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
	}, 0);
});

function allowOnlyNumber(evt) {
	var charCode = (evt.which) ? evt.which : event.keyCode
	if (charCode > 31 && (charCode < 48 || charCode > 57))
		return false;
	return true;
}