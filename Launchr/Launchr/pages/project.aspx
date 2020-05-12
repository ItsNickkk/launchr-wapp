<%@ Page Title="" Language="C#" MasterPageFile="~/pages/Launchr.Master" AutoEventWireup="true" CodeBehind="project.aspx.cs" Inherits="Launchr.pages.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<title>| Launch:r</title>
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
                            <asp:PlaceHolder ID="plcAlbumIndicator" runat="server"></asp:PlaceHolder>
						</ul>
  
						<div class="carousel-inner">
                            <asp:PlaceHolder ID="plcImageAlbum" runat="server"></asp:PlaceHolder>
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
						<h2 class="project-info">
							<asp:PlaceHolder ID="plcTitle" runat="server">

							</asp:PlaceHolder>

						</h2>
					</div>				
				</div>
				<div class="row">
					<div class="col">
						<p class="project-info">
							<asp:PlaceHolder ID="plcDescription" runat="server">

							</asp:PlaceHolder>
						</p>
					</div>
				</div>
				<div class="progress mb-3">
                    <asp:PlaceHolder ID="plcProgressBar" runat="server"></asp:PlaceHolder>
				</div>
				<div class="row">
					<div class="col-xl-6">
						<h3>
                            <asp:PlaceHolder ID="plcTarget" runat="server"></asp:PlaceHolder>
						</h3>
					</div>
					<div class="col-xl-6 text-right">
						<h3>
                            <asp:PlaceHolder ID="plcBackers" runat="server"></asp:PlaceHolder>
                        </h3>
						<h4>
                            <asp:PlaceHolder ID="plcRemaining" runat="server"></asp:PlaceHolder>
						</h4>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<h6>Creator Info</h6>
                        <asp:PlaceHolder ID="plcCreatorName" runat="server"></asp:PlaceHolder>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
						<asp:Button type="button" cssclass="btn btn-secondary launchr-btn mt-3" data-toggle="modal" data-target="#pledge-modal" ID="backProject" runat="server" Text="Back this Project" OnClientClick="return false;"></asp:Button>
						<div id="pledge-modal" class="modal fade" role="dialog">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">Back this project</h5>
										<button type="button" class="close pledge-btn" data-dismiss="modal" aria-label="Close" id="close-pledge">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body pl-5 pr-5">
										<div class="row pt-3">
											<div class="p-4 tier-card"><h4>Pledge without a tier reward</h4>
												<asp:TextBox ID="txtTierNoRewardModal" runat="server" Cssclass="form-control no-reward" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)"></asp:TextBox>
												<asp:Button runat="server" Text="Pledge" CssClass="btn join-sign-up-btn mt-3 launchr-btn pledge-without-reward" data-toggle="modal" data-target="#tier-pledge-modal"/>
											</div>	
										</div>

										<asp:PlaceHolder ID="plcTierSide" runat="server"></asp:PlaceHolder>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn" data-dismiss="modal">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>
                    <asp:PlaceHolder ID="plcControlPanel" runat="server"></asp:PlaceHolder>
				</div>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-xl-8">
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link active project-tab p-3" data-toggle="tab" href="#project-background">Background</a>
					</li>
					<li class="nav-item">
						<a class="nav-link project-tab p-3" data-toggle="tab" href="#project-comment">Comment</a>
					</li>
				</ul>
				<div class="tab-content border">
					<div class="tab-pane fade active show project-details neumorph" id="project-background">
						<zero-md>
							<template>
								<xmp>
<asp:PlaceHolder ID="plcContent" runat="server"></asp:PlaceHolder> 
<!--place markdown code here-->
								</xmp>
							</template>
						</zero-md>
					</div>
					<div class="tab-pane fade project-details neumorph" id="project-comment">
						<asp:PlaceHolder ID="plcComment" runat="server"></asp:PlaceHolder>
						<!--Comment content
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
								<div class="txtrow pl-3">
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
								Replying to <asp:TextBox id="txtCommentReplyPointer" runat="server" CssClass="comment-reply-pointer"></asp:TextBox>
							</span>
							<input type="button" class="clear-comment-pointer-btn comment-input-btn text-muted" value="Clear"/>
						</div>
						
						<asp:TextBox TextMode="MultiLine" ID="txtProjectComment" runat="server" Cssclass="form-control mt-3" ValidationGroup="projcomment"></asp:TextBox>
						<asp:RegularExpressionValidator ID="memberUsernameMinLengthValidator" CssClass="text-danger" ValidationExpression="^[a-zA-Z0-9\S\s]{6,20}" runat="server" ErrorMessage="<br/><i>Error:</i> A comment must be at least 10 characters." ControlToValidate="txtProjectComment" Display="Dynamic" ValidationGroup="projcomment"></asp:RegularExpressionValidator><br />
						<asp:Button ID="btnComment" runat="server" Text="Leave comment" CssClass="btn launchr-btn" ValidationGroup="projcomment" OnClick="btnComment_Click"/>
						<asp:PlaceHolder ID="plcCommentAlert" runat="server"></asp:PlaceHolder>
					</div>
				</div>
			</div>
			<div class="col-xl-4 d-none d-xl-block">
				<div class="row">
					<h3 class="pb-1">Tier Rewards</h3>
				</div>
				<div class="row pt-3">
					<div class="p-4 tier-card neumorph"><h4>Pledge without a tier reward</h4>
						<asp:TextBox ID="txtTierNoReward" runat="server" Cssclass="form-control no-reward" onkeypress="return allowOnlyNumber(event);" MaxLength="15" placeholder="Amount in USD ($)"></asp:TextBox>
						<button type="button" Class="btn mt-3 launchr-btn pledge-btn pledge-without-reward" data-toggle="modal" data-target="#tier-pledge-modal">Pledge</button>
					</div>	
				</div>
                <asp:PlaceHolder ID="plcTier" runat="server"></asp:PlaceHolder>

				<div id="tier-pledge-modal" class="modal fade" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Back this project</h5>
								<button type="button" class="close pledge-btn" data-dismiss="modal" aria-label="Close" >
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body pl-5 pr-5">
								<input type="text" id="txtTierIDModal" readonly class="d-none"/>
								<p>You are pledging for <input type="text" readonly class="comment-reply-pointer" id="txtTierNameModal"/></p>
								<p>Total Price: <input type="text" readonly class="comment-reply-pointer" id="txtTierPriceModal"/></p>
								<label for="txtCreditCardNumberModal">Credit card number</label>
								<input id="txtCreditCardNumberModal" type="text" class="form-control" placeholder="Enter your credit card number"/>
								<div class="row">
									<div class="col">
										<label for="txtCreditCardExpiryDate">Expiry Date</label>
										<input id="txtCreditCardExpiryDate" type="text" class="form-control" placeholder="MM/YY"/>
									</div>
									<div class="col">
										<label for="txtCreditCardCVV">Security Code (CVV)</label>
										<input id="txtCreditCardCVV" type="text" class="form-control" placeholder="XXX"/>
									</div>
								</div>
								<label for="txtCreditCardName">Credit card holder name</label>
								<input id="txtCreditCardName" type="text" class="form-control" placeholder="Enter your card's holder name"/>
								<span class="text-info">We will not store your credit card details</span>

								<div class="mt-3" runat="server">
									<div class="alert" id="errorMsgBoxInner">
										<div id="errorMsg"></div>
									</div>
								</div>						
							</div>
							<div class="modal-footer">
								<button class="launchr-btn btn" type="button" id="btnConfirmPayModal">Confirm Payment</button>
								<button type="button" class="btn" data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>

				<div id="tier-pledge-modal-success" class="modal fade" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Back this project</h5>
								<button type="button" class="close pledge-btn" data-dismiss="modal" aria-label="Close" >
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-content">
								<div class="modal-body pl-5 pr-5">
									Pledging successful, you'll be refreshed in 3 seconds.								
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="sign-in-info" class="modal fade" role="dialog">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Back this project</h5>
								<button type="button" class="close pledge-btn" data-dismiss="modal" aria-label="Close" >
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-content">
								<div class="modal-body pl-5 pr-5">
									<div class="row">
										<div class="col text-center">
											You must sign in before backing this project.
										</div>
									</div>
									<div class="row">
										<div class="col mt-3 text-center">
											<a href="login" class="btn launchr-btn">Sign In</a>
										</div>
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
</div>
<asp:HiddenField ID="txtUserID" runat="server"/>
<asp:HiddenField ID="txtProjID" runat="server"/>
<script src="../Scripts/bootstrap.bundle.js"></script>
<script type="text/javascript">
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

	function GetURLParameter(sParam) {
		var sPageURL = window.location.search.substring(1);
		var sURLVariables = sPageURL.split('&');
		for (var i = 0; i < sURLVariables.length; i++) {
			var sParameterName = sURLVariables[i].split('=');
			if (sParameterName[0] == sParam) {
				return sParameterName[1];
			}
		}
	}
</script>
</asp:Content>
