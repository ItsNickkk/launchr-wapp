$(document).ready(function () {
	if ($("#content_txtUserID").val() == "") {
		$(".pledge-tier-btn").attr("data-target", "#sign-in-modal");
		$(".pledge-without-reward").attr("data-target", "#sign-in-modal");
	}
	if ($("#content_txtUserID").val().slice(0, 1) == "2") {
		$(".pledge-tier-btn").attr("data-toggle", "tooltip");
		$(".pledge-tier-btn").attr("data-placement", "right");
		$(".pledge-tier-btn").attr("title", "You can only pledge a tier as a normal member.");
		$(".pledge-tier-btn").removeAttr("data-target");
		$(".pledge-tier-btn").attr("disabled", "disabled");

		$(".pledge-without-reward").attr("data-toggle", "tooltip");
		$(".pledge-without-reward").attr("data-placement", "right");
		$(".pledge-without-reward").attr("title", "You can only pledge a tier as a normal member.");
		$(".pledge-without-reward").removeAttr("data-target");
		$(".pledge-without-reward").attr("disabled", "disabled");
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
		if (checkAllCCField($(this)) == true) {
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
		}
		else {
			generateInfoMsgBox(1, "Please correct all the error fields.")
		}

	});

	$(".tier-card").on('click', '.pledge-without-reward', function () {
		var projID = GetURLParameter('id');
		var amount = $(this).siblings(".no-reward").val();
		if (amount == "" || amount < 1) {
			$(this).siblings(".no-reward").addClass("animate__animated");
			$(this).siblings(".no-reward").addClass("animate__headShake");
			$(this).siblings(".no-reward").addClass("is-invalid");
			$(this).siblings(".invalid-feedback").removeClass("d-none");
		}
		else {
			$(this).siblings(".no-reward").removeClass("is-invalid");
			$(this).siblings(".invalid-feedback").addClass("d-none");
			$(this).siblings(".no-reward").removeClass("animate__animated");
			$(this).siblings(".no-reward").removeClass("animate__headShake");
			$("#txtTierIDModal").val(projID);
			$("#txtTierNameModal").val("no rewards");
			$("#txtTierPriceModal").val("$" + amount);
			$("#tier-pledge-modal").modal("show");
		}
	});
	$(".tier-card").on('keyup', '.no-reward', function () {
		$(this).removeClass("is-invalid");
		$(this).siblings(".invalid-feedback").addClass("d-none");
		$(this).removeClass("animate__animated");
		$(this).removeClass("animate__headShake");
	});
	$(".card-number-row").on('blur', '.card-details', function () {
		checkCCValue(4, $(this));
	});

	$(".card-expiry-date-col").on('blur', '.card-details', function () {
		checkCCValue(2, $(this));
	});

	$(".card-cvv-col").on('blur', '.card-details', function () {
		checkCCValue(3, $(this));
	});

	$(".card-name-col").on('blur', '.card-details', function () {
		checkCCValue(1, $(this));
	});

	$("body").tooltip({
		selector: '[data-toggle="tooltip"]'
	});
	console.log($(".end-date").html().slice(-1));

	if ($(".end-date").html().length == 50) {
		console.log($(".end-date").html());
		$(".pledge-btn").attr("disabled", "disabled");
		$(".pledge-btn").attr("data-toggle", "tooltip");
		$(".pledge-btn").attr("data-placement", "bottom");
		$(".pledge-btn").attr("title", "Campaign ended, you can't back this project anymore");

	};
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

function checkCCValue(length, obj) {
	if (obj.val().length < length) {
		obj.addClass("is-invalid");
		obj.attr("data-toggle", "tooltip");
		obj.attr("data-placement", "bottom");
		obj.attr("title", "Invalid field value");
		if (obj.hasClass("not-completed") == false) {
			obj.addClass("not-completed");
		}
	}
	else {
		obj.removeClass("is-invalid");
		obj.removeClass("not-completed");
		obj.removeAttr("data-toggle", "tooltip");
		obj.removeAttr("data-placement", "bottom");
		obj.removeAttr("title", "Invalid field value");
	}
}

function checkAllCCField(obj) {
	if (obj.parent().parent().find('.not-completed').length !== 0){
		return false;
	}
	else {
		return true;
	}
}