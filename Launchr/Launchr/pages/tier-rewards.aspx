<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="tier-rewards.aspx.cs" Inherits="Launchr.pages.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="https://unpkg.com/easymde/dist/easymde.min.css">
<script src="https://unpkg.com/easymde/dist/easymde.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="container-fluid">
	<div class="row">
		<div class="col-xl-10 offset-xl-1 pt-5 pb-5">
			<div class="row">
				<div class="col neumorph p-3">
					<h1>Create new project</h1>
					<h3>Step 2: Create tier rewards for your project</h3>
				</div>
			</div>
			<div id="tier-list">
				<div class="row pt-3">
					<div class="col-xl-4 offset-xl-4">
						<div class="p-4 tier-card neumorph">
							<div class="pleg">
								<h4>Pledge without a tier reward</h4>
								<asp:TextBox ID="txtTierNoReward" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)" ReadOnly="true"></asp:TextBox>
								<asp:Button runat="server" Text="Pledge" CssClass="btn mt-3 launchr-btn pledge-btn" Enabled="false"/>
							</div>						
						</div>
					</div>		
				</div>
			</div>

			<div class="row mt-3">
				<div class="col neumorph p-3">
					<asp:TextBox ID="txtProjectID" runat="server" Cssclass="form-control d-none" ReadOnly="true" Text="600003"></asp:TextBox>				

					<label for="content_txtTierTitle" class="mt-2" data-toggle="tooltip" title="Make an attractive title" data-placement="right">Title</label>
					<asp:RequiredFieldValidator ID="createProjTitleReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTierTitle" Display="Dynamic" ValidationGroup="createTier"></asp:RequiredFieldValidator>
					<asp:TextBox ID="txtTierTitle" runat="server" Cssclass="form-control" MaxLength="55"></asp:TextBox>
					<label for="content_txtTitle" class="text-muted">Maximum length: 55</label><br/>

					<div class="row">
						<div class="col">
							<label for="txtTierValue" class="mt-2" data-placement="right">Tier Price</label>
							<asp:RequiredFieldValidator ID="createTierValueReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTierValue" Display="Dynamic" ValidationGroup="createTier"></asp:RequiredFieldValidator>
							<div class="input-group mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">$</span>
								</div>
								<asp:TextBox ID="txtTierValue" runat="server" Cssclass="form-control text-right" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
						<div class="col">
							<label for="content_txtTierMaxNumber" class="mt-2">Tier Quantity</label>
							<asp:TextBox ID="txtTierMaxNumber" runat="server" Cssclass="form-control" ValidationGroup="createTier" onkeypress="return allowOnlyNumber(event);"></asp:TextBox>
						</div>
					</div>

					<label for="content_txtTierContentFaux" class="mt-2">Tier Content</label>
					<asp:RequiredFieldValidator ID="createProjContentReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTierContentFaux" Display="Dynamic" ValidationGroup="createTier"></asp:RequiredFieldValidator>
					<asp:TextBox TextMode="MultiLine" ID="txtTierContentFaux" runat="server" Cssclass="form-control"></asp:TextBox>
					<asp:TextBox ID="txtTierContent" runat="server" TextMode="multiline" Cssclass="form-control d-none" ReadOnly="true" ValidationGroup="createTier"></asp:TextBox>

					<button class="launchr-btn btn" onclick="addTier()" type="button">Add Tier</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
	var easyMDE = new EasyMDE({ element: document.getElementById('content_txtTierContentFaux') });
	var combinedTier = new Object();
	var tierNumber = 0;
	

	function allowOnlyNumber(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode
		if (charCode > 31 && (charCode < 48 || charCode > 57))
			return false;
		return true;
	}

	function addTier() {
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
							"<div class=\"progress-bar bg-launchr delete-tier-btn\" role=\"progressbar\" aria-valuenow=\"20\" aria-valuemin=\"0\" aria-valuemax=\"" + quantity + "\" style=\"width: 75 %\"></div></div>",
			"<p>0 out of " + quantity + " slots left</p>",
			"<input type=\"text\" readonly class=\"tempID d-none\" value=\"" + tierNumber + "\"/>",
			"<button onclick=\"deleteTier(this);\" type=\"button\" class=\"btn mt-3 launchr-btn pledge-btn delete-tier-btn\">Remove this Tier</button></div></div></div>"
		);
		$('#tier-list').append(newTier.join(""));
		buildTierDict(title, price, quantity, content);
	}

	function deleteTier(elem) {
		var tierNumber = $(elem).siblings("input").val();
		$(elem).parent().remove();
		delete combinedTier[tierNumber];
	}

	function buildTierDict(tierTitle, tierPrice, tierQuantity, tierContent){
		var tempTier = {
			"title": tierTitle,
			"price": tierPrice,
			"quantity": tierQuantity,
			"content": tierContent,
		};
		combinedTier[tierNumber] = tempTier;
		tierNumber = tierNumber + 1;
	}

	function saveTier() {
		/*
		$.ajax({
			type: "POST",
			url: "tier-rewards.aspx/addTier";

		});*/
	}


</script>
</asp:Content>