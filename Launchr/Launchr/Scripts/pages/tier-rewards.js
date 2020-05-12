var easyMDE = new EasyMDE({ element: document.getElementById('content_txtTierContentFaux') });
var combinedTier = new Object();
var tierNumber = 0;
var projID = GetURLParameter('id');

$(document).ready(function () {
	$('#txtProjID').attr("value", projID);
	setInterval(updatetxtContent, 1000);
	$('[data-toggle="tooltip"]').tooltip();
});

function updatetxtContent() {
	document.getElementById('content_txtTierContent').value = easyMDE.value();
}

//Build Tier on the page and store the details in dictionary
function addTier() {
	easyMDE.value();
	if (Page_ClientValidate()) {
		if (Object.keys(combinedTier).length < 10) {
			var newTier = [];
			var title = $("#content_txtTierTitle").val();
			var price = $("#content_txtTierValue").val();
			var quantity = $("#content_txtTierMaxNumber").val();
			var content = easyMDE.value();
			newTier.push(
				"<div class=\"row pt-3\">",
				"<div class=\"col-xl-4 offset-xl-4\">",
				"<div class=\"p-4 tier-card neumorph\">",
				"<h4>" + title + "</h4><h4>" + price + "$</h4>",
				"<p class=\"text-muted\">By pledging amount above you get:</p>",
				"<span><zero-md><template><xmp>",
				content,
				"</xmp></template></span>",
				"<div class=\"progress mt-4\">",
				"<div class=\"progress-bar bg-launchr delete-tier-btn\" role=\"progressbar\" aria-valuenow=\"0\" aria-valuemin=\"0\" aria-valuemax=\"" + quantity + "\" style=\"width: 0%\"></div></div>",
				"<p>0 out of " + quantity + " slots left</p>",
				"<input type=\"text\" readonly class=\"tempID d-none\" value=\"" + tierNumber + "\"/>",
				"<button onclick=\"deleteTier(this);\" type=\"button\" class=\"btn mt-3 launchr-btn pledge-btn delete-tier-btn\">Remove this Tier</button></div></div></div>"
			);
			$('#tier-list').append(newTier.join(""));
			buildTierDict(title, price, quantity, content);
			$("#content_txtTierTitle").val("");
			$("#content_txtTierValue").val("");
			$("#content_txtTierMaxNumber").val("");
			easyMDE.value("");
			generateInfoMsgBox(2, "Tier added! Number of tiers:" + Object.keys(combinedTier).length);
		}
		else {
			generateInfoMsgBox(1, "<i>Error!</i> Only maximum of 10 tier rewards are allowed.");
		}
	}
	else {
		generateInfoMsgBox(1, "<i>Error!</i> Please fill in all the fields.");
	}
}

//Remove unwanted tier
function deleteTier(elem) {
	var tierNumber = $(elem).siblings("input").val();
	$(elem).parent().parent().parent().remove();
	delete combinedTier[tierNumber];
	generateInfoMsgBox(2, "Tier successfully removed.");
}

//Build tier dictionary
function buildTierDict(tierTitle, tierPrice, tierQuantity, tierContent) {
	var projNumber = $("#txtProjID").val();
	var tempTier = {
		"title": tierTitle,
		"value": tierPrice,
		"max_amount": tierQuantity,
		"description": tierContent,
		"project_id": projNumber,
	};
	combinedTier[tierNumber.toString()] = tempTier;
	tierNumber = tierNumber + 1;
}

//final step to save tier
function saveTier() {
	console.log(combinedTier);
	$.ajax({
		type: 'POST',
		url: 'tier-rewards.aspx/saveTiers',
		data: JSON.stringify({ "tiers": combinedTier }),
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
		success: function (resp) {
			window.location.href = "project?id=" + projID;
		},
		error: function (resp) {
			alert("Failure: " + resp);
		}
	});
}

