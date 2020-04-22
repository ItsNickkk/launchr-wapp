<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Launchr.pages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script src="https://cdn.jsdelivr.net/npm/@webcomponents/webcomponentsjs@2/webcomponents-loader.min.js"></script>
	<script type="module" src="https://cdn.jsdelivr.net/gh/zerodevx/zero-md@1/src/zero-md.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row">
	<div class="col-xl-1 hidden-xs">&nbsp;</div>
	<div class="col-xl-10 pt-5 pb-5">
		<div class="row">
			<div class="col-xl-6 text-center">
				<div>
					<div id="project-photo-carousel" class="carousel slide" data-ride="carousel">

						<ul class="carousel-indicators">
							<li data-target="#project-photo-carousel" data-slide-to="0" class="active"></li>
							<li data-target="#project-photo-carousel" data-slide-to="1"></li>
							<li data-target="#project-photo-carousel" data-slide-to="2"></li>
						</ul>
  
						<div class="carousel-inner">
							<div class="carousel-item active project-photo-div ">
								<img class="project-photo-carousel" src="../Content/images/content1.jpg" />
							</div>
							<div class="carousel-item project-photo-div">
								<img class="project-photo-carousel" src="../Content/images/content2.jpg" />
							</div>
							<div class="carousel-item project-photo-div">
								<img class="project-photo-carousel" src="../Content/images/content4.jpg" />
							</div>
						</div>
  
						<a class="carousel-control-prev" href="#project-photo-carousel" data-slide="prev">
							<span class="carousel-control-prev-icon"></span>
						</a>
						<a class="carousel-control-next" href="#project-photo-carousel" data-slide="next">
							<span class="carousel-control-next-icon"></span>
						</a>
					</div>
				</div>
			</div>
			<div class="col-xl-6">
				<div class="row">
					<div class="col">
						<h2 class="project-info">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut nibh dui.</h2>
					</div>				
				</div>
				<div class="row">
					<div class="col">
						<p class="project-info">lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam. Duis congue urna nisi,</p>
					</div>
				</div>
				<div class="progress mb-3">
					<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<h3>$0 plegded of $100000</h3>
					</div>
					<div class="col-xl-6 text-right">
						<h3>110 backers</h3>
						<h4>3 days left</h4>
					</div>
				</div>
				<div class="row mt-3">
					<button type="button" class="btn btn-secondary launchr-btn mt-3 ml-3" data-toggle="modal" data-target="#pledge-modal">Back this Project</button>
					<div id="pledge-modal" class="modal fade" role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Back this project</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body pl-5 pr-5">
									<div class="row pt-3">
										<div class="p-4 tier-card"><h4>Pledge without a tier reward</h4>
											<asp:TextBox ID="TextBox1" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)"></asp:TextBox>
											<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn"/>
										</div>	
									</div>

									<div class="row pt-3">
										<div class="p-4 tier-card">
											<h4>Potato x1</h4><h4>30$</h4>
											<p class="text-muted">By pledging amount above you get:</p>
											<span>
												<zero-md>
													<template>
														<xmp>
- potato signed by designer
- idk anymore
														</xmp>
													</template>
												</zero-md>
											</span>
											<div class="progress mt-4">
												<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
											</div>
											<p>75 out of 100 slots left</p>
											<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn"/>
										</div>	
									</div>
								</div>
								<div class="modal-footer">
									<asp:Button ID="Button1" runat="server" Text="Sign Up" CssClass="btn launchr-btn"/>
									<button type="button" class="btn" data-dismiss="modal">Close</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-xl-8">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active project-tab p-3" data-toggle="tab" href="#project-background">BACKGROUND</a>
					</li>
					<li class="nav-item">
						<a class="nav-link project-tab p-3" data-toggle="tab" href="#project-comment">COMMENT</a>
					</li>
				</ul>
				<div class="tab-content border">
					<div class="tab-pane fade active show project-details" id="project-background">
						<zero-md>
							<template>
								<xmp>
# lacus id massa bibendum efficitur sit amet ac leo. Proin non scelerisque diam
## Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam venenatis egestas laoreet. Praesent vel commodo quam. Pellentesque ut ante sollicitudin, posuere quam in, dapibus leo. In eget laoreet massa, non facilisis sapien. Cras auctor ipsum ante, vitae congue tortor lobortis sit amet. Vivamus sed congue massa. Etiam dictum vel sem sed posuere.

Etiam viverra ullamcorper ipsum. Duis consequat felis lectus, vitae consectetur ipsum interdum eu. Aenean in malesuada odio. Mauris commodo non mauris id eleifend. Nulla nec nisl euismod, accumsan purus a, iaculis neque. Aenean hendrerit egestas elit nec gravida. Duis ut hendrerit felis. Ut et sapien convallis, tempus felis sit amet, fermentum odio. Donec tristique mauris eros, ac convallis justo posuere quis. Sed sed ligula vel sapien lobortis tincidunt id sed quam. Integer quis nisi aliquet, dictum magna in, iaculis neque. Donec lobortis quam sit amet tellus fringilla condimentum. Curabitur et urna velit. Cras dictum, leo et auctor mollis, ipsum sapien porta odio, vel fringilla dolor dui a ex. Nam erat ipsum, malesuada quis finibus in, facilisis ut est. Maecenas non venenatis turpis.

Nulla luctus eget leo sit amet consectetur. Nullam nisi massa, auctor aliquet magna sit amet, commodo gravida lorem. In a elementum arcu. Cras feugiat diam id blandit feugiat. Cras ut suscipit lectus. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed malesuada, eros vel elementum laoreet, leo elit commodo nibh, tempus lobortis erat enim in ipsum. Duis finibus congue sapien, eu sollicitudin quam aliquet nec. Nunc in pretium ipsum. Nullam metus sapien, pulvinar sed gravida sed, tempus id urna. Sed ac iaculis lorem, eget tincidunt augue.

Sed commodo felis tincidunt, convallis ipsum at, fringilla est. Proin convallis blandit congue. Nullam sollicitudin orci in sem aliquet, et eleifend mi auctor. Sed nec lorem massa. Curabitur condimentum ex sed nunc molestie elementum. Vestibulum gravida ornare arcu sed molestie. Aliquam fermentum ac ipsum ut gravida. Nulla et pretium ipsum. Pellentesque euismod tincidunt ex non pulvinar. Curabitur pretium lorem sed volutpat auctor. Aenean feugiat venenatis dui. 
								</xmp>
							</template>
						</zero-md>
					</div>
					<div class="tab-pane fade project-details" id="project-comment">
						<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla single-origin coffee squid. Exercitation +1 labore velit, blog sartorial PBR leggings next level wes anderson artisan four loko farm-to-table craft beer twee. Qui photo booth letterpress, commodo enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum PBR. Homo nostrud organic, assumenda labore aesthetic magna delectus mollit.</p>
					</div>
				</div>
			</div>
			<div class="col-xl-4 d-none d-xl-block">
				<div class="row">
					<h3 class="pb-1">Tier Rewards</h3>
				</div>
				<div class="row pt-3">
					<div class="p-4 tier-card"><h4>Pledge without a tier reward</h4>
						<asp:TextBox ID="txtTierNoReward" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)"></asp:TextBox>
						<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn"/>
					</div>	
				</div>
				<div class="row pt-3">
					<div class="p-4 tier-card">
						<h4>Potato x1</h4><h4>30$</h4>
						<p class="text-muted">By pledging amount above you get:</p>
						<span>
							<zero-md>
							<template>
								<xmp>
- potato signed by designer
- idk anymore
								</xmp>
							</template>
						</zero-md>
						</span>
						<div class="progress mt-4">
							<div class="progress-bar progress-bar-striped bg-launchr progress-bar-animated" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
						</div>
						<p>75 out of 100 slots left</p>
						<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn"/>
					</div>	
				</div>	
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
		function allowOnlyNumber(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
			return true;
		}
	</script>


</asp:Content>
