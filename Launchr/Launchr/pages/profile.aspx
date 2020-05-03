<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Launchr.pages.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	});
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row">
	<div class="col-xl-1 hidden-xs">&nbsp;</div>
	<div class="col-xl-10 pt-5 pb-5">
		<div class="row neumorph p-3">
			<div class="col-xl-6">
				<h1>John Doe</h1>
				<span class="backer-status mt-3" data-toggle="tooltip" data-placement="right" title="This user has backed over 25 projects!">Superbacker</span>
			</div>
			<div class="col-xl-6 text-right"><img class="profile-details-icon mr-3" src="../Content/Logo/location.svg">Country</div>
		</div>
	</div>
</div>

</asp:Content>
