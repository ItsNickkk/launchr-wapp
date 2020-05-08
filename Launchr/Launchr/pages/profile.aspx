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
				<!-- If creator
				<span class="backer-status mt-3" data-toggle="tooltip" data-placement="right" title="This user is a creator.">Creator</span>
				If number of project backed is >25
				<span class="backer-status mt-3" data-toggle="tooltip" data-placement="right" title="This user has backed over 25 projects!">Superbacker</span>
				-->
			</div>
			<div class="col-xl-6 text-right">
				<img class="profile-details-icon mr-3" src="../Content/Logo/location.svg">Country<br />
				<!--show this only when owner-->
				<a ID="editProfile" href="edit-profile?id=" class="btn launchr-btn mt-2">Edit Profile</a>
			</div>
		</div>
		<div class="row pt-3">
			<div class="col">
				<h3>History</h3>
			</div>
		</div>
		<div class="row">
			<div class="col pl-0 pr-0">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active project-tab p-3" data-toggle="tab" href="#project-backed">Project Backed</a>
					</li>
					<li class="nav-item">
						<a class="nav-link project-tab p-3" data-toggle="tab" href="#project-comment">Comment</a>
					</li>
				</ul>
				<div class="tab-content border">
					<div class="tab-pane fade active show project-details neumorph p-3" id="project-backed">
					<!--History Project Backed-->
						<div class="row mb-3 search-card border m-3">
							<div class="col neumorph">
								<div class="row mb-3">
									<div class="col-xl-4">
										<img src="../Content/images/content4.jpg" />
									</div>
									<div class="col-xl-5 pt-3 pl-0">
										<a href="#"><h3>Project 1</h3></a>
										<p>Lorem ipsum dolor sit amet, consectetur adipiscingLorem ipsum dolor sit amet, consectetur adipiscing</p>
										<!-- if its creator just ignore next line-->
										<p>Tier Backed: Tier 1</p>
									</div>
									<div class="col-xl-3 pt-3">
										<div class="row">
											<div class="col">
												<div class="progress">
													<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-xl mt-3">
												<span class="project-card-details">$75</span> raised of $100
											</div>
											<div class="col-xl text-right mt-3">
												<span class="project-card-details">75%</span>
											</div>
										</div>
										<div class="row">
											<div class="col">
												<p class="mb-2">30 backers</p>
											</div>	
											<div class="col">
												<p class="mb-2 text-right">30 days left</p>
											</div>	
										</div>
									</div>
								</div>
							</div>
						</div>
					<!--History Project Backed End-->		
					</div>
					<div class="tab-pane fade project-details neumorph" id="project-comment">
						<div id="100001" class="row p-2">
							<div class="col-xl-12 border pt-3">
								<div class="row pl-3">
									<div class="col-xl-10">
										<h4>John Doe</h4>
										<a href="project?id=300008"><h5>reply to -project name here-</h5></a>
										<p>Hi</p>
									</div>
									<div class="col-xl-2">
										<h5 class="text-muted align-right">#600004</h5>	
									</div>
									<div class="row pl-3">
										<div class="col pb-3">
											<a href="project?id=300008#600004" class="comment-input-btn">Go to Comment</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
</div>
</asp:Content>
