<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Launchr.pages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title></title>
	<script type="text/javascript">
		$(document).ready(function () {
			$(".reply-btn").click(function () {
				id = $(this).parent().parent().parent().parent().attr('id');
				$('#content_txtCommentReplyPointer').val(id);
			});
			$(".clear-comment-pointer-btn").click(function () {
				$('#content_txtCommentReplyPointer').val("this project");
			});
		});
	</script>
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
					<div class="tab-pane fade active show project-details neumorph" id="project-background">
						<zero-md>
							<template>
								<xmp>
<asp:PlaceHolder ID="content" runat="server"></asp:PlaceHolder> 
<!--place markdown code here-->
								</xmp>
							</template>
						</zero-md>
					</div>
					<div class="tab-pane fade project-details neumorph" id="project-comment">
						<asp:PlaceHolder ID="comments" runat="server"></asp:PlaceHolder>
						<!--Commnet content
						<div id="100001" class="row p-2">
							<div class="col-xl-12 border pt-3">
								<div class="row pl-3">
									<div class="col-xl-10">
										<a href="profile"><h4>John Doe</h4></a>
										<p>Hi</p>
									</div>
									<div class="col-xl-2">
										<h5 class="text-muted">#100001</h5>
									</div>
								</div>
								<div class="row pl-3">
									<div class="col pb-3">
										<input type="button" class="reply-btn comment-input-btn" value="Reply"/>
									</div>
								</div>
							</div>
						</div>

						<div id="100002" class="row p-2">
							<div class="col-xl-12 border pt-3">
								<div class="row pl-3">
									<div class="col-xl-10">
										<a href="profile"><h4>John Doe</h4></a> <a href="#100001"><h5>reply to #100001</h5></a>
										<p>Hi</p>
									</div>
									<div class="col-xl-2">
										<h5 class="text-muted">#100002</h5>
									</div>
								</div>
								<div class="row pl-3">
									<div class="col pb-3">
										<input type="button" class="reply-btn comment-input-btn" value="Reply"/>
									</div>
								</div>
							</div>
						</div>
						-->
						<h4>Leave a comment</h4>
						<div>
							<span class="text-muted">
								Replying to <asp:TextBox id="txtCommentReplyPointer" runat="server" CssClass="comment-reply-pointer" Text="this project" ReadOnly="true"></asp:TextBox>
							</span>
							<input type="button" class="clear-comment-pointer-btn comment-input-btn text-muted" value="Clear"/>
						</div>
						
						<asp:TextBox TextMode="MultiLine" ID="txtProjectComment" runat="server" Cssclass="form-control mt-3" ValidationGroup="projcomment"></asp:TextBox>
						<asp:RegularExpressionValidator ID="memberUsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> A comment must be at least 10 characters." ControlToValidate="txtProjectComment" Display="Dynamic" ValidationGroup="projcomment"></asp:RegularExpressionValidator><br />
						<asp:Button ID="btnComment" runat="server" Text="Leave comment" CssClass="btn launchr-btn" ValidationGroup="projcomment"/>

					</div>
				</div>
			</div>
			<div class="col-xl-4 d-none d-xl-block">
				<div class="row">
					<h3 class="pb-1">Tier Rewards</h3>
				</div>
				<div class="row pt-3">
					<div class="p-4 tier-card neumorph"><h4>Pledge without a tier reward</h4>
						<asp:TextBox ID="txtTierNoReward" runat="server" Cssclass="form-control" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)"></asp:TextBox>
						<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn"/>
					</div>	
				</div>
				<div class="row pt-3">
					<div class="p-4 tier-card neumorph">
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
