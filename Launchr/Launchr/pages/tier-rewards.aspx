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
					<input type="text" class="d-none" id="txtProjID" readonly/>
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
					<span class="text-warning">All the fields are mandatory. <br />Only maximum of 10 tiers are allowed.</span><br />
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
								<asp:TextBox ID="txtTierValue" runat="server" Cssclass="form-control text-right" onkeypress="return allowOnlyNumber(event);" MaxLength="9"></asp:TextBox>
								<div class="input-group-append">
									<span class="input-group-text">.00</span>
								</div>
							</div>
						</div>
						<div class="col">
							<label for="content_txtTierMaxNumber" class="mt-2">Tier Quantity</label>
							<asp:RequiredFieldValidator ID="createTierMaxNumReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTierMaxNumber" Display="Dynamic" ValidationGroup="createTier"></asp:RequiredFieldValidator>
							<asp:TextBox ID="txtTierMaxNumber" runat="server" Cssclass="form-control" ValidationGroup="createTier" onkeypress="return allowOnlyNumber(event);" MaxLength="9"></asp:TextBox>
						</div>
					</div>

					<label for="content_txtTierContentFaux" class="mt-2">Tier Content</label>
					<asp:RequiredFieldValidator ID="createProjContentReqValidator" runat="server" ErrorMessage="*"  CssClass="text-danger" ControlToValidate="txtTierContent" Display="Dynamic" ValidationGroup="createTier"></asp:RequiredFieldValidator>
					<asp:TextBox TextMode="MultiLine" ID="txtTierContentFaux" runat="server" Cssclass="form-control"></asp:TextBox>
					<asp:TextBox ID="txtTierContent" runat="server" TextMode="multiline" Cssclass="form-control d-none" ReadOnly="true" ValidationGroup="createTier"></asp:TextBox>

					<asp:Button cssclass="launchr-btn btn" runat="server" ValidationGroup="createTier" Text="Add Tier" onclientclick="addTier();" type="button" CausesValidation="true"></asp:Button>
					<button class="launchr-btn btn" data-toggle="modal" data-target="#confirmSaveTierBox" type="button">Save Tier</button>
					<div id="confirmSaveTierBox" class="modal fade" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title">Are you sure you want to save?</h4>
								</div>
								<div class="modal-body">
									<p class="text-danger">Saved tiers cannot be edited in the future. Please review before saving.</p>
								</div>
									<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
									<button class="launchr-btn btn" onclick="saveTier()" type="button">Save Tiers</button>
								</div>
							</div>
						</div>
					</div>
					<asp:TextBox TextMode="MultiLine" ID="TextBox1" runat="server" Cssclass="form-control d-none"></asp:TextBox>
					<div id="errorMsgBox" class="d-none" role="dialog">
						<div class="mt-3" runat="server">
							<div class="alert alert-danger" id="errorMsgBoxInner">
								<div id="errorMsg"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="../Scripts/pages/tier-rewards.js"></script>
</asp:Content>