$(document).ready(function () {
	var txtNameHidden = $("#<%= txtNameHidden.ClientID %>");
	var txtUsernameHidden = $("#<%= txtUsernameHidden.ClientID %>");
	var txtEmailHidden = $("#<%= txtEmailHidden.ClientID %>");
	var txtPhoneHidden = $("#<%= txtPhoneHidden.ClientID %>");
	var txtAddressHidden = $("#<%= txtAddressHidden.ClientID %>");
	var txtPasswordHidden = $("#<%= txtPasswordHidden.ClientID %>");
	var txtCountryHidden = $("#<%= txtCountryHidden.ClientID %>");
	var txtCurrPasswordHidden = $("#<%= txtCurrPasswordHidden.ClientID %>");

	var txtName = $("#<%= txtName.ClientID %>");
	var txtUsername = $("#<%= txtUsername.ClientID %>");
	var txtEmail = $("#<%= txtEmail.ClientID %>");
	var txtPhone = $("#<%= txtPhone.ClientID %>");
	var txtAddress = $("#<%= txtAddress.ClientID %>");
	var txtPassword = $("#<%= txtPassword.ClientID %>");
	var cobCountry = $("#<%= cobCountry.ClientID %> option:selected");
	var txtCurrPassword = $("#<%= txtCurrPassword.ClientID %>");

	txtNameHidden.val(txtName.val());
	txtUsernameHidden.val(txtUsername.val());
	txtEmailHidden.val(txtEmail.val());
	txtPhoneHidden.val(txtPhone.val());
	txtAddressHidden.val(txtAddress.val());
	txtPasswordHidden.val(txtPassword.val());
	txtCountryHidden.val(cobCountry.text());
	txtCurrPasswordHidden.val(txtCurrPasswordHidden.val());

	$(".entry-field").on("keyup", function () {
		txtNameHidden.val(txtName.val());
		txtUsernameHidden.val(txtUsername.val());
		txtEmailHidden.val(txtEmail.val());
		txtPhoneHidden.val(txtPhone.val());
		txtAddressHidden.val(txtAddress.val());
		txtCurrPasswordHidden.val(txtCurrPassword.val());
		txtPasswordHidden.val(txtPassword.val());
		var country = cobCountry.text()
		txtCountryHidden.val($("#<%= cobCountry.ClientID %> option:selected").text());
	});

	$(".entry-field-cob").on("change", function () {
		txtCountryHidden.val($("#<%= cobCountry.ClientID %> option:selected").text());
	});
});
/*
$("#").click(function () {
	var fullname = $("#<%= txtName.ClientID %>").val();
	var username = $("#<%= txtUsername.ClientID %>").val();
	var email = $("#<%= txtEmail.ClientID %>").val();
	var hpno = $("#<%= txtPhone.ClientID %>").val();
	var address = $("#<%= txtAddress.ClientID %>").val();
	var newPW = $("#<%= txtPassword.ClientID %>").val();
	var country = $("#<%= txtPassword.ClientID %> option:selected").val();
	var currPW = $("#<%= txtCurrPassword.ClientID %>").val();
	var updateDetails = {
		"fullname": fullname,
		"username": username,
		"email": email,
		"hpno": hpno,
		"address": address,
		"newPW": newPW,
		"country": country,
		"currPW": currPW
	};
	$.ajax({
		type: 'POST',
		url: 'edit-profile.aspx/editProfile',
		data: JSON.stringify(updateDetails),
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
		success: function (resp) {
			if (resp.d == 1) {
				generateInfoMsgBox(2, "Profile successfully updated!");
			}
			else {
				generateInfoMsgBox(1, "An error occured.");
			}
		},
		error: function (resp) {
			generateInfoMsgBox(1, "AJAX Error");
		}
	});
});
*/
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